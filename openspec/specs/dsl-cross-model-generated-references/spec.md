# dsl-cross-model-generated-references Specification

## Purpose

Define the generation-plan, checkpoint, identity, and dependency contract for references from contributions in one MPS model to classifiers generated from entities in another model.

## Requirements

### Requirement: Generated classifier mappings cross model boundaries through an explicit checkpoint

The generation pipeline SHALL make the generated classifier mapped from a source `Entity` available to contribution generation in another model through an explicit, shared checkpoint contract.
The lookup SHALL use the source entity's stable node identity and SHALL NOT depend on an authored Java classifier-name string.

#### Scenario: Contribution resolves an entity generated from another model

- **WHEN** a contribution declared in model `recommendations` targets an entity declared in model `customers`
- **THEN** generation resolves the checkpointed classifier mapped from the `customers` entity while generating the `recommendations` output model

#### Scenario: Target entity is renamed

- **WHEN** a target entity is renamed while the source reference remains valid
- **THEN** cross-model generation resolves the renamed generated classifier without requiring a duplicated classifier-name update on the contribution

### Requirement: Participating models share deterministic generation ordering

Every model that produces or consumes checkpointed entity-classifier mappings SHALL run under an effective generation plan that checkpoints producer mappings before consumer references are resolved.
A project consumer SHALL obtain that plan by importing the production Causeway DevKit rather than by recreating a solution-local Custom Generation facet.
A clean rebuild SHALL recreate the checkpoint state without relying on stale transient or generated models.

#### Scenario: Clean generation starts without checkpoint state

- **WHEN** generated output and persisted checkpoint state are removed before generation
- **THEN** the generation plan recreates the entity-classifier checkpoint and resolves all cross-model contribution references

#### Scenario: Models are generated in a different discovery order

- **WHEN** MPS discovers the consumer model before the producer model
- **THEN** the explicit plan ordering still makes the producer's classifier mapping available before the consumer reference is resolved

#### Scenario: New consumer imports the production DevKit

- **WHEN** a solution outside the language and plan modules adds a model that imports the production Causeway DevKit
- **THEN** the model receives the shared checkpoint plan without configuring a Custom Generation facet

### Requirement: Cross-model classifier references carry valid generated-model dependencies

A resolved cross-model classifier reference SHALL add or retain the generated-model dependency and import information required for BaseLanguage generation and Java TextGen.
The generated Java SHALL contain a valid imported or qualified classifier reference and SHALL contain no unresolved-reference marker.

#### Scenario: Mixee type belongs to another generated package

- **WHEN** a top-level contribution generated in package `recommendations` targets generated classifier `customers.Customer`
- **THEN** its mixee field and constructor parameter compile against `customers.Customer`

#### Scenario: Result type belongs to another generated package

- **WHEN** a cross-model contribution returns an entity type owned by a third imported model
- **THEN** its generated method signature resolves and compiles against that entity's generated classifier

### Requirement: Same-model generation remains compatible

Introducing the shared checkpoint contract SHALL NOT change generated source or runtime behavior for nested contributions, same-model explicit-target contributions, persisted properties, or models without cross-model references.

#### Scenario: Existing sandbox models are regenerated

- **WHEN** the existing sandbox models are cleanly regenerated under the new effective plan
- **THEN** their generated source structure, Java compilation, and Causeway runtime verification continue to pass
