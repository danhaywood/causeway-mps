# Tasks

Oracle = `./gradlew checkModels` (the new solution loads; sandbox + generator resolve the stub
classifiers; modelcheck fails on unresolved refs) then `./gradlew generateModels` (the `customers`
skeleton still generates). Unblocks `causeway-generator-first-slice` §2 (B2 template authoring).

## 1. Create the `causeway.stubs` solution

- [x] 1.1 Add `languages/causeway.stubs/causeway.stubs.msd` — DONE: solution uuid
  `c31c5f46-778f-4244-90d0-c92808fc2b16`, `java_classes` modelRoot over `${module}/libs` with the three
  jars (mirrors `causeway.sandbox.msd`).
- [x] 1.2 Register the new module — DONE: added a `<modulePath>` for `causeway.stubs.msd` to
  `.mps/modules.xml`; `.gitignore` covers `languages/causeway.stubs/libs/`.

## 2. Gradle staging

- [x] 2.1 Rename `resolveSandboxStubs` → `resolveStubs`; retarget `into(...)` to
  `languages/causeway.stubs/libs`; rename configuration `sandboxStubs` → `stubs`; update `dependsOn` on
  `checkModels`/`generateModels` — DONE.
- [x] 2.2 `libs/` git-ignored for the new path; removed the orphaned `languages/causeway.sandbox/libs`
  directory (no longer referenced) — DONE.

## 3. Wire the generator dependency

- [x] 3.1 Add a dependency on `causeway.stubs` to the `causeway` language's generator (`causeway.mpl`) —
  DONE: added a `<dependencies>` block to the `<generator>` element + a `causeway.stubs` entry in its
  `dependencyVersions`. Hand-XML worked (no GUI fallback needed). `./gradlew checkModels` green — the
  module graph is well-formed with the new dependency.
- [~] 3.2 Classifier-resolution probe — FOLDED INTO B2: hand-authoring a `ClassifierType` reference needs
  the GUI-assigned stub node id, and B2's first action (adding an annotation to the Entity template) IS the
  probe. The dependency is wired + checkModels-green; final resolution confirmation happens on the first
  B2 annotation.

## 4. Re-point the sandbox

- [x] 4.1 Add a dependency on `causeway.stubs` to `causeway.sandbox.msd`; remove its `${module}/libs`
  `java_classes` modelRoot — DONE (also added the stubs entry to `dependencyVersions`).
- [x] 4.2 `./gradlew checkModels` green — DONE: BUILD SUCCESSFUL; only the pre-existing `causeway.generator`
  baseLanguage-target warning. (The `customers` model uses no external types yet, so the dependency is for
  when sandbox programs/bodies do; resolution path verified by a green load.)

## 5. Verify + reconcile

- [x] 5.1 `./gradlew generateModels` green — DONE: `Customer.java` + `Product.java` still generate (no
  regression from moving the modelRoot).
- [x] 5.2 Reconcile `sandbox-sample-and-e2e` — DONE: its `java-classpath-interop` requirement reframed to
  "Sandbox resolves external Java via the shared stubs solution" (depends on `causeway.stubs`), and its
  task 1.1 note updated, so the two changes don't conflict at archive.
- [x] 5.3 Update `docs/generator-template-authoring.md` — DONE: playbook step 1 + the "annotation-classifier
  dependency" section now describe the shared `causeway.stubs` solution visible to the generator; also
  corrected `causeway-generator-first-slice` task 1.2's stale "via sandbox" note.
