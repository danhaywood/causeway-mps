## Why

The generator-template work (`causeway-generator-first-slice` §2 / "B2") is blocked on a dependency the
authoring doc assumed but never wired. A faithful Entity/Action template emits **resolved references** to
real classifiers — `@Named`, `@DomainObject`, `@Entity`, `@Table`, `@Id`, `@Column`, `@Property`,
`@Domain.Include`, `@Action`, `@MemberSupport`, `@Inject` and the `Nature`/`Introspection`/`SemanticsOf`
enums (MPS `AnnotationInstance`/`ClassifierType` nodes). Those resolve only if the classifiers are visible
**in the `causeway` language's scope**, because the generator templates live in the language.

Today the Causeway/Jakarta stub jars (`causeway-applib:3.6.0`, `jakarta.persistence-api:3.1.0`,
`jakarta.inject-api:2.0.1`) are staged into `languages/causeway.sandbox/libs` and exposed **only** by the
`causeway.sandbox` solution (a `java_classes` modelRoot). The `causeway` language / its generator depend
only on `jetbrains.mps.baseLanguage` + `causeway.runtime`, so `@DomainObject` and friends do **not**
resolve in the generator — in the GUI they won't even appear in completion, stalling template authoring at
the first annotation.

We cannot fix this by depending the generator on `causeway.sandbox`: the sandbox is the *consumer* of the
language, so a language→sandbox dependency is backwards / cyclic. The clean MPS pattern is a **shared
stubs solution** that both the generator and the sandbox depend on.

## What Changes

- **New `causeway.stubs` solution** (`languages/causeway.stubs/causeway.stubs.msd`) with a `java_classes`
  modelRoot over its own `libs/` — the single home for the Causeway/Jakarta stub jars.
- **Gradle** stages the three jars into `languages/causeway.stubs/libs` (the existing `resolveSandboxStubs`
  Sync task is renamed/retargeted to `resolveStubs` → the stubs solution).
- **The `causeway` language's generator depends on `causeway.stubs`**, so template `AnnotationInstance`/
  `ClassifierType` references to the annotation types and `Nature`/`Introspection`/`SemanticsOf` enums
  resolve.
- **`causeway.sandbox` depends on `causeway.stubs`** and **drops its own `${module}/libs` modelRoot** — the
  sandbox gets the same stubs transitively, so DSL programs and embedded baseLanguage bodies still resolve
  external types. The jars live in exactly one place.

## Capabilities

### Modified Capabilities
- `java-classpath-interop`: the Causeway/Jakarta classpath stubs move from a sandbox-local `java_classes`
  import to a **shared `causeway.stubs` solution** depended on by both the generator (new — enables
  template authoring) and the sandbox (now transitive).

## Impact

- **New module**: `causeway.stubs` solution (fresh module UUID; a plain random UUID, not an MPS conceptId).
- **`build.gradle.kts`**: rename `resolveSandboxStubs` → `resolveStubs`; retarget the `Sync` `into(...)` to
  `languages/causeway.stubs/libs`; update `dependsOn` wiring on `checkModels`/`generateModels`.
- **`causeway.mpl`**: add a generator dependency on `causeway.stubs` (so template classifier refs resolve).
- **`causeway.sandbox.msd`**: add a dependency on `causeway.stubs`; remove the `${module}/libs`
  `java_classes` modelRoot.
- **Reconcile** `sandbox-sample-and-e2e` (in-flight): its `java-classpath-interop` requirement "Sandbox
  imports external Java as classpath stubs" is reframed — the sandbox now obtains them via the shared
  `causeway.stubs` solution rather than its own `libs`. Both changes touch this capability; whichever
  archives second reconciles (the dsl-action-model precedent).
- **Oracle**: `./gradlew checkModels` (classifiers resolve from the generator + sandbox) and
  `generateModels` (still green) — no GUI required for the wiring; the GUI (template authoring, B2) begins
  only after this lands.
- **Out of scope**: the generator templates themselves (B2); the `reference-app` app-stub for action
  *bodies* (still deferred in the authoring doc); any version bump of the stub jars.
