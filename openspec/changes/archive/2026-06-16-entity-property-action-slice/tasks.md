# Tasks

Scope (after the 2026-06-16 re-slice): the **delivered foundation** of the first slice —
plain-Java idiom de-risking + the core MPS structure concepts (authored headlessly).
Remaining first-slice work moved to follow-on changes (see proposal).

## 1. Plain-Java de-risking (`reference-app`)

- [x] 1.1 Create `reference-app` Maven module (Causeway applib 3.6.0 + Jakarta Persistence/Inject, JDK 21)
- [x] 1.2 Write hand-written sample domain service (`app.OrderService`) — the coexisting external code
- [x] 1.3 Write golden reference entities (`customers.Customer`, `customers.Product`) in the locked idiom
- [x] 1.4 Compile golden + sample against real Causeway jars — validates the idiom; resolves the no-Lombok getter-annotation wrinkle empirically
- [x] 1.5 Document the stub/classpath setup and golden idiom (`reference-app/SETUP.md`)

## 2. Core structure concepts (causeway.structure — authored headlessly)

- [x] 2.1 `Module` root concept (`INamedConcept`) with `entities` 0..n → Entity
- [x] 2.2 `Entity` concept (`INamedConcept`) with `properties` 0..n → Property and `actions` 0..n → Action
- [x] 2.3 `Property` concept (`INamedConcept`) with a `type` (reference → Entity)
- [x] 2.4 `Parameter` concept (`INamedConcept`) with a `type` (reference → Entity)
- [x] 2.5 `Action` concept (`INamedConcept`) with `parameters` 0..n → Parameter
- [x] 2.6 Validate the whole structure model headlessly (`./gradlew checkModels`, 0 errors)

## Moved to follow-on changes

- `Type` union, `Action` return type / `SemanticsOf` / embedded baseLanguage body → **`dsl-type-system`**
- Unique-member-name constraint, `Type` typesystem/scoping → **`dsl-type-system`**
- MPS generator (concepts → golden Causeway Java) → **`causeway-generator-first-slice`**
- Sandbox stubs, sample DSL program, generate→diff→compile, runtime introspection check → **`sandbox-sample-and-e2e`**
- CI productionization → **`headless-mps-build`**
