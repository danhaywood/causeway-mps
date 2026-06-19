# Tasks

Oracle = `./gradlew checkModels` (structure well-formed, no unresolved refs / orphaned containment) then
`./gradlew generateModels` over the `customers` sandbox; for the golden, recompile `reference-app` against
Causeway 3.6.0 with the nested action in non-static-inner-class form.

Settles the model=module contradiction between the metamodel/spec (Module owns entities/actions) and what
the generator + sandbox actually do. Structure edits are hand-authorable (per the headless-authoring
spike); the inner-class generation split feeds `causeway-generator-first-slice` §2 (template bodies stay
GUI-authored there).

## 0. Verify the starting contradiction (audit — DONE)

- [x] 0.1 Confirm structure is half-migrated — DONE: `Module` (id 1) still has `entities` (link 21) and
  `actions` (link 49); `Entity` (id 2) is rootable; `Action` (id 4) is NOT rootable; `customers.mps` has
  two `Entity` roots and no `Module` node (sandbox ahead of metamodel).

## 1. Structure edits (`causeway.structure`)

- [x] 1.1 Remove `Module.entities` (link 21, `0..n` → Entity) from the `Module` concept — DONE.
- [x] 1.2 Remove `Module.actions` (link 49, `0..n` → Action) from the `Module` concept — DONE. Grep
  confirmed no model references either removed link id outside `causeway.structure.mps`.
- [x] 1.3 Make `Action` (id 4) rootable — DONE: added `19KtqR=true`. Still usable as an `Entity` child
  (`Entity.actions`, link 23 retained) and `Action.target` (link 48 retained) is the discriminator.
- [x] 1.4 `./gradlew checkModels` green — DONE (BUILD SUCCESSFUL, JDK 17). No unresolved references, no
  orphaned-containment errors; only the pre-existing `baseLanguage` generation-target warning on
  `causeway.generator` (unrelated).

## 2. Sandbox sanity (`causeway.sandbox` / `customers`)

- [x] 2.1 Confirm `customers.mps` still loads and `checkModels` is green after the metamodel change — DONE:
  green with no edit; it already stores two `Entity` roots and no `Module` node.
- [x] 2.2 Add a `Module` singleton root to the `customers` model carrying the `customers` namespace — DONE:
  hand-authored a `Module` root named `customers` (concept `8900000000000000001`, registry index `3Zuir1`,
  node id `_$TiGuwUR0`), matching the file's id/index style. `./gradlew checkModels --rerun-tasks` green
  (MPS executed the check; modelcheck plugin fails on errors, so success = the node is valid). User to
  reload-from-disk in MPS.

## 3. Generator alignment (`causeway.generator`)

> Template *bodies* are GUI-authored under `causeway-generator-first-slice` §2; this change only fixes the
> shape they target and records the split. Keep these as confirmation, not authoring, where possible.

- [ ] 3.1 Confirm the `Entity` root mapping rule is the single entry point and that nested `actions` are
  intended to generate via a `$LOOP$` (inner class per nested action) — not a separate root rule.
- [ ] 3.2 Confirm a top-level `Action` root mapping rule is the path for the separate-file form (deferred
  until a top-level action exists in the sandbox/golden; record as the design of record).
- [ ] 3.3 `./gradlew generateModels` green over `customers` (skeleton still generates after the metamodel
  change).

## 4. Re-golden the reference-app

- [ ] 4.1 Re-golden `Customer.placeOrder` from a separate `Customer_placeOrder.java` (the
  `causeway-generator-first-slice` 0.1 form) to a **non-static inner mixin class** of `Customer`
  (`@Action` class, `@MemberSupport act`, injected `OrderService`, mixee = `Customer.this`).
- [ ] 4.2 Compile the re-goldened `reference-app` against real Causeway 3.6.0; confirm Causeway introspects
  the non-static inner class as a mixin (1-arg synthesised ctor = mixee). Update `SETUP.md` if the golden
  layout notes change.

## 5. Reconcile the spec + dependent changes

- [ ] 5.1 At archive time, merge this change's `dsl-domain-model` delta into the promoted spec (Module =
  singleton; Entity = root owning properties + nested actions; Action = dual nested/top-level with the
  inner-class split).
- [ ] 5.2 Confirm `dsl-action-model`'s in-flight `dsl-domain-model` delta still reconciles — its nested
  form via containment stays valid; ensure its merge does not re-introduce `Module`-owns-entities.
- [ ] 5.3 Note the deferred Module metadata follow-up (ModuleWithFixtures flag, deps, permissions) so it
  is not lost.
