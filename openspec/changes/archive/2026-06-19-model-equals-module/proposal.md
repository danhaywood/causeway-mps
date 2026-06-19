## Why

The `causeway` DSL's structure metamodel and its `dsl-domain-model` spec still say `Module` **contains**
its entities and actions. That contradicts what the generator actually needs and what the sandbox already
does. An MPS **root mapping rule** is strictly 1 input-root → 1 output-root and fires only on roots, so a
single `Module` root holding N entities cannot fan out to N class files (it fails with "failed to generate
output after 10 repeated mappings"). The `causeway-generator-first-slice` B1 work therefore made `Entity`
a **root** and the `customers` sandbox now stores two `Entity` roots with no `Module` node at all — the
sandbox is ahead of the metamodel, and the spec describes a shape the generator can't use.

This change settles that contradiction: **one MPS model = one module**, class-producing concepts are
roots, and `Module` becomes a lightweight **singleton metadata root**.

A second decision is folded in. The earlier pivot note ("`Action` becomes a root too") over-generalised:
a concept only needs to be a root when it must become **its own file**. Causeway happily accepts a
**non-static inner class** as a mixin — javac synthesises that class's constructor as `Mixin(Outer)`,
which is exactly the 1-arg-mixee constructor Causeway requires (the mixee is `Outer.this`, for free). So a
**nested** action stays *contained* in its `Entity` and generates as a non-static inner mixin class inside
the entity's own `.java` file (no extra file, no fan-out). Only a **top-level / cross-module** action — one
contributing to an entity it does not live beside — needs to be a root with an explicit `target`.

## What Changes

- **`Module` becomes a singleton metadata root.** It no longer contains `entities` or `actions`. Per the
  model=module rule, entities are top-level roots of the model and the model/package boundary (not a
  containment link) defines the module. `Module` carries module identity only: the namespace that prefixes
  each `@Named` logical-type-name (and, later, a `ModuleWithFixtures` flag, deps, permissions).
- **`Entity` is a root** that owns its `properties` **and** its nested `actions` (the `actions`
  containment is retained, reversing the earlier "remove it" pivot note).
- **`Action` is dual-form**: a valid `Entity` child (nested) *and* rootable (top-level). The existing
  `dsl-action-model` rule — empty `target` ⇒ nested (target = enclosing entity); `target` set ⇒
  top-level / cross-module — is unchanged.
- **Generation split** follows the form: a nested action generates as a **non-static inner mixin class**
  of its entity; a top-level action generates as a **separate top-level mixin class** via a root mapping
  rule. Cross-module contribution is a cross-model reference (`target` → an `Entity` in another module's
  model).

## Capabilities

### Modified Capabilities
- `dsl-domain-model`: `Module` no longer contains entities/actions (singleton metadata root); `Entity` is
  a model root owning properties + nested actions; `Action` is both a nested `Entity` child and a rootable
  top-level concept, with the nested form generating as a non-static inner class.

## Impact

- **`causeway.structure`**: remove `Module.entities` (link 21) and `Module.actions` (link 49); add
  `19KtqR=true` (rootable) to `Action`. `Entity.actions` (link 23) and `Action.target` (link 48) are
  unchanged. `./gradlew checkModels` must stay green.
- **`causeway.sandbox` (`customers`)**: already migrated (Entity roots, no Module node) — no edit expected;
  verify it still loads after the metamodel change.
- **`causeway.generator`**: confirms the generation split — `Entity` template `$LOOP$`s over nested
  `actions` to emit non-static inner mixin classes; a top-level `Action` root mapping rule emits a separate
  file. (Template bodies remain GUI-authored under `causeway-generator-first-slice` §2; this change only
  fixes the spec/structure they target.)
- **Golden (`reference-app`)**: re-goldens again — `Customer.placeOrder` (a nested action) becomes a
  **non-static inner class** of `Customer`, not the separate `Customer_placeOrder.java` from
  `causeway-generator-first-slice` task 0.1. Recompile against Causeway 3.6.0 to lock the new oracle.
- **Touches `dsl-action-model`**: its in-flight `dsl-domain-model` delta describes the nested form via
  containment — that delta stays valid (containment is retained), but its merge must not re-introduce
  `Module`-owns-entities. Both deltas reconcile at archive time.
- **Out of scope**: Module metadata beyond the `@Named` namespace (the `ModuleWithFixtures` flag, deps,
  permissions) — captured as future work; the action lifecycle scope provider (`dsl-action-model` §3);
  authoring the generator template bodies (`causeway-generator-first-slice` §2).
