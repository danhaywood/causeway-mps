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

- [x] 3.1 Confirm the `Entity` root mapping rule is the single entry point — DONE: the `main` mapping
  config has exactly one rule, `Entity --> map_Entity` (root mapping rule); no `Action` root rule exists,
  consistent with nested actions generating via a `$LOOP$` inside `map_Entity` (inner class per nested
  action). The `$LOOP$` body itself is GUI template work (`causeway-generator-first-slice` §2).
- [x] 3.2 Top-level `Action` root mapping rule = design of record for the separate-file form — DONE
  (recorded): `Action` is now rootable, so a `Action --> map_Action` root mapping rule is the path when a
  top-level action exists. Deferred until the sandbox/golden has one.
- [x] 3.3 `./gradlew generateModels` green over `customers` — DONE: `Customer.java` + `Product.java` still
  generate as skeletons (`package customers`); the new `Module` root does **not** leak into `source_gen`
  (unmatched root, not copied to the Java output) — benign today. An explicit abandon-root rule is still
  wanted in `causeway-generator-first-slice` 2.1 (for the namespace macro), but is not required for
  generation to succeed.

## 4. Re-golden the reference-app

- [x] 4.1 Re-golden `Customer.placeOrder` to a **non-static inner mixin class** of `Customer` — DONE:
  deleted `Customer_placeOrder.java`; added inner class `placeOrder` (`@Action(semantics=IDEMPOTENT)`,
  `@MemberSupport act(Product,int)`, `@Inject OrderService`, mixee = `Customer.this`, no explicit
  field/ctor). Named after the member per design decision.
- [x] 4.2 Compile against real Causeway 3.6.0 — DONE: `mvn compile` green (JDK 21). `javap` confirms the
  synthesised ctor is `Customer$placeOrder(customers.Customer)` — i.e. the 1-arg-mixee ctor Causeway
  requires, at the bytecode level. `SETUP.md` updated to the inner-class idiom. (Runtime metamodel
  introspection of the inner-class mixin remains the same deferred boot-time validation as before.)

## 5. Reconcile the spec + dependent changes

- [x] 5.1 Merge this change's `dsl-domain-model` delta into the promoted spec — DONE: promoted
  `openspec/specs/dsl-domain-model/spec.md` now has Module = singleton (no containment), Entity = root
  owning properties + nested actions, Action = dual nested/top-level with the inner-class split.
- [x] 5.2 Reconcile `dsl-action-model`'s in-flight delta — DONE: it never referenced `Module` containment
  (no re-introduction risk); its `Action concept` MODIFIED requirement was updated to a superset that
  carries the rootable + non-static-inner-class generation detail, so archiving it later extends (not
  reverts) this change. Its supporting-blocks / injected-services / params-as-fields additions are intact.
- [x] 5.3 Deferred Module metadata follow-up (ModuleWithFixtures flag, deps, permissions) — DONE: recorded
  in the (archived) proposal's out-of-scope list and the `model-equals-module` memory.
