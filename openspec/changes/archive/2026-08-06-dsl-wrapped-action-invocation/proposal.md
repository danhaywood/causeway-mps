## Why

Transparent action invocation currently lowers directly through `FactoryService`, so it deliberately bypasses Causeway rule checks and interaction-event publication.
DSL authors need an explicit wrapped form when one action must invoke another through the Causeway interaction pipeline without reverting to handwritten Java plumbing.

## What Changes

- Add wrapped action invocation syntax for synchronous `wrap(target).action(args)` calls while keeping direct `target.action(args)` invocation raw and unchanged.
- Add explicit-control and asynchronous wrapped variants with result typing that reflects Causeway's synchronous and `TryFuture` APIs.
- Reuse exact-target DSL action resolution, argument validation, ambiguity diagnostics, and nested versus explicit-target mixin identity.
- Lower wrapped calls through the verified Causeway 3.6 `WrapperFactory.wrapMixin(...)` and `asyncWrapMixin(...)` APIs.
- Generate reserved `WrapperFactory` injection only for action mixins that contain wrapped invocations.
- Add positive and negative fixtures covering synchronous, asynchronous, control, typing, generated Java, rule-checking, event publication, and runtime mixin validity.

## Capabilities

### New Capabilities

- `dsl-wrapped-action-invocation`: Explicit synchronous, asynchronous, and controlled invocation of DSL-defined actions through Causeway's interaction pipeline.

### Modified Capabilities

- `causeway-generation`: Wrapped action invocations generate Causeway `WrapperFactory` plumbing and lower to the appropriate nested or top-level mixin wrapper API.

## Impact

- **Language structure and editor:** wrapped invocation expressions and explicit mode/control projection around the existing action reference model.
- **Scoping and typesystem:** reuse of exact-target action resolution plus synchronous result and asynchronous `TryFuture` typing.
- **Generator:** `WrapperFactory` injection, mixin-class selection, synchronous `wrapMixin` lowering, and asynchronous lambda lowering through `asyncWrapMixin`.
- **Runtime verification:** Causeway rule checks and interaction-event publication become observable requirements for wrapped calls.
- **Compatibility:** existing direct transparent invocation remains raw, source-compatible, and unchanged.
