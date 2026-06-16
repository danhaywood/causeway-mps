## Why

Apache Causeway domain code is highly conventional and boilerplate-heavy: annotated entities, opt-in members, supporting methods, persistence mappings. A JetBrains MPS language can capture domain intent at a higher altitude and generate the conventional Java. Before investing in the full programming model, we need one thin vertical slice that proves the entire pipeline — modelling concepts → generating compilable, annotated Causeway Java — and, critically, proves that embedded Java in action bodies can reference the surrounding hand-written application. Everything else layers onto a working slice.

## What Changes

- Add core structure concepts to the `causeway` MPS language: `Module`, `Entity`, `Property`, `Action`, `Parameter`, and a `Type` union.
- `Type` is a union: either a reference to another DSL `Entity` node (intra-model, rename-safe) **or** a wrapped baseLanguage Java type (e.g. `String`, `BigDecimal`, a hand-written class).
- `Action` carries parameters, a return `Type`, a `SemanticsOf` value, and a body that is **real embedded MPS baseLanguage** (a Java `StatementList`) — not a custom expression language.
- Add an MPS generator that emits compilable, annotated Causeway Java:
  - `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class. Introspection is set **per-object** (self-contained), not globally.
  - `Property` → a plain private JPA-annotated field (field-access) plus an **explicit private getter** annotated `@Property` + `@Domain.Include`. **No Lombok.** Getters-only ⇒ read-only properties in this slice.
  - `Action` → a public method annotated `@Action(semantics=…)` whose body is the generated baseLanguage.
- Wire the `causeway.sandbox` solution to import the Causeway API and a hand-written application as **Java classpath stubs**, so embedded action bodies can reference external types. Generation is strictly **one-way** (DSL → Java); generated sources are never hand-edited.

## Capabilities

### New Capabilities
- `dsl-domain-model`: The MPS structure concepts (`Module`, `Entity`, `Property`, `Action`, `Parameter`, `Type` union) and how they compose, including embedded baseLanguage action bodies.
- `causeway-java-generation`: The generator that turns the domain model into compilable, annotated Causeway Java following the locked idiom (JPA field-access, per-object encapsulation, explicit annotated getters, action methods).
- `java-classpath-interop`: Coexistence with hand-written Java — importing the Causeway API and application as classpath stubs so embedded action bodies can reference external types, with strictly one-way generation.

### Modified Capabilities
<!-- None — this is the first change; no existing specs. -->

## Impact

- **MPS language `causeway`**: new concepts in `structure.mps`; constraints/typesystem/editor aspects as needed for the `Type` union and references.
- **MPS generator `causeway.generator`**: new templates mapping concepts → Causeway Java.
- **Solution `causeway.sandbox`**: classpath/stub dependencies on Causeway API + a sample hand-written app; first DSL program lives here.
- **Dependencies**: Causeway applib (annotations), Jakarta Persistence — referenced as stubs, not added to the language runtime.
- **Out of scope (deferred):** Maven `generated-sources` build wiring, editability/setters, collections, view models, domain services, mixins, layouts/grids, security.
