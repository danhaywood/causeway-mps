## Context

The `causeway` generator maps each source `Entity` to a generated BaseLanguage classifier under the `entityToClass` mapping label.
Same-model templates can resolve that output through `genContext`, but a contribution generated from another model cannot see the target model's transient mapping label.
The derived-properties experiment reproduced this boundary with null classifier targets and TextGen failures for the mixee field, constructor parameter, and entity-typed return.

MPS generation checkpoints are the supported mechanism for persisting transient mappings between phases and making them available to other models that share a generation plan.
The current generator has no explicit project-level generation plan or checkpoint contract, so introducing one is architectural work rather than a local template adjustment.

The implementation must preserve source-level references to `Entity` nodes, generated Java package ownership, existing same-model output, and the current Java 21 and Causeway 3.6 verification gates.

## Goals / Non-Goals

**Goals:**

- Prove and document a repeatable checkpoint-based lookup from a contribution model to a generated entity classifier owned by another model.
- Introduce the minimum generation-plan and mapping organization needed to make that lookup deterministic.
- Support root derived properties whose explicit target belongs to an imported model.
- Reuse the mechanism for explicit-target actions if the audit confirms that they cross the same boundary.
- Preserve rename-safe source references and stable generated Java classifier identities.
- Verify generated source, Java compilation, and Causeway runtime discovery across model boundaries.

**Non-Goals:**

- Supporting arbitrary cross-language or cross-generator references unrelated to generated Causeway entity classifiers.
- Replacing source `Entity` references with authored package or classifier-name strings.
- Changing nested or same-model contribution syntax and semantics.
- Introducing collection-derived members, supporting-method families, or a generic contributed-member abstraction.
- Redesigning persisted-property or action invocation behavior.

## Decisions

### Begin with an executable checkpoint proof before restructuring production mappings

The first implementation step SHALL create a minimal two-model fixture and inspect the effective generation plan, transient outputs, and checkpoint mappings.
The proof must demonstrate a persistent mapping from a source `Entity` node to its generated classifier and a successful lookup from another source model.
Production mapping reorganization will follow only after this proof identifies the exact checkpoint and synchronization shape required by the installed MPS version.

This avoids committing the generator to an assumed plan structure that may not match MPS's per-model execution semantics.
A purely name-based workaround was rejected because it loses rename safety and can conceal missing model dependencies until TextGen.

### Use source identity plus checkpointed mapping output as the authoritative reference

Cross-model templates SHALL continue to reference the source `Entity` node and resolve its generated classifier through a checkpointed mapping label.
The generated classifier's name SHALL remain an output concern derived by the entity mapping rather than a second authored identity.

The implementation may introduce a dedicated mapping label or query helper if `entityToClass` cannot be exposed safely, but it SHALL not encode the entity's qualified Java name as the primary source-model reference.

### Make generation ordering explicit and project-owned

The change SHALL add an explicit generation plan, or an equivalent plan contribution attached through the project's generation configuration, that guarantees classifier mappings are checkpointed before cross-model contribution references are resolved.
All participating sandbox models SHALL use the same effective plan and checkpoint contract.

The exact attachment mechanism will be selected by the proof: a project DevKit is preferred for reusable production behavior, while a custom generation facet is acceptable only for an initial fixture or if this repository intentionally scopes the plan to selected models.

### Keep output ownership with the declaring contribution model

A cross-model derived property declared in `recommendations` and targeting `customers.Customer` SHALL generate its top-level mixin in the `recommendations` output package.
Its mixee field and constructor parameter SHALL reference the generated `customers.Customer` classifier.
An entity-typed result SHALL resolve according to the referenced entity's owning generated package, independently of the contribution's package.

This preserves the established rule that root contributions are generated with their declaring model while the explicit target controls mixee identity.

### Audit actions without broadening the contract speculatively

A cross-model explicit-target action fixture SHALL be used to determine whether action mixee and parameter/return references fail through the same path.
If they do, the shared checkpointed resolver SHALL cover actions in this change and the generated-source/runtime gates SHALL include them.
If they do not, action generation will remain unchanged and the audit result will be documented.

### Treat generation and runtime verification as separate boundaries

Generated-source checks SHALL assert package placement, imports or qualified classifier references, constructor signatures, method signatures, and absence of unresolved-reference markers.
Java 21 compilation SHALL prove that generated model dependencies and classifier references are valid.
Causeway runtime checks SHALL prove that the cross-model derived property is discovered as a property mixin for the target entity and that `prop()` executes correctly.

## Risks / Trade-offs

- [The effective MPS plan executes per model in a way that prevents the proposed checkpoint ordering] → Prove the minimal two-model path first and retain a fallback design using a dedicated classifier-index phase or plan synchronization rather than adopting dynamic name references.
- [Splitting or reordering mappings changes existing generated output] → Compare representative models with and without cross-model contributions and keep existing source/runtime verification mandatory.
- [Checkpoint models become stale during iterative development] → Validate with clean rebuilds and document when generated checkpoints must be removed or rebuilt.
- [The plan is attached inconsistently across consumer models] → Centralize plan attachment through one project-owned mechanism and add a model-check or build assertion where feasible.
- [Generated model dependencies are missing even after reference resolution] → Make dependency/import repair part of the resolver and verify with Java 21 compilation rather than relying on successful MPS generation alone.
- [Action support expands the implementation unexpectedly] → Gate action changes on the focused audit and keep derived-property support as the required acceptance path.

## Open Questions

- Which exact plan attachment mechanism gives every project model the same checkpoint contract without requiring repetitive model configuration?
- Does the existing `entityToClass` label survive the required checkpoint, or should a dedicated exported classifier label be introduced?
- Can explicit-target actions reproduce the cross-model failure, and if so, which action type references require the shared resolver?
