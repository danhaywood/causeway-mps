## Context

The Causeway DSL currently distinguishes persisted entity state (`Property`) from behavior (`Action`) and generates actions as nested or explicit-target mixins.
Apache Causeway models a calculated scalar property as an `@Property` mixin with a no-argument `prop()` main method.
The action work has already established placement, target naming, mixee scoping, injected-service declarations, BaseLanguage body embedding, generator class naming, Java 21 compilation, and runtime mixin verification.
Derived properties should reuse those proven patterns without prematurely introducing the generic contributed-member abstraction deferred until actions, properties, and collections all have concrete models.

## Goals / Non-Goals

**Goals:**

- Represent a calculated, non-persisted property as a distinct DSL declaration.
- Support nested and explicit-target contribution, including cross-model targets.
- Provide a typed BaseLanguage getter body with the mixee and declared injected services in scope.
- Generate valid Causeway 3.6 property mixins for both placement forms.
- Diagnose missing targets, invalid placement, duplicate member identities, and incompatible return values.
- Verify generated source structure, Java compilation, and Causeway runtime mixin discovery.

**Non-Goals:**

- Property access or invocation sugar in embedded BaseLanguage.
- Collections or collection-member generation.
- A common `Mixin` or `IContributedMember` abstraction shared with actions.
- Supporting-method families such as hide, disable, or choices for derived properties in this first slice.
- Entity inheritance, handwritten Java mixin discovery, setters, persistence, or caching.

## Decisions

### Use a distinct `DerivedProperty` concept

`DerivedProperty` will be an `INamedConcept` with a required result `Type`, a getter body, zero or more `InjectedService` declarations, and the same nested-versus-explicit-target placement shape as `Action`.
It will not extend persisted `Property`, because a persisted property owns JPA state while a derived property is a contributed behavior mixin with no storage.
A later contributed-member change can extract common structure after the property and collection shapes are proven.

### Mirror action placement without sharing an abstraction yet

An entity will gain a `derivedProperties` containment role for nested declarations whose target is implicit.
`DerivedProperty` will also be rootable with an explicit `target` entity and mixee name, including a target in another model.
Nested declarations generate public static mixin classes inside the entity class, while explicit-target roots generate top-level `Entity_property` classes.
This intentionally duplicates a small amount of action placement logic rather than introducing the deferred abstraction early.

### Reuse existing type, variable, and service concepts

The declared result uses the existing `Type` union so Java and DSL entity results resolve through the same generator mappings as action returns.
Getter code uses the established `ActionVariableReference` expression for the mixee and injected services, despite its action-specific name, to avoid adding another equivalent reference concept before the contributed-member abstraction.
The derived property acts as a scope provider that exposes only the mixee and its `InjectedService` declarations because a property getter has no parameters.

### Give the getter body a declared expected type

The body is embedded BaseLanguage and is checked as a no-argument method-like body whose expected return type is the declared derived-property type.
Every returned expression is constrained to that type, and a missing type or incompatible return is an error.
A derived property does not support a void result.

### Treat member identity as target plus name

Within an exact target entity, a derived-property name must not collide with another derived property or a persisted property.
The checker reports ambiguity rather than relying on generated Java class names or Causeway runtime discovery order.
Actions remain a separate member kind and may retain the same textual name because their runtime facet differs.

### Generate the Causeway property-mixin programming model

Each generated mixin is annotated with `@Property`, has an explicit final mixee field and public one-argument constructor, and exposes a public no-argument `prop()` method containing the authored body.
The implementation will verify against the pinned Causeway 3.6 programming model whether `@MemberSupport` is required or merely accepted on `prop()`, and the generated fixture will freeze the verified form.
Declared services generate `@Inject private <Type> <name>;` fields using the action generator's established type-copying approach.
No JPA field, entity getter, setter, or mutation is generated for a derived property.

### Verify behavior at source, compile, and runtime boundaries

The sandbox will include nested and explicit-target derived properties returning both Java and entity types, with one fixture using an injected service and mixee reference.
Generated-source assertions will check placement, annotation, constructor, `prop()` signature, copied body, service injection, and the absence of persistent state.
Java 21 compilation and runtime programming-model verification will confirm that Causeway discovers each class as a property mixin with the expected mixee and main method.
Negative `@tests` fixtures will cover invalid placement, missing explicit target, duplicate persisted/derived identity, missing type, and incompatible return values.

## Risks / Trade-offs

- **Causeway property-mixin annotation details differ from action mixins** → Inspect and verify the pinned Causeway 3.6 programming model before finalizing generator templates.
- **Duplicated placement logic can drift from actions** → Centralize generator query helpers where practical and cover both placement forms in source assertions.
- **The reused `ActionVariableReference` name is conceptually narrow** → Document the temporary reuse and rename or generalize it only in the contributed-member abstraction change.
- **Duplicate identity checks span two containment and root forms** → Resolve candidates by exact target entity and member kind, then test nested, explicit-target, and persisted collisions.
- **BaseLanguage return checking can miss fall-through paths** → Reuse method-like expected-type constraints now and leave complete control-flow return analysis to existing BaseLanguage diagnostics.

## Migration Plan

The change is additive, so existing models require no migration.
Rebuilding the language and generator makes `DerivedProperty` available and regenerates sandbox output.
Rollback consists of removing derived-property fixtures and reverting the additive language and generator artifacts before release.

## Open Questions

- Confirm through the pinned Causeway 3.6 runtime whether generated `prop()` should carry `@MemberSupport` or rely only on the reserved method name.
