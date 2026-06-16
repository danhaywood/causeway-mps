## ADDED Requirements

### Requirement: Entity generates an annotated Causeway domain class
The generator SHALL emit, for each `Entity`, a Java class annotated with `@Named` (using the module prefix), `@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)`, and JPA `@Entity`/`@Table`. The introspection policy SHALL be set per-object so the class is self-contained, not reliant on global configuration.

#### Scenario: Entity class is generated and compiles
- **WHEN** the generator runs on an `Entity` named `Customer` in module `customers`
- **THEN** it produces a `customers.Customer` Java class annotated `@Named("customers.Customer")`, `@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)`, `@Entity`, and `@Table`, that compiles against the Causeway and Jakarta Persistence APIs

### Requirement: Property generates a JPA field plus an explicit annotated getter
The generator SHALL emit, for each `Property`, a plain private field carrying JPA annotations (field-access, e.g. `@Column`) and a separate explicit private getter method annotated `@Property` and `@Domain.Include`. The generator SHALL NOT use Lombok. In this slice properties are read-only (getter only, no setter).

#### Scenario: Property generates field and getter
- **WHEN** the generator runs on a `Property` named `name` of type `String`
- **THEN** it produces a `private String name;` field with JPA annotations and a `@Property @Domain.Include private String getName() { return name; }` method, with no Lombok annotations and no setter

### Requirement: Action generates an annotated method with the embedded body
The generator SHALL emit, for each `Action`, a public method annotated `@Action(semantics = …)` whose signature reflects the declared parameters and return `Type`, and whose body is the generated baseLanguage from the action's body node.

#### Scenario: Action generates a semantics-annotated method
- **WHEN** the generator runs on an `Action` named `placeOrder` with `SemanticsOf.IDEMPOTENT`, a `quantity` parameter, and a Java body
- **THEN** it produces a `@Action(semantics = SemanticsOf.IDEMPOTENT) public … placeOrder(final int quantity) { … }` method whose body is the generated Java statements

### Requirement: Generation is one-way and the output compiles
Generated Java SHALL be the sole product of the model and SHALL never be hand-edited. The complete generated output for a modelled module SHALL compile against the Causeway applib and Jakarta Persistence APIs.

#### Scenario: Full module generation compiles
- **WHEN** a `Module` containing at least one `Entity` with a `Property` and an `Action` is generated
- **THEN** the resulting Java sources compile successfully against the Causeway and Jakarta Persistence APIs
