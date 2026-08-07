## MODIFIED Requirements

### Requirement: Derived properties support nested and explicit-target placement

A `DerivedProperty` SHALL be valid either as a child of an `Entity` with an implicit target or as a model root with an explicit target `Entity` and mixee name.
A root derived property SHALL require an explicit target, and a nested derived property SHALL derive its target from the containing entity.
An explicit target MAY reference an entity in the declaring model or an entity in an imported model.
Cross-model and same-model targets SHALL retain identical exact-target typing, scoping, and identity semantics.

#### Scenario: Nested derived property uses its containing entity

- **WHEN** `displayName` is nested in `Customer`
- **THEN** its exact target and mixee type are `Customer`

#### Scenario: Root derived property contributes to an explicit target

- **WHEN** root derived property `preferredProduct` targets `Customer` as `customer`
- **THEN** the declaration contributes the property to `Customer` and exposes `customer` as the mixee handle

#### Scenario: Root derived property targets an imported entity

- **WHEN** root derived property `recommendedCustomer` is declared in model `recommendations` and targets `Customer` from imported model `customers`
- **THEN** the declaration retains `Customer` as its exact target and exposes a correctly typed `Customer` mixee handle

#### Scenario: Root declaration omits its target

- **WHEN** a root derived property has no explicit target
- **THEN** constraints or model checking report the missing target
