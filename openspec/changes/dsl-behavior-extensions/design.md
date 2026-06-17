## Context

Explore-mode capture (2026-06-16/17). Records the member-invocation transparency design so it isn't
lost. Builds on `dsl-mixins` (members modelled as mixins) and composes with `dsl-action-model`.

## Goals / Non-Goals

**Goals:** transparent, type-safe `target.member(..)` and `wrap(target).member(..)` in embedded code,
resolved over inline + mixin members, generating correct Causeway plumbing.

**Non-Goals (this cut):** assignability-based contribution (mixins on interfaces/supertypes — needs a
DSL type hierarchy); resolving hand-written stub mixins; contributed property/collection *access* sugar
(same mechanism, later); the `wrap` async/control variants.

## Key insight: not Groovy — a baseLanguage extension

`customer.placeOrder(..)` isn't a real Java method, so a *textual* language would need dynamic dispatch
(Groovy). MPS doesn't: a `MemberInvocation` concept resolves `member` against the model at **edit time**
(completion + static type-check) and **generates** fully-static verbose Java. Groovy-like surface,
Java-like safety, verbose-Java output — the strongest justification for MPS over Xtext.

```
            surface              member resolved...   output         type-safe
 Groovy     customer.placeOrder  runtime (dynamic)    (stays Groovy)  no
 plain Java factoryService.mixin compile-time         verbose Java    yes (verbose)
 MPS extn   customer.placeOrder  EDIT-time (proj.)    verbose Java    yes  ◀ best of both
```

## Resolution pipeline

```
 customer.placeOrder(product, qty)
 ├─1 type of `target`         → Entity Customer        (or Wrapped(Customer) if wrap(customer))
 ├─2 gather candidate members → inline members on Customer
 │                              + Mixins whose mixee is Customer
 │                              (+ later: hand-written stub mixins; supertypes/interfaces)
 ├─3 resolve `placeOrder`     → an IContributedMember  (inline OR mixin)
 └─4 generate, by kind:        inline → customer.placeOrder(..)
                               mixin  → factoryService.mixin(Customer_placeOrder.class, customer).act(..)
                               +wrap  → wrapperFactory.wrap(..)/wrapMixin(..)
```

`IContributedMember` is the union — implemented by both the inline `Action`/`Property`/`Collection` and
the `Mixin` concept; the scope gathers both, the generator dispatches on the concrete kind. This is how
"the author can't distinguish" becomes true in code.

## `wrap(...)` semantics

Two genuinely different things, surfaced as a one-word toggle:
- `customer.placeOrder(..)` — raw call: bypasses hide/disable/validate, no events.
- `wrap(customer).placeOrder(..)` — rule-checked + publishes interaction events ("as if a user did it").
`wrap(x)` types as `Wrapped(T)`; the **result is unwrapped** (Causeway's wrapper returns the raw object),
so wrap-ness does not propagate through return values.

## Forks (decisions for when this is built)

1. **Exact-mixee vs assignability.** Full power = mixins on interfaces/supertypes contribute to all
   subtypes — but that needs a **DSL type hierarchy** (entity `extends`/`implements`) we don't have. v1:
   exact-mixee match. Assignability ⇒ a prerequisite `dsl-type-hierarchy` capability.
2. **DSL-modelled vs hand-written mixins.** v1 resolves **DSL-defined** members only; to call a
   hand-written (stub) mixin, drop to plain baseLanguage and write the `factoryService.mixin(..)` plumbing
   (escape hatch always available). v2 could index stub mixins by the `Mixee_member` convention.
3. **Definition transparency** (from `dsl-mixins`): because call sites are transparent, moving a member
   inline↔mixin (or across modules) **doesn't break callers** — a refactoring the host platform can't
   offer (in plain Causeway it rewrites every call site). The headline payoff.

## Risks / Trade-offs

- **Scoping cost** — gathering contributed members per type runs on every completion/resolve; naive
  iteration is fine for v1, may need indexing at scale.
- **Ambiguity** — an inline and a mixin member with the same name on one type: Causeway rejects the
  member-id clash at bootstrap; the DSL can flag it at **edit time** (a nice early-error win).
- **Exact Causeway API** — `wrapMixin`/`wrapMixinT`, mixin method `act`/`prop`/`coll` — verify against 3.6.
- **Baseline extension difficulty** — extending baseLanguage with new expression concepts + scope is
  advanced/imperative → GUI-authored, per the declarative/imperative boundary.
