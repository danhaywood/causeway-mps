# Tasks

This change exercises the archived `headless-mps-build` pipeline as its production-order verification oracle.
The shared library stubs, action DSL, Causeway generator, and headless pipeline are complete prerequisites from archived changes.
Implement the remaining tasks one at a time and keep each implementation commit scoped to its task.

## 1. Application-support classpath

- [x] 1.1 Resolve Causeway 3.6.0, Jakarta Persistence 3.1.0, and Jakarta Inject 2.0.1 through the shared `causeway.stubs` solution, with jars staged by `resolveStubs`.
- [x] 1.2 Compile the complete golden reference app and establish the initial app-only `reference-app-stubs.jar` containing `app.OrderService`.
  `compileReferenceApp` compiles the complete golden source set, `referenceAppStubs` packages `app/**`, and `resolveStubs` stages the artifact into `causeway.stubs/libs`.
- [x] 1.3 Split reference-app output into an exact MPS-only signature JAR containing the complete compiled class set and an app-only support JAR used by `compileGeneratedJava`.
  Keep `reference-app-stubs.jar` at the existing `java_classes` model-root path for MPS, and ensure the generated-Java classpath uses only the app-only artifact.
- [x] 1.4 Verify that MPS resolves `app.OrderService`, `customers.Customer`, `customers.Product`, and the exact `placeOrder(Customer, Product, int)` method without stub-model errors.
  Verify separately that the app-only support JAR contains `app/OrderService.class` and no `customers/**` entries.

## 2. Causeway action-expression type bridge

- [x] 2.1 Add Causeway typesystem inference for `ActionVariableReference`.
  Unwrap `JavaType.javaType` for Java-valued parameters and injected services, retain `EntityType` for entity-valued parameters, and synthesize the containing entity's `EntityType` for the mixee reference.
- [ ] 2.2 Add an exact `EntityType`-to-`ClassifierType` compatibility rule based on equality between the entity's generated FQN and the Java classifier's qualified name.
  Do not use `Object`, simple-name-only matching, or a permissive fallback for mismatched classifiers.
- [ ] 2.3 Rebuild and reload the Causeway language, then validate focused positive and negative action-expression fixtures for Java unwrapping, matching entity classifiers, and mismatched entity classifiers.

## 3. Complete the sandbox sample

- [x] 3.1 Retain the existing `customers` model with `Product.price : int`, `Customer.name : String`, and the established nested and top-level probe actions.
- [ ] 3.2 Add nested action `Customer.placeOrder(Product product, int quantity)`, returning `Customer`, with typed `OrderService` injection and a body that calls `orderService.placeOrder(mixee, product, quantity)`.
- [ ] 3.3 Confirm the completed action resolves the typed injection, exact external method, entity arguments, primitive argument, and return expression without errors or unresolved references.

## 4. End-to-end verification

- [x] 4.1 Preserve the completed entity/property golden comparison and the current passing `./gradlew headlessBuild` baseline.
- [ ] 4.2 Compare the generated nested `Customer.placeOrder` mixin with the golden action section, covering its annotation, immutable `Params` carrier, typed service field, mixee constructor, `act` signature, and body call.
- [ ] 4.3 Run `./gradlew headlessBuild` from clean generated outputs and confirm bootstrap, generation, modelcheck, and generated-Java compilation all succeed with the split application-support classpath.
