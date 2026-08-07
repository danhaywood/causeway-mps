# causeway-generation Specification

## Purpose

Generate compilable Apache Causeway 3.6 domain classes and action mixins from `causeway` DSL models.

## Requirements

### Requirement: Entity generates an annotated Causeway domain class (pure state)

The generator SHALL emit, for each `Entity`, a Java class annotated with `@Named` using the `Module` prefix, `@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)`, and JPA `@Entity` and `@Table`.
Introspection SHALL be set per object so the generated class is self-contained.
The class SHALL contain only persisted state as fields and getters; actions and derived members SHALL be generated as separate mixin classes.

#### Scenario: Entity class is generated and compiles

- **WHEN** the generator runs on an `Entity` named `Customer` in module `customers`
- **THEN** it produces a `customers.Customer` class with those annotations, holding only state, that matches the golden reference and compiles against the Causeway and Jakarta APIs

### Requirement: Property generates a JPA field plus an explicit annotated getter

The generator SHALL emit, for each `Property`, a plain private field with JPA annotations using field access and a separate explicit private getter annotated with `@Property` and `@Domain.Include`.
The generator SHALL NOT emit Lombok annotations or a setter in this slice.

#### Scenario: Property generates field and getter

- **WHEN** the generator runs on a `Property` named `name` of Java type `String`
- **THEN** it produces a `private String name;` field with JPA annotations and an `@Property @Domain.Include private String getName() { return name; }` method, with no Lombok annotations or setter

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

### Requirement: Type references resolve in generated code

The generator SHALL resolve an `EntityType` to the referenced entity's generated class name and a `JavaType` to its underlying Java type.

#### Scenario: Entity-typed parameter uses the generated class name

- **WHEN** an `Action` parameter has an `EntityType` referencing `Product`
- **THEN** the generated parameter type is `customers.Product`, the generated class

### Requirement: Generation is one-way and the output compiles

Generated Java SHALL be the sole product of the model and SHALL never be hand-edited.
The complete generated output SHALL compile against the Causeway applib and Jakarta Persistence APIs.

#### Scenario: Headless generate produces compilable output

- **WHEN** `./gradlew generateModels` runs on a module with an entity, property, and action
- **THEN** it generates Java that matches the golden reference and compiles with no errors

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
