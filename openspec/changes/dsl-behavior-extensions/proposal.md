## Why

Causeway makes contributed members (mixins) transparent in the **UI** — a user can't tell a native
member from a contributed one. But in **code** they are clumsy:
`factoryService.mixin(Customer_placeOrder.class, customer).act(product, qty)`, and for rule-checked
invocation `wrapperFactory.wrapMixin(Customer_placeOrder.class, customer).act(...)`. The DSL can make
contributed members transparent in code too — `customer.placeOrder(product, qty)` and
`wrap(customer).placeOrder(product, qty)` — by **extending baseLanguage** with Causeway-aware expression
concepts that generate the plumbing. This is a genuine capability the host platform can't give (uniform
member access in code), not mere sugar.

> **Stub:** proposal + design captured now (explore). Specs + tasks fleshed when scheduled.
> Successor to `dsl-mixins` (needs members modelled as mixins). Composes with `dsl-action-model`.

## What Changes

- Add a `MemberInvocation` expression concept (a **baseLanguage extension**) projecting as
  `target.member(args)`, resolving `member` against the contributed members of `target`'s type, and
  generating the right plumbing per member kind: an inline member → a direct call; a mixin member →
  `factoryService.mixin(Mixee_member.class, target).act(args)`.
- Add a `wrap(x)` form (type `Wrapped(T)`) so `wrap(customer).placeOrder(..)` generates the
  `wrapperFactory.wrap(..)` / `wrapMixin(..)` (rule-checked + event-publishing) path.
- Resolve member references uniformly across **inline** members and **mixin** members via an
  `IContributedMember` union (both the inline `Action`/`Property`/`Collection` and a `Mixin` implement it).

## Capabilities

### New Capabilities
- `dsl-behavior-extensions`: Transparent, type-safe call-site invocation of contributed members in
  embedded code (`target.member(..)`, `wrap(target).member(..)`), resolved over inline + mixin members
  and generated to the correct Causeway plumbing.

### Modified Capabilities
<!-- May modify dsl-domain-model to introduce IContributedMember as the shared super of inline members and Mixin. -->

## Impact

- **`causeway.structure`/used languages**: `MemberInvocation` + `wrap` as baseLanguage-extension concepts;
  `IContributedMember` union.
- **scoping/typesystem**: gather all members contributed to a given type (inline + mixins targeting it);
  type `wrap(x)` as `Wrapped(T)` (result is unwrapped — wrap-ness does not propagate through return values).
- **generator**: dispatch member-kind → direct call vs `factoryService.mixin(..)` vs
  `wrapperFactory.wrap(..)/wrapMixin(..)`.
- **Depends on** `dsl-mixins`; **composes with** `dsl-action-model`.
- **Out of scope / open forks** (see design): assignability-based contribution (needs a DSL type
  hierarchy); resolving hand-written (stub) mixins (v1 = DSL-modelled only); contributed property/
  collection access.
