## MODIFIED Requirements

### Requirement: Module concept
The `causeway` language SHALL provide a `Module` root concept that is an `INamedConcept`. A `Module` SHALL
be a **singleton metadata root** per model — carrying module identity (the namespace that prefixes each
`@Named` logical-type-name) — and SHALL NOT contain `Entity` or `Action` children. The model itself is the
module boundary (one MPS model = one module; the model name maps to the package); entities are top-level
roots of the model rather than children of the `Module`. The generator SHALL read the `Module` singleton
for namespace metadata and SHALL produce no class from it (the `Module` root is abandoned in generation).

#### Scenario: Module carries namespace, owns no members
- **WHEN** a model `customers` contains a `Module` singleton and two `Entity` roots
- **THEN** the model is valid, the `Module` contains no entities or actions, and the entities are roots of
  the model

#### Scenario: Module namespace prefixes @Named
- **WHEN** an `Entity` named `Customer` is generated in a model whose `Module` namespace is `customers`
- **THEN** the generated class's `@Named` logical-type-name is prefixed by that namespace

### Requirement: Entity concept
The `causeway` language SHALL provide an `Entity` **root** concept (`INamedConcept`). An `Entity` SHALL
contain zero or more `Property` children (`properties`, `0..n`) and zero or more nested `Action` children
(`actions`, `0..n`). Each `Entity` root generates exactly one top-level Java class file; its nested actions
are generated **within** that file (see the Action concept).

#### Scenario: Entity is a model root with members
- **WHEN** an `Entity` named `Customer` is a root of the `customers` model containing a `Property` and a
  nested `Action`
- **THEN** the model is valid and the entity exposes both members

#### Scenario: Entity generates one file
- **WHEN** the generator runs over an `Entity` root
- **THEN** it produces exactly one top-level class file for that entity

### Requirement: Action concept
The `causeway` language SHALL provide an `Action` concept (`INamedConcept`) that is **both** a valid
nested child of an `Entity` (the `actions` containment) **and** rootable as a top-level concept. An
`Action` SHALL be authored in one of two forms, discriminated by its optional `target` reference to an
`Entity`:

- **nested** — the `Action` is contained in an `Entity` and its `target` is empty; the mixee is implicitly
  the enclosing entity. A nested action SHALL generate as a **non-static inner mixin class** of the
  enclosing entity's generated class, sharing that entity's file. The mixee is the enclosing instance
  (`Outer.this`), and the mixin's single-argument constructor is the one the Java compiler synthesises for
  a non-static inner class.
- **top-level** — the `Action` is a root with its `target` reference set to an `Entity` (possibly in
  another module's model); the mixee is that target. A top-level action SHALL generate as a **separate
  top-level mixin class** file via a root mapping rule, contributing to its target (a cross-model reference
  when the target lives in another module).

An `Action` SHALL otherwise have a name; an ordered list of `Parameter` children (`0..n`); a return
`Type`; a `SemanticsOf` value; and an `act` body that is an embedded MPS baseLanguage statement list (real
Java).

#### Scenario: Nested action generates as an inner class
- **WHEN** an `Action` named `placeOrder` is nested in entity `Customer` with an empty `target`
- **THEN** the model is valid, the action's mixee is `Customer`, and generation emits a non-static inner
  mixin class inside `Customer`'s generated file (no separate file)

#### Scenario: Top-level action generates as a separate file
- **WHEN** an `Action` is a root with its `target` set to entity `Customer`
- **THEN** the model is valid and generation emits a separate top-level mixin class file contributing to
  `Customer`

#### Scenario: Cross-module contribution via cross-model reference
- **WHEN** a top-level `Action` root in module-model `orders` sets its `target` to an `Entity` in
  module-model `customers`
- **THEN** the reference resolves across models and the mixin is generated in `orders` contributing to the
  `customers` entity

#### Scenario: Action body references an external type
- **WHEN** an `Action` body references a type available via classpath stubs (a Causeway service or a
  hand-written class)
- **THEN** the reference resolves within the model
