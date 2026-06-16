# Tasks

> **UPDATE (2026-06-16):** `spike-headless-authoring` delivered the build foundation early.
> A working Gradle build now exists at the repo root (`build.gradle.kts`, wrapper, `settings.gradle.kts`)
> and `./gradlew checkModels` runs modelcheck headlessly over the real `causeway` modules (0 errors).
> Corrected toolchain (the original `com.specificlanguages.mps` guess was wrong): **Gradle 9.x** +
> **`de.itemis.mps.gradle.common` 1.30.x** (`MpsCheck`/`MpsGenerate`) + `com.jetbrains:mps:2025.3`
> from artifacts.itemis.cloud. Remaining scope is now: run/verify *generate*, compile the generated
> Java, and *productionize* (CI). See `docs/headless-build-research.md` + the spike verdict.

## 1. Toolchain selection & pinning

- [x] 1.1 Verify plugin compatibility with MPS 2025.3 — DONE (corrected): `de.itemis.mps.gradle.common` 1.30.x on **Gradle 9.x** (8.x fails: Kotlin `SpillingKt`). `com.specificlanguages.mps` rejected (packaging-oriented). Ant fallback not needed.
- [x] 1.2 Pin MPS 2025.3 + download for the build — DONE: `mps` configuration resolves `com.jetbrains:mps:2025.3`, `Sync`'d to `build/mps`; not dependent on local MPS.app.
- [~] 1.3 JDK 21 — PARTIAL: build currently run with `JAVA_HOME`=SDKMAN JDK 21; a declarative Gradle Java toolchain block is still a refinement.
- [x] 1.4 Gradle wrapper + settings — DONE (pinned to Gradle 9.0.0; committed).

## 2. Headless generation & modelcheck

- [x] 2.1 Resolve the `causeway`/`runtime`/`sandbox` modules — DONE (`MpsCheck.projectLocation` = project dir picks them up).
- [ ] 2.2 Wire + verify the `generate` task — `generateModels` (`MpsGenerate`) is DEFINED but not yet run/verified (waits on the generator, slice task 4).
- [x] 2.3 Modelcheck gate — DONE: `checkModels` fails the build on model errors; passes clean on the current structure.
- [ ] 2.4 Sandbox stub dependencies (Causeway + Jakarta + reference-app) resolve headlessly — pending (waits on slice task 5.1/5.2).

## 3. Compile generated Java

- [ ] 3.1 Configure a compile step for the Java generated from `causeway.sandbox`
- [ ] 3.2 Put the Causeway 3.6.0 + Jakarta Persistence/Inject deps (aligned with `reference-app`) + hand-written app on the compile classpath
- [ ] 3.3 Expose a single command that runs generate → modelcheck → compile, fail-fast

## 4. CI pipeline

- [ ] 4.1 Add a CI workflow that runs the single build command on push and PR
- [ ] 4.2 Provision the pinned JDK 21 and MPS 2025.3 distribution on the runner (no preinstalled IDE)
- [ ] 4.3 Cache the MPS distribution and Gradle dependencies for stable runs
- [ ] 4.4 Confirm CI fails on a deliberately broken model and passes on a clean one

## 5. Integration & docs

- [ ] 5.1 Point `entity-property-action-slice` verification (tasks 5.3–5.5) at this headless pipeline
- [ ] 5.2 Document the headless build: command, pinned versions, fallback (ant), and known limitations (does not author concepts)
