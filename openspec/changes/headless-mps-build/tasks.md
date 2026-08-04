# Tasks

> **UPDATE (2026-06-16):** `spike-headless-authoring` delivered the build foundation early.
> A working Gradle build now exists at the repo root (`build.gradle.kts`, wrapper, `settings.gradle.kts`)
> and `./gradlew checkModels` runs modelcheck headlessly over the real `causeway` modules (0 errors).
> Corrected toolchain (the original `com.specificlanguages.mps` guess was wrong): **Gradle 9.x** +
> **`de.itemis.mps.gradle.common` 1.30.x** (`MpsCheck`/`MpsGenerate`) + `com.jetbrains:mps:2026.1`
> from artifacts.itemis.cloud. `causeway-generator-first-slice` has since verified `generateModels` and
> manually compiled the generated entity-state Java. Remaining scope is now: automate that compile in
> Gradle, complete action/app coexistence, and *productionize* (CI). See
> `docs/headless-build-research.md` + the spike verdict.
>
> **UPDATE (2026-08-03):** The project and authoring IDE moved to MPS 2026.1 (baseline 261).
> The headless distribution is now aligned to `com.jetbrains:mps:2026.1`; fresh `checkModels` and `generateModels` runs pass on JDK 21.

## 1. Toolchain selection & pinning

- [x] 1.1 Verify plugin compatibility with MPS 2026.1 — DONE: `de.itemis.mps.gradle.common` 1.30.x on **Gradle 9.x** runs both `MpsCheck` and `MpsGenerate` successfully against MPS 2026.1 on JDK 21.
  The original `com.specificlanguages.mps` option remains rejected as packaging-oriented, and the Ant fallback is not needed.
- [x] 1.2 Pin MPS 2026.1 + download for the build — DONE: the `mps` configuration resolves `com.jetbrains:mps:2026.1` and syncs it to `build/mps`, independently of the local MPS.app.
- [~] 1.3 JDK 21 — PARTIAL: build currently run with `JAVA_HOME`=SDKMAN JDK 21; a declarative Gradle Java toolchain block is still a refinement.
- [x] 1.4 Gradle wrapper + settings — DONE (pinned to Gradle 9.0.0; committed).

## 2. Headless generation & modelcheck

- [x] 2.1 Resolve the `causeway`/`runtime`/`sandbox` modules — DONE (`MpsCheck.projectLocation` = project dir picks them up).
- [x] 2.2 Wire + verify the `generate` task — DONE via `causeway-generator-first-slice`: `./gradlew generateModels` succeeds and generates the `customers` entity-state Java.
- [x] 2.3 Modelcheck gate — DONE: `checkModels` fails the build on model errors; passes clean on the current structure and the current `customers` entity-state sandbox.
- [~] 2.4 Sandbox stub dependencies resolve headlessly — Causeway 3.6.0 and Jakarta stubs DONE via the shared `causeway.stubs` solution and used successfully by generation; the `reference-app`/`OrderService` positive resolution check remains pending until an action body exists.

## 3. Compile generated Java

- [~] 3.1 Generated `Customer.java` and `Product.java` were compiled successfully with `javac`; configuring that compile as a Gradle pipeline step remains open.
- [~] 3.2 Causeway 3.6.0 + Jakarta Persistence/Inject are proven on the generated-code classpath via `causeway.stubs/libs/*`; adding the hand-written app/`OrderService` to the same classpath remains open.
- [x] 3.3 Expose a single command that runs generate → modelcheck → compile, fail-fast — DONE: `./gradlew headlessBuild` follows the dependency chain `generateModels` → `checkModels` → `compileGeneratedJava`, using the pinned Java 21 toolchain and the resolved Causeway/Jakarta stub classpath.

## 4. CI pipeline

- [x] 4.1 Add a CI workflow that runs the single build command on push and PR — DONE: `.github/workflows/headless-build.yml` runs `./gradlew headlessBuild --no-daemon --stacktrace` on both events with read-only repository permissions.
- [x] 4.2 Provision pinned JDK 21 and JDK 25 toolchains plus the MPS 2026.1 distribution on the runner (no preinstalled IDE) — DONE.
  MPS Ant Make under JDK 25 bootstraps the ignored `causeway.Language` and `causeway.generator.Generator` deployment descriptors before generation/modelcheck under JDK 21.
  A pristine local clone and GitHub Actions run `30922640991` both completed the full `headlessBuild` successfully.
- [x] 4.3 Cache the MPS distribution and Gradle dependencies for stable runs — DONE.
  `actions/setup-java` caches Gradle dependencies and the wrapper using the pinned build files, while `actions/cache` stores the unpacked MPS distribution under an OS-, architecture-, and MPS-version-specific key.
  GitHub Actions run `30928905602` attempt 2 restored both caches, skipped `resolveMps`, and completed `headlessBuild` successfully.
- [ ] 4.4 Confirm CI fails on a deliberately broken model and passes on a clean one

## 5. Integration & docs

- [ ] 5.1 Point `entity-property-action-slice` verification (tasks 5.3–5.5) at this headless pipeline
- [ ] 5.2 Document the headless build: command, pinned versions, fallback (ant), and known limitations (does not author concepts)
