## ADDED Requirements

### Requirement: Shared classpath-stubs solution
The Causeway/Jakarta external Java SHALL be provided by a single shared `causeway.stubs` solution that
imports `causeway-applib`, `jakarta.persistence-api`, and `jakarta.inject-api` as `java_classes` classpath
stubs. Both the `causeway` language's generator and the `causeway.sandbox` solution SHALL depend on
`causeway.stubs`; the stub jars SHALL live in exactly one location. The `causeway.sandbox` solution SHALL
NOT carry its own copy of the stub jars (it obtains them transitively via the shared solution).

#### Scenario: Generator resolves annotation classifiers
- **WHEN** a generator template in the `causeway` language references a Causeway/Jakarta classifier (e.g.
  `@DomainObject`, `@Entity`, `@Named`, or the `Nature`/`Introspection`/`SemanticsOf` enums)
- **THEN** the reference resolves and `./gradlew checkModels` reports no unresolved references

#### Scenario: Sandbox still resolves external types via the shared solution
- **WHEN** the `customers` sandbox program (and its embedded baseLanguage bodies) reference external types
  after the stubs move out of `causeway.sandbox` into `causeway.stubs`
- **THEN** the types resolve and `./gradlew checkModels` is green

#### Scenario: Stub jars staged once
- **WHEN** `./gradlew checkModels` (or `generateModels`) runs
- **THEN** the build stages the three stub jars into the `causeway.stubs` solution's `libs/` and no other
  module carries a duplicate copy
