## ADDED Requirements

### Requirement: Lifecycle parameter scoping
The DSL SHALL enforce, at edit time, that each action/parameter supporting block may reference only the
parameters available when that block runs in Causeway's lifecycle. Specifically, for an action with
parameters in declared order `0..n-1`:

- action `hide` and `disable` SHALL see **no** parameters;
- parameter *i*'s `default`, `choices`, `hide`, `disable`, and `autoComplete` SHALL see parameters
  `[0 .. i-1]` (those declared before it);
- parameter *i*'s `validate` SHALL see parameters `[0 .. i]` (including itself);
- action `validate` and `act` SHALL see **all** parameters.

The mixee (the target entity instance) and any declared injected services SHALL be in scope in **every**
block.

#### Scenario: parameter choices offers only earlier parameters
- **WHEN** an author edits the `choices` block of parameter `i`
- **THEN** code completion offers parameters `[0 .. i-1]`, the mixee, and injected services — and does
  **not** offer parameter `i` or any later parameter

#### Scenario: the act body sees all parameters
- **WHEN** an author edits the `act` body of an action with parameters `product` and `quantity`
- **THEN** both `product` and `quantity` are in scope, as are the mixee and injected services

#### Scenario: action availability blocks see no parameters
- **WHEN** an author edits an action-level `hide` or `disable` block
- **THEN** no parameters are in scope; only the mixee and injected services are

#### Scenario: referencing a not-yet-available parameter is rejected
- **WHEN** a block references a parameter outside its allowed scope (e.g. parameter `i`'s `choices`
  referencing parameter `i+1`)
- **THEN** the model reports an edit-time error

### Requirement: Parameter order is dependency order
The DSL SHALL treat parameter declaration order as significant (dependency order), since a block may
reference only earlier parameters, and SHALL report an edit-time warning when reordering parameters
invalidates an existing reference (a block now referencing a parameter that is no longer in its scope).

#### Scenario: reordering parameters that breaks a reference warns
- **WHEN** parameter `b`'s `choices` references parameter `a`, and `b` is moved before `a`
- **THEN** the model reports an edit-time warning that the reference is now out of scope

### Requirement: Supporting blocks are typed to their Causeway contract
Each supporting block's body SHALL be an embedded baseLanguage block typed to the contract Causeway
expects, so the embedded Java is checked against the right return type:

- `hide` → `boolean`
- `disable` and `validate` → a reason `String` or `null` (null = allowed)
- `choices` and `autoComplete` → `Collection<ParamType>` (the parameter's type)
- `default` → `ParamType` (the parameter's type)

#### Scenario: a choices block is typed to a collection of the parameter type
- **WHEN** an author edits the `choices` block of a `Product`-typed parameter
- **THEN** the block body is typed as `Collection<Product>` and a body returning the wrong type is an
  edit-time type error

#### Scenario: a hide block is typed to boolean
- **WHEN** an author edits an action `hide` block
- **THEN** the block body is typed as `boolean`
