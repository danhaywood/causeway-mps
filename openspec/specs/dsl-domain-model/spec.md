# dsl-domain-model Specification

## Purpose
The core MPS structure concepts of the `causeway` DSL — `Module`, `Entity`, `Property`, `Action`, `Parameter`, `Collection`, and the `Type` union (`EntityType` ∪ `JavaType`) — and how they compose.
Actions carry ordered parameters, an optional return type, a `SemanticsOf` value, embedded baseLanguage bodies, lifecycle supporting blocks, and injected services.
Their generator emits Causeway parameters-class-style mixins.
## Requirements
### Requirement: Module concept
The `causeway` language SHALL provide a `Module` root concept that is an `INamedConcept` and a singleton metadata root per model (one MPS model = one module; the model name maps to the package).
It SHALL NOT contain `Entity` or `Action` children; entities are top-level roots of the model.
Beyond `name` (the module's identity), a `Module` SHALL carry two optional string properties that the generator reads, each falling back to `name` when unset:

- `logicalTypeNamePrefix` — the prefix applied to each member's `@Named` logical-type-name; and
- `schema` — the JPA database schema for the module's entities.

These two are deliberately distinct: a module's logical-type-name prefix (for example, `sharedKernel.customers`) may differ from its database schema (for example, `customers`).
The generator SHALL produce each member's `@Named` from `logicalTypeNamePrefix` (or `name` if unset) and each entity's `@Table(schema=…)` from `schema` (or `name` if unset).
The generator SHALL produce no class from the `Module` itself; the root is abandoned in generation.

#### Scenario: Defaults fall back to name
- **WHEN** a `Module` named `customers` sets neither `logicalTypeNamePrefix` nor `schema`
- **THEN** generated members are `@Named("customers.<Member>")` and entities are `@Table(schema = "customers", …)`

#### Scenario: Prefix and schema diverge
- **WHEN** a `Module` named `customers` sets `logicalTypeNamePrefix = "sharedKernel.customers"` and `schema = "customers"`
- **THEN** `Customer` generates `@Named("sharedKernel.customers.Customer")` and `@Table(schema = "customers", name = "Customer")`

### Requirement: Entity concept
The `causeway` language SHALL provide an `Entity` **root** concept (`INamedConcept`). An `Entity` SHALL
contain zero or more `Property` children (`properties`, `0..n`) and zero or more nested `Action` children
(`actions`, `0..n`). Each `Entity` root generates exactly one top-level Java class file; its nested actions
are generated **within** that file (see the Action concept).

#### Scenario: Entity is a model root with members
- **WHEN** an `Entity` named `Customer` is a root of the `customers` model containing a `Property` and a
  nested `Action`
- **THEN** the model is valid and the entity exposes both members

#### Scenario: Entity generates one file
- **WHEN** the generator runs over an `Entity` root
- **THEN** it produces exactly one top-level class file for that entity

### Requirement: Property concept
The `causeway` language SHALL provide a `Property` concept (`INamedConcept`) owned by an `Entity`. A
`Property` SHALL have a name and a `Type` (the union concept — either an `EntityType` or a `JavaType`).

#### Scenario: Property with a Java type
- **WHEN** a `Property` named `name` is given a `JavaType` of `String`
- **THEN** the model is valid and the property's type resolves to `java.lang.String`

#### Scenario: Property with an entity type
- **WHEN** a `Property` named `owner` is given an `EntityType` referencing another `Entity`
- **THEN** the model is valid and the reference resolves to that entity

### Requirement: Action concept
The `causeway` language SHALL provide an `Action` concept (`INamedConcept`) that is both a valid nested child of an `Entity` through the `actions` containment and rootable as a top-level concept.
An `Action` SHALL be authored in one of two forms, discriminated by its optional `target` reference:

- **nested** within an `Entity` — `target` empty, mixee implicitly the enclosing entity; generates as a static nested mixin class of the entity's class with an explicit mixee field and one-argument constructor; or
- **top-level** — a root with an explicit `target` `Entity` and a mixee name; generates as a separate top-level mixin class via a root mapping rule, enabling contribution to an entity in another module.

An `Action` SHALL have a name; an ordered list of `Parameter` children (`0..n`) whose order is significant; a return `Type`; a `SemanticsOf` value; an `act` body that is an embedded MPS baseLanguage statement list; zero or more action-level supporting blocks (`hide`, `disable`, `validate`), each an embedded baseLanguage block; and zero or more injected service declarations (`injectedServices`).

#### Scenario: Nested action with parameters, return type, semantics, and a Java body
- **WHEN** an `Action` named `placeOrder` is nested in entity `Customer`, declaring a `product` parameter, a return `Type`, semantics `IDEMPOTENT`, and an `act` body containing Java statements
- **THEN** the model is valid, the action's target is `Customer`, the body is editable as baseLanguage within the action node, and generation emits a static nested mixin class with an explicit mixee field and constructor

#### Scenario: Top-level action with an explicit target
- **WHEN** an `Action` is declared top-level as `action placeOrder on Customer as customer`
- **THEN** the model is valid and the action contributes to `Customer` with `customer` as the mixee handle in scope

#### Scenario: Cross-module contribution via cross-model reference
- **WHEN** a top-level `Action` root in module-model `orders` sets its `target` to an `Entity` in module-model `customers`
- **THEN** the reference resolves across models and the mixin is generated in `orders` contributing to the `customers` entity

#### Scenario: Action with supporting blocks
- **WHEN** an `Action` declares a `hide` block and a cross-parameter `validate` block alongside its `act` body
- **THEN** the model is valid and each block is editable as a typed baseLanguage block

#### Scenario: Action body references an external type
- **WHEN** an `Action` body references a type available via classpath stubs, such as a Causeway service or a hand-written class
- **THEN** the reference resolves within the model

### Requirement: Parameter concept
The `causeway` language SHALL provide a `Parameter` concept (`INamedConcept`) owned by an `Action`, with a name and a `Type` from the union concept.
A `Parameter` SHALL additionally carry zero or more per-parameter supporting blocks (`choices`, `default`, `validate`, `autoComplete`, `hide`, `disable`), each an embedded baseLanguage block scoped according to the `dsl-action-scoping` capability.
A parameter's position in its action's ordered parameter list is significant.

#### Scenario: Typed parameter
- **WHEN** a `Parameter` named `quantity` is given a `JavaType` of `int`
- **THEN** the model is valid and the type resolves accordingly

#### Scenario: Parameter with supporting blocks
- **WHEN** a `Parameter` named `product` declares a `choices` block and a `default` block
- **THEN** the model is valid and each block is editable as a typed baseLanguage block

### Requirement: Action injected services
An `Action` SHALL allow zero or more injected service declarations, each a named field with a `Type` reusing the `Type` union.
Each declared service SHALL be in scope as a variable of that type for the action's `act` body and every action or parameter supporting block.
The generator SHALL emit each declared service as an `@Inject private <Type> <name>;` field on the generated mixin class.
Auto-detecting services from body references remains a deferred convenience.

#### Scenario: Action body calls an injected service
- **WHEN** an `Action` declares an injected service `orderService` of type `OrderService` and its `act` body calls `orderService.placeOrder(...)`
- **THEN** the reference resolves at edit time and the generated mixin carries `@Inject private OrderService orderService;`

### Requirement: Actions generate parameters-class-style mixins
The generator SHALL emit each `Action` as a parameters-class-style mixin in which supporting behaviours become by-name supporting methods and an immutable `Params` value carrier is generated from the single parameter declarations.
The carrier SHALL be `public static final`, hold private final fields, expose a public constructor matching the complete action parameter signature, and provide record-style accessors named after the parameters.
A parameter reference SHALL map to a direct method argument in the generated `act` body and to a `Params` accessor in every generated Causeway PAT supporting method.

#### Scenario: Parameters are declared once and generate a Params value carrier
- **WHEN** an `Action` declares parameters `product` and `quantity` with supporting blocks referencing them
- **THEN** the generated mixin has a single immutable `Params` carrier with `product` and `quantity`, and the by-name supporting methods read those parameters without re-declaring the parameter list

### Requirement: Type is a union of DSL entity reference and Java type
The `causeway` language SHALL provide a `Type` concept that is a union: an `EntityType` that
references another DSL `Entity` node (rename-safe, by model node — not by generated class name), or a
`JavaType` that wraps a baseLanguage Java type resolved via classpath stubs.

#### Scenario: Type referencing another DSL entity
- **WHEN** a `Type` is an `EntityType` pointing at another `Entity` in the model
- **THEN** the reference resolves to that entity node, and renaming the entity updates the reference

#### Scenario: Type wrapping a plain Java type
- **WHEN** a `Type` is a `JavaType` wrapping a baseLanguage type such as `BigDecimal`
- **THEN** the type resolves to the corresponding Java type via classpath stubs

### Requirement: Collection concept

The language SHALL provide a named, rootable `Collection` concept for read-only list-valued contributed members.
An entity SHALL contain zero or more nested collections, and a collection root SHALL optionally reference an explicit target entity according to placement constraints.
A collection SHALL contain one element type, injected services, and one BaseLanguage body.

#### Scenario: Entity contains a nested collection

- **WHEN** `Customer` contains collection `recentOrders` with element type `Order`
- **THEN** the entity exposes the collection as a nested member

#### Scenario: Collection is an explicit-target root

- **WHEN** root collection `recommendedProducts` targets `Customer`
- **THEN** the model represents a collection contribution independently of the target entity root

#### Scenario: Collection targets an entity in another model

- **WHEN** a collection root in `recommendations` targets `Customer` in `customers`
- **THEN** the target resolves by persistent cross-model entity reference

#### Scenario: Collection body uses a service

- **WHEN** a collection declares an injected service and references it from its body
- **THEN** the reference resolves through the collection's body scope

