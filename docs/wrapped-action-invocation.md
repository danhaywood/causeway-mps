# Wrapped action invocation

The Causeway DSL supports explicit wrapped invocation of DSL-declared actions from embedded action lifecycle code.
Use wrapped invocation when the call must cross Causeway's `WrapperFactory` interaction boundary rather than dispatching directly through `FactoryService`.

## Syntax

Synchronous calls use `wrap`:

```text
wrap(customer).placeOrder(product, quantity)
wrap(customer, syncControl).topLevelProbe()
```

Asynchronous calls use `asyncWrap`:

```text
asyncWrap(customer).placeOrder(product, quantity)
asyncWrap(customer, asyncControl).recordOrder(product, quantity)
```

The optional synchronous control expression must have type `SyncControl`.
The optional asynchronous control expression must have type `AsyncControl`.
A mismatched control produces a model-checking error on the wrapped invocation.

## Resolution and typing

Wrapped invocation reuses the exact-target action scope and inherited diagnostics of direct `target.action(arguments)` invocation.
The target must have a DSL entity type.
Completion includes actions nested directly in that entity and root actions whose explicit target is that exact entity.
Wrong targets, unresolved or ambiguous action identity, incorrect arity, and incompatible positional arguments remain model errors.
Wrapped invocation is valid only inside lifecycle code belonging to a DSL `Action`.

A synchronous call has the referenced action's declared return type, or BaseLanguage `void` when the action declares no return type.
An asynchronous value-returning call has type `TryFuture<R>`.
An asynchronous void call has type `TryFuture<Void>`.

## Generated Java

A synchronous nested call without an explicit control lowers to:

```java
return __wrapperFactory.wrapMixin(Customer.placeOrder.class, customer)
        .act(product, quantity);
```

A synchronous explicit-target call with a control lowers to:

```java
return __wrapperFactory.wrapMixin(Customer_topLevelProbe.class, customer, syncControl)
        .act();
```

An asynchronous value call lowers through `applyAsync`:

```java
return __wrapperFactory.asyncWrapMixin(Customer.placeOrder.class, customer)
        .applyAsync(mixin -> mixin.act(product, quantity));
```

An asynchronous void call lowers through `acceptAsync`:

```java
return __wrapperFactory.asyncWrapMixin(Customer.recordOrder.class, customer, asyncControl)
        .acceptAsync(mixin -> mixin.act(product, quantity));
```

The generator selects nested `action.class` or explicit-target `Entity_action.class` literals from the referenced action's placement.
A generated caller receives `@Inject private WrapperFactory __wrapperFactory` only when its lifecycle subtree contains a wrapped invocation.
The names `__wrapperFactory` and `__factoryService` are reserved for generated service plumbing and cannot be used by authored injected services.
A caller containing both raw and wrapped calls receives both generated fields.

## Wrapper boundary

Wrapped invocation enters Causeway through `WrapperFactory`.
The selected wrapper API receives the generated mixin class, target object, and optional control object before invoking `act`.
This boundary is where Causeway applies wrapper rule checking and interaction behavior according to the supplied control.
A wrapper rejection is propagated and does not fall back to raw `FactoryService` dispatch.

Direct `target.action(arguments)` remains intentionally raw and source-compatible.
It continues to lower through `FactoryService.mixin(...).act(...)` and does not acquire wrapped semantics implicitly.

## Sandbox coverage

The `customers.Customer` sandbox contains synchronous and asynchronous callers for nested and explicit-target actions, default and explicit controls, value and void results, and a mixed raw/wrapped caller.
Generated-source verification checks every `wrapMixin`, `asyncWrapMixin`, `applyAsync`, and `acceptAsync` shape plus conditional service injection.
Runtime verification uses a recording `WrapperFactory` boundary to check mixin class, target, arguments, controls, rejection, interaction notification, and absence of raw fallback.
Generated Java is compiled with JDK 21 against Causeway 3.6.
