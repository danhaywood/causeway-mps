## Why

Causeway action mixins are transparent in the UI but require verbose `FactoryService.mixin(...).act(...)` plumbing when called from Java.
Now that the DSL generates runtime-verified nested and top-level action mixins, it can provide concise, statically resolved action invocation inside embedded action code.

## What Changes

- Add a BaseLanguage-extension expression that projects as `target.action(args)` and references an existing DSL `Action` directly.
- Resolve candidate actions from the exact DSL entity type of the target expression, covering both actions nested in that entity and root actions with that explicit target.
- Type-check the invocation arguments and result from the referenced action's parameters and optional return type.
- Generate the appropriate `FactoryService.mixin(...).act(...)` call for either nested or top-level generated action placement.
- Generate an injected `FactoryService` field when an action mixin contains a transparent action invocation.
- Add positive and negative sandbox fixtures covering resolution, typing, generated Java, and runtime compilation.
- Defer wrapped invocation, properties, collections, generic contributed-member abstractions, inheritance-aware resolution, and handwritten mixin discovery to named follow-up changes recorded in the design.

## Capabilities

### New Capabilities

- `dsl-action-invocation`: Transparent, type-safe invocation of DSL-defined action mixins from embedded action code.

### Modified Capabilities

- `causeway-generation`: Generated action mixins containing transparent invocations receive Causeway `FactoryService` plumbing and lower each invocation to the correct generated mixin class.

## Impact

- **Language structure and editor:** one new BaseLanguage-extension expression with target, action reference, and ordered arguments.
- **Scoping and typesystem:** exact entity-target action discovery, argument compatibility, and result inference.
- **Generator:** nested and top-level mixin-class selection plus `FactoryService.mixin(...).act(...)` lowering.
- **Generated dependencies:** uses the existing Causeway 3.6 application classpath and Jakarta injection support.
- **Verification:** extends sandbox generation, generated-Java compilation, and the existing runtime mixin gate.
- **Compatibility:** existing models and generated action shapes remain unchanged unless the new expression is used.
