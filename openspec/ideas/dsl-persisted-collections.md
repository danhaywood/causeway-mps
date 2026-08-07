# Idea: persisted collections

**Status:** Future-change idea only.

**Candidate change name:** `dsl-persisted-collections`.

**Promotion dependency:** Complete and archive `dsl-collection-members` first.

## Motivation

The current `Property` concept models persisted scalar or single-valued entity state.
The proposed `Collection` concept models calculated, read-only Causeway collection mixins and deliberately generates no persistence state.
The DSL therefore has no way to model an entity-owned persistent to-many relationship or persistent collection of values.

This distinction must remain explicit because a Causeway collection member and a JPA collection-valued attribute have different ownership, lifecycle, schema, mutation, and generation contracts even when both appear as collections in the UI.

## Initial direction

Introduce a distinct nested concept such as `PersistedCollection` rather than adding a persistence flag to the contributed `Collection` concept.
A persisted collection is owned state and should initially be valid only as a child of its owning `Entity`, with no top-level explicit-target contribution form.
It should generate inline entity state rather than a Causeway mixin class.

The first implementation slice should be deliberately narrow.
A reasonable starting point is an entity-valued, owner-controlled to-many association using one fixed Java container type and one explicit JPA mapping strategy.
Additional relationship kinds should follow only after the ownership and mutation contract is proven end to end.

## Candidate model

A future proposal should evaluate features along these lines:

- `name`: the member and persistence attribute name.
- `elementType`: initially an `EntityType`, with Java basic or embeddable values considered separately.
- `relationshipKind`: potentially `ONE_TO_MANY`, `MANY_TO_MANY`, or `ELEMENT_COLLECTION`, but preferably fixed for the first slice.
- `ownership`: owner-side join metadata versus inverse `mappedBy` metadata.
- `cascade`: an explicit, constrained cascade policy rather than an unchecked JPA string.
- `orphanRemoval`: meaningful only for owner-controlled child lifecycles.
- `fetch`: default lazy behavior with any override represented deliberately.
- `ordering`: absent initially, then potentially `@OrderColumn` or ordered-by semantics.
- `required` or cardinality constraints: domain validation distinct from database nullability.

The concept should not share containment or generation with the read-only contributed `Collection` merely because both return multiple values.
A later common abstraction may share presentation-level metadata, but persisted state and contributed behavior should remain separate semantic categories.

## Recommended first slice

Prefer one owned `List<Child>` relationship with a generated, eagerly initialized collection field and explicit add/remove methods.
The exact JPA mapping remains a design decision because the choice between a foreign-key join column, join table, and bidirectional `mappedBy` changes schema ownership and mutation behavior.

The first slice should probably require the element entity to be in the same bounded module or model unless a concrete cross-module persistence use case justifies tighter coupling.
Cross-model generated classifier resolution is technically available through `causeway.devkit`, but persistence ownership should be decided from domain semantics rather than generator capability.

Value collections using `@ElementCollection`, many-to-many associations, sets, maps, sorting, paging, and bidirectional synchronization should remain out of scope until the owned one-to-many contract is stable.

## Generated Java questions

The future design must settle the exact generated shape, including:

- Whether JPA uses field access consistently with current persisted `Property` generation.
- Whether the generated field is `final`, eagerly initialized, and exposed directly or through a private annotated getter.
- Which Causeway annotation exposes the collection and whether it belongs on a field or getter.
- Whether callers receive an unmodifiable view or the live persistent collection.
- Which add/remove methods are generated and how they maintain inverse references.
- Whether replacement of the whole collection is forbidden.
- How logical member naming and database naming reuse `Module` metadata.
- How proxy-safe equality and duplicate membership are handled.

A golden handwritten Causeway 3.6/JPA example should be created before the MPS structure or generator is finalized.
Runtime verification should exercise persistence metadata as well as Causeway collection-facet discovery.

## Ownership and lifecycle decisions

The most important unresolved question is what aggregate semantics the DSL intends to express.
An owned child collection normally implies cascade and orphan removal, while a shared association normally does not.
Encoding those alternatives as arbitrary annotation options would expose JPA complexity without giving the DSL a coherent domain model.

The future proposal should choose whether the DSL models:

1. Aggregate-owned children with generated lifecycle methods.
2. Shared entity associations with explicit link management.
3. Both through separate concepts or a small, constrained relationship-kind enumeration.

The first option is the strongest candidate for an initial slice because it provides one clear ownership and deletion contract.

## Identity and compatibility

Persisted collection names should participate in persisted member identity for an exact owning entity.
The future specification must decide whether a persisted collection may share a name with a persisted scalar property, derived property, contributed collection, or action.
At minimum, persisted scalar properties and persisted collections should not generate the same Java or persistence attribute name.

Existing `Property`, `DerivedProperty`, `Collection`, and `Action` behavior must remain unchanged for models that do not declare persisted collections.
No migration should reinterpret a contributed collection as persistent state.

## Verification expectations

A promoted change should include:

- MPS structure, editor, placement, type, ownership, and identity checks.
- Positive and negative model fixtures for the chosen relationship contract.
- Generated-source assertions for JPA and Causeway annotations, initialization, accessors, and mutators.
- Java 21 compilation of generated generic relationship code.
- JPA metadata bootstrapping against the generated entity classes.
- Causeway 3.6 runtime discovery of the collection member.
- Behavioral tests for add, remove, cascade, orphan, and inverse-link semantics where applicable.
- Clean shared-plan generation and regression checks for all existing scalar, derived, action, invocation, and contributed-collection behavior.

## Likely capability impact

A promoted OpenSpec change would likely introduce `dsl-persisted-collections` and modify at least:

- `dsl-domain-model` for owned collection-valued state.
- `causeway-generation` for JPA relationship fields, accessors, mutators, and Causeway exposure.
- `dsl-constraints` if ownership, cross-model placement, or relationship combinations need normative validation.
- The build verification capability if JPA metadata bootstrapping requires a new test boundary.

## Promotion questions

Before promoting this idea, answer:

1. What is the first concrete domain example and aggregate boundary?
2. Is the initial relationship unidirectional or bidirectional?
3. Which JPA mapping owns the foreign key or join table?
4. Are child deletion and orphan removal part of the DSL contract?
5. Is `List` the only initial container, and does order persist?
6. Are element entities restricted to the same model or module?
7. Which mutation operations should generated domain code expose?
8. How will generated JPA metadata be verified independently of source compilation?
