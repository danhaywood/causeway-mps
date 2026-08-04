# Causeway 3.6 parameter hide and disable signatures

This note records the source-level verification performed against Apache Causeway tag `rel/causeway-3.6.0`, commit `07f4bea45f9d3e9d590979e77084daefb6b09fbc`.

## Support is registered

`ProgrammingModelDefault` registers both `ActionParameterHiddenFacetViaMethodFactory` and `ActionParameterDisabledFacetViaMethodFactory` in the default programming model.

The factories use `MemberSupportPrefix.HIDE` and `MemberSupportPrefix.DISABLE` respectively.

`MemberSupportPrefix.HIDE` requires primitive `boolean`.

`MemberSupportPrefix.DISABLE` accepts `String` or `TranslatableString`; the Causeway DSL's `String`-or-null contract is therefore valid.

At invocation time, a non-boolean hide result is treated as `false`, while a null disable result means that the parameter is enabled.

## Supported names

For a mixin action method named `act`, Causeway 3.6 searches both the positional and parameter-name conventions.

For parameter index `i` named `product`, the hide candidates are `hide{i}Act` and `hideProduct`.

The corresponding disable candidates are `disable{i}Act` and `disableProduct`.

The parameter-name form is restricted to mixins, which matches the DSL's action-generation target.

## Supported parameter shapes

Causeway searches parameters-as-a-tuple (PAT) signatures before positional sweep signatures.

A PAT supporting method takes one tuple argument whose class has a public constructor matching the complete action parameter signature.

For a generated mixin with `Product product` and `int quantity`, the intended generated forms are therefore:

```java
public record Params(Product product, int quantity) {}

public boolean hideProduct(Params params) {
    // generated lifecycle body
}

public String disableProduct(Params params) {
    // generated lifecycle body; null means enabled
}
```

The generated `Params` record must be public because Causeway discovers it through a public constructor lookup.

Causeway constructs the tuple from the pending action arguments and invokes the supporting method with that tuple.

As a fallback, the positional sweep accepts a prefix of action arguments, starting with parameters `0..i` and progressively removing trailing arguments down to a no-argument signature.

The DSL intentionally exposes only parameters declared before parameter `i` in hide and disable blocks, even though the Causeway PAT object structurally contains every action parameter.

## Source evidence

The relevant Causeway 3.6 sources are:

- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/spec/impl/ProgrammingModelDefault.java`
- `core/config/src/main/java/org/apache/causeway/core/config/progmodel/ProgrammingModelConstants.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/facets/param/support/ActionParameterSupportFacetFactoryAbstract.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/facets/ParameterSupport.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/methods/MethodFinderPAT.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/facets/param/hide/method/ActionParameterHiddenFacetViaMethod.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/facets/param/disable/method/ActionParameterDisabledFacetViaMethod.java`
- `core/metamodel/src/main/java/org/apache/causeway/core/metamodel/object/MmInvokeUtils.java`
