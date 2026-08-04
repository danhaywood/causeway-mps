# Tasks

This change exercises the archived `headless-mps-build` pipeline as its production-order verification oracle.
The shared library stubs, action DSL, Causeway generator, and headless pipeline are complete prerequisites from archived changes.
Implement the remaining tasks one at a time and keep each implementation commit scoped to its task.

## 1. Application-support classpath

- [x] 1.1 Resolve Causeway 3.6.0, Jakarta Persistence 3.1.0, and Jakarta Inject 2.0.1 through the shared `causeway.stubs` solution, with jars staged by `resolveStubs`.
- [ ] 1.2 Build and stage application-support output containing `app.OrderService` for both MPS type resolution and `compileGeneratedJava`, without importing the golden `customers.Customer` or `customers.Product` classifiers as MPS stubs.
- [ ] 1.3 Confirm the actual sandbox `placeOrder` action resolves typed `OrderService` injection and body references through the staged application-support output.
  Treat this as a positive resolution check because a broken stub path can warn without failing `checkModels`.

## 2. Complete the sandbox sample

- [x] 2.1 Retain the existing `customers` model with `Product.price : int`, `Customer.name : String`, and the established nested and top-level probe actions.
- [ ] 2.2 Add nested action `Customer.placeOrder(Product product, int quantity)`, returning `Customer`, with typed `OrderService` injection and a body that calls `orderService.placeOrder(mixee, product, quantity)`.
- [ ] 2.3 Run modelcheck for the completed sample and verify that the entity types, injected service, parameters, and external body call have no errors or unresolved references.

## 3. End-to-end verification

- [x] 3.1 Preserve the completed entity/property golden comparison and the current passing `./gradlew headlessBuild` baseline.
- [ ] 3.2 Compare the generated nested `Customer.placeOrder` mixin with the golden action section, covering its annotation, immutable `Params` carrier, typed service field, mixee constructor, `act` signature, and body call.
- [ ] 3.3 Run `./gradlew headlessBuild` from clean generated outputs and confirm bootstrap, generation, modelcheck, and generated-Java compilation all succeed with the application-support classpath.
