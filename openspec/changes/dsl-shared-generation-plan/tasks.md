## 1. Prove DevKit configuration

- [ ] 1.1 Inspect the installed MPS APIs and existing SDK examples for the model-aware operations that persist DevKit exported languages, module dependencies, and generation-plan references, and record the exact API and reference forms in the design.
- [ ] 1.2 Use MPS MCP, MPS Console, or an IDE model-aware operation to create a reversible DevKit proof that exports `causeway` and references a genplan model without editing serialized descriptors as text.
- [ ] 1.3 Reload modules and inspect the proof through the MPS repository to confirm that a consumer model receives the language and effective plan and that a second genplan-bearing DevKit is diagnosed as unsupported.
- [ ] 1.4 Remove any temporary proof modules or fixtures before creating the production topology.

## 2. Create the shared plan and DevKit

- [ ] 2.1 Create dedicated solution `causeway.generation` with only the dependencies needed to own the production generation plan.
- [ ] 2.2 Create and validate `CausewayGenerationPlan` in a `@genplan` model with the proven `causeway` transform, in-place `after_causeway` checkpoint, and downstream smodel, closures, BaseLanguage-internal, and BaseLanguage transforms.
- [ ] 2.3 Create production DevKit `causeway.devkit`, add its dependency on `causeway.generation`, export the `causeway` language, and select `CausewayGenerationPlan` through the proven model-aware API.
- [ ] 2.4 Reload all modules and inspect the DevKit to verify its exported language, plan dependency, generation-plan reference, and absence of sandbox dependencies.
- [ ] 2.5 Validate the shared plan root and make or rebuild every new or changed module needed to materialize runtime descriptors.

## 3. Migrate sandbox consumers

- [ ] 3.1 Add `causeway.devkit` to every sandbox model and remove redundant direct `causeway` language imports so the DevKit is the sole provider of the DSL and checkpoint plan.
- [ ] 3.2 Disable the `causeway.sandbox` Custom Generation facet and verify that no solution-local plan attachment remains.
- [ ] 3.3 Delete the complete sandbox `source_gen` tree and regenerate it to prove that shared-plan checkpoints are recreated for `customers` and `recommendations` without prototype checkpoint state.
- [ ] 3.4 Verify that `recommendedCustomer`, `crossModelProbe`, nested contributions, and same-model explicit-target contributions resolve through the shared checkpoint.
- [ ] 3.5 Delete the obsolete `causeway.sandbox.generation@genplan` model only after the shared-plan clean rebuild passes, then remove any stale model or module dependencies.

## 4. Add configuration and regression verification

- [ ] 4.1 Extend Gradle or model-aware verification to assert that sandbox models import `causeway.devkit`, exactly one imported DevKit carries a generation plan, and the sandbox solution has no Custom Generation facet.
- [ ] 4.2 Assert that clean generation recreates checkpoint files under the shared plan identity and emits no prototype-plan checkpoint dependency or unresolved classifier marker.
- [ ] 4.3 Run generated-source verification for cross-model and same-model action/property mixins and confirm that generated Java remains structurally unchanged apart from checkpoint provenance.
- [ ] 4.4 Compile generated Java with pinned Java 21 and run Causeway 3.6 runtime verification for existing action, property, raw invocation, and wrapped invocation behavior.
- [ ] 4.5 Run focused MPS model checks and the derived-property negative-test configuration after the DevKit migration.
- [ ] 4.6 Run a clean full `headlessBuild` with the pinned Java 21 and Java 25 toolchains and confirm that every existing regression gate passes.

## 5. Document and validate the production contract

- [ ] 5.1 Update generation-plan and derived-property documentation with the production module topology, DevKit import workflow, one-genplan-bearing-DevKit rule, clean-rebuild procedure, and rollback guidance.
- [ ] 5.2 Refresh the project-local Causeway DSL skill references and sandbox metadata so future agents use `causeway.devkit` rather than restoring the Custom Generation facet.
- [ ] 5.3 Validate every changed MPS root and model, strictly validate the OpenSpec change, and reconcile this checklist with the completed implementation.
