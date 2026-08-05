## MODIFIED Requirements

### Requirement: Action generates a mixin class with the embedded body
The generator SHALL emit each `Action` as a Causeway mixin class while preserving its authored placement.
An action nested in an `Entity` SHALL generate as a public static nested class of that entity's generated class.
A root action with an explicit `target` SHALL generate as a top-level `Mixee_member` class named from the target entity and action.
Both forms SHALL be annotated with `@Action(semantics = …)`, have a public single-argument constructor whose parameter type is the mixee, and have an `act` method carrying `@MemberSupport` whose signature reflects the parameters and return `Type` and whose body is the generated BaseLanguage from the action's `body`.
The entity class itself SHALL contain no action method.

#### Scenario: Nested action generates a static nested mixin
- **WHEN** the generator runs on an `Action` named `placeOrder` nested in entity `Customer`
- **THEN** it produces a public static `Customer.placeOrder` class with `@Action`, constructor `placeOrder(Customer)`, and an `@MemberSupport act(...)` method containing the generated body, while `Customer` itself has no `placeOrder` method

#### Scenario: Explicit-target action generates a top-level mixin
- **WHEN** the generator runs on a root `Action` named `topLevelProbe` whose explicit target is `Customer`
- **THEN** it produces a top-level `Customer_topLevelProbe` class with `@Action`, constructor `Customer_topLevelProbe(Customer)`, and an `@MemberSupport act(...)` method containing the generated body
