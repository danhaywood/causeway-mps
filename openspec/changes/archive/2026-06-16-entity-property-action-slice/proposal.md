## Why

Apache Causeway domain code is highly conventional and boilerplate-heavy. A JetBrains MPS
language can capture domain intent at a higher altitude and generate the conventional Java.
Before building the generator, we needed (1) confidence that the locked Causeway idiom is valid,
and (2) the core language structure modelled. This change delivers that **foundation**.

> **Re-sliced 2026-06-16 (Path B).** Originally this change bundled the entire first vertical
> slice (structure + generator + classpath interop + end-to-end). After `spike-headless-authoring`
> proved concepts can be authored headlessly, the slice was re-sliced: this change is narrowed to
> the **delivered foundation**, and the remaining work moves to focused follow-on changes:
> `dsl-type-system`, `causeway-generator-first-slice`, `sandbox-sample-and-e2e`.

## What Changes

- **Plain-Java de-risking (`reference-app`)**: a Maven module proving the locked idiom compiles
  against real Causeway 3.6.0 + Jakarta on JDK 21 — golden `Customer`/`Product` entities (field-access
  JPA, no Lombok, explicit `@Property @Domain.Include` private getters, per-object
  `ENCAPSULATION_ENABLED`) plus a hand-written `OrderService` demonstrating coexistence.
- **Core MPS structure concepts** in the `causeway` language, authored headlessly and modelcheck-clean:
  `Module` (root) → `entities` 0..n → `Entity` → `properties`/`actions` 0..n → `Property`/`Action` →
  `parameters` 0..n → `Parameter`; `Property`/`Parameter` carry a `type` reference.

## Capabilities

### New Capabilities
- `dsl-domain-model`: The core MPS structure concepts (`Module`, `Entity`, `Property`, `Action`,
  `Parameter`) and how they compose. (The `Type` union and the embedded-baseLanguage `Action` body
  are introduced by the `dsl-type-system` follow-on.)

### Modified Capabilities
<!-- None -->

## Impact

- **MPS language `causeway`**: `causeway.structure` gains the five concepts.
- **`reference-app/`**: new Maven module (golden idiom + sample service + `SETUP.md`).
- **Validated** by the headless build (`./gradlew checkModels`, 0 errors) and by compiling
  `reference-app` against real Causeway jars.
- **Follow-on changes** own: the `Type` union + `Action` behavior (`dsl-type-system`), the generator
  (`causeway-generator-first-slice`), and the sandbox sample + end-to-end compile
  (`sandbox-sample-and-e2e`). `headless-mps-build` owns CI productionization.
