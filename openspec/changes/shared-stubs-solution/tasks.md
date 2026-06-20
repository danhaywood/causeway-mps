# Tasks

Oracle = `./gradlew checkModels` (the new solution loads; sandbox + generator resolve the stub
classifiers; modelcheck fails on unresolved refs) then `./gradlew generateModels` (the `customers`
skeleton still generates). Unblocks `causeway-generator-first-slice` §2 (B2 template authoring).

## 1. Create the `causeway.stubs` solution

- [ ] 1.1 Add `languages/causeway.stubs/causeway.stubs.msd` with a fresh module UUID and a `java_classes`
  modelRoot over `${module}/libs` (mirroring `causeway.sandbox.msd`'s stub modelRoot).
- [ ] 1.2 Register the new module with the MPS project/build (the same place `causeway.sandbox` is listed)
  so headless build discovers it.

## 2. Gradle staging

- [ ] 2.1 Rename `resolveSandboxStubs` → `resolveStubs`; retarget the `Sync` `into(...)` to
  `languages/causeway.stubs/libs`; rename the `sandboxStubs` configuration → `stubs` (same three
  coordinates). Update `dependsOn(resolveMps, resolveStubs)` on `checkModels`/`generateModels`.
- [ ] 2.2 Confirm `libs/` is git-ignored for the new path; remove the now-unused
  `languages/causeway.sandbox/libs` staging.

## 3. Wire the generator dependency

- [ ] 3.1 Add a dependency on `causeway.stubs` to the `causeway` language's generator (in `causeway.mpl`),
  so generator-template classifier references resolve. If hand-XML proves impractical, do this one edit in
  the MPS GUI (Module Properties → Dependencies) — the documented GUI fallback.
- [ ] 3.2 (Optional probe) Add a throwaway `ClassifierType` reference to a Causeway annotation in the
  generator model; `./gradlew checkModels` green ⇒ the generator can see the classifiers; then remove the
  probe. Proves the unblock ahead of B2.

## 4. Re-point the sandbox

- [ ] 4.1 Add a dependency on `causeway.stubs` to `causeway.sandbox.msd`; remove its `${module}/libs`
  `java_classes` modelRoot.
- [ ] 4.2 `./gradlew checkModels` green — the `customers` program and its bodies still resolve external
  types (now transitively).

## 5. Verify + reconcile

- [ ] 5.1 `./gradlew generateModels` green — `Customer.java` + `Product.java` still generate (no
  regression from moving the modelRoot).
- [ ] 5.2 Reconcile `sandbox-sample-and-e2e`'s in-flight `java-classpath-interop` requirement "Sandbox
  imports external Java as classpath stubs" — reframe to "obtains them via the shared `causeway.stubs`
  solution" so the two changes don't conflict at archive (whichever archives second merges).
- [ ] 5.3 Update `docs/generator-template-authoring.md`: correct the playbook step-1 claim (stubs are
  visible to the **generator** via `causeway.stubs`, not just the sandbox).
