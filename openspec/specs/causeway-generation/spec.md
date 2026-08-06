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
