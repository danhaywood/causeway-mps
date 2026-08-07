## Why

The DSL currently models persisted properties and action mixins but cannot express calculated scalar properties that Causeway exposes without adding persistent state.
Derived properties are the next concrete contributed-member shape needed before collections and a shared contributed-member abstraction can be designed from proven behavior.

## What Changes

- Add a derived-property declaration with a name, scalar result type, target entity, and embedded BaseLanguage getter body.
- Support both derived properties nested in an entity and root derived properties with an explicit entity target.
- Make the target entity and injected services available to getter code using the established action-body variable model.
- Type-check getter returns against the declared property type and reject missing targets, invalid placement, duplicate member identities, and incompatible return values.
- Generate Causeway `@Property` mixins whose no-argument `prop()` method contains the authored getter body, without adding JPA state or entity getters.
- Verify nested and explicit-target generated forms through Java 21 compilation and Causeway runtime mixin discovery.
- Keep persisted properties and existing action invocation behavior source-compatible.
- Defer derived-property invocation sugar, collection members, and a generic contributed-member abstraction.

## Capabilities

### New Capabilities

- `dsl-derived-properties`: Defines derived-property authoring, placement, target scoping, result typing, diagnostics, and lifecycle-body behavior.

### Modified Capabilities

- `causeway-generation`: Adds Causeway property-mixin generation and compilation/runtime verification for nested and explicit-target derived properties.

## Impact

- Affects the `causeway` language structure, editor, constraints, typesystem, and generator aspects.
- Adds representative positive and negative models to the sandbox or test solution.
- Extends generated-source and runtime verification for Causeway property mixins.
- Refreshes derived-property documentation and the project-local `causeway-dsl` skill.
- Adds no new external dependency and requires no migration for existing models.
