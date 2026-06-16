## ADDED Requirements

### Requirement: Unique member names within an entity
The `causeway` language SHALL report a constraint violation when two `Property` members, or two
`Action` members, within the same `Entity` share the same name.

#### Scenario: Duplicate property names rejected
- **WHEN** an `Entity` contains two `Property` children both named `name`
- **THEN** modelcheck reports a constraint error on the duplicate

#### Scenario: Distinct member names accepted
- **WHEN** an `Entity`'s properties and actions all have distinct names
- **THEN** modelcheck reports no naming violation

### Requirement: Type references resolve
The `causeway` language SHALL ensure that an `EntityType`'s referenced `Entity` and a `JavaType`'s
wrapped Java type resolve; an unresolved reference SHALL be a modelcheck error.

#### Scenario: Unresolved entity reference is an error
- **WHEN** an `EntityType` references an `Entity` that no longer exists
- **THEN** modelcheck reports an unresolved-reference error

#### Scenario: Resolved references pass
- **WHEN** all `Type` references resolve (entities present, Java types on the stub classpath)
- **THEN** modelcheck reports no reference errors
