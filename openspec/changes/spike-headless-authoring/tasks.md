# Tasks

Time-boxed spike. The deliverable is the **go/no-go verdict** (task 4.2), not the concept.

## 1. Bootstrap the headless build

- [ ] 1.1 Download a Gradle distribution and generate a Gradle wrapper (gradlew + wrapper jar/properties)
- [ ] 1.2 Write minimal `settings.gradle.kts` / `build.gradle.kts` / `gradle.properties` using `com.specificlanguages.mps` 2.0.1, `com.jetbrains:mps:2025.3` (artifacts.itemis.cloud), JDK 21 toolchain
- [ ] 1.3 Resolve the MPS 2025.3 distribution and the plugin (one-time ~1 GB download)

## 2. Green baseline on the empty scaffold

- [ ] 2.1 Run headless `generate` against the unmodified `causeway` scaffold; fix any toolchain/config issues
- [ ] 2.2 Run headless `modelcheck` against the unmodified scaffold; confirm clean — establishes the oracle/baseline

## 3. Hand-author the Module concept

- [ ] 3.1 Inspect the existing `causeway.structure.mps` header/persistence (v9) and a known structure model for the exact `jetbrains.mps.lang.structure` concept IDs / format
- [ ] 3.2 Hand-author the `Module` root concept (`INamedConcept`, `entities` child collection) by editing `causeway.structure.mps` XML
- [ ] 3.3 Run modelcheck + generate; iterate on the XML using the diagnostics until green (or hit the iteration cap)

## 4. Verdict

- [ ] 4.1 Capture the build evidence (commands + output) for baseline and for the authored concept
- [ ] 4.2 Write the explicit go/no-go: is headless hand-authoring viable for Phase B, or fall back to GUI authoring? Record the recommended approach
