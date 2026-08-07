# Calculated collections

The Causeway DSL models calculated read-only collections with `Collection` rather than persisted entity state.
A collection owns a required element `Type`, an embedded BaseLanguage body, optional injected services, and either an implicit or explicit target entity.
Its method-like return contract is fixed to `java.util.List<ElementType>`.
It generates Causeway contributed behavior and never adds JPA state, entity accessors, mutation methods, or persistence metadata.

## Placement

A collection may be nested under an `Entity` through `Entity.collections`.
The containing entity is then the exact target and the declaration must omit `target`.

A collection may instead be a model root with an explicit `target` reference.
The target may belong to the declaring model or an imported MPS model.
A root collection without a target, a nested collection with an explicit target, or any unrelated placement is a model-checking error.

## Element type and body

The first collection slice always returns `java.util.List<ElementType>`.
The element type may be a DSL `EntityType` or a non-primitive BaseLanguage classifier wrapped by `JavaType`.
Missing, `void`, and primitive element types are rejected.
Scalar returns and lists with incompatible element types are rejected by the method-like return contract.

The body sees the exact target mixee and the collection's declared `InjectedService` values.
It does not see action parameters or unrelated variables.
The current language reuses `ActionVariableReference` for mixee and service expressions until a shared contributed-member abstraction is introduced.

## Identity

A collection's runtime identity is its exact target entity plus its name.
Nested and root collection declarations with the same target and name conflict even when they live in different placement forms.
Collection identity is independent of persisted properties, derived properties, and actions, so those member kinds may use the same textual name.

## Generated Causeway shape

A nested declaration generates a public static class inside the generated entity class.
A root declaration generates a top-level class named `Entity_collection` in the declaring model's package.
A cross-model root remains in its declaring package and imports the target and entity element classifiers from the target model's generated package.

Both forms are annotated with `@Collection` and contain:

- a final mixee field;
- a public one-argument mixee constructor;
- one `@Inject private <Type> <name>;` field per declared service;
- a public no-argument `List<ElementType> coll()` method containing the authored body.

The pinned Causeway 3.6 contract recognizes the reserved `coll()` method and exposes the contributed member through a `MixinFacet` whose main method is `coll`.
The returned list is governed by Causeway's collection-facet contract.

For example, the nested `Customer.recentProducts` fixture generates conceptually as:

```java
@Collection
public static class recentProducts {
    @Inject
    private Product recommendedProduct;
    private final Customer mixee;

    public recentProducts(Customer mixee) {
        this.mixee = mixee;
    }

    public List<Product> coll() {
        List<Product> result = new ArrayList<>();
        if (mixee != null) {
        }
        if (recommendedProduct != null) {
        }
        return result;
    }
}
```

The same-model root `customerLabels` fixture generates `customers.Customer_customerLabels` with `List<String> coll()`.
The cross-model root `recommendedProducts` is declared in `recommendations`, targets `customers.Customer`, returns `List<customers.Product>`, and generates `recommendations.Customer_recommendedProducts`.
Runtime verification processes all three mixins through the Causeway programming model, confirms their exact target and `coll` main method, and invokes the authored bodies.

## Cross-model generation and clean rebuilds

Collection target and entity element classifiers resolve through the checkpointed `entityToClass` mapping keyed by stable source `Entity` identity.
Every producer and consumer model imports `causeway.devkit`, which selects `CausewayGenerationPlan` and persists checkpoint `after_causeway` before downstream BaseLanguage generation.
A consumer must not add a second genplan-bearing DevKit or a solution-local Custom Generation facet.

For clean verification, delete the complete `languages/causeway.sandbox/source_gen` tree and regenerate the sandbox.
Generation must recreate both `customers/causewaygenerationplan-after_causeway.mps` and `recommendations/causewaygenerationplan-after_causeway.mps` together with all three collection mixins.
Generated Java is then compiled with the pinned Java 21 toolchain and verified against Causeway 3.6.

## Deferred capabilities

This slice does not add persisted collections, mutation, supporting methods, sorting, paging, `Set`, maps, transparent collection access, handwritten mixin interoperation, or a generic contributed-member abstraction.
Persisted relationships remain a separate future `PersistedCollection` capability with independent ownership, lifecycle, and JPA decisions.
Packaging and publishing `causeway.devkit` outside this repository also remains separate distribution work.
