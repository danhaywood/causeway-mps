# dsl-wrapped-action-invocation Specification

## Purpose

Provide explicit synchronous and asynchronous action invocation through Apache Causeway's wrapper boundary while retaining raw direct invocation semantics.

## Requirements

### Requirement: Embedded action code supports explicit wrapped invocation

The DSL SHALL provide synchronous `wrap(target).action(args)` and asynchronous `asyncWrap(target).action(args)` expressions in action lifecycle code.
The wrapped action reference SHALL resolve to an existing DSL `Action`, and direct `target.action(args)` invocation SHALL retain its existing raw semantics.

#### Scenario: Author invokes an action synchronously through Causeway

- **WHEN** embedded action code invokes `wrap(customer).placeOrder(product, quantity)`
- **THEN** the invocation references `placeOrder` and requests synchronous wrapped dispatch

#### Scenario: Author invokes an action asynchronously through Causeway

- **WHEN** embedded action code invokes `asyncWrap(customer).placeOrder(product, quantity)`
- **THEN** the invocation references `placeOrder` and requests asynchronous wrapped dispatch

#### Scenario: Direct invocation remains raw

- **WHEN** embedded action code invokes `customer.placeOrder(product, quantity)` without a wrapper keyword
- **THEN** the invocation retains raw `FactoryService` dispatch rather than wrapped dispatch

### Requirement: Wrapped invocation accepts mode-specific control

A synchronous wrapped invocation SHALL optionally accept one BaseLanguage expression assignable to Causeway `SyncControl`.
An asynchronous wrapped invocation SHALL optionally accept one BaseLanguage expression assignable to Causeway `AsyncControl`.
The absence of a control expression SHALL select the corresponding Causeway default-control overload.

#### Scenario: Synchronous invocation supplies explicit control

- **WHEN** embedded action code invokes `wrap(customer, syncControl).placeOrder(product, quantity)` and `syncControl` has type `SyncControl`
- **THEN** the invocation passes model checking and retains that control expression

#### Scenario: Asynchronous invocation supplies explicit control

- **WHEN** embedded action code invokes `asyncWrap(customer, asyncControl).placeOrder(product, quantity)` and `asyncControl` has type `AsyncControl`
- **THEN** the invocation passes model checking and retains that control expression

#### Scenario: Control type does not match invocation mode

- **WHEN** a synchronous invocation receives `AsyncControl` or an asynchronous invocation receives `SyncControl`
- **THEN** model checking reports an error on the control expression

### Requirement: Wrapped action resolution follows the exact target entity

The wrapped action reference scope SHALL reuse the exact-target rules of direct action invocation.
The scope SHALL include actions nested directly in the target's exact DSL entity and root actions explicitly targeting that entity, while excluding unrelated, inherited, and handwritten actions.

#### Scenario: Matching nested and explicit-target actions are offered

- **WHEN** a wrapped invocation target has DSL entity type `Customer`
- **THEN** completion offers actions nested in `Customer` and root actions explicitly targeting `Customer`

#### Scenario: Unrelated action is rejected

- **WHEN** a wrapped invocation targeting `Customer` references an action belonging to `Product`
- **THEN** model checking reports an unresolved or wrong-target action reference

#### Scenario: Ambiguous action identity is rejected

- **WHEN** two DSL actions contribute the same action name to the exact target entity
- **THEN** model checking reports ambiguity rather than selecting one action arbitrarily

### Requirement: Wrapped invocation typing follows action result and dispatch mode

The DSL SHALL validate wrapped invocation arguments positionally against the referenced action's parameters using the existing compatibility rules.
A synchronous wrapped invocation SHALL have the action's declared return type or BaseLanguage `void` when no return type is declared.
An asynchronous wrapped invocation SHALL have Causeway `TryFuture<R>` for a value-returning action or `TryFuture<Void>` when no return type is declared.

#### Scenario: Synchronous entity result is preserved

- **WHEN** a synchronously wrapped action declares return type `Customer`
- **THEN** the invocation expression has type `Customer`

#### Scenario: Asynchronous entity result becomes a future

- **WHEN** an asynchronously wrapped action declares return type `Customer`
- **THEN** the invocation expression has type `TryFuture<Customer>`

#### Scenario: Asynchronous void result becomes a void future

- **WHEN** an asynchronously wrapped action declares no return type
- **THEN** the invocation expression has type `TryFuture<Void>`

#### Scenario: Invalid arguments are rejected

- **WHEN** a wrapped invocation has incorrect arity or an incompatible positional argument
- **THEN** model checking reports the corresponding invocation or argument error

### Requirement: Wrapped invocation is restricted to action lifecycle code

A wrapped invocation SHALL be valid only within embedded lifecycle code of a DSL `Action`.
Placement elsewhere SHALL be rejected by constraints or model checking.

#### Scenario: Wrapped invocation outside an action is rejected

- **WHEN** a wrapped invocation is placed outside a containing DSL `Action`
- **THEN** constraints or model checking report that the placement is invalid
