## 1. Action Invocation Language Surface

- [x] 1.1 Add the `ActionInvocation` BaseLanguage expression concept with a target expression, an `Action` reference, and ordered argument expressions, then rebuild and reload the language runtime.
- [x] 1.2 Add an editor that projects `ActionInvocation` as `target.action(args)` with normal expression and argument-list editing behavior.
- [x] 1.3 Restrict `ActionInvocation` placement to embedded DSL action code and provide exact-entity reference scope over nested and explicit-target root actions.
- [x] 1.4 Infer the invocation result from the referenced action's optional return type and diagnose targets that do not resolve to a DSL entity.
- [x] 1.5 Diagnose unresolved or ambiguous action identity, incorrect arity, and incompatible positional argument types.

## 2. Causeway Generation

- [x] 2.1 Add generator queries that detect `ActionInvocation` usage and select the referenced action's nested or top-level generated class form.
- [x] 2.2 Generate reserved `@Inject private FactoryService __factoryService` plumbing only for action mixins containing transparent invocations, covering both generated action placements.
- [x] 2.3 Reduce nested-action invocations to `__factoryService.mixin(Entity.action.class, target).act(args)` while preserving expression result typing.
- [x] 2.4 Reduce explicit-target action invocations to `__factoryService.mixin(Entity_action.class, target).act(args)` while preserving expression result typing.
- [x] 2.5 Rebuild the generator, reload modules, regenerate the sandbox, and validate every changed MPS root.

## 3. Fixtures and Verification

- [x] 3.1 Add a positive sandbox caller that resolves and invokes a nested action with entity, primitive, and entity-return typing.
- [x] 3.2 Add a positive sandbox caller that resolves and invokes an explicit-target root action.
- [x] 3.3 Add negative model fixtures for a wrong target entity and ambiguous or unresolved action identity.
  DONE: a temporary `negativeWrongTarget` caller used a `Product` target for `Customer.placeOrder` and model checking reported `The reference placeOrder (action) is out of search scope`.
  A temporary duplicate nested `placeOrder` action made the positive caller report `action invocation member identity is ambiguous for the target entity`.
  A temporary invocation with no selected action reported `No reference in the obligatory role 'action'`.
  All negative fixtures were removed after verification, and the `Customer` root returned to its clean state apart from the existing informational String recommendation.
- [x] 3.4 Add negative model fixtures for incorrect arity and incompatible argument types.
  DONE: a temporary `negativeIncorrectArity` caller omitted the `quantity` argument and model checking reported `action invocation argument count must match the referenced action`.
  A temporary `negativeIncompatibleArgument` caller supplied `Product` for the `int quantity` position and model checking reported `action invocation arguments must be compatible with the referenced action parameters`.
  Both negative fixtures were removed after verification, and the `Customer` root returned to its clean state apart from the existing informational String recommendation.
- [x] 3.5 Extend generated-source structural verification for both invocation class-literal forms and conditional `FactoryService` injection.
  DONE: `verifyGeneratedSourceStructure` checks the nested `placeOrder.class` and top-level `Customer_topLevelProbe.class` invocation forms, requires the reserved field in both calling mixins, and rejects that field in unchanged nested and top-level actions.
  `compileGeneratedJava` now depends on this source-structure gate, and both a forced verification run and the Java 21 compilation pipeline pass.
- [x] 3.6 Extend runtime mixin verification with a JDK proxy `FactoryService` so affected generated callers instantiate without adding a mocking dependency.
  DONE: `GeneratedMixinRuntimeCheck` registers a JDK dynamic proxy as the Causeway `FactoryService`, processes both generated caller mixins through the programming model, instantiates them for a `Customer`, and verifies injection into the reserved field.
  The existing nested and top-level target checks and deliberate invalid-mixin rejection remain green, and no mocking dependency was added.

## 4. Documentation and Validation

- [x] 4.1 Document transparent action invocation syntax, exact-target resolution, raw invocation semantics, and deferred follow-up capabilities.
  DONE: `docs/transparent-action-invocation.md` documents expression typing and placement, nested and explicit-target resolution, both generated `FactoryService.mixin(...).act(...)` forms, conditional service plumbing, direct-call semantics, sandbox coverage, and all six named follow-up stubs.
- [x] 4.2 Refresh the project-local Causeway DSL skill with the new concept, sandbox examples, blueprint, workflow, and known generation constraints.
  DONE: the synchronized `.pi`, `.agents`, and `.claude` Causeway DSL skills now document `ActionInvocation`, both sandbox callers and invocation refs, exact-target authoring and verification workflow, raw-call and generation gotchas, and a reusable invocation subtree blueprint.
  The blueprint parses and dry-runs successfully in the nested sandbox caller, all cross-links resolve, and the three skill copies are byte-identical.
- [x] 4.3 Run focused positive and negative model checks, generated Java compilation, and runtime mixin verification.
  DONE: final temporary fixtures reconfirmed the exact incorrect-arity and incompatible-positional-type diagnostics, then were removed; the restored `Customer` root has only the existing informational String recommendation.
  A forced `verifyGeneratedMixins` run completed generation, model checking, generated-source structure checks, Java 21 compilation, caller/target mixin processing, proxy injection, and deliberate invalid-mixin rejection successfully.
- [ ] 4.4 Run `./gradlew headlessBuild --no-daemon --stacktrace` with the pinned JDKs and confirm the complete pipeline succeeds.
- [ ] 4.5 Run strict OpenSpec validation and confirm the action-invocation and Causeway-generation deltas remain coherent with generated output.
