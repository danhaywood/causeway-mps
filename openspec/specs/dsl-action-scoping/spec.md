# dsl-action-scoping Specification

## Purpose
Define the edit-time scope, dependency ordering, and return-type contracts for Causeway action lifecycle blocks.

## Requirements

### Requirement: Lifecycle parameter scoping
The DSL SHALL enforce at edit time that each action or parameter supporting block may reference only the parameters available when that block runs in Causeway's lifecycle.
For an action with parameters in declared order `0..n-1`:

- action `hide` and `disable` SHALL see no parameters;
- parameter *i*'s `default`, `choices`, `hide`, `disable`, and `autoComplete` SHALL see parameters `[0 .. i-1]`;
- parameter *i*'s `validate` SHALL see parameters `[0 .. i]`, including itself; and
- action `validate` and `act` SHALL see all parameters.

The mixee and any declared injected services SHALL be in scope in every block.

#### Scenario: Parameter choices offers only earlier parameters
- **WHEN** an author edits the `choices` block of parameter `i`
- **THEN** code completion offers parameters `[0 .. i-1]`, the mixee, and injected services, but does not offer parameter `i` or any later parameter

#### Scenario: The act body sees all parameters
- **WHEN** an author edits the `act` body of an action with parameters `product` and `quantity`
- **THEN** both `product` and `quantity` are in scope, as are the mixee and injected services

#### Scenario: Action availability blocks see no parameters
- **WHEN** an author edits an action-level `hide` or `disable` block
- **THEN** no parameters are in scope; only the mixee and injected services are

#### Scenario: Referencing a not-yet-available parameter is rejected
- **WHEN** a block references a parameter outside its allowed scope, such as parameter `i`'s `choices` referencing parameter `i+1`
- **THEN** the model reports an edit-time error

### Requirement: Parameter order is dependency order
The DSL SHALL treat parameter declaration order as significant dependency order because a block may reference only earlier parameters.
The DSL SHALL report an edit-time warning when reordering parameters invalidates an existing reference.

#### Scenario: Reordering parameters that breaks a reference warns
- **WHEN** parameter `b`'s `choices` references parameter `a`, and `b` is moved before `a`
- **THEN** the model reports an edit-time warning that the reference is now out of scope

### Requirement: Supporting blocks are typed to their Causeway contract
Each supporting block's body SHALL be an embedded baseLanguage block typed to the contract Causeway expects:

- `hide` → `boolean`;
- `disable` and `validate` → a reason `String` or `null`, where null means allowed;
- `choices` and `autoComplete` → `Collection<ParamType>`; and
- `default` → `ParamType`.

#### Scenario: A choices block is typed to a collection of the parameter type
- **WHEN** an author edits the `choices` block of a `Product`-typed parameter
- **THEN** the block body is typed as `Collection<Product>` and a body returning the wrong type is an edit-time type error

#### Scenario: A hide block is typed to boolean
- **WHEN** an author edits an action `hide` block
- **THEN** the block body is typed as `boolean`
