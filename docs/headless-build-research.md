# Headless MPS build — toolchain research

Decision record for the `headless-mps-build` change.
The original investigation was performed on 2026-06-16 and the MPS 2026.1 alignment was verified on 2026-08-03.

## Verdict

A reproducible headless build is working with MPS 2026.1 (baseline 261), Gradle 9.0.0, `de.itemis.mps.gradle.common` 1.30.x, and JDK 21.
No Ant fallback is required.

## Verified facts

| Check | Result |
|-------|--------|
| MPS 2026.1 distribution downloadable | ✅ `com.jetbrains:mps:2026.1` resolves from `artifacts.itemis.cloud` |
| IDE and headless runtime aligned | ✅ both use build `MPS-261.25134.779` |
| Model checking | ✅ `./gradlew checkModels --rerun-tasks` completes successfully |
| Model generation | ✅ `./gradlew generateModels --rerun-tasks` completes successfully |
| Gradle integration | ✅ `de.itemis.mps.gradle.common` 1.30.x works with MPS 2026.1 on Gradle 9.0.0 |
| JDK | ✅ JDK 21 via SDKMAN; the machine default remains JDK 11 |

## Current toolchain

- **Gradle wrapper:** 9.0.0.
- **MPS Gradle plugin:** `de.itemis.mps.gradle.common` 1.30.x, using `MpsCheck` and `MpsGenerate`.
- **MPS distribution:** `com.jetbrains:mps:2026.1` from `https://artifacts.itemis.cloud/repository/maven-mps/`.
- **JDK:** 21, matching `reference-app` and MPS 2026.1.
- **Fallback:** the MPS-generated Ant build remains a documented fallback but is not currently needed.

`com.specificlanguages.mps` was rejected during the original spike because it is packaging-oriented and no-ops without an MPS build solution.
The Itemis `MpsCheck` and `MpsGenerate` task types directly match this project's headless validation needs.

## Commands

Run with JDK 21 selected:

```bash
JAVA_HOME="$HOME/.sdkman/candidates/java/21.0.10-tem" ./gradlew checkModels --rerun-tasks
JAVA_HOME="$HOME/.sdkman/candidates/java/21.0.10-tem" ./gradlew generateModels --rerun-tasks
```

The Gradle build resolves the pinned MPS distribution into `build/mps` and stages Causeway/Jakarta stub dependencies under `languages/causeway.stubs/libs`.
A declarative Gradle Java toolchain remains desirable so callers do not need to set `JAVA_HOME` explicitly.

## MPS 2025.3 to 2026.1 alignment

The project and authoring IDE were upgraded from MPS 2025.3 (baseline 253) to MPS 2026.1 (baseline 261).
Keeping the old headless runtime caused 2026.1-generated behavior descriptors to fail under 2025.3 with an `SMethodBuilder` ABI mismatch.
The fix is to align the downloaded headless distribution with the authoring baseline rather than downgrade or redesign the language behavior.

Whenever MPS is upgraded, verify both `checkModels` and `generateModels` against the new downloaded distribution before accepting the baseline change.

## Remaining pipeline work

The MPS generate and modelcheck stages are operational.
The remaining `headless-mps-build` work is to automate compilation of generated Java together with `reference-app`, expose a single fail-fast command, and add the CI workflow and caches.
