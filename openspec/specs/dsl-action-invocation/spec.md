# dsl-action-invocation Specification

## Purpose

Provide concise, statically resolved invocation of DSL-defined Causeway actions from embedded action lifecycle code.

## Requirements

### Requirement: Embedded action code supports transparent action invocation

The DSL SHALL provide an expression in action lifecycle code that projects a target expression, referenced action name, and ordered arguments as `target.action(args)`.
The action reference SHALL resolve to an existing DSL `Action` rather than a Java method.

#### Scenario: Author invokes a nested action transparently

- **WHEN** embedded action code invokes `customer.placeOrder(product, quantity)` and `placeOrder` is nested in entity `Customer`
- **THEN** the invocation references that nested DSL action

#### Scenario: Author invokes an explicit-target action transparently

- **WHEN** embedded action code invokes an action whose root declaration explicitly targets the target expression's entity
- **THEN** the invocation references that root DSL action

### Requirement: Action scope follows the exact target entity

The action reference scope SHALL contain actions nested directly in the exact entity type of the target expression and root actions whose explicit target is that entity.
The scope SHALL exclude actions targeting unrelated entities and SHALL NOT infer contribution through entity inheritance or Java assignability in this change.

#### Scenario: Matching actions are offered

- **WHEN** the invocation target has DSL entity type `Customer`
- **THEN** completion offers actions nested in `Customer` and root actions explicitly targeting `Customer`

#### Scenario: Unrelated actions are excluded

- **WHEN** an action is nested in or explicitly targets `Product`
- **THEN** that action is not a valid reference for an invocation whose target type is `Customer`

### Requirement: Invocation typing follows the referenced action

The DSL SHALL validate invocation arguments positionally against the referenced action's parameters using the existing DSL-to-Java type compatibility rules.
The invocation expression type SHALL be the referenced action's declared return type, or BaseLanguage `void` when no return type is declared.

#### Scenario: Valid arguments and entity return type are accepted

- **WHEN** an action declares parameters `(Product, int)` and return type `Customer`
- **THEN** an invocation with compatible arguments has type `Customer` and passes model checking

#### Scenario: Incorrect arity is rejected

- **WHEN** an invocation supplies a different number of arguments than the referenced action declares
- **THEN** model checking reports an error on the invocation

#### Scenario: Incompatible argument is rejected

- **WHEN** an invocation argument is not compatible with the corresponding action parameter type
- **THEN** model checking reports an error on that argument or invocation

### Requirement: Ambiguous and invalid action references are diagnosed

The DSL SHALL NOT select an action arbitrarily when more than one candidate has the same member name for the exact target entity.
The DSL SHALL report unresolved, ambiguous, wrong-target, and out-of-action-context invocations as model errors.

#### Scenario: Duplicate member identity is ambiguous

- **WHEN** two DSL actions contribute the same action name to one exact entity target
- **THEN** model checking reports the duplicate or ambiguous member identity instead of resolving arbitrarily

#### Scenario: Invocation outside action code is rejected

- **WHEN** the transparent invocation expression is placed outside a containing DSL `Action`
- **THEN** constraints or model checking report that the placement is invalid
