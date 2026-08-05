## Why

The generator already emits nested and top-level action classes in Causeway's mixin form, but verification currently stops at Java compilation.
Before adding transparent action invocation, the project needs executable evidence that Causeway 3.6 recognizes both generated forms as mixins with the intended mixee and member identity.

## What Changes

- Preserve the current generation topology: actions nested in an entity generate static nested mixin classes, while root actions with an explicit target generate top-level `Mixee_member` classes.
- Verify generated nested and top-level action classes through Causeway's metamodel APIs rather than relying only on successful compilation.
- Assert mixin recognition, mixee type, main method, logical member id, and constructor-based instantiation.
- Reconcile the promoted generation requirement that currently says every action generates a separate top-level `Mixee_member` class.
- Remove derived properties, collections, and a generic contributed-member abstraction from this change; those require separate domain-model design.
- Keep transparent `target.member(...)` and `wrap(target).member(...)` invocation in the successor `dsl-behavior-extensions` change.

## Capabilities

### New Capabilities

- `dsl-action-mixin-runtime`: Runtime metamodel verification for generated nested and top-level Causeway action mixins.

### Modified Capabilities

- `causeway-generation`: Align the action-generation contract with the implemented nested-versus-top-level topology and require runtime mixin recognition.

## Impact

- **Verification build:** Adds a Causeway metamodel verification step after generated Java compilation.
- **Test dependencies:** Uses Causeway 3.6 core metamodel test support without adding a production runtime dependency.
- **Generated output:** No intended topology change; existing nested and top-level action classes remain the contract.
- **Promoted specification:** Corrects the obsolete requirement that every action must generate as a separate top-level class.
- **Successor work:** Gives `dsl-behavior-extensions` a verified action-mixin target without requiring derived properties or collections.
