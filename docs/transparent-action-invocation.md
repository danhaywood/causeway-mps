# Transparent action invocation

The Causeway DSL supports transparent invocation of DSL-declared actions from embedded action lifecycle code.
The syntax is `target.action(arguments)` and references a DSL `Action`, not an arbitrary Java method.

## Syntax

A nested action can be invoked using its contributed member name:

```text
customer.placeOrder(product, quantity)
```

The same syntax is used for an explicit-target root action:

```text
customer.topLevelProbe()
```

An invocation is an expression, so its result can be returned, assigned, or passed to another expression.
The expression has the referenced action's declared return type, or BaseLanguage `void` when the action has no return type.
Arguments are matched positionally against the action's ordered parameters.
Model checking rejects incorrect arity and incompatible argument types.

Transparent invocation is currently valid only inside lifecycle code belonging to a DSL `Action`.
This restriction ensures that generation has a containing Causeway mixin in which it can provide the required service plumbing.

## Exact-target action resolution

The target expression must have a DSL entity type.
For an exact target entity such as `Customer`, completion and reference resolution consider:

- actions nested directly in `Customer`;
- root actions whose explicit target is `Customer`.

Actions nested in or explicitly targeting another entity are out of scope.
The current implementation does not use entity inheritance, Java assignability, or Java-stub mixin discovery.
Two actions with the same contributed member name for the same exact entity are ambiguous and produce a model-checking error rather than an arbitrary selection.
Missing, unresolved, and wrong-target action references also produce model errors.

## Generated Java

Transparent invocation lowers to Causeway `FactoryService.mixin(...).act(...)` Java.
For a nested action, the generated form is equivalent to:

```java
return __factoryService.mixin(Customer.placeOrder.class, customer)
        .act(product, quantity);
```

For an explicit-target root action, the generated form is equivalent to:

```java
return __factoryService.mixin(Customer_topLevelProbe.class, customer)
        .act();
```

The generator derives the class literal from the referenced action's actual placement.
It does not reconstruct the generated class name from the call-site spelling.

A generated caller mixin receives the following field only when its lifecycle subtree contains a transparent invocation:

```java
@Inject
private FactoryService __factoryService;
```

The name `__factoryService` is reserved for generated plumbing.
Actions without transparent invocations retain their previous generated service-field shape.
Using `FactoryService` rather than a direct constructor allows Causeway to instantiate the invoked mixin and inject its services.

## Raw invocation semantics

Transparent invocation is intentionally a raw, direct action invocation.
`FactoryService.mixin(...)` constructs the generated mixin, after which generated Java calls its `act` method directly.
The call does not use Causeway `WrapperFactory` or another rule-checking wrapper.
Callers must not assume that Causeway visibility, usability, validation, interaction-event, or other wrapper semantics run around this direct call.
The invoked action's ordinary Java body and injected services do run.

Use transparent invocation when direct domain behavior composition is intended.
Use explicit `wrap(target[, control]).action(args)` or `asyncWrap(target[, control]).action(args)` when the caller requires the Causeway wrapper interaction boundary.
See [Wrapped action invocation](wrapped-action-invocation.md) for that contract.

## Sandbox examples

The `customers.Customer` sandbox entity contains both supported placement paths:

- `invokePlaceOrder(Product, int): Customer` invokes the nested `placeOrder(Product, int): Customer` action;
- `invokeTopLevelProbe(): Customer` invokes the explicit-target root action `topLevelProbe(): Customer`.

Generated-source verification checks both class-literal forms and verifies conditional `FactoryService` injection.
Java 21 compilation checks the emitted signatures and calls.
The runtime mixin verifier processes and instantiates both caller mixins and both referenced action mixins through the Causeway 3.6 programming model.

## Deferred capabilities

The action-only first slice deliberately defers the following capabilities:

- `dsl-derived-properties` will define derived-property authoring, typing, lifecycle, and generation before adding transparent property access;
- `dsl-collection-members` will define collection-member structure and generation before adding transparent collection access;
- `dsl-contributed-member-abstraction` will consider common `Mixin` and `IContributedMember` abstractions after actions, properties, and collections have compatible concrete models;
- `dsl-type-hierarchy` will add entity supertypes and interfaces before extending resolution beyond exact targets;
- `dsl-handwritten-mixin-interop` will define discovery and typing for handwritten Causeway mixins.

These names are follow-up stubs, not additional active OpenSpec changes.
