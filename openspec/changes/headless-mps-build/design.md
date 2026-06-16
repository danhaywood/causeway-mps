## Context

The `causeway-mps` repo is an MPS project (`causeway` language + `causeway.runtime` + `causeway.sandbox` solutions) with no build automation. The only available MPS is the GUI app (`MPS.app`, baseline 253 → MPS 2025.3). A `reference-app` Maven module already exists and compiles the locked generated idiom against Causeway 3.6.0 + Jakarta on JDK 21 (default `java` is 11; 17/21/25 are available via SDKMAN). To make language changes verifiable in CI, we need to drive MPS generation, model-checking, and the downstream Java compile from the command line.

## Goals / Non-Goals

**Goals:**
- A single CLI command that generates the MPS modules, runs modelcheck as a gate, and compiles the generated Java.
- Pinned, reproducible MPS (2025.3) and JDK (17+) versions; no reliance on the developer's IDE.
- CI runs the pipeline on every change; makes `entity-property-action-slice` tasks 5.3–5.5 reproducible.

**Non-Goals:**
- Authoring or editing MPS models from the CLI (remains projectional-editor/GUI work).
- Replacing the MPS IDE for day-to-day development.
- Packaging/publishing the language as an MPS plugin.
- The language concepts and generator templates themselves (owned by `entity-property-action-slice`).

## Decisions

**Use the mps-gradle-plugin rather than the raw ant build.** The `de.itemis.mps` Gradle plugins (`generate`, `modelcheck`, and `execute`/build tasks) wrap the MPS ant generator and integrate JDK toolchains, dependency download of the MPS distribution, and task caching. Rationale: less hand-rolled XML than the ant `build.xml` approach, first-class JDK-toolchain selection (solves the JDK-11-default problem cleanly), and a conventional CI story. Alternative considered — the MPS-provided ant build (`<generate>`/`<modelcheck>` tasks via `mps-build` / a generated `build.xml`): more control but more boilerplate and manual MPS-home wiring; documented as the fallback if the plugin lags MPS 2025.3.

**Pin MPS 2025.3 and download it for the build.** The build should fetch the pinned MPS distribution (matching baseline 253) rather than depend on the locally installed `MPS.app`, so CI and any developer machine are identical. Version pinned in a single place (gradle properties / version catalog).

**Select a JDK 17+ via Gradle toolchains.** The project default `java` is 11, which cannot run MPS 2025.3 / build Causeway 3.x. The Gradle Java toolchain pins 21 (matching `reference-app`) and is resolved independently of `JAVA_HOME`/PATH.

**Compile generated Java with the existing `reference-app` dependency set.** Reuse Causeway 3.6.0 + Jakarta Persistence 3.1.0 + Jakarta Inject 2.0.1 so the headless compile matches the already-verified golden idiom. The generated sources from `causeway.sandbox` are compiled on a classpath that also includes the hand-written `reference-app` code (coexistence).

**Pipeline order is generate → modelcheck → compile, fail-fast.** Modelcheck gates generation output before the Java compile, so a model error fails the build with a clear MPS diagnostic rather than a downstream Java error.

## Risks / Trade-offs

- **mps-gradle-plugin may not yet support MPS 2025.3 (baseline 253)** → Verify plugin↔MPS compatibility first; if unsupported, fall back to the documented ant build, or pin to the latest MPS the plugin supports and record the gap.
- **MPS distribution download size/time in CI** → Cache the MPS distribution and Gradle dependencies in CI; pin exact versions for cache stability.
- **Headless generation may surface module-metadata/dependency issues hidden by the IDE** (e.g. unresolved devkits, classpath stubs) → Treat the first green headless build as a milestone; expect minor `.mpl`/`.msd`/library adjustments.
- **Sandbox stub dependencies (Causeway/app jars) must be resolvable headlessly** → Wire the same coordinates the IDE uses into the build; align with `reference-app`.
- **JDK drift between MPS runtime and Causeway compile** → Use a single toolchain (21) for both where possible; document if MPS requires a different JDK than the Java compile.
