# Tasks

Exercises `headless-mps-build`'s generate, modelcheck, and compile stages.
Use `./gradlew headlessBuild` as the verification oracle so the MPS bootstrap, generation, modelcheck, and generated-Java compilation run in production order.
This is the current home of the historical `entity-property-action-slice` tasks 5.3–5.5 after that change was re-sliced and archived.
It depends on `causeway-generator-first-slice` and `dsl-type-system`.

## 1. Sandbox stubs

> **Pulled forward (2026-06-17)** to unblock `causeway-generator-first-slice` (the generator templates
> must resolve Causeway/JPA annotation classifiers). Mechanism proven headlessly — see
> `docs/generator-template-authoring.md` and the build wiring.

- [~] 1.1 Import Causeway/Jakarta + `reference-app` as classpath stubs — **library stubs DONE, now via the shared solution**: the 3 library jars (`causeway-applib-3.6.0`, `jakarta.persistence-api-3.1.0`, `jakarta.inject-api-2.0.1`) were moved out of `causeway.sandbox` into the shared **`causeway.stubs`** solution (`shared-stubs-solution` change, 2026-06-20); the sandbox now **depends on** `causeway.stubs` (jars staged by `resolveStubs`). A bogus-jar differential earlier confirmed MPS actually consumes the path. These 3 jars cover every annotation in the golden. **Still deferred here**: the `reference-app` app-stub (provides `OrderService` for action *bodies*) — do it in §3 where body-coexistence is exercised (Maven module; only needed once a DSL action body exists).
- [ ] 1.2 Confirm external types (`OrderService`, Causeway services) resolve in a throwaway sandbox node — *needs a node referencing a stub type; comes with the sample program (§2). NB a broken stub path only **warns**, it does not fail `checkModels`, so this positive check matters.*

## 2. Sample DSL program

- [x] 2.1 Author module/model `customers` with entity `Product` — DONE during `causeway-generator-first-slice`; `Product.price : int` also exercises non-`String` Java type flow.
- [~] 2.2 Author entity `Customer`: entity and `String name` property DONE during `causeway-generator-first-slice`; `placeOrder(Product, int)` and its `OrderService` body remain deferred until `dsl-action-model` supplies action-body scoping.
- [x] 2.3 `./gradlew headlessBuild` clean — DONE for the current `customers` entity-state sandbox; repeat the same pipeline after adding the action body.

## 3. End-to-end

- [~] 3.1 `./gradlew headlessBuild` owns generation; entity-state generation and golden diff were completed during `causeway-generator-first-slice`, while the action-aware golden comparison remains explicit work here.
- [~] 3.2 The pipeline's `compileGeneratedJava` stage compiles generated `Customer.java` and `Product.java` against `causeway.stubs/libs/*`; adding the hand-written app to that classpath remains open until the generated action references `OrderService`.
- [ ] 3.3 Add the `placeOrder`/`OrderService` fixture, then use `./gradlew headlessBuild` to confirm the generated external-type body compiles end to end (coexistence milestone).
- [ ] 3.4 (deferred) Boot a Causeway app context to verify runtime introspection under `ENCAPSULATION_ENABLED`
