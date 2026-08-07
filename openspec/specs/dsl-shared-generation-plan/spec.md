# dsl-shared-generation-plan Specification

## Purpose

Define production ownership, DevKit distribution, consumer configuration, and clean verification for the shared Causeway generation plan.

## Requirements

### Requirement: The Causeway generation plan has production ownership

The project SHALL own the checkpointed Causeway generation plan in a dedicated non-sandbox module.
The plan SHALL transform `causeway`, persist in-place checkpoint `after_causeway`, and then transform smodel, closures, BaseLanguage-internal, and BaseLanguage with applicable generator priorities retained.
The production plan SHALL NOT depend on sandbox application models.

#### Scenario: Shared plan is inspected

- **WHEN** the project-owned generation plan is resolved through the MPS repository
- **THEN** it has the proven transform and checkpoint sequence and belongs to a dedicated generation-plan solution

#### Scenario: Sandbox models are removed from plan dependencies

- **WHEN** the plan module's dependencies are inspected
- **THEN** no dependency requires `causeway.sandbox` or one of its application models

### Requirement: A production DevKit distributes the language and generation plan

The project SHALL provide one DevKit that exports the `causeway` language, depends on the solution containing the shared plan, and selects that plan as its generation plan.
A consumer model importing the DevKit SHALL obtain both Causeway language concepts and the effective checkpoint plan without configuring a solution-local Custom Generation facet.

#### Scenario: Consumer imports the Causeway DevKit

- **WHEN** a model imports the production Causeway DevKit
- **THEN** Causeway concepts resolve and generation uses the shared checkpoint plan

#### Scenario: Consumer solution has no custom plan facet

- **WHEN** the consumer solution's facets are inspected
- **THEN** no Custom Generation facet is required to select the Causeway plan

### Requirement: Consumers use one unambiguous plan contract

A model participating in Causeway generation SHALL use exactly one genplan-bearing DevKit.
The project SHALL document or diagnose a conflicting second genplan-bearing DevKit rather than relying on unspecified plan selection.
Direct `causeway` language imports SHALL NOT be required when the production DevKit already provides that language.

#### Scenario: Consumer has one generation-plan provider

- **WHEN** the used DevKits of a migrated sandbox model are inspected
- **THEN** exactly one of them provides a generation plan and it is the production Causeway DevKit

#### Scenario: Conflicting plan provider is introduced

- **WHEN** a model uses the Causeway DevKit together with another genplan-bearing DevKit
- **THEN** validation or documented MPS diagnostics identify the unsupported configuration

### Requirement: Shared-plan migration passes clean verification

The migrated sandbox SHALL generate its same-model and cross-model outputs solely through the production DevKit attachment.
A clean rebuild SHALL recreate shared-plan checkpoint state and SHALL pass model checking, generated-source verification, Java 21 compilation, Causeway 3.6 runtime verification, and focused MPS tests.
Persisted checkpoint files from the prototype sandbox plan SHALL NOT be required.

#### Scenario: Clean consumer generation uses the shared plan

- **WHEN** the sandbox generated output and persisted checkpoints are removed before generation
- **THEN** generation recreates checkpoints under the shared plan and resolves the cross-model property and action classifiers

#### Scenario: Existing generated behavior remains compatible

- **WHEN** the migrated sandbox completes `headlessBuild`
- **THEN** nested and explicit-target contributions, persisted properties, action invocation, and Causeway runtime behavior remain unchanged
