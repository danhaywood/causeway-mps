# Derived properties

The Causeway DSL models calculated scalar properties with `DerivedProperty` rather than persisted `Property`.
A derived property owns a required result `Type`, an embedded BaseLanguage getter body, optional injected services, and either an implicit or explicit target entity.
It generates Causeway behavior and never adds JPA state, an entity getter, or a setter.

## Placement

A derived property may be nested under an `Entity` through `Entity.derivedProperties`.
The containing entity is then the target and supplies the generated mixee type.

A derived property may instead be a model root with an explicit `target` reference.
The declaration and target entity must belong to the same MPS model in this change.
Cross-model generated classifier resolution is deferred to the draft follow-up proposal at `openspec/future-changes/dsl-cross-model-generated-references/proposal.md`.

Nested and root declarations cannot combine the two forms.
A nested declaration with an explicit target and a root declaration without one are model-checking errors.

## Getter body and scope

The getter body is a no-argument method-like BaseLanguage `StatementList`.
Its expected return type is the declared result `Type`, which may be a `JavaType` or `EntityType`.
A missing type, `void` type, or incompatible returned expression is an error.

Getter code sees the exact target mixee and the derived property's declared `InjectedService` values.
It does not see action parameters or unrelated entity variables.
The current language reuses `ActionVariableReference` for mixee and service expressions until a shared contributed-member abstraction is introduced.

## Identity

A derived property's runtime identity is its exact target entity plus its name.
Nested and root derived properties with the same target and name conflict.
A derived property also conflicts with a persisted `Property` of the same name on that exact target.
Actions are a separate member kind and may use the same textual name.

## Generated Causeway shape

A nested declaration generates a public static class inside the generated entity class.
A root declaration generates a top-level class named `Entity_property` in the declaring model's package.

Both forms are annotated with `@Property` and contain:

- a final mixee field;
- a public one-argument mixee constructor;
- one `@Inject private <Type> <name>;` field per declared service;
- a public no-argument `prop()` method returning the declared type and containing the authored body.

The pinned Causeway 3.6 contract recognizes `prop()` by its reserved name, so the generated method does not carry `@MemberSupport`.

For example, the nested `Customer.recentCustomer` fixture generates conceptually as:

```java
@Property
public static class recentCustomer {
    @Inject
    private OrderService orderService;
    private final Customer mixee;

    public recentCustomer(Customer mixee) {
        this.mixee = mixee;
    }

    public Customer prop() {
        return mixee;
    }
}
```

The same-model root `externalLabel` fixture generates `customers.Customer_externalLabel` with `String prop()`.

## Deferred capabilities

This change does not add property-access syntax inside embedded BaseLanguage.
It does not add supporting methods, collections, caching, setters, persistence, or a generic contributed-member abstraction.
Cross-model explicit targets require separate generation-plan and generated-reference work.
