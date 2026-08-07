## MODIFIED Requirements

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
