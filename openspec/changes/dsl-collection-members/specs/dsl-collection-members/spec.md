## ADDED Requirements

### Requirement: DSL declares read-only contributed collections

The DSL SHALL provide a named `Collection` declaration with a mandatory element type and an authored BaseLanguage body.
The declaration SHALL represent calculated, read-only member behavior and SHALL NOT represent persisted entity state.
The first supported container shape SHALL be `List<ElementType>`.

#### Scenario: Entity-typed collection

- **WHEN** a collection declares `Product` as its entity element type
- **THEN** its body is expected to return `List<Product>`

#### Scenario: Java-typed collection

- **WHEN** a collection declares non-primitive Java type `String` as its element type
- **THEN** its body is expected to return `List<String>`

### Requirement: Collections support nested and explicit-target placement

A collection SHALL be valid either inside an entity or as a model root with an explicit target entity.
A nested collection SHALL derive its target from its containing entity and SHALL NOT set `target`.
A root collection SHALL set `target` to an entity in the same model or an imported model.

#### Scenario: Nested collection uses its containing entity

- **WHEN** `Customer` contains collection `recentOrders`
- **THEN** `recentOrders` contributes to `Customer` without an authored target reference

#### Scenario: Root collection targets a same-model entity

- **WHEN** root collection `preferredProducts` targets `Customer` in the same model
- **THEN** the declaration is valid and contributes to that exact entity

#### Scenario: Root collection targets an imported entity

- **WHEN** a collection root in `recommendations` targets `Customer` from `customers`
- **THEN** the persistent cross-model reference resolves and the collection remains owned by `recommendations`

#### Scenario: Root collection omits its target

- **WHEN** a root collection has no target
- **THEN** model checking reports that an explicit target is required

### Requirement: Collection element types are valid Java generic arguments

A collection element type SHALL use the existing DSL `Type` union and SHALL resolve to a non-void reference type.
A missing, void, or primitive Java element type SHALL be rejected before generation.

#### Scenario: Reference element type passes

- **WHEN** a collection element type is a DSL entity or Java classifier
- **THEN** element-type validation succeeds

#### Scenario: Primitive element type fails

- **WHEN** a collection declares primitive Java type `int` as its element type
- **THEN** model checking reports that collection elements must be reference types

#### Scenario: Missing element type fails

- **WHEN** a collection omits its element type
- **THEN** model checking reports that an element type is required

### Requirement: Collection bodies can reference the mixee and injected services

A collection SHALL support declared injected services using the existing DSL type forms.
Its body scope SHALL contain the exact target mixee and those injected services and SHALL contain no action parameters.

#### Scenario: Body uses the nested mixee

- **WHEN** a nested collection body references its containing `Customer`
- **THEN** the reference resolves to the generated mixee value

#### Scenario: Body uses an injected service

- **WHEN** a collection declares and references `RecommendationService`
- **THEN** the reference resolves and generation emits the corresponding injected field

### Requirement: Collection return values match the declared list type

The collection body SHALL be checked with method-like expected type `List<ElementType>`.
Every returned expression SHALL be compatible with that type.

#### Scenario: Compatible list return passes

- **WHEN** a `Product` collection returns an expression typed as `List<Product>`
- **THEN** no return-type diagnostic is reported

#### Scenario: Scalar return fails

- **WHEN** a `Product` collection returns one `Product`
- **THEN** model checking reports an incompatible return type

#### Scenario: Wrong element list fails

- **WHEN** a `Product` collection returns `List<Customer>`
- **THEN** model checking reports an incompatible return type

### Requirement: Collection identity is deterministic per exact target

Within an exact target entity, a collection name SHALL be unique across nested and explicit-target collection declarations.
Model checking SHALL report duplicate collection identity rather than selecting by declaration order.
Property and action names SHALL remain separate member kinds.

#### Scenario: Nested and root collections collide

- **WHEN** nested and explicit-target collections both contribute `recommendedProducts` to `Customer`
- **THEN** model checking reports the duplicate collection identity

#### Scenario: Same name targets different entities

- **WHEN** two root collections named `recommendedProducts` target different entities
- **THEN** both declarations remain valid

### Requirement: Existing members remain compatible

Adding collections SHALL NOT change persisted-property state, derived-property behavior, action behavior, invocation semantics, or generated output for models without collection declarations.

#### Scenario: Existing sandbox behavior is regenerated

- **WHEN** existing property and action fixtures are generated alongside collection fixtures
- **THEN** their model checks, generated-source assertions, Java compilation, and Causeway runtime verification continue to pass
