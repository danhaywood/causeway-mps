## Context

The existing `ActionInvocation` expression resolves a DSL action from the exact entity type of its target and lowers directly to `FactoryService.mixin(...).act(...)`.
That raw form is intentionally concise but bypasses Causeway's wrapper interaction pipeline, including rule checking and interaction-event publication.
The pinned Causeway 3.6 API exposes synchronous `WrapperFactory.wrapMixin(Class<T>, Object[, SyncControl])` and asynchronous `WrapperFactory.asyncWrapMixin(Class<T>, Object[, AsyncControl])` entry points.
The asynchronous API returns `WrapperFactory.AsyncProxy<T>`, whose `applyAsync` and `acceptAsync` methods return `TryFuture<U>` and `TryFuture<Void>` respectively.
The implementation spans language structure, editor, constraints, typesystem, generator, sandbox fixtures, generated-Java verification, runtime verification, documentation, and the project-local DSL skill.

## Goals / Non-Goals

**Goals:**

- Provide an explicit wrapped action syntax without changing the meaning of direct `target.action(args)` calls.
- Support synchronous default-control, synchronous explicit-control, asynchronous default-control, and asynchronous explicit-control forms.
- Reuse exact-target action resolution and existing positional argument validation.
- Preserve nested and explicit-target generated mixin-class selection.
- Generate Java against the pinned Causeway 3.6 wrapper APIs and preserve Java 21 compilation.
- Verify that generated calls enter `WrapperFactory` with the intended mixin class, target, arguments, and control object.

**Non-Goals:**

- Change direct invocation from raw `FactoryService` dispatch to wrapped dispatch.
- Expose every `SyncControl` or `AsyncControl` builder operation as new DSL syntax.
- Add inheritance-aware action resolution, handwritten mixin discovery, derived-property access, collection access, or a generic contributed-member abstraction.
- Reimplement or independently test Causeway's internal rule engine and event bus.
- Infer asynchronous behavior from an action declaration; authors choose it explicitly at each call site.

## Decisions

### Extend the existing invocation shape with a dedicated subconcept

Add `WrappedActionInvocation` as a subconcept of `ActionInvocation` so it inherits the target expression, action reference, and ordered arguments.
Give it a `mode` property with synchronous and asynchronous values and an optional `control` BaseLanguage expression.
Existing `ActionInvocation` nodes remain structurally and semantically unchanged.

A single expanded base concept was rejected because a defaulted mode property on every existing raw node would blur the compatibility boundary and complicate generator dispatch.
An unrelated duplicate concept was rejected because it would duplicate reference scope, argument validation, and action identity logic.

### Project four explicit surface forms

Project synchronous calls as `wrap(target).action(args)` or `wrap(target, control).action(args)`.
Project asynchronous calls as `asyncWrap(target).action(args)` or `asyncWrap(target, control).action(args)`.
The editor SHALL make mode and optional control explicit rather than selecting overloads from inferred control types.

A single `wrap` keyword with an inferred asynchronous mode was rejected because return usage is not a reliable or readable dispatch selector.

### Reuse exact-target action resolution

The inherited action reference scope continues to select actions nested directly in the target's exact DSL entity and root actions explicitly targeting that entity.
Wrapped invocation adds no inheritance, Java-assignability, or handwritten-mixin candidates.
Inherited wrong-target, unresolved, ambiguous, arity, and argument-type diagnostics remain authoritative.

### Type synchronous and asynchronous results separately

A synchronous wrapped invocation has the referenced action's declared return type or BaseLanguage `void` when no return type is declared.
An asynchronous wrapped invocation has `TryFuture<R>` for a value-returning action and `TryFuture<Void>` for an action with no declared return type.
A synchronous control expression MUST be assignable to Causeway `SyncControl`, and an asynchronous control expression MUST be assignable to `AsyncControl`.
The first structure and typesystem implementation step SHALL verify that the existing Causeway stubs expose `TryFuture`, `SyncControl`, and `AsyncControl` to the language model before dependent rules are authored.

### Lower directly to the verified Causeway 3.6 APIs

Synchronous calls lower to `__wrapperFactory.wrapMixin(MixinClass.class, target[, control]).act(args)`.
Asynchronous value-returning calls lower to `__wrapperFactory.asyncWrapMixin(MixinClass.class, target[, control]).applyAsync(mixin -> mixin.act(args))`.
Asynchronous void calls lower to `__wrapperFactory.asyncWrapMixin(MixinClass.class, target[, control]).acceptAsync(mixin -> mixin.act(args))`.
`MixinClass` uses the existing nested `Entity.action` or explicit-target `Entity_action` selection logic.

Lowering through `wrap(target)` was rejected because generated actions are Causeway mixins and the generated call must name the action mixin class explicitly through `wrapMixin`.

### Inject WrapperFactory only where required

An action mixin whose lifecycle subtree contains a `WrappedActionInvocation` receives `@Inject private WrapperFactory __wrapperFactory`.
Actions containing only raw invocations retain only their existing conditional `FactoryService` plumbing.
If one action contains both forms, both reserved fields are generated because they serve distinct runtime semantics.
The reserved name participates in the same authored-service collision checks as `__factoryService`.

### Verify the integration boundary rather than Causeway internals

Generated-source checks assert all synchronous and asynchronous lowering shapes, both generated class-literal forms, optional controls, and conditional service injection.
Runtime verification uses a recording `WrapperFactory` test double to prove the generated caller chooses the expected wrapper API and forwards the expected mixin class, target, arguments, and control.
The test double models success, rule rejection, and interaction notification at the service boundary, while treating Causeway's internal rule engine and event bus as framework-owned behavior.
The complete headless build remains the final compatibility gate.

## Risks / Trade-offs

- **Risk: asynchronous generic types are difficult to construct in the MPS typesystem.** → Harvest the exact `TryFuture` classifier reference from the pinned stubs and validate value and void examples before completing the editor and generator work.
- **Risk: lambda generation selects the wrong functional overload or fails Java 21 compilation.** → Maintain separate value-returning `applyAsync` and void `acceptAsync` generator paths with compiling golden fixtures.
- **Risk: inherited raw-invocation rules accidentally override wrapped-specific typing or generation.** → Validate rule priority on the subconcept and add focused model checks for all four surface forms.
- **Risk: reserved service fields collide with authored injection names.** → Extend the existing reserved-name diagnostics and generated-source checks.
- **Trade-off: two invocation concepts expose raw versus wrapped semantics explicitly.** → Accept the extra concept because it preserves compatibility and keeps runtime semantics visible at the call site.
- **Trade-off: runtime tests use a service-boundary double rather than booting the full Causeway runtime.** → Keep the build fast while verifying the generated integration contract against the pinned API signatures.

## Migration Plan

No model migration is required because existing raw `ActionInvocation` nodes and generated Java remain unchanged.
Introduce the wrapped subconcept and compile the language before adding dependent editor, typesystem, and generator nodes.
Regenerate the sandbox and compare raw callers to confirm no generated changes outside actions that adopt wrapped calls.
Rollback consists of removing wrapped call sites and the new language and generator nodes; raw invocation remains available throughout.

## Open Questions

No product-level questions remain for this slice.
Implementation must confirm MPS classifier references and lambda shapes against the pinned stubs before finalizing the typesystem and generator rules.
