## Context

The DSL currently models `Property`, `DerivedProperty`, and `Action`, but has no representation of a Causeway contributed collection.
Causeway 3.6 collection mixins use `@Collection`, a one-argument mixee constructor, and a public no-argument `coll()` method returning `List` or `Set`.
The derived-property implementation already proves nested and explicit-target placement, injected-service scope, method-like body typing, mixin generation, runtime discovery, and cross-model classifier resolution through `causeway.devkit`.
The collection slice should reuse those mechanisms without prematurely introducing the deferred generic contributed-member abstraction.

## Goals / Non-Goals

**Goals:**

- Add a rootable `Collection` concept that can be nested on an entity or target an entity explicitly.
- Model one mandatory element type and an authored body whose expected result is `List<ElementType>`.
- Support mixee and injected-service references inside the body.
- Generate nested, same-model root, and cross-model root Causeway collection mixins.
- Diagnose invalid placement, element types, body returns, and duplicate collection identity.
- Verify generated structure, Java 21 compilation, Causeway 3.6 collection-facet discovery, and clean shared-plan generation.

**Non-Goals:**

- Supporting methods such as `hideColl`, `disableColl`, choices, defaults, validation, or auto-complete.
- `Set`, sorted, paged, map-valued, mutable, cached, or persisted collections.
- Transparent collection access from embedded DSL code.
- A common `Mixin` or `IContributedMember` hierarchy shared by actions, properties, and collections.
- Type-hierarchy target resolution or handwritten mixin discovery.

## Decisions

### Model a collection as its own concrete contributed-member concept

Add `causeway.structure.Collection` as a named, rootable concept with `elementType`, `body`, `injectedServices`, and optional `target` features.
Add a `collections` containment role to `Entity` for nested declarations.
This mirrors the proven `DerivedProperty` placement model while keeping the third concrete shape available as evidence for a later abstraction.
The alternative of introducing a common contributed-member superconcept now would couple this change to action and property migrations and is deliberately deferred.

### Fix the first slice to `java.util.List<ElementType>`

Authors declare an element type through the existing DSL `Type` union, and the collection's method-like expected return type is a parameterized BaseLanguage `List<ElementType>`.
The element type is mandatory and must not resolve to `void` or a primitive Java type because Java generic arguments require reference types.
Generation emits `public List<ElementType> coll()` and copies the authored body into that method.
The alternative of authoring a complete collection return type makes the domain concept less explicit, while a `List`/`Set` enum adds editor, typing, and generator branches before there is a proven need.

### Reuse derived-property placement and body-scope mechanics

A nested collection derives its exact target from its containing entity and must omit `target`.
A root collection must set `target` to an entity in the same model or an imported model.
The body may reference the mixee and declared injected services through the existing interim `ActionVariableReference` mechanism, matching derived properties until a common reference concept is designed.
Collection bodies expose no action parameters and no mutation syntax.

### Keep collection identity separate from scalar and action identity

A collection name must be unique among nested and explicit-target collections for the same exact target entity.
Collection names remain a separate member kind from persisted properties, derived properties, and actions.
This avoids introducing cross-kind collisions without runtime evidence while still preventing declaration-order-dependent collection generation.

### Generate the established Causeway mixin shape

A nested collection generates a public static nested class named after the collection.
An explicit-target collection generates a top-level class named `Entity_collection` in the declaring model's package.
Both forms receive `@Collection`, a final mixee field, a public one-argument constructor, optional Jakarta-injected service fields, and a public no-argument `coll()` method returning `List<ElementType>`.
Collection generation does not add a JPA field, entity getter, setter, or other entity state.

### Route entity classifiers through the shared production plan

Target and element entity references use the existing checkpointed `entityToClass` mapping by stable source `Entity` identity.
All fixtures import `causeway.devkit`; no Custom Generation facet or collection-specific classifier-name resolver is added.
A cross-model fixture remains in its declaring package while importing the generated target and element classifiers.

### Verify structure, compilation, and runtime semantics

MPS tests cover placement, element-type validity, return compatibility, service scope, and duplicate identity.
Gradle generated-source assertions cover annotation, class shape, generic signature, constructor, copied body, service injection, package ownership, and absence of persistence state or unresolved markers.
Java 21 compilation verifies generated imports and generic types.
The Causeway runtime verifier processes the generated classes and confirms that the target exposes the collection through the collection facet and that `coll()` returns the authored values.
A clean `headlessBuild` proves that the shared plan recreates checkpoint state for same-model and cross-model fixtures.

## Risks / Trade-offs

- [Risk] The name `Collection` can be confused with `java.util.Collection` in generated or BaseLanguage models. → Use fully qualified MPS concept references and generate the fixed `java.util.List` API.
- [Risk] Parameterized expected-type construction can leave hollow or mismatched BaseLanguage type nodes. → Reuse the proven DSL-to-Java type conversion helpers and add focused incompatible-return tests before generator work.
- [Risk] Primitive `JavaType` values would generate illegal signatures such as `List<int>`. → Add a dedicated element-type checker and negative fixture.
- [Risk] Cross-model target or element references can regress checkpoint resolution. → Add a fixture whose declaring, target, and element classifiers cross model boundaries and verify clean checkpoint recreation.
- [Risk] Reusing `ActionVariableReference` extends an interim naming mismatch. → Document the reuse and defer migration until the common contributed-member abstraction has concrete requirements from all three member kinds.
- [Trade-off] Fixing the first slice to `List` excludes valid Causeway `Set` collections. → Prefer one end-to-end proven container shape now and add container kinds in a later compatible change.
