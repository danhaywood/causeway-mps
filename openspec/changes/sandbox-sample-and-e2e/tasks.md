# Tasks

Exercises `headless-mps-build`'s generate + compile steps. Depends on `causeway-generator-first-slice`
and `dsl-type-system`.

## 1. Sandbox stubs

> **Pulled forward (2026-06-17)** to unblock `causeway-generator-first-slice` (the generator templates
> must resolve Causeway/JPA annotation classifiers). Mechanism proven headlessly — see
> `docs/generator-template-authoring.md` and the build wiring.

- [~] 1.1 Import Causeway/Jakarta + `reference-app` as classpath stubs — **library stubs DONE, now via the shared solution**: the 3 library jars (`causeway-applib-3.6.0`, `jakarta.persistence-api-3.1.0`, `jakarta.inject-api-2.0.1`) were moved out of `causeway.sandbox` into the shared **`causeway.stubs`** solution (`shared-stubs-solution` change, 2026-06-20); the sandbox now **depends on** `causeway.stubs` (jars staged by `resolveStubs`). A bogus-jar differential earlier confirmed MPS actually consumes the path. These 3 jars cover every annotation in the golden. **Still deferred here**: the `reference-app` app-stub (provides `OrderService` for action *bodies*) — do it in §3 where body-coexistence is exercised (Maven module; only needed once a DSL action body exists).
- [ ] 1.2 Confirm external types (`OrderService`, Causeway services) resolve in a throwaway sandbox node — *needs a node referencing a stub type; comes with the sample program (§2). NB a broken stub path only **warns**, it does not fail `checkModels`, so this positive check matters.*

## 2. Sample DSL program

- [ ] 2.1 Author module `customers` with entity `Product`
- [ ] 2.2 Author entity `Customer`: `String name` property; `placeOrder(Product, int)` action whose body calls `OrderService`
- [ ] 2.3 `./gradlew checkModels` clean

## 3. End-to-end

- [ ] 3.1 `./gradlew generateModels`; diff output against golden `reference-app/src/main/java/customers/`
- [ ] 3.2 Compile generated sources + hand-written `app` on one classpath (reuse `reference-app` deps)
- [ ] 3.3 Confirm the generated `placeOrder` body referencing `OrderService` compiles (coexistence milestone)
- [ ] 3.4 (deferred) Boot a Causeway app context to verify runtime introspection under `ENCAPSULATION_ENABLED`
