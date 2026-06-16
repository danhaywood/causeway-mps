## Context

Explore-mode design capture (2026-06-16). Builds on the archived `dsl-domain-model` foundation and the
`dsl-type-system` Action-body work. Decides how members map to inline-vs-mixin and how the entity class
is shaped, ahead of the generator.

## Goals / Non-Goals

**Goals:** the persisted/derived discriminator; the mixin generation strategy; cross-module contributions;
the pure-state entity-class shape.

**Non-Goals:** the transparent call-site sugar (`customer.placeOrder(..)` / `wrap(..)`) — that is the
successor `dsl-behavior-extensions`; editability; entity inheritance/interfaces (a separate prerequisite
for assignability-based contribution).

## Decisions

**Persistence is the discriminator (persisted = default).** Following JPA (persistent-unless-`@Transient`),
properties/collections are persisted/inline by default; the `derived` keyword marks computed members that
become mixins. Rationale: stored fields are the common case for an entity, so the default minimizes
ceremony; only the minority (derived) is marked.

```
   member kind                       generated as            why
   ───────────────────────────────   ─────────────────────   ────────────────────────────
   Action                            mixin (always)          never state
   Property  (default / persisted)   inline field + getter   IS state → real field, JPA-mapped
   Property  derived                 mixin (prop())          computed → no backing field
   Collection(default / persisted)   inline JPA relationship  IS state → @OneToMany etc.
   Collection derived                mixin (coll())          computed query → no backing field
   any cross-module contribution     mixin                   can't add a method/field to a foreign class
```

**Entity class = pure persisted state.** With actions and derived members hoisted to mixin classes, the
generated entity holds only fields + getters. Cleaner/more modular than typical hand-written Causeway, and
it makes call-site transparency (successor change) fall out for free.

**Re-golden the reference-app to mixins (the a/b decision → b).** `Customer.placeOrder` becomes a separate
`Customer_placeOrder` mixin class (with `act(..)`); `Customer.java` keeps only state. This shifts the
generator's golden target, so it is **an input to `causeway-generator-first-slice`** — execute the
re-golden there (or in a small prep step), not against the current inline golden. (Explore mode: not
changing `reference-app` code now.)

**Authoring placement.** Same-module members (persisted state + same-module derived/actions) are declared
in the entity body; **cross-module** contributions are declared separately (`mixin … on Entity` /
`contribute … to Entity`) because the author isn't in the mixee's module. Hence both placements exist.

**Invariants / constraints (edit-time wins):**
- `persisted ⇒ owned ⇒ same-module ⇒ inline`; cross-module contribution ⇒ non-persisted.
- `derived`/mixin members are read-only; `editing=ENABLED` + setter applies only to persisted props.
- `derived` is valid only on properties/collections, not actions.

## Risks / Trade-offs

- **Generator complexity** — emitting `Mixee_member` classes (correct ctor of mixee type, `act/prop/coll`
  method, `@Action/@Property/@Collection`) is more than inline methods. Mitigate by re-goldening one mixin
  in `reference-app` first and compiling it, as the generator's verified target.
- **Mixin method/name conventions** — verify against Causeway 3.6 (`act`/`prop`/`coll`, member name from
  `Mixee_member`, mixee = ctor arg) when implementing.
- **Assignability (mixins on interfaces/supertypes)** is the full-power case but needs a DSL type
  hierarchy we don't have — deliberately out of scope; exact-mixee match for now.
