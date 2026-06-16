# Headless MPS build — toolchain research (task 1.1)

Decision record for the `headless-mps-build` change. Captures what was verified on
2026-06-16 and the recommended toolchain.

## Verdict: a headless build is feasible for MPS 2025.3

No fallback to the ant build is required for compatibility reasons; the Gradle path works.

## Verified facts

| Check | Result |
|-------|--------|
| MPS 2025.3 distribution downloadable | ✅ `GET …/maven-mps/com/jetbrains/mps/2025.3/mps-2025.3.zip` → **HTTP 200** (artifacts.itemis.cloud) |
| `com.specificlanguages.mps` plugin published | ✅ **2.0.1** on the Gradle Plugin Portal (released 2026-01-15, *after* MPS 2025.3) → portal POM **HTTP 200** |
| mbeddr `de.itemis.mps.gradle` per-baseline builds | ✅ artifacts versioned `…1.4.253.…` exist (baseline **253** = MPS 2025.3) |
| JDK 17+ available | ✅ 17 / 21 / 25 via SDKMAN (default `java` is 11) |
| Gradle installed locally | ❌ not on PATH or SDKMAN — a wrapper must be bootstrapped |

Sources: [Gradle Plugin Portal — com.specificlanguages.mps](https://plugins.gradle.org/plugin/com.specificlanguages.mps),
[mbeddr/mps-gradle-plugin](https://github.com/mbeddr/mps-gradle-plugin),
[mvnrepository — modelcheck.gradle.plugin](https://mvnrepository.com/artifact/modelcheck/modelcheck.gradle.plugin).

## Recommended toolchain

- **Primary:** `com.specificlanguages.mps` **2.0.1** — declarative; auto-discovers MPS modules,
  resolves the MPS distribution as a dependency, and exposes generate / check-models / assemble tasks.
  It builds on the mbeddr `de.itemis.mps.gradle` task types (`MpsGenerate`, `MpsCheck`).
- **MPS distribution:** `com.jetbrains:mps:2025.3` from `https://artifacts.itemis.cloud/repository/maven-mps/`.
- **JDK:** Gradle Java toolchain pinned to **21** (matches `reference-app`; independent of the default `java` 11).
- **Fallback (documented, not needed for compat):** the MPS-generated ant `build.xml` (`<generate>` / `<modelcheck>`),
  if the plugin ever lags an MPS release.

## Proposed build config (DRAFT — not yet verified by running)

> Recorded as guidance, **not** committed as working build files. The exact module-discovery
> and stub-dependency wiring depends on what Phase B of `entity-property-action-slice` produces
> (see blocker below), and nothing here has been executed (no local Gradle; empty modules).

```kotlin
// settings.gradle.kts
pluginManagement { repositories { gradlePluginPortal(); mavenCentral() } }
rootProject.name = "causeway-mps"

// build.gradle.kts
plugins { id("com.specificlanguages.mps") version "2.0.1" }
repositories {
    maven("https://artifacts.itemis.cloud/repository/maven-mps/")
    mavenCentral()
}
java { toolchain { languageVersion.set(JavaLanguageVersion.of(21)) } }
dependencies {
    "mps"("com.jetbrains:mps:2025.3")
    // + Causeway applib 3.6.0 / Jakarta Persistence 3.1.0 / Jakarta Inject 2.0.1
    //   on the generated-Java compile classpath, aligned with reference-app — wired after Phase B
}
// tasks: generate -> checkModels (modelcheck gate) -> compile generated Java
```

## Blocker found during apply: most of this depends on Phase B

The `causeway` language, `causeway.runtime`, and `causeway.sandbox` modules are currently
**empty** (no concepts, no generator templates, no sandbox DSL program — that is
`entity-property-action-slice` Phase B, which is MPS-IDE work and not yet done). Consequently:

- A headless **generate** would run against an empty-but-valid scaffold — a near no-op, not a
  meaningful milestone (task 2.2).
- **modelcheck** has little to check (task 2.3).
- There is **no generated Java to compile** and **no sandbox stub setup** to mirror (tasks 2.4, 3.x, 5.x).
- The end-to-end CI gate (4.4, 5.1) cannot be exercised.

**Recommendation:** do `entity-property-action-slice` Phase B first (or far enough to have a
sample DSL program generating real Java), then return to wire and *verify* this build green.
Tasks 1.2–1.4 (write the build files + bootstrap a wrapper) can be done now as unverified
scaffolding, but gain little until there is something to build.
