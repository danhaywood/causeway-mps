## Context

Causeway exposes generated action mixins as contributed actions in the UI, but ordinary Java callers must select the generated mixin class through `FactoryService` and invoke its `act` method.
The DSL already models action parameters, return types, nested placement, explicit-target placement, and generated mixin class names.
It can therefore resolve an action reference at edit time and generate fully static Java without introducing dynamic dispatch.

The current language has no generic `Mixin`, `IContributedMember`, derived-property body, collection member, or entity inheritance model.
This change deliberately builds on existing `Action` nodes rather than introducing those abstractions prematurely.

## Goals / Non-Goals

**Goals:**

- Provide `target.action(args)` syntax inside embedded action code.
- Resolve nested and explicit-target DSL actions for the target's exact entity type.
- Check argument count, argument types, and result type from the referenced `Action`.
- Generate valid Causeway 3.6 `FactoryService.mixin(...).act(...)` Java.
- Preserve current nested and top-level action generation.
- Verify the feature through modelcheck, generated Java, runtime mixin processing, and the headless pipeline.

**Non-Goals:**

- Wrapped or rule-checked invocation.
- Derived properties or collection members.
- A generic `Mixin` or `IContributedMember` hierarchy.
- Entity inheritance or assignability-based contribution.
- Discovery of handwritten Java mixins.
- Transparent invocation outside a containing DSL `Action`.

## Decisions

### Use an action-specific BaseLanguage expression

Introduce an `ActionInvocation` expression whose semantic reference points directly to an `Action`.
Its children are a target expression and an ordered list of argument expressions.
Its editor projects the referenced action name between the target and argument list as `target.action(args)`.

Keeping the concept action-specific makes the first slice match the structure that exists today while leaving the projection and concept name extensible.
Introducing `IContributedMember` now was rejected because there are no property or collection member concepts with compatible behavior to unify.

### Restrict use to embedded action code

The expression is valid only beneath a DSL `Action` lifecycle body.
This gives generation a containing mixin class in which it can provide `FactoryService` and avoids defining service access for unrelated BaseLanguage roots.

### Resolve actions by exact entity target

The type of the target expression must resolve to a DSL `EntityType`.
The action scope contains actions nested directly in that entity plus root actions whose explicit `target` references that entity.
No supertype, interface, or Java-stub search participates in this first slice.

A missing candidate leaves the reference unresolved.
Multiple same-named candidates for one entity produce an edit-time ambiguity or checking error rather than choosing arbitrarily.

### Derive invocation typing from the action declaration

The invocation's arguments correspond positionally to the referenced action's `Parameter` children.
Model checking reports incorrect arity and incompatible argument types using the existing DSL-to-Java type bridge.
The expression type is the declared action return type, or BaseLanguage `void` when the action has no return type.

### Lower through Causeway FactoryService

For a nested action, generation lowers the expression to the equivalent of:

```java
__factoryService.mixin(Customer.placeOrder.class, target).act(args)
```

For an explicit-target root action, generation lowers it to the equivalent of:

```java
__factoryService.mixin(Customer_topLevelProbe.class, target).act(args)
```

The generator selects the class form from the referenced action's actual placement rather than reconstructing it from the call site.
Direct constructor invocation was rejected because it would bypass Causeway service injection into the invoked mixin.

### Generate FactoryService only where required

A generated action mixin whose lifecycle subtree contains `ActionInvocation` receives an injected private `FactoryService` field with the reserved generated name `__factoryService`.
Actions that do not contain transparent invocations retain their current generated shape.
The runtime verification harness supplies a JDK dynamic proxy for `FactoryService` when instantiating affected mixins, avoiding a new mocking dependency.

### Prove both action placement paths

The sandbox will contain representative invocation of a nested action and an explicit-target root action.
Positive checks cover reference resolution, argument and return typing, generated class literals, generated method calls, Java 21 compilation, and runtime mixin verification.
Negative fixtures cover a wrong target entity, incorrect arity, and an incompatible argument type.

## Deferred Follow-up Stubs

These are named future changes rather than additional active OpenSpec changes because the repository permits only one active change at a time.
Each stub should be promoted to a full proposal after its prerequisites are archived.

### `dsl-wrapped-action-invocation`

Add `wrap(target).action(args)` for rule-checked invocation and interaction-event publication.
Verify the exact Causeway 3.6 `WrapperFactory` and `wrapMixin` APIs, then cover synchronous, asynchronous, and control variants explicitly.

### `dsl-derived-properties`

Define the DSL authoring, typing, lifecycle, and generation model for derived property members.
Do not add invocation sugar until the property declaration and generated Causeway runtime shape are stable.

### `dsl-collection-members`

Define collection member structure, element typing, lifecycle support, and Causeway generation.
Follow with transparent collection access once generated collection mixins have runtime verification equivalent to actions.

### `dsl-contributed-member-abstraction`

Introduce `Mixin` and `IContributedMember` only after actions, derived properties, and collections have concrete compatible models.
Use the abstraction to support uniform member resolution and refactoring between nested and explicit-target definitions without changing callers.

### `dsl-type-hierarchy`

Add entity supertype and interface relationships plus assignability rules.
Then extend contributed-action resolution from exact targets to compatible subtypes with deterministic ambiguity diagnostics.

### `dsl-handwritten-mixin-interop`

Discover handwritten Causeway mixins from Java stubs or an explicit registration model.
Resolve their mixee, member id, main method, argument types, and return type without relying solely on filename conventions.

## Risks / Trade-offs

- **BaseLanguage extension complexity** → Build structure, editor, constraints, typesystem, and generator support incrementally and validate each changed root through MPS MCP.
- **Generated service-field collisions** → Reserve `__factoryService` for generated plumbing and reject or rename conflicting authored declarations.
- **Scope cost** → Search only editable DSL actions with exact entity targets in the first slice; add indexing only if measurements justify it.
- **Nested versus top-level class literals** → Reuse the generator's established action-placement decision and verify both emitted source forms.
- **Runtime verifier injection** → Supply a focused test implementation or proxy without adding Causeway core-metamodel libraries to generated application dependencies.

## Migration Plan

No existing model migration is required because the expression is additive.
Rebuilding the language and generator deploys the new concept and reduction rule.
Removing the feature before release consists of deleting its sandbox usages and reverting the additive language artifacts.

## Open Questions

No open design questions remain for the action-only first slice.
