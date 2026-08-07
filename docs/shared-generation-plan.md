# Shared Causeway generation plan

## Purpose

Cross-model Causeway contributions resolve generated entity classifiers through the checkpointed `entityToClass` mapping label.
The production attachment is distributed with the DSL so consumer solutions do not recreate a Custom Generation facet.

## Module topology

Solution `causeway.generation` owns model `causeway.generation@genplan` and root `CausewayGenerationPlan`.
The plan transforms `causeway`, persists in-place checkpoint `after_causeway`, and then transforms `jetbrains.mps.lang.smodel`, `jetbrains.mps.baseLanguage.closures`, `jetbrains.mps.baseLanguageInternal`, and `jetbrains.mps.baseLanguage` with generator priorities retained.
DevKit `causeway.devkit` exports the `causeway` language, depends on `causeway.generation`, and associates that generation-plan model.
Neither the plan solution nor the DevKit depends on `causeway.sandbox`.

Persistent references are:

- DevKit: `7c9b6f21-fd96-42ab-b49b-a290b97fc134(causeway.devkit)`.
- Plan solution: `1e2065a9-a62c-415c-8f37-47beb6daa6b3(causeway.generation)`.
- Plan model: `r:0967b094-f6e6-428d-a9e9-3c051bdc791d(causeway.generation@genplan)`.
- Plan root: `r:0967b094-f6e6-428d-a9e9-3c051bdc791d(causeway.generation@genplan)/4835663559142235207`.

## Consumer workflow

Add `causeway.devkit` as a used DevKit on every model that authors Causeway DSL nodes.
Do not add a redundant direct `causeway` used-language import when the DevKit already supplies it.
Do not attach the plan through the consumer solution's Custom Generation facet.
A model may use only one DevKit that independently supplies a generation plan.
MPS model checking reports an error such as `2 devkits supply independent generation plans` when that rule is violated.

The `causeway.sandbox`, `customers`, and `recommendations` models are the acceptance consumers.
The sandbox solution has only its Java facet; the production DevKit supplies both the language and generation plan.

## Clean rebuild

Delete the complete `languages/causeway.sandbox/source_gen` directory when proving plan attachment or recovering from stale checkpoints.
Run `./gradlew generateModels` or the full `./gradlew headlessBuild` with the pinned toolchains.
Generation must recreate `causewaygenerationplan-after_causeway.mps` under both the `customers` and `recommendations` generated directories.
No `causewaysandboxplan-after_causeway.mps` file or `causeway.sandbox.generation@genplan` model should remain.
Never inspect or edit checkpoint `.mps` files as source models.

`verifySharedGenerationPlanConfiguration` checks production plan and DevKit ownership, required shared checkpoint files, and absence of prototype-plan artifacts.
Generated-source verification additionally rejects unresolved mapping markers before Java 21 compilation and Causeway runtime verification.

## Rollback

If DevKit attachment fails during a future migration, restore the last known-good DevKit and plan references through model-aware MPS APIs and regenerate from an empty `source_gen` directory.
Do not repair DevKit, module, model, or checkpoint serialization as raw XML.
The obsolete sandbox Custom Generation facet and `CausewaySandboxPlan` have been removed and must not be restored as the normal consumer configuration.
