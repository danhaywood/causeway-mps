# Design

## Why a shared solution (and not the alternatives)

MPS resolves a classifier reference in a model only if the classifier is reachable from that model's
owning module via its dependency graph. The generator templates live in the `causeway` **language**
module's generator; for `@DomainObject` to resolve in a template, the generator must depend on a module
that exports the `org.apache.causeway.applib.annotation.DomainObject` stub.

- **Depend the generator on `causeway.sandbox`** (where the stubs are today): rejected. The sandbox is the
  *consumer* of the language under test; a language→sandbox edge is a backwards dependency and risks a
  cycle (sandbox uses the language). It also couples the generator to sandbox content.
- **Duplicate the jars** (one copy for the generator, one for the sandbox): rejected. Two stage targets,
  two modelRoots, drift risk. The jars should live in one place.
- **Shared `causeway.stubs` solution**: chosen. A leaf module that owns the stub jars and is depended on by
  both the generator and the sandbox. No cycle (stubs depend on nothing), single jar location, and the
  generator gains exactly the visibility template authoring needs.

```
causeway.stubs (java_classes over libs/*.jar)   ← leaf, depends on nothing
      ▲                         ▲
      │ depends                 │ depends
causeway (language/generator)   causeway.sandbox
```

## Module mechanics

- **Module UUID.** A new MPS solution needs a fresh module UUID. Unlike conceptIds (whose fabrication is
  the documented spike failure mode), a module UUID is a plain random UUID with no MPS-derived structure —
  safe to generate headlessly. The dependency references from `causeway.mpl` and `causeway.sandbox.msd`
  use that same UUID.
- **`java_classes` modelRoot.** `causeway.stubs.msd` declares `<modelRoot contentPath="${module}/libs"
  type="java_classes">`, exactly as `causeway.sandbox.msd` does today. MPS reflects the jar classes into
  stub models at load; no IDs to author, no "Generate IDs" step.
- **Where the generator dependency goes.** The dependency must be visible to the generator templates. In
  MPS a language's generator is a sub-module with its own dependency list; the `causeway.stubs` dependency
  is declared so the generator model resolves the classifiers. If the hand-authored `.mpl` generator
  dependency proves fiddly, this single edit is the one step that may need the GUI (Module Properties →
  Dependencies); everything else is plain `.msd`/gradle XML. `checkModels` is the oracle either way.
- **Sandbox keeps working.** `causeway.sandbox` swaps its own `${module}/libs` `java_classes` modelRoot for
  a dependency on `causeway.stubs`. Because `causeway.stubs` exports its stub models, sandbox programs and
  embedded baseLanguage bodies resolve the same external types as before — verified by `checkModels` over
  the existing `customers` program.

## Gradle staging

`build.gradle.kts` currently stages the jars via a `Sync` task `resolveSandboxStubs` into
`languages/causeway.sandbox/libs`. This change:

- renames it `resolveStubs` and points `into(...)` at `languages/causeway.stubs/libs`;
- keeps the same `sandboxStubs` configuration + the three coordinates (rename the configuration to `stubs`
  for clarity);
- updates `checkModels`/`generateModels` `dependsOn(resolveMps, resolveStubs)`.

`libs/` stays git-ignored and is repopulated from resolved dependencies, as today.

## Validation (oracle)

1. `./gradlew checkModels` — the new `causeway.stubs` solution loads; the sandbox resolves external types
   via the dependency (no regression); and, once the generator dependency is wired, the generator model
   can resolve a probe classifier reference. modelcheck fails the build on unresolved refs, so green = the
   classifiers are visible.
2. `./gradlew generateModels` — the `customers` skeleton still generates (no regression from the modelRoot
   move).
3. The real proof that the *generator* can now see the classifiers comes during B2, when an annotation is
   first added to the Entity template and `checkModels` stays green. This change can include a tiny probe
   (a throwaway `ClassifierType` ref in the generator model, removed after) to confirm resolution ahead of
   B2 — optional.
