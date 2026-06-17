# Tasks

Exercises `headless-mps-build`'s generate + compile steps. Depends on `causeway-generator-first-slice`
and `dsl-type-system`.

## 1. Sandbox stubs

> **Pulled forward (2026-06-17)** to unblock `causeway-generator-first-slice` (the generator templates
> must resolve Causeway/JPA annotation classifiers). Mechanism proven headlessly — see
> `docs/generator-template-authoring.md` and the build wiring.

- [~] 1.1 Import Causeway/Jakarta + `reference-app` into `causeway.sandbox` as classpath stubs — **library stubs DONE**: `causeway.sandbox.msd` declares a `java_classes` modelRoot over `${module}/libs` holding `causeway-applib-3.6.0`, `jakarta.persistence-api-3.1.0`, `jakarta.inject-api-2.0.1`; a `resolveSandboxStubs` Gradle task (config `sandboxStubs`, `isTransitive=false`) stages them there (git-ignored), and `checkModels`/`generateModels` depend on it. `./gradlew checkModels` green from clean; a bogus-jar differential confirmed MPS actually consumes the path (missing→`could not find the virtual file` warning; real jar→clean). These 3 jars cover every annotation in the golden. **Deferred**: the `reference-app` app-stub (provides `OrderService` for action *bodies*) — do it here in §3 where the body-coexistence is exercised (it's a Maven module; only needed once a DSL action body exists).
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
