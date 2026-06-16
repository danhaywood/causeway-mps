# Tasks

Exercises `headless-mps-build`'s generate + compile steps. Depends on `causeway-generator-first-slice`
and `dsl-type-system`.

## 1. Sandbox stubs

- [ ] 1.1 Import Causeway applib 3.6.0 + Jakarta Persistence/Inject + `reference-app` into `causeway.sandbox` as classpath stubs
- [ ] 1.2 Confirm external types (`OrderService`, Causeway services) resolve in a throwaway sandbox node

## 2. Sample DSL program

- [ ] 2.1 Author module `customers` with entity `Product`
- [ ] 2.2 Author entity `Customer`: `String name` property; `placeOrder(Product, int)` action whose body calls `OrderService`
- [ ] 2.3 `./gradlew checkModels` clean

## 3. End-to-end

- [ ] 3.1 `./gradlew generateModels`; diff output against golden `reference-app/src/main/java/customers/`
- [ ] 3.2 Compile generated sources + hand-written `app` on one classpath (reuse `reference-app` deps)
- [ ] 3.3 Confirm the generated `placeOrder` body referencing `OrderService` compiles (coexistence milestone)
- [ ] 3.4 (deferred) Boot a Causeway app context to verify runtime introspection under `ENCAPSULATION_ENABLED`
