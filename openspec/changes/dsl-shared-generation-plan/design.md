## Context

The completed cross-model generated-reference work proved that the existing `entityToClass` mapping label becomes visible across source models when all models run a plan that transforms `causeway`, persists in-place checkpoint `after_causeway`, and then transforms smodel, closures, BaseLanguage-internal, and BaseLanguage.
The proof plan currently lives in `causeway.sandbox.generation@genplan` and is selected by the `causeway.sandbox` solution's Custom Generation facet.
That attachment is appropriate for a prototype but is not distributed when another solution imports the `causeway` language.

MPS supports production plan attachment through a DevKit: the DevKit exports languages, depends on the solution containing the genplan model, and identifies one generation plan used by every importing model.
MPS permits at most one genplan-bearing DevKit per model.
The repository currently has no project-owned DevKit, and available MCP tools do not expose every DevKit descriptor field directly, so implementation must prove the exact model-aware descriptor API before wiring production modules.
Raw `.devkit`, `.mps`, `.mpl`, or other serialized MPS XML must not be edited directly.

## Goals / Non-Goals

**Goals:**

- Own the proven Causeway plan in a dedicated non-sandbox module.
- Distribute the `causeway` language and shared plan through a production DevKit.
- Make an importing consumer model receive the plan without a solution-local Custom Generation facet.
- Migrate every sandbox model to the DevKit and retain the existing cross-model fixtures as acceptance tests.
- Preserve stable source `Entity` identity, checkpoint `after_causeway`, generated package ownership, Java 21 compilation, and Causeway 3.6 runtime behavior.
- Document the module topology, one-plan-per-model rule, consumer workflow, and clean-rebuild procedure.

**Non-Goals:**

- Publishing a packaged plugin or distribution outside this repository.
- Generalizing the plan for unrelated languages or arbitrary generators.
- Introducing multiple selectable Causeway plans or plan composition variants.
- Changing generated Java APIs, persisted properties, actions, derived properties, or invocation syntax.
- Adding collection members, contributed-member abstractions, or transparent property access.

## Decisions

### Put the plan in a dedicated solution

Create solution `causeway.generation` and recreate the proven plan as `CausewayGenerationPlan` in a `@genplan` model owned by that solution.
The plan SHALL retain the exact proven sequence: transform `causeway`; persist in-place checkpoint `after_causeway`; then transform smodel, closures, BaseLanguage-internal, and BaseLanguage while retaining generator priorities.

A dedicated solution avoids making production consumers depend on `causeway.sandbox` application models.
Keeping the plan in the sandbox and merely pointing a DevKit at it was rejected because it reverses the intended dependency direction and makes sandbox deletion a production breaking change.

### Distribute the language and plan through one project DevKit

Create DevKit `causeway.devkit`.
It SHALL export the `causeway` language, depend on `causeway.generation`, and select `CausewayGenerationPlan` as its generation plan.
Consumer models SHALL import this DevKit instead of relying on direct language import plus a solution facet.

The DevKit approach is preferred over copying the Custom Generation facet to every solution because it couples language availability and generation ordering in one reusable contract.
A second genplan-bearing DevKit on the same model remains unsupported and SHALL be documented and checked during migration.

### Configure the DevKit only through model-aware MPS APIs

The implementation SHALL first inspect the installed MPS API for DevKit exported-language and generation-plan fields and prove a reversible model-aware update through MPS MCP, MPS Console, or the IDE.
It SHALL not modify serialized descriptors as text.
After configuration, reload modules and inspect the DevKit through MPS repository APIs before migrating consumers.

This discovery step acknowledges the current MCP surface without weakening the production architecture.
If the installed API cannot persist the required fields programmatically, implementation SHALL pause for a single IDE-mediated configuration step rather than fall back to raw XML editing.

### Use the sandbox as the external-consumer acceptance fixture

After the DevKit is ready, add it to every sandbox model, remove redundant direct `causeway` language imports where the DevKit supplies them, and disable the sandbox Custom Generation facet.
The `customers` producer and `recommendations` consumer then prove that a solution outside the language and plan modules obtains the checkpoint solely through the shared DevKit.
The existing `recommendedCustomer` property and `crossModelProbe` action remain acceptance fixtures.

Adding another duplicate consumer solution was rejected because it would add maintenance cost without exercising a different attachment path.

### Switch attachment before deleting the prototype plan

Create and validate the dedicated plan and DevKit first.
Switch sandbox models to the DevKit and disable the Custom Generation facet in one migration step.
Delete the old sandbox genplan model only after a clean build proves that the shared plan is effective.

This ordering keeps rollback simple: re-enable the existing facet and old plan if the DevKit attachment does not generate valid checkpoints.

### Verify both effective configuration and generated behavior

Repository verification SHALL inspect the sandbox facet state and DevKit/model wiring, delete sandbox generated output, regenerate checkpoints, and assert that checkpoint files are recreated under the shared plan identity.
Existing generated-source checks, Java 21 compilation, Causeway runtime verification, focused MPS tests, and `headlessBuild` SHALL remain mandatory.
Successful Java generation alone is insufficient because stale checkpoints could conceal an attachment failure.

## Risks / Trade-offs

- [The installed MPS API does not expose writable DevKit generation-plan metadata through current MCP tools] → Resolve the exact model-aware API first and use MPS Console or one explicit IDE operation; never edit descriptor XML directly.
- [A consumer imports another DevKit carrying a generation plan] → Document the one-plan rule and add a validation or build diagnostic that identifies conflicting genplan-bearing DevKits.
- [Direct language imports mask an incomplete DevKit] → Remove redundant direct `causeway` imports from sandbox models before the clean acceptance build.
- [Both the Custom Generation facet and DevKit plan remain active during migration] → Treat attachment switching as one bounded step and verify the facet is disabled before generation.
- [Persisted checkpoints from the old plan produce a false pass] → Delete the complete sandbox `source_gen` tree before acceptance generation and assert shared-plan checkpoint names.
- [Moving the plan changes root/model references] → Bind the DevKit to the new plan reference through MPS APIs and avoid storing plan references in authored DSL models.

## Migration Plan

1. Discover and record the installed MPS DevKit descriptor API needed for exported languages and generation-plan selection.
2. Create `causeway.generation`, recreate `CausewayGenerationPlan`, and validate the plan root.
3. Create and configure `causeway.devkit`, reload modules, and verify its exported language, dependency, and generation-plan metadata.
4. Add `causeway.devkit` to all sandbox models and remove redundant direct `causeway` language imports.
5. Disable the sandbox Custom Generation facet and cleanly regenerate all sandbox output.
6. Run configuration assertions, generated-source verification, Java 21 compilation, Causeway runtime verification, focused MPS tests, and full `headlessBuild`.
7. Delete the obsolete sandbox plan only after all gates pass.

Rollback re-enables the sandbox Custom Generation facet, restores model imports, and retains the original sandbox plan until the migration has passed every gate.

## Open Questions

- Which installed MPS descriptor method or repository service persists a DevKit's exported languages and generation-plan model reference?
- Can the one-genplan-bearing-DevKit rule be checked directly in `checkModels`, or should Gradle verification inspect effective model imports and DevKit descriptors?
