# dsl-domain-model Specification

## Purpose
TBD - created by archiving change entity-property-action-slice. Update Purpose after archive.
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
The `causeway` language SHALL provide a `Property` concept (`INamedConcept`) owned by an `Entity`. A `Property` SHALL have a name and a `type`. (In this foundation the `type` is a reference to an `Entity`; a richer `Type` union is introduced by a follow-on change.)

#### Scenario: Typed property
- **WHEN** a `Property` named `owner` references an `Entity` as its `type`
- **THEN** the model is valid and the reference resolves to that entity

### Requirement: Action concept
The `causeway` language SHALL provide an `Action` concept (`INamedConcept`) owned by an `Entity`. An `Action` SHALL have a name and an ordered list of `Parameter` children (`parameters`, `0..n`). (Return type, semantics, and an embedded baseLanguage body are added by a follow-on change.)

#### Scenario: Action with parameters
- **WHEN** an `Action` named `placeOrder` declares a `Parameter`
- **THEN** the model is valid and the action exposes that parameter

### Requirement: Parameter concept
The `causeway` language SHALL provide a `Parameter` concept (`INamedConcept`) owned by an `Action`, with a name and a `type` (a reference to an `Entity` in this foundation).

#### Scenario: Typed parameter
- **WHEN** a `Parameter` named `product` references an `Entity` as its `type`
- **THEN** the model is valid and the reference resolves to that entity

