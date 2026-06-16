## Why

Causeway makes contributed members (mixins) transparent in the UI, but in code they are clumsy
(`factoryService.mixin(Customer_placeOrder.class, customer).act(..)`). We want the DSL to (1) represent
behavior and derived members **as mixins under the covers** — keeping entity classes lean and modular —
and (2) eventually expose them transparently at the call site (`customer.placeOrder(..)`). This change
establishes the **persisted-vs-derived discriminator** and the **mixin generation strategy** that make
that possible. The call-site sugar itself is a successor change (`dsl-behavior-extensions`).

> **Stub:** proposal + design captured now (explore). Specs + tasks to be fleshed when scheduled.
> **Sequencing:** the "actions are always mixins" decision changes the generator's target, so this
> change's core decision is an **input to `causeway-generator-first-slice`** — settle/fold before the
> generator hardens (see that change's design note).

## What Changes

- **Persistence is the discriminator.** A `Property`/`Collection` is **persisted by default** (real entity
  state → inline field + getter, JPA-mapped). Marking it **`derived`** (JPA-inspired, the inverse of
  `@Transient`) makes it a computed member with no backing field → generated as a **mixin**.
- **Actions are always mixins** (never state). Even a same-module action generates a `Mixee_member` mixin class.
- **Entity class = pure persisted state.** Fields + getters only; all behavior and derived views live in
  mixin classes.
- **Generation dispatch:** `persisted` prop/coll → inline; `derived` prop/coll + every action → mixin;
  any **cross-module** contribution → mixin (and necessarily non-persisted).
- **Cross-module contributions** are first-class: a mixin can target an `Entity` it does not own.

## Capabilities

### New Capabilities
- `dsl-mixins`: Mixin generation strategy (`Mixee_member` classes with `act`/`prop`/`coll`) and
  cross-module contributions (a member contributed to an `Entity` in another module).

### Modified Capabilities
- `dsl-domain-model`: `Property`/`Collection` gain a `derived` marker (default = persisted/inline); the
  generation strategy (inline vs mixin) is defined; actions are documented as always-mixin.

## Impact

- **`causeway.structure`**: `derived` flag on `Property`/`Collection`; a way to declare cross-module contributions.
- **`causeway.generator`**: dispatch persisted→inline, derived/action→mixin; emit `Mixee_member` classes.
- **`reference-app` golden**: shifts — `Customer.placeOrder` moves from an inline method to a
  `Customer_placeOrder` mixin class (the agreed re-golden; executed in the generator change, not here).
- **Successor**: `dsl-behavior-extensions` adds the transparent call-site sugar (`customer.placeOrder(..)`,
  `wrap(..)`) on top of this — out of scope here.
- **Invariant**: `persisted ⇒ owned ⇒ same-module ⇒ inline`; a cross-module contribution is necessarily
  non-persisted. `derived`/mixin members are read-only; editability (setter / `editing=ENABLED`) applies
  only to persisted props.
