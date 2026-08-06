## ADDED Requirements

### Requirement: DSL declares calculated scalar properties

The DSL SHALL provide a named `DerivedProperty` declaration with a required result `Type` and an embedded BaseLanguage getter body.
A derived property SHALL represent calculated behavior and SHALL NOT add persisted entity state.

#### Scenario: Java-typed derived property

- **WHEN** a derived property named `displayName` declares Java type `String` and a body returning a string
- **THEN** the model represents a calculated `String` property without adding a persisted `Property`

#### Scenario: Entity-typed derived property

- **WHEN** a derived property declares an `EntityType` referencing `Product`
- **THEN** its result type resolves rename-safely to the `Product` entity node

### Requirement: Derived properties support nested and explicit-target placement

A `DerivedProperty` SHALL be valid either as a child of an `Entity` with an implicit target or as a model root with an explicit target `Entity` and mixee name.
A root derived property SHALL require an explicit target, and a nested derived property SHALL derive its target from the containing entity.
An explicit target SHALL be allowed to reference an entity in another imported model.

#### Scenario: Nested derived property uses its containing entity

- **WHEN** `displayName` is nested in `Customer`
- **THEN** its exact target and mixee type are `Customer`

#### Scenario: Root derived property contributes to an explicit target

- **WHEN** root derived property `preferredProduct` targets `Customer` as `customer`
- **THEN** the declaration contributes the property to `Customer` and exposes `customer` as the mixee handle

#### Scenario: Root declaration omits its target

- **WHEN** a root derived property has no explicit target
- **THEN** constraints or model checking report the missing target

### Requirement: Getter bodies can reference the mixee and injected services

A derived property SHALL allow zero or more named `InjectedService` declarations using the existing `Type` union.
The getter body SHALL expose the exact target mixee and every declared injected service as typed variables.
No action parameters or unrelated entity variables SHALL enter that scope.

#### Scenario: Getter uses the nested mixee

- **WHEN** a derived property nested in `Customer` returns a value computed from its `Customer` mixee
- **THEN** the mixee reference resolves with type `Customer`

#### Scenario: Getter uses an injected service

- **WHEN** a derived property declares `lookupService` and its getter body calls that service
- **THEN** the service reference resolves with its declared type

### Requirement: Getter return values match the declared result type

A derived property getter SHALL be checked as a no-argument method-like body whose expected return type is the declaration's result `Type`.
Every returned expression SHALL be compatible with that type.
A missing result type or incompatible returned expression SHALL be an error, and a derived property SHALL NOT declare a void result.

#### Scenario: Compatible return value passes

- **WHEN** a `String` derived property returns a `String` expression
- **THEN** its getter body passes type checking

#### Scenario: Incompatible return value fails

- **WHEN** a derived property declared as `Customer` returns a `Product`
- **THEN** model checking reports the incompatible returned expression

#### Scenario: Result type is missing

- **WHEN** a derived property has no result `Type`
- **THEN** model checking reports that its result type is required

### Requirement: Derived-property identity is deterministic per exact target

Within an exact target entity, a derived-property name SHALL be unique across nested and explicit-target derived properties and SHALL NOT collide with a persisted `Property` name.
Model checking SHALL report ambiguity or duplication instead of relying on declaration order.
Action names SHALL remain a separate member kind.

#### Scenario: Nested and explicit-target declarations collide

- **WHEN** a nested and a root derived property both contribute `displayName` to `Customer`
- **THEN** model checking reports the duplicate property identity

#### Scenario: Derived property collides with persisted state

- **WHEN** `Customer` has persisted property `name` and a derived property also contributes `name`
- **THEN** model checking reports the duplicate property identity

#### Scenario: Same name targets different entities

- **WHEN** `Customer` and `Product` each receive a derived property named `displayName`
- **THEN** both declarations remain valid because their exact targets differ

### Requirement: Existing persisted properties and actions remain compatible

Adding derived-property support SHALL NOT change the structure, typing, persistence, or generation semantics of existing `Property` and `Action` declarations.
The DSL SHALL NOT add derived-property access or invocation sugar in this change.

#### Scenario: Existing model contains no derived properties

- **WHEN** an existing DSL model is rebuilt without adding a `DerivedProperty`
- **THEN** its persisted properties, actions, and generated behavior remain unchanged
