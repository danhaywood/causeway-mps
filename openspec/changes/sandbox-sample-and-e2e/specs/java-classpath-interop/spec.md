## ADDED Requirements

### Requirement: Sandbox resolves external Java via the shared stubs solution
The `causeway.sandbox` solution SHALL obtain the Causeway applib + Jakarta Persistence/Inject as Java
classpath stubs by depending on the shared `causeway.stubs` solution (see the `Shared classpath-stubs
solution` requirement) rather than importing the jars itself, and SHALL additionally import the
hand-written `reference-app` so embedded baseLanguage bodies can reference that external code. DSL programs
and their bodies SHALL then resolve those external types.

#### Scenario: External types resolve in the sandbox
- **WHEN** the sandbox depends on `causeway.stubs` (and on the `reference-app` app-stub)
- **THEN** types like `OrderService` and Causeway services/annotations resolve as baseLanguage types in
  sandbox models

### Requirement: Sample DSL program
The `causeway.sandbox` SHALL contain a sample program: module `customers`, entity `Customer` with a
`String name` property and a `placeOrder(Product, int)` action whose body calls the hand-written
`OrderService`, plus entity `Product`.

#### Scenario: Sample program model-checks
- **WHEN** `./gradlew checkModels` runs with the sample program present
- **THEN** modelcheck reports no errors

### Requirement: End-to-end generate, match golden, and compile
Generating the sandbox SHALL produce Java that matches the golden `reference-app` classes and, together
with the hand-written app on one classpath, compiles against Causeway + Jakarta.

#### Scenario: End-to-end compile succeeds
- **WHEN** the sandbox is generated and compiled with the hand-written `app` code on a shared classpath
- **THEN** generation matches the golden output and compilation succeeds with no errors

### Requirement: Embedded action body references external code (coexistence milestone)
The generated body of an `Action` SHALL be able to reference and invoke hand-written external code, and
that SHALL compile on the shared classpath.

#### Scenario: Generated body calls a hand-written service
- **WHEN** the `placeOrder` action's body calls `OrderService` and is generated (into the
  `Customer_placeOrder` mixin's `act` method)
- **THEN** the generated mixin compiles against `OrderService` on the shared classpath
