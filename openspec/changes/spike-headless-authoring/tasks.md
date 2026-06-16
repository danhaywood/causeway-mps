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

- [x] 3.1 Inspect persistence-v9 format — DONE via the repo's `…@generator.mps` (registry index→id mapping); distribution ships no source structure models to crib feature IDs from.
- [x] 3.2 Hand-author the `Module` concept — DONE (minimal: named `ConceptDeclaration`, rootable). **It loaded and MPS recognised it as concept `Module`.**
- [~] 3.3 Iterate against the oracle — PARTIAL: one specific modelcheck error remains — a manually-created concept needs its `conceptId`/feature IDs generated ("Generate IDs" intention). Couldn't extract the `conceptId` property id from the distribution; not closed this session. See verdict.

## 4. Verdict

- [x] 4.1 Capture build evidence — DONE (commands + the modelcheck error + attempted model in the verdict doc)
- [x] 4.2 Write the go/no-go — DONE: **QUALIFIED GO** — `docs/spike-headless-authoring-verdict.md`. Headless authoring viable; needs a one-time conceptId bootstrap (seed IDs from one GUI/sample concept, or run headless "Generate IDs").
