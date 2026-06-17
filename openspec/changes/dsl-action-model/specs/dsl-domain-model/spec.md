## MODIFIED Requirements

### Requirement: Action concept
The `causeway` language SHALL provide an `Action` concept (`INamedConcept`). An `Action` SHALL be
authored in one of two forms:

- **nested** within an `Entity` — its target (mixee) is implicitly the enclosing entity; or
- **top-level** with an explicit target `Entity` and a mixee name (e.g. `action … on Customer as
  customer`), enabling contribution to an entity in another module.

An `Action` SHALL have a name; an ordered list of `Parameter` children (`0..n`) whose order is
significant (dependency order — see the `dsl-action-scoping` capability); a return `Type`; a
`SemanticsOf` value; an `act` body that is an embedded MPS baseLanguage statement list (real Java) — not
a custom expression language; zero or more **action-level supporting blocks** (`hide`, `disable`,
`validate`), each an embedded baseLanguage block; and zero or more **injected service** declarations
(`injectedServices`).

#### Scenario: Nested action with parameters, return type, semantics, and a Java body
- **WHEN** an `Action` named `placeOrder` is nested in entity `Customer`, declaring a `product`
  parameter, a return `Type`, semantics `IDEMPOTENT`, and an `act` body containing Java statements
- **THEN** the model is valid, the action's target is `Customer`, and the body is editable as
  baseLanguage within the action node

#### Scenario: Top-level action with an explicit target
- **WHEN** an `Action` is declared top-level as `action placeOrder on Customer as customer`
- **THEN** the model is valid and the action contributes to `Customer` with `customer` as the mixee
  handle in scope

#### Scenario: Action with supporting blocks
- **WHEN** an `Action` declares a `hide` block and a cross-parameter `validate` block alongside its `act`
  body
- **THEN** the model is valid and each block is editable as a typed baseLanguage block

#### Scenario: Action body references an external type
- **WHEN** an `Action` body references a type available via classpath stubs (a Causeway service or a
  hand-written class)
- **THEN** the reference resolves within the model

### Requirement: Parameter concept
The `causeway` language SHALL provide a `Parameter` concept (`INamedConcept`) owned by an `Action`, with
a name and a `Type` (the union concept). A `Parameter` SHALL additionally carry zero or more **per-parameter
supporting blocks** (`choices`, `default`, `validate`, `autoComplete`, `hide`, `disable`), each an
embedded baseLanguage block scoped per the `dsl-action-scoping` capability. A parameter's position in its
action's ordered parameter list is significant.

#### Scenario: Typed parameter
- **WHEN** a `Parameter` named `quantity` is given a `JavaType` of `int`
- **THEN** the model is valid and the type resolves accordingly

#### Scenario: Parameter with supporting blocks
- **WHEN** a `Parameter` named `product` declares a `choices` block and a `default` block
- **THEN** the model is valid and each block is editable as a typed baseLanguage block

## ADDED Requirements

### Requirement: Action injected services
An `Action` SHALL allow zero or more injected service declarations, each a named field with a `Type`
(reusing the `Type` union). Each declared service SHALL be in scope (as a variable of that type) for the
action's `act` body and every action/parameter supporting block. The generator SHALL emit each declared
service as an `@Inject private <Type> <name>;` field on the generated mixin class.

(Settled in this change's design as the explicit alternative to auto-detecting services from the body;
auto-detection remains a deferred v2 convenience layered over this.)

#### Scenario: Action body calls an injected service
- **WHEN** an `Action` declares an injected service `orderService` of type `OrderService` and its `act`
  body calls `orderService.placeOrder(...)`
- **THEN** the reference resolves at edit time and the generated mixin carries
  `@Inject private OrderService orderService;`

### Requirement: Actions generate parameters-class-style mixins
The generator SHALL emit each `Action` as a parameters-class-style mixin: the supporting behaviours
become by-name supporting methods, and a `Params` record is generated from the single parameter-field
declarations (parameters are declared once, not restated per supporting method). A parameter reference in
a block SHALL be mapped to the correct generated form for that block (an `act` argument, a `Params`
accessor, or the validated-parameter argument).

#### Scenario: Parameters are declared once and generate a Params record
- **WHEN** an `Action` declares parameters `product` and `quantity` with supporting blocks referencing
  them
- **THEN** the generated mixin has a single `Params` record with `product` and `quantity`, and the
  by-name supporting methods read those parameters without re-declaring the parameter list
