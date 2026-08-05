## ADDED Requirements

### Requirement: Sandbox resolves exact external Java signatures via shared stubs
The `causeway.sandbox` solution SHALL obtain Causeway applib and Jakarta Persistence/Inject through the shared `causeway.stubs` solution rather than importing those jars directly.
The build SHALL expose an exact MPS-only signature artifact containing `app.OrderService` and the golden entity classifiers required by its concrete method descriptors.
The build SHALL separately expose an app-only support artifact to generated-Java compilation so golden `customers.Customer` and `customers.Product` classes are absent from that compilation classpath.
DSL programs and embedded BaseLanguage bodies SHALL resolve the exact external types and method signatures.

#### Scenario: Exact external types resolve in the sandbox
- **WHEN** the actual sandbox `placeOrder` action declares a typed `OrderService` injection and invokes `placeOrder(Customer, Product, int)` from its body
- **THEN** the injected classifier, concrete method declaration, and Causeway/Jakarta dependencies resolve without modelcheck errors

#### Scenario: Generated compilation excludes golden entities
- **WHEN** `compileGeneratedJava` assembles its application-support classpath
- **THEN** it includes `app.OrderService` but does not include golden `customers.Customer` or `customers.Product` classes

### Requirement: Causeway action expressions bridge to matching Java classifiers
The Causeway typesystem SHALL infer the type of each `ActionVariableReference` from its referenced declaration.
A reference to a `JavaType` declaration SHALL have the wrapped BaseLanguage type.
A reference to an entity-valued declaration or the containing mixee SHALL have the corresponding `EntityType`.
An `EntityType` SHALL satisfy a required Java `ClassifierType` only when the entity's generated FQN equals the classifier's qualified name.

#### Scenario: Embedded service invocation type-checks exactly
- **WHEN** `orderService.placeOrder(mixee, product, quantity)` is checked in the sandbox action body
- **THEN** `orderService` has Java type `app.OrderService`, the two entity arguments match `customers.Customer` and `customers.Product`, and `quantity` has Java type `int`

#### Scenario: A mismatched Java classifier remains invalid
- **WHEN** an entity-valued action reference is supplied where a different Java classifier is required
- **THEN** modelcheck reports an incompatible argument rather than treating the entity as `Object` or accepting it by name alone

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
