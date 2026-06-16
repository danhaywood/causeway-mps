# Tasks

Split into two phases (decided 2026-06-16): **Phase A** is plain-Java de-risking that
needs no MPS IDE; **Phase B** is the MPS language authoring, which must be done
through the MPS projectional editor (`.mps` model files cannot be reliably hand-written
as text). See `reference-app/SETUP.md`.

## 1. Phase A — Plain-Java de-risking (no MPS IDE)

- [x] 1.1 Create `reference-app` Maven module (Causeway applib 3.6.0 + Jakarta Persistence/Inject, JDK 21)
- [x] 1.2 Write hand-written sample domain service (`app.OrderService`) — the coexisting external code
- [x] 1.3 Write golden reference entities (`customers.Customer`, `customers.Product`) in the locked idiom
- [x] 1.4 Compile golden + sample against real Causeway jars — validates the idiom; resolves the no-Lombok getter-annotation wrinkle empirically
- [x] 1.5 Document the stub/classpath setup and golden idiom (`reference-app/SETUP.md`)
- [ ] 1.6 (deferred) Boot a Causeway app context to verify runtime introspection under `ENCAPSULATION_ENABLED` (compile-time only so far)

## 2. Phase B — Structure concepts (MPS IDE: causeway.structure)

- [ ] 2.1 Add `Module` root concept (`INamedConcept`) with an `entities` child collection
- [ ] 2.2 Add `Entity` root concept (`INamedConcept`) with `properties` and `actions` child collections
- [ ] 2.3 Add `Type` union concept: alternative of an `Entity` reference vs a wrapped baseLanguage type
- [ ] 2.4 Add `Property` concept with `name` and a `Type`
- [ ] 2.5 Add `Parameter` concept with `name` and a `Type`
- [ ] 2.6 Add `Action` concept with `parameters`, return `Type`, `SemanticsOf` value, and an embedded baseLanguage `StatementList` body

## 3. Phase B — Constraints, typesystem & editor (MPS IDE)

- [ ] 3.1 Constraint: member names unique within an entity (properties and actions)
- [ ] 3.2 Typesystem/scoping: `Type` entity-reference resolves to an `Entity` node; baseLanguage-type alternative resolves via stubs
- [ ] 3.3 Editor: projectional editors for `Module`, `Entity`, `Property`, `Action` (including inline baseLanguage body)

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
