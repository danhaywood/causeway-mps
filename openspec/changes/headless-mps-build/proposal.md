## Why

The Causeway MPS DSL currently has no headless build: the only way to generate the `causeway` language and verify its output is through the MPS GUI IDE (`MPS.app`, MPS 2025.3 / baseline 253). That makes the `entity-property-action-slice` verification tasks (generate → model-check → compile generated Java) un-runnable from the command line and impossible to gate in CI — every change relies on a human opening the IDE. A reproducible, CI-runnable generate→build→compile pipeline turns those manual checks into an automated gate and lets contributors validate language changes without the IDE. This was explicitly deferred during the first slice; this change picks it up.

## What Changes

- Add a headless MPS build toolchain (preferring the **mps-gradle-plugin**; ant-based MPS build is the documented alternative), targeting **MPS 2025.3 (baseline 253)**.
- **Pin** the MPS version and a **JDK 17+** for the build (the project default `java` is 11; the build must select 17+, e.g. via Gradle toolchains) — aligned with the existing `reference-app` (Causeway 3.6.0, JDK 21).
- Headlessly **generate** the `causeway` language, `causeway.runtime`, and `causeway.sandbox` modules.
- Run MPS **modelcheck** in the build as a gate (fail on model errors).
- **Compile** the Java generated from `causeway.sandbox` against the Causeway applib + Jakarta Persistence/Inject, reusing the `reference-app` dependency set.
- Add a **CI pipeline** that runs generate → modelcheck → compile on every change, making `entity-property-action-slice` tasks 5.3–5.5 reproducible.

This does **not** solve authoring MPS concepts (that remains GUI/projectional-editor work); it makes the generate→build→compile pipeline reproducible and CI-runnable.

## Capabilities

### New Capabilities
- `headless-mps-build`: A command-line build that, without the MPS GUI, generates the `causeway`/`causeway.runtime`/`causeway.sandbox` modules, runs modelcheck as a gate, and compiles the generated Causeway Java against the applib + Jakarta APIs — with pinned MPS and JDK versions.
- `ci-build-pipeline`: Continuous-integration wiring that runs the headless build (generate → modelcheck → compile) on every change as an automated gate.

### Modified Capabilities
<!-- None — these are new capabilities; entity-property-action-slice's specs are unchanged. -->

## Impact

- **New build files**: Gradle build for the MPS modules (mps-gradle-plugin), version catalog/properties pinning MPS 2025.3 and JDK 17+, and a CI workflow file.
- **MPS modules**: `causeway`, `causeway.runtime`, `causeway.sandbox` become headlessly buildable (may require minor module-metadata adjustments for dependency resolution outside the IDE).
- **Reuses**: `reference-app` dependency coordinates (Causeway 3.6.0, Jakarta Persistence 3.1.0, Jakarta Inject 2.0.1) for the generated-Java compile step.
- **Relationship**: complements `entity-property-action-slice` (Phase B); makes its verification tasks 5.3–5.5 reproducible. Authoring of concepts/generator remains in that change.
- **Out of scope (deferred):** authoring/editing MPS models from the CLI, replacing the IDE for development, packaging/publishing the language as an MPS plugin.
