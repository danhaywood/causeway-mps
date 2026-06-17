## ADDED Requirements

### Requirement: Entity generates an annotated Causeway domain class (pure state)
The generator SHALL emit, for each `Entity`, a Java class annotated with `@Named` (using the `Module`
prefix), `@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)`,
and JPA `@Entity`/`@Table`. Introspection SHALL be set per-object (self-contained). The class SHALL
contain only **persisted state** (fields + getters); actions (and derived members) are generated as
separate mixin classes.

#### Scenario: Entity class is generated and compiles
- **WHEN** the generator runs on an `Entity` named `Customer` in module `customers`
- **THEN** it produces a `customers.Customer` class with those annotations, holding only state, that
  matches the golden reference and compiles against the Causeway + Jakarta APIs

### Requirement: Property generates a JPA field plus an explicit annotated getter
The generator SHALL emit, for each `Property`, a plain private field with JPA annotations (field-access)
and a separate explicit private getter annotated `@Property` and `@Domain.Include`. No Lombok; no setter
(read-only) in this slice.

#### Scenario: Property generates field and getter
- **WHEN** the generator runs on a `Property` named `name` of Java type `String`
- **THEN** it produces a `private String name;` field with JPA annotations and a
  `@Property @Domain.Include private String getName() { return name; }` method, no Lombok, no setter

### Requirement: Action generates a mixin class with the embedded body
The generator SHALL emit, for each `Action` on an `Entity`, a separate `Mixee_member` **mixin class**
(e.g. `Customer_placeOrder`): annotated `@Action(semantics = …)`, with a public single-arg constructor
whose parameter type is the mixee, and a method named `act` carrying `@MemberSupport` whose signature
reflects the parameters and return `Type` and whose body is the generated baseLanguage from the action's
`body`. The entity class itself contains no action method. (Per the mixins-everywhere decision; matches
the re-goldened `reference-app`.)

#### Scenario: Action generates a mixin
- **WHEN** the generator runs on an `Action` `placeOrder` (semantics `IDEMPOTENT`, a `product`
  parameter, a Java body) on entity `Customer`
- **THEN** it produces a `Customer_placeOrder` class — `@Action(semantics = SemanticsOf.IDEMPOTENT)`,
  ctor `Customer_placeOrder(Customer)`, `@MemberSupport public … act(...) { … }` with the generated
  body — and `Customer` itself has no `placeOrder` method

### Requirement: Type references resolve in generated code
The generator SHALL resolve an `EntityType` to the referenced entity's generated class name and a
`JavaType` to its underlying Java type.

#### Scenario: Entity-typed parameter uses the generated class name
- **WHEN** an `Action` parameter has an `EntityType` referencing `Product`
- **THEN** the generated parameter type is `customers.Product` (the generated class)

### Requirement: Generation is one-way and the output compiles
Generated Java SHALL be the sole product of the model, never hand-edited, and the complete generated
output SHALL compile against the Causeway applib + Jakarta Persistence APIs.

#### Scenario: Headless generate produces compilable output
- **WHEN** `./gradlew generateModels` runs on a module with an entity, property, and action
- **THEN** it generates Java that matches the golden reference and compiles with no errors
