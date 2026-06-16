# Tasks

Split into two phases (decided 2026-06-16): **Phase A** is plain-Java de-risking that
needs no MPS IDE; **Phase B** is the MPS language authoring. See `reference-app/SETUP.md`.

**UPDATE (2026-06-16):** the original assumption that Phase B "must be done through the MPS
projectional editor" was **disproven** by `spike-headless-authoring` (verdict: GO). Claude can
author `.mps` models **headlessly** by hand-editing XML and validating via `./gradlew checkModels`
(see `docs/spike-headless-authoring-verdict.md`). The only GUI step needed is a one-time capture
of a new language's concept/feature IDs (reference it once in MPS, save, read the ids). The
structure concepts (task 2) were authored this way and pass modelcheck clean.

## 1. Phase A — Plain-Java de-risking (no MPS IDE)

- [x] 1.1 Create `reference-app` Maven module (Causeway applib 3.6.0 + Jakarta Persistence/Inject, JDK 21)
- [x] 1.2 Write hand-written sample domain service (`app.OrderService`) — the coexisting external code
- [x] 1.3 Write golden reference entities (`customers.Customer`, `customers.Product`) in the locked idiom
- [x] 1.4 Compile golden + sample against real Causeway jars — validates the idiom; resolves the no-Lombok getter-annotation wrinkle empirically
- [x] 1.5 Document the stub/classpath setup and golden idiom (`reference-app/SETUP.md`)
- [ ] 1.6 (deferred) Boot a Causeway app context to verify runtime introspection under `ENCAPSULATION_ENABLED` (compile-time only so far)

## 2. Phase B — Structure concepts (causeway.structure — authored HEADLESSLY)

- [x] 2.1 `Module` root concept (`INamedConcept`) with `entities` 0..n → Entity
- [x] 2.2 `Entity` concept (`INamedConcept`) with `properties` 0..n → Property and `actions` 0..n → Action (note: Entity is a child of Module, so not rootable; only Module is rootable)
- [ ] 2.3 `Type` union concept — NOT done. Placeholder: `Property.type`/`Parameter.type` are currently direct references to `Entity`. Needs an interface concept + `EntityType` arm + baseLanguage-type arm (capture `InterfaceConceptDeclaration` + baseLanguage ids once via GUI).
- [x] 2.4 `Property` concept (`INamedConcept`) with a `type` (currently ref → Entity; see 2.3)
- [x] 2.5 `Parameter` concept (`INamedConcept`) with a `type` (currently ref → Entity; see 2.3)
- [~] 2.6 `Action` concept — PARTIAL: `INamedConcept` + `parameters` 0..n → Parameter done; **deferred:** return `Type`, `SemanticsOf` (enum), and the embedded baseLanguage `StatementList` body (need the enum + baseLanguage ids).

## 3. Phase B — Constraints, typesystem & editor (causeway.* — headless)

- [ ] 3.1 Constraint: member names unique within an entity (properties and actions)
- [ ] 3.2 Typesystem/scoping: `Type` entity-reference resolves to an `Entity` node; baseLanguage-type alternative resolves via stubs (depends on 2.3)
- [ ] 3.3 Editor: rely on MPS **default editors** for v1 (no editor aspect authored); revisit only if the inline baseLanguage body needs a custom cell

## 4. Phase B — Generator (MPS IDE: causeway.generator)

Target output is the compile-verified golden reference in `reference-app/src/main/java/customers/`.

- [ ] 4.1 Template: `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class
- [ ] 4.2 Template: `Property` → plain private JPA-annotated field (field-access) + explicit `@Property @Domain.Include` private getter, no Lombok, no setter
- [ ] 4.3 Template: `Action` → public `@Action(semantics=…)` method with parameters, return type, and the generated baseLanguage body
- [ ] 4.4 Resolve `Type` entity references to the generated class name; resolve baseLanguage types directly

## 5. Phase B — Wire sandbox stubs & verify end-to-end (MPS IDE + Maven)

- [ ] 5.1 Import Causeway applib + Jakarta Persistence/Inject + the `reference-app` (hand-written app) into `causeway.sandbox` as Java classpath stubs
- [ ] 5.2 Author a sample DSL program in `causeway.sandbox`: module `customers`, entity `Customer` with a `String name` property and a `placeOrder` action whose body calls `OrderService`
- [ ] 5.3 Generate and diff the output against the golden reference (annotations, field+getter, action method)
- [ ] 5.4 Compile the generated sources against the Causeway applib + Jakarta Persistence (reuse the Phase A pom/classpath)
- [ ] 5.5 Confirm the generated action body referencing the external type compiles (coexistence milestone met end-to-end)
