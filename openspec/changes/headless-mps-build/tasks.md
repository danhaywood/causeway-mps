# Tasks

## 1. Toolchain selection & pinning

- [ ] 1.1 Verify mps-gradle-plugin (`de.itemis.mps`) compatibility with MPS 2025.3 (baseline 253); if unsupported, record the gap and fall back to the ant build
- [ ] 1.2 Pin MPS version (2025.3) and download the MPS distribution for the build (don't depend on local `MPS.app`)
- [ ] 1.3 Configure a Gradle Java toolchain pinning JDK 21 (independent of the default `java` 11)
- [ ] 1.4 Add Gradle wrapper + settings so the build runs from a clean checkout

## 2. Headless generation & modelcheck

- [ ] 2.1 Configure the build to resolve the `causeway`, `causeway.runtime`, and `causeway.sandbox` modules
- [ ] 2.2 Wire the generate task for all three modules; achieve a first green headless generate (expect minor `.mpl`/`.msd`/library adjustments)
- [ ] 2.3 Wire the modelcheck task as a gate (fail the build on model errors)
- [ ] 2.4 Ensure sandbox stub dependencies (Causeway applib + Jakarta + hand-written app) resolve headlessly, matching the IDE setup

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
