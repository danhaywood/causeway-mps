# Draft Future Change: Cross-Model Generated References

Status: discovery captured for future proposal; not an active OpenSpec change.
Promote this draft with `openspec new change dsl-cross-model-generated-references` only after the current active change is archived.

## Why

Causeway DSL declarations can reference entities in imported models, but generator mapping labels such as `entityToClass` are model-local.
A derived property declared in `recommendations` and targeting `customers.Customer` therefore cannot currently resolve the generated `customers.Customer` classifier while generating the `recommendations` output model.
The failed experiment produced `Target node is null for reference to classifier ... map_Entity` text-generation errors for the mixee field, constructor parameter, and entity-typed return.

Cross-model contributions are useful beyond derived properties and should be solved as generator infrastructure rather than patched into one template.

## Proposed Change

- Define a generation plan that orders relevant model generation and introduces checkpoints where generated classifiers must be visible across model boundaries.
- Establish a reusable cross-model reference strategy for generated entity classifiers instead of assuming that `genContext.get output ... for (...)` can read a mapping label from another model.
- Apply the strategy to explicit-target derived properties and audit explicit-target actions and other generated entity references for the same limitation.
- Preserve rename-safe source references and emit correctly qualified generated Java types in the declaring model's package.
- Add cross-model fixtures, generated-source assertions, Java 21 compilation, and runtime mixin-discovery verification.

## Candidate Capabilities

### New Capabilities

- `dsl-cross-model-generated-references`: Defines generation ordering and generated-reference resolution across MPS model boundaries.

### Modified Capabilities

- `causeway-generation`: Allows explicit-target contributions declared in one model to target generated entity classes owned by another model.

## Open Questions

- Should the solution use generation-plan checkpoints, symbolic `SNodeReference` values, dynamic name-based references, or a combination?
- What generated-model import and package rules are required for Java TextGen to emit stable qualified classifier names?
- Should cross-model reference infrastructure cover only entity classifiers initially, or all generated member and type references?
- Can existing explicit-target action generation reproduce the same failure and therefore serve as a second acceptance fixture?

## Out of Scope for the Current Derived-Properties Change

The active `dsl-derived-properties` change supports nested declarations and same-model explicit-target roots only.
It does not introduce generation-plan architecture or claim cross-model generated classifier support.
