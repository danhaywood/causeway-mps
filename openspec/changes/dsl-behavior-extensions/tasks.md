## 1. Action Invocation Language Surface

- [ ] 1.1 Add the `ActionInvocation` BaseLanguage expression concept with a target expression, an `Action` reference, and ordered argument expressions, then rebuild and reload the language runtime.
- [ ] 1.2 Add an editor that projects `ActionInvocation` as `target.action(args)` with normal expression and argument-list editing behavior.
- [ ] 1.3 Restrict `ActionInvocation` placement to embedded DSL action code and provide exact-entity reference scope over nested and explicit-target root actions.
- [ ] 1.4 Infer the invocation result from the referenced action's optional return type and diagnose targets that do not resolve to a DSL entity.
- [ ] 1.5 Diagnose unresolved or ambiguous action identity, incorrect arity, and incompatible positional argument types.

## 2. Causeway Generation

- [ ] 2.1 Add generator queries that detect `ActionInvocation` usage and select the referenced action's nested or top-level generated class form.
- [ ] 2.2 Generate reserved `@Inject private FactoryService __factoryService` plumbing only for action mixins containing transparent invocations, covering both generated action placements.
- [ ] 2.3 Reduce nested-action invocations to `__factoryService.mixin(Entity.action.class, target).act(args)` while preserving expression result typing.
- [ ] 2.4 Reduce explicit-target action invocations to `__factoryService.mixin(Entity_action.class, target).act(args)` while preserving expression result typing.
- [ ] 2.5 Rebuild the generator, reload modules, regenerate the sandbox, and validate every changed MPS root.

## 3. Fixtures and Verification

- [ ] 3.1 Add a positive sandbox caller that resolves and invokes a nested action with entity, primitive, and entity-return typing.
- [ ] 3.2 Add a positive sandbox caller that resolves and invokes an explicit-target root action.
- [ ] 3.3 Add negative model fixtures for a wrong target entity and ambiguous or unresolved action identity.
- [ ] 3.4 Add negative model fixtures for incorrect arity and incompatible argument types.
- [ ] 3.5 Extend generated-source structural verification for both invocation class-literal forms and conditional `FactoryService` injection.
- [ ] 3.6 Extend runtime mixin verification with a JDK proxy `FactoryService` so affected generated callers instantiate without adding a mocking dependency.

## 4. Documentation and Validation

- [ ] 4.1 Document transparent action invocation syntax, exact-target resolution, raw invocation semantics, and deferred follow-up capabilities.
- [ ] 4.2 Refresh the project-local Causeway DSL skill with the new concept, sandbox examples, blueprint, workflow, and known generation constraints.
- [ ] 4.3 Run focused positive and negative model checks, generated Java compilation, and runtime mixin verification.
- [ ] 4.4 Run `./gradlew headlessBuild --no-daemon --stacktrace` with the pinned JDKs and confirm the complete pipeline succeeds.
- [ ] 4.5 Run strict OpenSpec validation and confirm the action-invocation and Causeway-generation deltas remain coherent with generated output.
