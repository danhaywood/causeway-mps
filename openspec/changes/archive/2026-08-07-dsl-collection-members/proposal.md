## Why

The Causeway DSL can author persisted scalar state, calculated scalar properties, and actions, but it cannot declare read-only contributed collections.
Adding a focused collection-member slice now completes the concrete contributed-member shapes needed before designing a common abstraction or transparent collection access.

## What Changes

- Add a `Collection` declaration for a read-only, list-valued contributed member with a required element type, authored BaseLanguage body, and optional injected services.
- Support both nested placement on an entity and top-level explicit targeting of same-model or imported entities.
- Type collection bodies as `List<ElementType>`, reject missing, void, or primitive element types, and expose the mixee and injected services inside the body.
- Generate Causeway 3.6 `@Collection` mixins with final mixee state, a public one-argument constructor, a public no-argument `coll()` method, and no JPA or entity-state mutation.
- Reuse the production `causeway.devkit` generation plan for cross-model target and element-classifier references.
- Add editor support, placement and identity constraints, checking rules, sandbox fixtures, generated-source checks, Java 21 compilation, Causeway runtime discovery, negative tests, documentation, and DSL-skill guidance.
- Keep supporting methods, multiple collection container kinds, transparent collection access, caching, ordering, mutation, generic contributed-member abstraction, type-hierarchy resolution, and handwritten mixin interop out of this first slice.

## Capabilities

### New Capabilities

- `dsl-collection-members`: Defines collection-member authoring, placement, typing, identity, diagnostics, and compatibility behavior.

### Modified Capabilities

- `dsl-domain-model`: Adds collections as entity members and explicit-target contribution roots.
- `causeway-generation`: Adds nested, same-model, and cross-model Causeway collection-mixin generation and verification.

## Impact

The change affects the `causeway` language structure, editor, constraints, behavior or type helpers, typesystem, generator templates, sandbox and test models, generated-source and runtime verification, documentation, and the project-local Causeway DSL skill.
It uses the existing Causeway 3.6 and Java 21 verification dependencies and the shared production generation plan without adding a new runtime dependency.
