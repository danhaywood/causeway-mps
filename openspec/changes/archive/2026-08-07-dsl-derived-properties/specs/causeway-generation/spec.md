## ADDED Requirements

### Requirement: Derived property generates a Causeway property mixin

The generator SHALL emit each `DerivedProperty` as a Causeway `@Property` mixin with an explicit final mixee field, a public one-argument constructor, and a public no-argument `prop()` method returning the declared result type.
A nested derived property SHALL generate as a public static nested class of its entity's generated class.
A root derived property with an explicit target SHALL generate as a top-level `Entity_property` class in its declaring model's package.

#### Scenario: Nested property generates a nested mixin

- **WHEN** `displayName` is nested in `Customer` and returns `String`
- **THEN** generation emits a public static `Customer.displayName` property mixin with constructor `displayName(Customer)` and `String prop()`

#### Scenario: Explicit-target property generates a top-level mixin

- **WHEN** root derived property `preferredProduct` targets `Customer` and returns `Product`
- **THEN** generation emits top-level property mixin `Customer_preferredProduct` with constructor `Customer_preferredProduct(Customer)` and `Product prop()`

### Requirement: Derived property generation preserves authored getter behavior

The generated `prop()` method SHALL contain the authored BaseLanguage getter body and SHALL preserve references to the mixee and declared injected services.
Each declared service SHALL generate as an `@Inject private <Type> <name>;` field on the property mixin.
The generated derived property SHALL NOT add a JPA field, entity getter, setter, or other persistent state to the target entity.

#### Scenario: Getter references mixee and service

- **WHEN** a derived-property body computes its result from the `Customer` mixee and an injected service
- **THEN** generated `prop()` reads the mixee field and service field and the mixin contains the corresponding `@Inject` declaration

#### Scenario: Derived property does not alter entity state

- **WHEN** `Customer` gains derived property `displayName`
- **THEN** the generated `Customer` entity gains only the nested mixin class and no persisted field or entity getter named `displayName`

### Requirement: Derived property output compiles and is discovered by Causeway

Generated nested and explicit-target derived-property forms SHALL compile with Java 21 against the pinned Causeway 3.6 APIs.
Runtime verification SHALL confirm that Causeway discovers each generated class as a property mixin for the expected mixee and recognizes its `prop()` main method.

#### Scenario: Headless build verifies property mixins

- **WHEN** the sandbox contains valid nested and explicit-target derived properties with Java and entity result types
- **THEN** generation, model checking, generated Java compilation, generated-source assertions, and runtime property-mixin verification all succeed in `headlessBuild`

#### Scenario: Runtime facet identifies the property member

- **WHEN** the runtime verifier processes a generated derived-property class
- **THEN** Causeway identifies the expected mixee, property member id, and no-argument `prop()` method without treating the declaration as persisted entity state
