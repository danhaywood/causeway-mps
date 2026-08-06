## ADDED Requirements

### Requirement: Transparent action invocation generates Causeway mixin plumbing

The generator SHALL lower each transparent DSL action invocation to a Causeway `FactoryService.mixin(generatedMixinClass, target).act(args)` call.
The generated mixin class literal SHALL correspond to the referenced action's actual nested or explicit-target placement.

#### Scenario: Nested action invocation uses a nested class literal

- **WHEN** an invocation references action `placeOrder` nested in entity `Customer`
- **THEN** generated Java invokes the equivalent of `__factoryService.mixin(Customer.placeOrder.class, target).act(args)`

#### Scenario: Explicit-target action invocation uses a top-level class literal

- **WHEN** an invocation references root action `topLevelProbe` whose explicit target is `Customer`
- **THEN** generated Java invokes the equivalent of `__factoryService.mixin(Customer_topLevelProbe.class, target).act(args)`

### Requirement: Generated invocation receives FactoryService injection

A generated action mixin whose lifecycle subtree contains a transparent action invocation SHALL contain an injected private Causeway `FactoryService` field available to the generated call.
The field SHALL use a reserved generated name that cannot silently collide with an authored injected service.
A generated action that contains no transparent invocation SHALL retain its existing service-field shape.

#### Scenario: Calling action receives FactoryService

- **WHEN** a DSL action body contains a transparent invocation
- **THEN** its generated mixin class contains an `@Inject` private `FactoryService __factoryService` field

#### Scenario: Unchanged action does not gain FactoryService

- **WHEN** a DSL action contains no transparent invocation
- **THEN** the generator does not add the reserved `FactoryService` field solely because the language supports transparent invocation

### Requirement: Generated invocation compiles and preserves runtime mixin validity

Generated nested and top-level invocation forms SHALL compile with Java 21 against the existing generated application classpath.
The action mixins containing and receiving representative invocations SHALL continue to satisfy the Causeway 3.6 runtime mixin verification gate.

#### Scenario: Headless build verifies generated invocation

- **WHEN** the sandbox contains valid nested and explicit-target transparent action invocations
- **THEN** generation, modelcheck, generated Java compilation, and runtime mixin verification all succeed in `headlessBuild`
