## Context

The `causeway-mps` project is a freshly-scaffolded JetBrains MPS language (`causeway`) with the standard aspect models (structure, behavior, constraints, typesystem, editor), a generator, a `causeway.runtime` solution, and a `causeway.sandbox` solution — all currently empty. The goal is a DSL that models Apache Causeway domain objects at a higher altitude and generates the conventional, boilerplate-heavy Causeway Java.

This change builds the first vertical slice end-to-end: model `Module`/`Entity`/`Property`/`Action`, generate compilable annotated Causeway Java, and prove that embedded Java action bodies can reference a surrounding hand-written application. The slice exists to de-risk the whole pipeline before investing in the broader programming model.

## Goals / Non-Goals

**Goals:**
- Concepts: `Module`, `Entity`, `Property`, `Action`, `Parameter`, and a `Type` union.
- Action bodies are real embedded MPS baseLanguage (Java `StatementList`).
- Generate compilable Causeway Java in the locked idiom (JPA field-access, no Lombok, explicit annotated private getters, per-object `ENCAPSULATION_ENABLED`).
- Prove classpath-stub interop: an action body can reference an external Java type and the generated body compiles.

**Non-Goals:**
- Maven `generated-sources` build wiring (follows the first generated class).
- Editability/setters, collections, view models, domain services, mixins, layouts/grids, security.
- A custom expression language for behavior (we embed Java instead).
- Round-tripping or reading Java back into the model.

## Decisions

**Embed baseLanguage rather than design an expression language.** Action bodies are arbitrary Java. MPS's language composition lets us embed a real Java `StatementList` inside the `Action` concept. This is the primary reason MPS was chosen over Xtext/ANTLR — alternatives (a) generate skeletons and hand-write bodies in separate Java (round-trip/partial-class friction) or (c) model behavior with a higher-level DSL (effectively building a programming language) were both rejected.

**Coexist via the JVM classpath; generation is strictly one-way.** The model and hand-written Java never read each other — they meet on the classpath. DSL-owned classes are 100% generated to a generated-sources location and never hand-edited; interop happens through ordinary Java (Spring `@Inject`, direct references). Regenerate-and-overwrite makes hand-editing pointless. Alternative — treating the model as sole source of truth — was rejected because the DSL must drop into existing Causeway apps.

**Stub wiring is a first-class milestone.** For an action body to call `repositoryService.persist(this)` or a hand-written service, the `causeway.sandbox` solution must import the Causeway applib and the app as read-only Java stubs. "Reference an external type from an action body" is treated as equal in importance to "generate an entity"; if stubs are misconfigured, every body fills with unresolved references.

**`Type` is a union of {DSL entity reference, baseLanguage type}.** Intra-model references point at the `Entity` *node* (rename-safe) and the generator resolves them to the generated class name; this dodges a chicken-and-egg trap where referencing entities *as generated stubs* would require the stubs to exist before generation. Value types and external classes are wrapped baseLanguage types resolved via stubs.

**No Lombok; explicit annotated private getters.** Since we generate anyway, Lombok adds an annotation-processor/build-tooling dependency for no benefit. The generator emits a plain private JPA-annotated field plus an explicit `@Property @Domain.Include private <T> getX() { return x; }`. Putting annotations directly on the generated getter also removes the ambiguity about where member annotations must sit. Getters-only ⇒ read-only properties in this slice.

**Per-object introspection policy.** `@DomainObject(introspection = ENCAPSULATION_ENABLED)` is emitted on each entity so generated classes are self-contained and do not depend on the host app's global `causeway.core.meta-model.introspector.policy`. ENCAPSULATION_ENABLED is what lets members and supporting methods be private.

## Risks / Trade-offs

- **Stub wiring is fragile and environment-specific** → Build it first and prove the milestone scenario (action body references an external type, generated body compiles) before hardening any templates. Document the exact classpath/library setup in the sandbox.
- **One-way generation invites hand-editing of generated files** ("just this once") → Generate to a clearly-marked generated-sources location, overwrite on every run, and never read it back.
- **Generated `@Named`/package layout could collide with the host app's conventions** → Derive both from the `Module` name and keep them explicit and visible; revisit if a real app needs configurability.
- **Read-only properties may feel limiting early** → Acceptable for the slice; editability is a deferred facet on `Property`, not a rework.
- **MPS baseLanguage version coupling** → Pin the baseLanguage version used by the generator; the scaffold already records language versions.
