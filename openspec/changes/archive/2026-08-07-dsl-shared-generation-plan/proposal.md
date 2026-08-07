## Why

Cross-model Causeway classifier references currently work only because `causeway.sandbox` selects `CausewaySandboxPlan` through a solution-local Custom Generation facet.
That prototype attachment does not travel with the language, so another consumer solution can import `causeway` successfully yet miss the checkpoint contract required for deterministic cross-model generation.

## What Changes

- Move the proven Causeway generation plan out of the sandbox and into a dedicated project module that can be depended on without depending on sandbox application models.
- Add a production DevKit that provides the `causeway` language and selects the shared generation plan for every model that imports it.
- Switch sandbox models from the Custom Generation facet to the shared DevKit and prove that the existing cross-model property and action fixtures still generate from a clean checkout.
- Add validation that participating models use exactly one genplan-bearing DevKit and that no sandbox-specific plan attachment is required.
- Preserve the proven `causeway` transform, `after_causeway` checkpoint, downstream smodel/closures/BaseLanguage transforms, source-entity identity, generated package ownership, and all existing runtime semantics.

## Capabilities

### New Capabilities

- `dsl-shared-generation-plan`: Distribution, attachment, ownership, and verification of the Causeway checkpoint plan through a production DevKit.

### Modified Capabilities

- `dsl-cross-model-generated-references`: Require cross-model consumers to obtain the shared checkpoint contract through the distributed DevKit rather than a sandbox-local Custom Generation facet.

## Impact

This affects MPS module topology, the generation-plan model, DevKit configuration, sandbox model imports, generation attachment, project-local DSL guidance, and headless build assertions.
Generated Java APIs, Causeway 3.6 action/property semantics, persisted state, and authored source references remain unchanged.
