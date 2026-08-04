## ADDED Requirements

### Requirement: Sandbox resolves external Java via shared stubs
The `causeway.sandbox` solution SHALL obtain Causeway applib and Jakarta Persistence/Inject through the shared `causeway.stubs` solution rather than importing those jars directly.
The build SHALL additionally expose application-support classes containing `app.OrderService` to MPS without importing the golden `customers.Customer` or `customers.Product` classifiers as stubs.
DSL programs and embedded BaseLanguage bodies SHALL resolve those external types.

#### Scenario: External types resolve in the sandbox
- **WHEN** the actual sandbox `placeOrder` action declares a typed `OrderService` injection and invokes that service from its body
- **THEN** `OrderService`, Causeway services, and Causeway/Jakarta annotations resolve as BaseLanguage types without modelcheck errors

### Requirement: Sample DSL program
The `causeway.sandbox` SHALL retain its existing `customers` fixture and SHALL add a nested `Customer.placeOrder(Product, int)` action with typed `OrderService` injection and a body that calls the hand-written service.

#### Scenario: Sample program model-checks
- **WHEN** `./gradlew checkModels` runs with the completed sample program present
- **THEN** modelcheck reports no errors for the entity types, injected service, action parameters, or action body

### Requirement: End-to-end generate, match golden, and compile
Generating the sandbox SHALL produce a `Customer.placeOrder` mixin that matches the corresponding golden `reference-app` structure and semantics.
The generated Java SHALL compile against Causeway, Jakarta, and the hand-written application-support code on one classpath.

#### Scenario: End-to-end compile succeeds
- **WHEN** `./gradlew headlessBuild` runs with the completed sandbox fixture and application-support classes
- **THEN** the generated `placeOrder` shape matches the golden mixin and generated-Java compilation succeeds with no errors

### Requirement: Embedded action body references external code
The generated body of an `Action` SHALL preserve references to hand-written external code and SHALL compile those references on the shared classpath.

#### Scenario: Generated body calls a hand-written service
- **WHEN** the `placeOrder` action's body calls `OrderService` and is generated into the nested `Customer.placeOrder` mixin's `act` method
- **THEN** the generated method invokes the typed service and compiles against `app.OrderService` on the shared classpath
