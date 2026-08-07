## Why

Causeway DSL declarations can reference entities in imported models, but generator mapping labels such as `entityToClass` are model-local.
Explicit-target contributions declared outside their target entity's model therefore fail when generated references to the target classifier cannot cross the model-generation boundary.

This limitation affects derived properties today and may also affect explicit-target actions and other generated entity references, so it should be solved as shared generator infrastructure rather than patched into one template.

## What Changes

- Define explicit generation ordering and checkpoint semantics for generated entity classifiers that must be referenced across model boundaries.
- Establish a reusable cross-model generated-reference strategy instead of assuming that `genContext.get output ... for (...)` can read another model's mapping labels.
- Extend explicit-target derived properties so a declaration in one model can target an entity owned by another imported model.
- Audit explicit-target actions and other generated entity references against the same cross-model boundary and apply the shared strategy where required.
- Preserve rename-safe source references while emitting stable, correctly qualified generated Java classifier references.
- Add cross-model fixtures, generated-source assertions, Java 21 compilation, and Causeway runtime mixin-discovery verification.

## Capabilities

### New Capabilities

- `dsl-cross-model-generated-references`: Defines generation ordering, checkpoint availability, and generated classifier resolution across MPS model boundaries.

### Modified Capabilities

- `causeway-generation`: Allows explicit-target contributions declared in one model to target generated entity classes owned by another model.
- `dsl-derived-properties`: Allows a root derived property to use an explicit target from an imported model while retaining exact-target typing and identity semantics.

## Impact

- Affects the `causeway.generator` generation plan, mapping configurations, query helpers, and templates that create classifier references.
- Affects sandbox model organization by adding a second model containing cross-model contributions.
- May affect explicit-target action generation if the audit confirms the same mapping-label limitation.
- Extends generated-source and Causeway runtime verification without changing persisted-property, nested-contribution, or same-model contribution behavior.
