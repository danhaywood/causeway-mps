## ADDED Requirements

### Requirement: Entity generates an annotated Causeway domain class
The generator SHALL emit, for each `Entity`, a Java class annotated with `@Named` (using the `Module`
prefix), `@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)`,
and JPA `@Entity`/`@Table`. Introspection SHALL be set per-object (self-contained).

#### Scenario: Entity class is generated and compiles
- **WHEN** the generator runs on an `Entity` named `Customer` in module `customers`
- **THEN** it produces a `customers.Customer` class with those annotations that matches the golden
  reference and compiles against the Causeway + Jakarta APIs

### Requirement: Property generates a JPA field plus an explicit annotated getter
The generator SHALL emit, for each `Property`, a plain private field with JPA annotations (field-access)
and a separate explicit private getter annotated `@Property` and `@Domain.Include`. No Lombok; no setter
(read-only) in this slice.

#### Scenario: Property generates field and getter
- **WHEN** the generator runs on a `Property` named `name` of Java type `String`
- **THEN** it produces a `private String name;` field with JPA annotations and a
  `@Property @Domain.Include private String getName() { return name; }` method, no Lombok, no setter

### Requirement: Action generates an annotated method with the embedded body
The generator SHALL emit, for each `Action`, a public method annotated `@Action(semantics = …)` whose
signature reflects the parameters and return `Type` and whose body is the generated baseLanguage from
the action's `body`.

#### Scenario: Action generates a semantics-annotated method with its body
- **WHEN** the generator runs on an `Action` `placeOrder` (semantics `IDEMPOTENT`, a `product`
  parameter, a Java body)
- **THEN** it produces a `@Action(semantics = SemanticsOf.IDEMPOTENT) public … placeOrder(...) { … }`
  method whose body is the generated Java statements

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
