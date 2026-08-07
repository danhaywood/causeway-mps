## 1. Structure and editor

- [ ] 1.1 Confirm the pinned Causeway 3.6 `@Collection`, `coll()`, constructor, return-container, and runtime-facet contracts from installed APIs and record any implementation-specific finding in `design.md`.
- [ ] 1.2 Add rootable named concept `causeway.structure.Collection` with optional `target`, mandatory `elementType`, mandatory BaseLanguage body, and injected-service children using model-aware MPS operations.
- [ ] 1.3 Add an `Entity.collections` containment role for nested collection declarations while preserving existing entity member roles.
- [ ] 1.4 Clean-rebuild the `causeway` language module, reload modules, and verify the live `Collection` descriptor exposes the intended non-hollow features.
- [ ] 1.5 Scaffold and refine the `Collection` editor for nested and root placement, including name, target where applicable, element type, injected services, and body.
- [ ] 1.6 Add placement constraints so nested collections omit `target`, root collections require `target`, and unrelated placements are rejected.

## 2. Typing, scope, and identity

- [ ] 2.1 Add behavior helpers that resolve a collection's exact target entity for nested and explicit-target declarations.
- [ ] 2.2 Build the method-like expected return type `java.util.List<ElementType>` from the existing DSL type conversion infrastructure and verify it for entity and Java classifier elements.
- [ ] 2.3 Reject missing, void, and primitive collection element types with focused diagnostics and valid message targets.
- [ ] 2.4 Extend variable-reference scope so collection bodies resolve the target mixee and declared injected services but expose no action parameters.
- [ ] 2.5 Add return-type checking so scalar returns and lists with incompatible element types fail while `List<ElementType>` returns pass.
- [ ] 2.6 Add exact-target collection identity checks across nested and root declarations while keeping property and action namespaces separate.
- [ ] 2.7 Add focused MPS negative fixtures for missing target, invalid placement, missing or primitive element type, incompatible returns, out-of-scope references, and duplicate identity.

## 3. Generator and fixtures

- [ ] 3.1 Add collection generator queries and mapping rules that select nested and explicit-target declarations without changing existing entity, property, derived-property, or action mappings.
- [ ] 3.2 Generate nested collections as public static `@Collection` mixin classes with final mixee state, a public constructor, injected services, and `List<ElementType> coll()`.
- [ ] 3.3 Generate explicit-target collections as top-level `Entity_collection` classes in the declaring model's package with the same mixin contract.
- [ ] 3.4 Copy authored collection bodies and lower mixee and injected-service references to the correct generated Java expressions.
- [ ] 3.5 Resolve target and entity element classifiers exclusively through the checkpointed `entityToClass` mapping and preserve required generated-model imports.
- [ ] 3.6 Add a nested sandbox collection fixture whose body uses its mixee and an injected service and returns an entity list.
- [ ] 3.7 Add a same-model explicit-target fixture with a non-primitive Java element type.
- [ ] 3.8 Add a cross-model fixture declared in `recommendations` that targets `customers.Customer`, returns `List<customers.Product>`, and remains in package `recommendations`.

## 4. Verification

- [ ] 4.1 Validate every changed root and affected model with MPS problem checking after structure, typing, constraint, editor, generator, and fixture changes.
- [ ] 4.2 Extend Gradle generated-source assertions for collection annotations, class placement, generic signatures, constructor and fields, copied bodies, package ownership, external imports, and absence of persistence or unresolved-reference markers.
- [ ] 4.3 Extend the Java 21 generated-source compilation inputs to cover all nested, same-model, and cross-model collection classes.
- [ ] 4.4 Extend the Causeway 3.6 runtime verifier to discover collection facets on the exact target and invoke `coll()` to confirm the authored result.
- [ ] 4.5 Run the focused collection and existing derived-property negative MPS tests and confirm every expected diagnostic remains stable.
- [ ] 4.6 Delete the complete sandbox `source_gen` tree, regenerate through `causeway.devkit`, and verify shared-plan checkpoints and cross-model collection classifiers are recreated cleanly.
- [ ] 4.7 Run the full pinned-toolchain `headlessBuild` and confirm existing persisted properties, derived properties, actions, raw and wrapped invocation, Java compilation, and Causeway runtime verification remain compatible.

## 5. Documentation and DSL memory

- [ ] 5.1 Document collection syntax, fixed `List` semantics, generated Causeway shape, placement, typing, cross-model behavior, clean rebuild workflow, and deferred capabilities.
- [ ] 5.2 Add reusable collection JSON blueprints and refresh the Causeway DSL skill's concepts, sandbox references, workflows, and gotchas.
- [ ] 5.3 Strictly validate all OpenSpec artifacts and confirm every changed documentation and skill file follows one-sentence-per-line formatting.
