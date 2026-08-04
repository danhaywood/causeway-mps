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

The generator SHALL emit, for each `Action` on an `Entity`, a separate `Mixee_member` mixin class such as `Customer_placeOrder`.
The mixin SHALL be annotated with `@Action(semantics = …)`, have a public single-argument constructor whose parameter type is the mixee, and have an `act` method carrying `@MemberSupport` whose signature reflects the parameters and return `Type` and whose body is the generated BaseLanguage from the action's `body`.
The entity class itself SHALL contain no action method.

#### Scenario: Action generates a mixin

- **WHEN** the generator runs on an `Action` named `placeOrder` with semantics `IDEMPOTENT`, a `product` parameter, and a Java body on entity `Customer`
- **THEN** it produces a `Customer_placeOrder` class with `@Action(semantics = SemanticsOf.IDEMPOTENT)`, constructor `Customer_placeOrder(Customer)`, and `@MemberSupport public … act(...) { … }` containing the generated body, while `Customer` itself has no `placeOrder` method

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
