## ADDED Requirements

### Requirement: Module concept
The `causeway` language SHALL provide a `Module` root concept that is an `INamedConcept`. A `Module` SHALL contain zero or more `Entity` children and SHALL define the Java package and the `@Named` logical-type-name prefix for the entities it contains.

#### Scenario: Empty module
- **WHEN** a `Module` named `customers` is created with no entities
- **THEN** the model is valid and the module contributes the package/`@Named` prefix `customers`

#### Scenario: Module owns entities
- **WHEN** an `Entity` is added as a child of a `Module`
- **THEN** the entity belongs to that module's package and logical-type-name namespace

### Requirement: Entity concept
The `causeway` language SHALL provide an `Entity` root concept that is an `INamedConcept`. An `Entity` SHALL contain zero or more `Property` children and zero or more `Action` children.

#### Scenario: Entity with members
- **WHEN** an `Entity` named `Customer` contains a `Property` and an `Action`
- **THEN** the model is valid and the entity exposes both members

#### Scenario: Unique member names within an entity
- **WHEN** two properties (or two actions) within the same entity share a name
- **THEN** the language reports a constraint violation

### Requirement: Property concept
The `causeway` language SHALL provide a `Property` concept owned by an `Entity`. A `Property` SHALL have a name and a `Type`.

#### Scenario: Typed property
- **WHEN** a `Property` named `name` is given the type `String`
- **THEN** the model is valid and the property's type resolves to `java.lang.String`

### Requirement: Action concept with embedded baseLanguage body
The `causeway` language SHALL provide an `Action` concept owned by an `Entity`. An `Action` SHALL have a name, an ordered list of `Parameter` children, a return `Type`, a `SemanticsOf` value, and a body that is an embedded MPS baseLanguage statement list (real Java), not a custom expression language.

#### Scenario: Action with parameters and a Java body
- **WHEN** an `Action` named `placeOrder` declares a parameter `quantity` of type `int` and a body containing Java statements
- **THEN** the model is valid and the body is editable as baseLanguage within the action node

#### Scenario: Action references its own entity as return type
- **WHEN** an `Action` on `Customer` sets its return `Type` to a reference to the `Customer` entity
- **THEN** the reference resolves to the owning entity

### Requirement: Type is a union of DSL entity reference and Java type
The `causeway` language SHALL provide a `Type` concept that is a union: it SHALL be either a reference to another DSL `Entity` node, or a wrapped baseLanguage Java type. Entity references SHALL be by model node (rename-safe), not by generated class name.

#### Scenario: Type referencing another DSL entity
- **WHEN** a property or parameter type is set to a reference to another `Entity` in the model
- **THEN** the reference resolves to that entity node, and renaming the entity updates the reference

#### Scenario: Type wrapping a plain Java type
- **WHEN** a property or parameter type is set to a baseLanguage type such as `BigDecimal`
- **THEN** the type resolves to the corresponding Java type via classpath stubs
