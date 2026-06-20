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

- [ ] 3.1 Add a dependency on `causeway.stubs` to the `causeway` language's generator (in `causeway.mpl`),
  so generator-template classifier references resolve. If hand-XML proves impractical, do this one edit in
  the MPS GUI (Module Properties → Dependencies) — the documented GUI fallback.
- [ ] 3.2 (Optional probe) Add a throwaway `ClassifierType` reference to a Causeway annotation in the
  generator model; `./gradlew checkModels` green ⇒ the generator can see the classifiers; then remove the
  probe. Proves the unblock ahead of B2.

## 4. Re-point the sandbox

- [x] 4.1 Add a dependency on `causeway.stubs` to `causeway.sandbox.msd`; remove its `${module}/libs`
  `java_classes` modelRoot — DONE (also added the stubs entry to `dependencyVersions`).
- [x] 4.2 `./gradlew checkModels` green — DONE: BUILD SUCCESSFUL; only the pre-existing `causeway.generator`
  baseLanguage-target warning. (The `customers` model uses no external types yet, so the dependency is for
  when sandbox programs/bodies do; resolution path verified by a green load.)

## 5. Verify + reconcile

- [ ] 5.1 `./gradlew generateModels` green — `Customer.java` + `Product.java` still generate (no
  regression from moving the modelRoot).
- [ ] 5.2 Reconcile `sandbox-sample-and-e2e`'s in-flight `java-classpath-interop` requirement "Sandbox
  imports external Java as classpath stubs" — reframe to "obtains them via the shared `causeway.stubs`
  solution" so the two changes don't conflict at archive (whichever archives second merges).
- [ ] 5.3 Update `docs/generator-template-authoring.md`: correct the playbook step-1 claim (stubs are
  visible to the **generator** via `causeway.stubs`, not just the sandbox).
