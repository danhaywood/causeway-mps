# Headless build

The repository provides a reproducible command that bootstraps the Causeway MPS language, generates the sandbox models, runs modelcheck, and compiles the generated Causeway Java.
It downloads the pinned MPS distribution and does not depend on an installed MPS IDE.

## Quick start

Install JDK 21 and JDK 25, and make both discoverable by Gradle toolchains.
Run Gradle itself with JDK 21 selected.
For example, installations under SDKMAN are detected automatically, while CI exposes them through `JAVA_HOME_21_X64` and `JAVA_HOME_25_X64`.

Run the complete pipeline from the repository root:

```bash
./gradlew headlessBuild --no-daemon --stacktrace
```

Use `--rerun-tasks` when every stage must execute even if Gradle considers outputs current:

```bash
./gradlew headlessBuild --rerun-tasks --no-daemon --stacktrace
```

A successful run ends only after generated Java has compiled.
Any failing stage stops the dependency chain and returns a non-zero exit code.

## Pinned toolchain

The authoritative version pins are in `gradle.properties` and the Gradle wrapper configuration.

| Component | Pinned version | Purpose |
| --- | --- | --- |
| Gradle | 9.0.0 | Runs the build through `./gradlew`. |
| Itemis MPS Gradle plugin | `1.30.1.1.bc0f59d` | Provides the MPS generation, modelcheck, and Ant-script integration tasks. |
| JetBrains MPS | 2026.1, baseline 261 | Supplies the headless MPS distribution and language runtime. |
| MPS Make runtime JDK | 25 | Runs the MPS 2026.1 Ant Make worker, whose classes require class-file version 69. |
| Generated Java JDK | 21 | Runs Gradle and compiles generated Causeway Java with `--release 21`. |
| Apache Causeway | 3.6.0 | Supplies the generated-code and MPS stub classpath. |
| Jakarta Persistence | 3.1.0 | Supplies generated persistence annotations. |
| Jakarta Inject | 2.0.1 | Supplies generated injection annotations. |

Keep the MPS version aligned with the authoring IDE baseline.
Re-run the full pipeline from a clean checkout whenever MPS or either JDK pin changes.

## Pipeline stages

`headlessBuild` uses Gradle task dependencies to enforce this order:

1. `resolveMps` downloads and unpacks the pinned MPS distribution into `build/mps` unless the matching cached distribution is present.
2. `resolveStubs` stages the Causeway and Jakarta dependency closure under `languages/causeway.stubs/libs`.
3. `bootstrapLanguage` runs MPS Ant Make under JDK 25 to generate and compile the `causeway.Language` and `causeway.generator.Generator` deployment descriptors required by a clean checkout.
4. `generateModels` generates Java from the Causeway sandbox models.
5. `checkModels` runs MPS modelcheck as a build gate.
6. `compileGeneratedJava` compiles `languages/causeway.sandbox/source_gen` against the resolved Causeway and Jakarta classpath with Java 21.

The generated classes are written to `build/classes/generated-sandbox`.
Generated sources and deployment artifacts remain ignored build outputs and must not be edited directly.

The individual Gradle tasks remain useful for diagnosis, but their dependencies preserve the required bootstrap and ordering:

```bash
./gradlew generateModels
./gradlew checkModels
./gradlew compileGeneratedJava
```

## Clean-checkout bootstrap and Ant fallback

`MpsGenerate` alone can compile language aspect models without producing the deployment descriptors needed by the next headless MPS process.
The production pipeline therefore wraps the native MPS `mps.make` Ant task through the Itemis `BuildLanguages` Gradle task.
The minimal Ant script is `gradle/mps-bootstrap.xml`.

If the Gradle wrapper around that bootstrap must be diagnosed independently, first resolve MPS and stubs:

```bash
./gradlew resolveMps resolveStubs
```

Then run the same Ant bootstrap directly with JDK 25:

```bash
MPS_HOME="$PWD/build/mps"
PROJECT_DIR="$PWD"
JAVA25_HOME="/path/to/jdk-25"

"$JAVA25_HOME/bin/java" \
  -cp "$MPS_HOME/lib/*:$MPS_HOME/lib/ant/lib/*" \
  org.apache.tools.ant.Main \
  -f gradle/mps-bootstrap.xml \
  -Dmps.home="$MPS_HOME" \
  -Dproject.dir="$PROJECT_DIR" \
  make-language
```

After a successful manual bootstrap, run the normal Gradle generation, modelcheck, and compilation tasks.
If a future MPS baseline is incompatible with the Itemis generation or modelcheck tasks, the broader fallback is an MPS-generated Ant build using the same pinned MPS home and stage ordering.
That full raw-Ant path is a contingency rather than a second maintained pipeline, so it must be validated before use.

## CI and caching

`.github/workflows/headless-build.yml` runs the complete command on pushes and pull requests.
The workflow installs both pinned Temurin JDKs and requires no preinstalled MPS IDE.

`actions/setup-java` caches Gradle dependencies and the wrapper.
`actions/cache` stores the unpacked MPS distribution using an operating-system, architecture, and MPS-version key.
The distribution contains a `.resolved-version` marker, allowing `resolveMps` to skip redundant extraction after an exact cache restore.

A cache miss affects download and extraction time but not build semantics.
Deleting `build/mps` locally forces the distribution to be restored from Gradle's dependency cache or downloaded again.

## Failure diagnosis

A failure in `bootstrapLanguage` usually indicates that JDK 25 is unavailable, that the MPS distribution is incomplete, or that language dependencies cannot be loaded.
An `UnsupportedClassVersionError` for `jetbrains.mps.tool.make.MakeExecutor` means the Make worker was launched with an older JDK.

A failure in `generateModels` indicates a generator, deployment, classloading, or generation-plan problem.
A failure in `checkModels` indicates an MPS structure, constraint, reference, or typesystem problem.
A failure in `compileGeneratedJava` indicates that generated Java is invalid or that its Causeway/Jakarta classpath is incomplete.

Run the complete command with `--stacktrace --info` for more Gradle detail.
Inspect generated sources only to diagnose generator output, and fix the source MPS model or generator rather than the generated file.

## Limitations

The headless build validates, generates, and compiles existing MPS models; it does not author concepts or replace projectional editing.
Create and edit MPS models through the MPS IDE or the MPS MCP tools, never by hand-editing serialized `.mps` or `.mpl` files.

The pipeline does not package or publish the language as an MPS plugin.
It does not start a Causeway application context or perform runtime introspection tests.
The pending `sandbox-sample-and-e2e` work still owns the explicit hand-written `OrderService` coexistence fixture and its action-body verification.
