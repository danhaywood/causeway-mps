## ADDED Requirements

### Requirement: Synchronous wrapped invocation generates WrapperFactory mixin dispatch

The generator SHALL lower a synchronous wrapped DSL action invocation to `WrapperFactory.wrapMixin(generatedMixinClass, target[, control]).act(args)`.
The generated mixin class literal SHALL correspond to the referenced action's actual nested or explicit-target placement.
The generator SHALL omit the control argument when the model does not contain an explicit `SyncControl` expression.

#### Scenario: Nested action uses synchronous default control

- **WHEN** `wrap(customer).placeOrder(product, quantity)` references `placeOrder` nested in `Customer`
- **THEN** generated Java invokes the equivalent of `__wrapperFactory.wrapMixin(Customer.placeOrder.class, customer).act(product, quantity)`

#### Scenario: Explicit-target action uses synchronous explicit control

- **WHEN** `wrap(customer, syncControl).topLevelProbe()` references root action `topLevelProbe` targeting `Customer`
- **THEN** generated Java invokes the equivalent of `__wrapperFactory.wrapMixin(Customer_topLevelProbe.class, customer, syncControl).act()`

### Requirement: Asynchronous wrapped invocation generates WrapperFactory async dispatch

The generator SHALL lower an asynchronous value-returning action invocation through `WrapperFactory.asyncWrapMixin(...).applyAsync(...)`.
The generator SHALL lower an asynchronous action without a declared return type through `WrapperFactory.asyncWrapMixin(...).acceptAsync(...)`.
The generated lambda SHALL invoke the selected mixin's `act(args)` method, and the generator SHALL pass an explicit `AsyncControl` only when one is present in the model.

#### Scenario: Value-returning action uses applyAsync

- **WHEN** `asyncWrap(customer).findReplacement()` references an action returning `Product`
- **THEN** generated Java uses `asyncWrapMixin` and `applyAsync` to produce `TryFuture<Product>`

#### Scenario: Void action uses acceptAsync with explicit control

- **WHEN** `asyncWrap(customer, asyncControl).placeOrder(product, quantity)` references an action with no declared return type
- **THEN** generated Java passes `asyncControl` to `asyncWrapMixin` and uses `acceptAsync` to produce `TryFuture<Void>`

#### Scenario: Asynchronous explicit-target action uses a top-level class literal

- **WHEN** an asynchronous wrapped invocation references root action `topLevelProbe` targeting `Customer`
- **THEN** generated Java passes `Customer_topLevelProbe.class` to `asyncWrapMixin`

### Requirement: Wrapped invocation receives conditional WrapperFactory injection

A generated action mixin whose lifecycle subtree contains a wrapped invocation SHALL contain an injected private Causeway `WrapperFactory` field named `__wrapperFactory`.
A generated action containing no wrapped invocation SHALL retain its existing service-field shape.
An action containing both raw and wrapped invocations SHALL receive both reserved `FactoryService` and `WrapperFactory` fields.

#### Scenario: Wrapped caller receives WrapperFactory

- **WHEN** a DSL action body contains at least one synchronous or asynchronous wrapped invocation
- **THEN** its generated mixin class contains an `@Inject private WrapperFactory __wrapperFactory` field

#### Scenario: Raw-only caller does not receive WrapperFactory

- **WHEN** a DSL action contains only direct raw action invocations
- **THEN** the generator does not add `__wrapperFactory`

#### Scenario: Mixed caller receives both services

- **WHEN** a DSL action contains both raw and wrapped action invocations
- **THEN** its generated mixin contains the reserved `FactoryService` and `WrapperFactory` fields

### Requirement: Wrapped invocation compiles and enters the Causeway wrapper boundary

Generated synchronous and asynchronous wrapped forms SHALL compile with Java 21 against the pinned Causeway 3.6 APIs.
Runtime verification SHALL demonstrate that each generated form calls the expected `WrapperFactory` API with the selected mixin class, target, arguments, and optional control.
Wrapped dispatch SHALL preserve Causeway's rule-checking and interaction-notification boundary rather than calling `FactoryService.mixin(...).act(...)` directly.

#### Scenario: Headless build verifies all wrapped forms

- **WHEN** the sandbox contains valid nested and explicit-target synchronous, asynchronous, and controlled wrapped invocations
- **THEN** generation, model checking, generated Java compilation, wrapper-boundary verification, and runtime mixin verification all succeed in `headlessBuild`

#### Scenario: Wrapper rule rejection is observable

- **WHEN** the recording wrapper boundary rejects a generated wrapped action call before execution
- **THEN** runtime verification observes the rejection and confirms that the generated caller does not fall back to raw dispatch

#### Scenario: Wrapper interaction notification is observable

- **WHEN** the recording wrapper boundary accepts and executes a generated wrapped action call
- **THEN** runtime verification observes the interaction notification associated with that wrapped call
