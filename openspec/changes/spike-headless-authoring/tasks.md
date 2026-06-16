# Tasks

Time-boxed spike. The deliverable is the **go/no-go verdict** (task 4.2), not the concept.

## 1. Bootstrap the headless build

- [x] 1.1 Download a Gradle distribution and generate a Gradle wrapper — DONE. Discovered the plugin requires **Gradle 9.x** (8.x fails with a Kotlin `SpillingKt` mismatch). Wrapper pinned to 9.0.0.
- [x] 1.2 Write minimal `settings.gradle.kts` / `build.gradle.kts` — DONE, but pivoted plugin: `com.specificlanguages.mps` is packaging-oriented (no-ops without a build solution); using `de.itemis.mps.gradle.common` 1.30.x `MpsCheck`/`MpsGenerate` task types instead. Plugin + MPS resolved from artifacts.itemis.cloud.
- [x] 1.3 Resolve the MPS 2025.3 distribution and the plugin — DONE (~1 GB download via `resolveMps` Sync task)

## 2. Green baseline on the empty scaffold

- [ ] 2.1 Run headless `generate` against the unmodified `causeway` scaffold; fix any toolchain/config issues
- [x] 2.2 Run headless `modelcheck` against the unmodified scaffold — DONE: `./gradlew checkModels` BUILD SUCCESSFUL, only harmless warnings (empty generator model), no errors. **Oracle established.**

## 3. Hand-author the Module concept

- [ ] 3.1 Inspect the existing `causeway.structure.mps` header/persistence (v9) and a known structure model for the exact `jetbrains.mps.lang.structure` concept IDs / format
- [ ] 3.2 Hand-author the `Module` root concept (`INamedConcept`, `entities` child collection) by editing `causeway.structure.mps` XML
- [ ] 3.3 Run modelcheck + generate; iterate on the XML using the diagnostics until green (or hit the iteration cap)

## 4. Verdict

- [ ] 4.1 Capture the build evidence (commands + output) for baseline and for the authored concept
- [ ] 4.2 Write the explicit go/no-go: is headless hand-authoring viable for Phase B, or fall back to GUI authoring? Record the recommended approach
