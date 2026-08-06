## 1. Wrapped Invocation Language Surface

- [ ] 1.1 Verify the pinned Causeway 3.6 `WrapperFactory`, `AsyncProxy`, `SyncControl`, `AsyncControl`, and `TryFuture` signatures in the project stubs, and harvest the classifier references needed by MPS typesystem and generator nodes.
- [ ] 1.2 Add synchronous and asynchronous wrapped-invocation mode structure plus `WrappedActionInvocation` as an `ActionInvocation` subconcept with an optional control expression, then rebuild and reload the language runtime.
- [ ] 1.3 Add an editor that projects the four explicit `wrap(target[, control]).action(args)` and `asyncWrap(target[, control]).action(args)` forms with normal target, control, action, and argument editing behavior.
- [ ] 1.4 Reuse exact-target action scope and placement constraints for wrapped calls while diagnosing controls whose type does not match the selected synchronous or asynchronous mode.
- [ ] 1.5 Infer synchronous action results and asynchronous `TryFuture<R>` or `TryFuture<Void>` results while preserving inherited arity, argument compatibility, wrong-target, unresolved, and ambiguity diagnostics.

## 2. Causeway Generation

- [ ] 2.1 Extend generator queries to detect wrapped invocations, select nested or explicit-target generated mixin classes, distinguish synchronous from asynchronous dispatch, and distinguish value-returning from void actions.
- [ ] 2.2 Generate reserved `@Inject private WrapperFactory __wrapperFactory` plumbing only for action mixins containing wrapped calls, including mixed raw-and-wrapped callers and authored-service collision diagnostics.
- [ ] 2.3 Reduce synchronous default-control and explicit-`SyncControl` calls to the appropriate `__wrapperFactory.wrapMixin(...).act(args)` form for both generated action placements.
- [ ] 2.4 Reduce asynchronous value-returning calls through `asyncWrapMixin(...).applyAsync(...)` and void calls through `asyncWrapMixin(...).acceptAsync(...)`, with optional `AsyncControl` and placement-correct class literals.
- [ ] 2.5 Rebuild the generator, reload modules, regenerate the sandbox, and validate every changed MPS root while confirming existing raw invocation output remains unchanged.

## 3. Fixtures and Verification

- [ ] 3.1 Add positive sandbox callers for synchronous nested default-control dispatch and explicit-target dispatch with an explicit `SyncControl`.
- [ ] 3.2 Add positive sandbox callers for asynchronous value and void results, default and explicit `AsyncControl`, and both nested and explicit-target action placements.
- [ ] 3.3 Add negative fixtures for mismatched control types, wrapped placement outside action code, wrong targets, ambiguous action identity, incorrect arity, and incompatible arguments.
- [ ] 3.4 Extend generated-source structural verification for every `wrapMixin`, `asyncWrapMixin`, `applyAsync`, and `acceptAsync` shape plus conditional and mixed service injection.
- [ ] 3.5 Extend runtime verification with a recording `WrapperFactory` boundary that checks mixin class, target, arguments, controls, rule rejection, interaction notification, and absence of raw-dispatch fallback.
- [ ] 3.6 Compile generated Java 21 and run runtime mixin verification for all affected caller and target mixins, including deliberate invalid-mixin rejection.

## 4. Documentation and Validation

- [ ] 4.1 Document wrapped syntax, synchronous and asynchronous result typing, control semantics, exact-target resolution, wrapper-boundary behavior, and the distinction from raw direct invocation.
- [ ] 4.2 Refresh the project-local Causeway DSL skill with the wrapped concept, sandbox examples, reusable blueprints, authoring workflow, and generation and typing gotchas.
- [ ] 4.3 Run focused positive and negative model checks and confirm all changed roots have no unexpected MPS problems.
- [ ] 4.4 Run `./gradlew headlessBuild --no-daemon --stacktrace` with pinned JDK 21 and JDK 25 toolchains and confirm the complete generation, checking, compilation, and runtime pipeline succeeds.
- [ ] 4.5 Run strict OpenSpec validation and confirm the wrapped-invocation and Causeway-generation deltas remain coherent with verified generated output.
