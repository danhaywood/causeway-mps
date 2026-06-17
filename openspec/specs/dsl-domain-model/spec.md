# dsl-domain-model Specification

## Purpose
The core MPS structure concepts of the `causeway` DSL — `Module`, `Entity`, `Property`, `Action`,
`Parameter`, and the `Type` union (`EntityType` ∪ `JavaType`) — and how they compose. Actions carry
parameters, an optional return type, a `SemanticsOf` value, and an embedded baseLanguage body. (Mixin
generation, the persisted/`derived` discriminator, and the richer action programming model are layered
on by the `dsl-mixins` and `dsl-action-model` changes.)
## Requirements
### Requirement: Module concept
The `causeway` language SHALL provide a `Module` root concept that is an `INamedConcept`. A `Module` SHALL contain zero or more `Entity` children (`entities`, cardinality `0..n`).

#### Scenario: Empty module
- **WHEN** a `Module` named `customers` is created with no entities
- **THEN** the model is valid

#### Scenario: Module owns entities
- **WHEN** an `Entity` is added to a `Module`'s `entities`
- **THEN** the model is valid and the module exposes that entity

### Requirement: Entity concept
The `causeway` language SHALL provide an `Entity` concept (`INamedConcept`), owned by a `Module`. An `Entity` SHALL contain zero or more `Property` children (`properties`, `0..n`) and zero or more `Action` children (`actions`, `0..n`).

#### Scenario: Entity with members
- **WHEN** an `Entity` named `Customer` contains a `Property` and an `Action`
- **THEN** the model is valid and the entity exposes both members

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
The `causeway` language SHALL provide an `Action` concept (`INamedConcept`) owned by an `Entity`. An
`Action` SHALL have a name, an ordered list of `Parameter` children (`0..n`), a return `Type`, a
`SemanticsOf` value, and a `body` that is an embedded MPS baseLanguage statement list (real Java) —
not a custom expression language.

#### Scenario: Action with parameters, return type, semantics, and a Java body
- **WHEN** an `Action` named `placeOrder` declares a `product` parameter, a return `Type`, semantics
  `IDEMPOTENT`, and a body containing Java statements
- **THEN** the model is valid and the body is editable as baseLanguage within the action node

#### Scenario: Action body references an external type
- **WHEN** an `Action` body references a type available via classpath stubs (a Causeway service or a
  hand-written class)
- **THEN** the reference resolves within the model

### Requirement: Parameter concept
The `causeway` language SHALL provide a `Parameter` concept (`INamedConcept`) owned by an `Action`,
with a name and a `Type` (the union concept).

#### Scenario: Typed parameter
- **WHEN** a `Parameter` named `quantity` is given a `JavaType` of `int`
- **THEN** the model is valid and the type resolves accordingly

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

