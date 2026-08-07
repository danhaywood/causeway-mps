## ADDED Requirements

### Requirement: Collection generates a Causeway collection mixin

A DSL collection SHALL generate a Causeway 3.6 mixin annotated with `@Collection`.
The generated class SHALL contain a final mixee field, a public one-argument constructor, optional Jakarta-injected service fields, and a public no-argument `coll()` method returning `List<ElementType>`.

#### Scenario: Nested collection generates a static nested mixin

- **WHEN** entity `Customer` contains collection `recentOrders` of `Order`
- **THEN** generated `Customer` contains public static class `recentOrders` whose `coll()` method returns `List<Order>`

#### Scenario: Explicit-target collection generates a top-level mixin

- **WHEN** root collection `recommendedProducts` targets `Customer`
- **THEN** generation emits top-level `Customer_recommendedProducts` in the collection's declaring package

### Requirement: Collection generation preserves authored behavior without entity state

The generated `coll()` method SHALL contain the authored collection body and SHALL resolve mixee and injected-service references to generated fields or parameters.
Collection generation SHALL NOT add a JPA field, entity getter, setter, or mutation method to the target entity.

#### Scenario: Collection body uses mixee and service

- **WHEN** a collection body computes its list from the target mixee and `RecommendationService`
- **THEN** generated Java contains the copied computation, final mixee state, and injected service field

#### Scenario: Collection does not alter persistence

- **WHEN** a collection is added to an existing entity
- **THEN** the entity's generated JPA fields and persisted property accessors remain unchanged

### Requirement: Cross-model collection classifiers use the shared checkpoint

An explicit-target collection SHALL resolve target and entity element classifiers through the checkpointed `entityToClass` mapping using stable source `Entity` identity.
The generated mixin SHALL remain in its declaring model's package and SHALL carry valid imports or qualified references for external generated classifiers.

#### Scenario: Target and element classifiers cross model boundaries

- **WHEN** a collection declared in `recommendations` targets `customers.Customer` and has element type `customers.Product`
- **THEN** generation emits the mixin in package `recommendations` with valid references to both external generated classifiers

#### Scenario: Clean generation recreates collection references

- **WHEN** sandbox generated output is deleted before generation
- **THEN** `CausewayGenerationPlan` recreates checkpoint state and the cross-model collection contains no unresolved reference marker

### Requirement: Collection output compiles and is discovered by Causeway

Generated collection mixins SHALL compile under Java 21 and SHALL be processed by the pinned Causeway 3.6 programming model as collection members of their exact target entities.
The headless verification pipeline SHALL cover nested, same-model explicit-target, and cross-model explicit-target collection fixtures.

#### Scenario: Headless build verifies collection mixins

- **WHEN** the sandbox contains valid collection fixtures
- **THEN** model checking, generation, generated-source assertions, Java compilation, and runtime verification all succeed in `headlessBuild`

#### Scenario: Runtime facet identifies the collection member

- **WHEN** Causeway processes a generated collection mixin and its target entity
- **THEN** the target exposes the collection through a collection facet and invoking `coll()` returns the authored list
