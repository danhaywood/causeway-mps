## 1. Prove the Checkpoint Architecture

- [ ] 1.1 Recreate the two-model explicit-target fixture in a controlled branch or temporary model, record the current null-classifier failure, and restore the stable model state before implementing the fix.
- [ ] 1.2 Inspect the effective generator steps, mapping labels, generated-model dependencies, and plan attachment options for the participating models.
- [ ] 1.3 Build a minimal checkpoint proof that maps a source `Entity` to its generated classifier and resolves that mapping from another model after a clean rebuild.
- [ ] 1.4 Record the proven checkpoint, synchronization, mapping-label, and plan-attachment shape in the design or project DSL guidance before restructuring production mappings.

## 2. Add Shared Cross-Model Generation Infrastructure

- [ ] 2.1 Create the project-owned generation plan or plan contribution selected by the proof and add the required classifier checkpoint between producer and consumer phases.
- [ ] 2.2 Attach the plan consistently to every participating project model through the selected DevKit or generation-facet mechanism.
- [ ] 2.3 Expose a stable source-entity-to-generated-classifier mapping that survives the checkpoint without introducing authored classifier-name strings.
- [ ] 2.4 Add a shared generator query or resolver that selects same-model output when available and checkpointed cross-model output otherwise.
- [ ] 2.5 Ensure resolved external classifiers add or preserve the generated-model dependencies and imports required by BaseLanguage and Java TextGen.

## 3. Generate Cross-Model Contributions

- [ ] 3.1 Remove the same-model restriction from root `DerivedProperty` targets while preserving exact-target scope, typing, placement, and duplicate-identity checks.
- [ ] 3.2 Update explicit-target derived-property templates to use the shared classifier resolver for mixee fields, constructors, entity result types, and entity-typed injected services.
- [ ] 3.3 Preserve top-level mixin ownership in the declaring contribution model while referencing the target entity's generated package.
- [ ] 3.4 Audit a cross-model explicit-target `Action` and its entity-typed members against the same mapping-label boundary.
- [ ] 3.5 Apply the shared resolver to explicit-target actions if the audit reproduces the failure, preserving existing action generation and invocation semantics.

## 4. Add Fixtures and Regression Coverage

- [ ] 4.1 Add an editable sandbox model that imports the entity-owning model and declares a valid cross-model explicit-target derived property.
- [ ] 4.2 Include mixee, result, and service entity types owned by external models so each generated classifier-reference path is exercised.
- [ ] 4.3 Add model checks or `@tests` fixtures proving cross-model targets retain the same typing, scope, placement, and identity behavior as same-model targets.
- [ ] 4.4 Extend generated-source verification for declaring-package placement, external classifier signatures, valid imports or qualification, and absence of unresolved-reference markers.
- [ ] 4.5 Extend Java 21 compilation and Causeway 3.6 runtime verification to discover and execute the cross-model property mixin.
- [ ] 4.6 Add action generated-source and runtime assertions if task 3.4 confirms that actions require the shared resolver.
- [ ] 4.7 Confirm nested contributions, same-model explicit targets, persisted properties, raw and wrapped action invocation, and models without cross-model references remain unchanged.

## 5. Document and Validate

- [ ] 5.1 Document the generation-plan/checkpoint contract, clean-rebuild requirements, output-package ownership, and supported cross-model declaration shapes.
- [ ] 5.2 Refresh the project-local `causeway-dsl` skill with the cross-model fixture references, workflows, blueprints, and discovered MPS gotchas.
- [ ] 5.3 Validate every changed MPS root and model with focused problem checks, including a clean checkpoint rebuild from no generated state.
- [ ] 5.4 Run `checkModels`, `generateModels`, generated-source verification, Java 21 compilation, runtime mixin verification, and `headlessBuild` under the pinned JDK toolchains.
- [ ] 5.5 Run strict OpenSpec validation and reconcile every completed task with its verification evidence.
