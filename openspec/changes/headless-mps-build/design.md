## Context

The `causeway-mps` repo is an MPS project (`causeway` language + `causeway.runtime` + `causeway.sandbox` solutions) with no build automation. The only available MPS is the GUI app (`MPS.app`, baseline 261 → MPS 2026.1). A `reference-app` Maven module already exists and compiles the locked generated idiom against Causeway 3.6.0 + Jakarta on JDK 21 (default `java` is 11; 17/21/25 are available via SDKMAN). To make language changes verifiable in CI, we need to drive MPS generation, model-checking, and the downstream Java compile from the command line.

## Goals / Non-Goals

**Goals:**
- A single CLI command that generates the MPS modules, runs modelcheck as a gate, and compiles the generated Java.
- Pinned, reproducible MPS (2026.1) and JDK (17+) versions; no reliance on the developer's IDE.
- CI runs the pipeline on every change; makes `entity-property-action-slice` tasks 5.3–5.5 reproducible.

**Non-Goals:**
- Authoring or editing MPS models from the CLI (remains projectional-editor/GUI work).
- Replacing the MPS IDE for day-to-day development.
- Packaging/publishing the language as an MPS plugin.
- The language concepts and generator templates themselves (owned by `entity-property-action-slice`).

## Decisions

**Use the mps-gradle-plugin rather than the raw ant build.** The `de.itemis.mps` Gradle plugins (`generate`, `modelcheck`, and `execute`/build tasks) wrap the MPS ant generator and integrate JDK toolchains, dependency download of the MPS distribution, and task caching. Rationale: less hand-rolled XML than the ant `build.xml` approach, first-class JDK-toolchain selection (solves the JDK-11-default problem cleanly), and a conventional CI story. Alternative considered — the MPS-provided ant build (`<generate>`/`<modelcheck>` tasks via `mps-build` / a generated `build.xml`): more control but more boilerplate and manual MPS-home wiring; documented as the fallback if the plugin lags MPS 2026.1.

**Pin MPS 2026.1 and download it for the build.** The build should fetch the pinned MPS distribution (matching baseline 261) rather than depend on the locally installed `MPS.app`, so CI and any developer machine are identical. Version pinned in a single place (gradle properties / version catalog).

**Bootstrap language deployment before consumer generation.** A clean checkout has no ignored `source_gen` or `classes_gen` output, and `MpsGenerate` generates and compiles the language aspect models but does not emit the `causeway.Language` and `causeway.generator.Generator` deployment descriptors needed to load the language in a subsequent MPS process.
Run the MPS Ant `mps.make` task against the `causeway` language module before the normal generation pass so those descriptors are generated and compiled without relying on IDE-created local artifacts.
Treat this Make step as part of headless generation, preserving the externally visible generate → modelcheck → compile pipeline.

**Use separate pinned JDKs for MPS Make and generated Java.** The project default `java` is 11, which cannot run MPS 2026.1 or build Causeway 3.x.
Run Gradle and the ordinary MPS generation/modelcheck tasks on JDK 21, matching `reference-app`, while launching the MPS 2026.1 Ant Make worker with JDK 25 because the distribution's `jetbrains.mps.tool.make.MakeExecutor` is compiled for class-file version 69.
Compile generated application Java with the Gradle Java 21 toolchain and `--release 21`.
CI provisions both pinned Temurin toolchains without relying on a preinstalled IDE or JDK.

**Compile generated Java with the dependency versions established by `reference-app`.** Reuse Causeway 3.6.0 + Jakarta Persistence 3.1.0 + Jakarta Inject 2.0.1 so the headless compile matches the already-verified golden idiom.
The generated sources from `causeway.sandbox` compile against that resolved dependency closure.
The explicit hand-written `OrderService` coexistence fixture remains owned by `sandbox-sample-and-e2e`.

**Pipeline order is generate → modelcheck → compile, fail-fast.** Modelcheck gates generation output before the Java compile, so a model error fails the build with a clear MPS diagnostic rather than a downstream Java error.

## Risks / Trade-offs

- **mps-gradle-plugin compatibility can drift across MPS baselines** → MPS 2026.1 compatibility is proven by fresh `MpsCheck` and `MpsGenerate` runs on JDK 21; rerun both checks whenever the baseline changes.
- **MPS distribution download size/time in CI** → Cache the MPS distribution and Gradle dependencies in CI; pin exact versions for cache stability.
- **Headless generation may surface module-metadata/dependency issues hidden by the IDE** (e.g. unresolved devkits, classpath stubs) → Treat the first green headless build as a milestone; expect minor `.mpl`/`.msd`/library adjustments.
- **Ignored language deployment artifacts can mask a non-hermetic local build** → Validate from a clean clone and run MPS Make before consumer generation so `Language` and `Generator` descriptors are created on every fresh runner.
- **MPS Make requires a newer runtime than the generated application target** → Provision JDK 25 specifically for the MPS 2026.1 Make worker while retaining JDK 21 and `--release 21` for generated Causeway Java.
- **Sandbox stub dependencies (Causeway/app jars) must be resolvable headlessly** → Wire the same coordinates the IDE uses into the build; align with `reference-app`.
- **JDK drift between MPS runtime and Causeway compile** → Use a single toolchain (21) for both where possible; document if MPS requires a different JDK than the Java compile.
