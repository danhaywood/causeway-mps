## Context

`reference-app` proves the target Causeway idiom with a hand-written `app.OrderService` and golden `customers.Customer` and `customers.Product` classes.
The Causeway generator, action DSL, shared library stubs, and reproducible headless build are now implemented and archived.
The remaining boundary is to resolve `OrderService` inside an MPS action body and compile the generated body against that same hand-written service.

## Goals / Non-Goals

**Goals:** expose `app.OrderService` to MPS and generated Java, add `Customer.placeOrder(Product, int)` to the existing sandbox fixture, compare its generated shape with the golden mixin, and pass `./gradlew headlessBuild`.

**Non-Goals:** changing the language structure or generator, replacing the existing sandbox probe actions, exact whole-file equality with the golden classes, and Causeway runtime/UI boot or introspection.

## Decisions

**Keep library and application stubs distinct.** `causeway.sandbox` continues to obtain Causeway applib 3.6.0, Jakarta Persistence 3.1.0, and Jakarta Inject 2.0.1 through the shared `causeway.stubs` solution.
Build wiring additionally stages application-support output containing `app.OrderService` for MPS type resolution and generated-Java compilation.
The golden `customers.Customer` and `customers.Product` classes are not imported as MPS stubs because the sandbox defines those same classifiers.

**Extend rather than replace the sandbox fixture.** The existing `Customer`, `Product`, `scopeProbe`, and top-level probe remain in place because they carry prior generator and scoping coverage.
The new nested `Customer.placeOrder` action adds typed `OrderService` injection and invokes `orderService.placeOrder(mixee, product, quantity)` from its action body.

**Compare the action shape, not the whole generated file.** Existing probe actions make byte-for-byte comparison of the complete generated `Customer.java` with the golden class neither possible nor desirable.
Verification compares the generated `Customer.placeOrder` mixin's annotation, immutable `Params` carrier, typed injected service, mixee constructor, method signature, and body call with the corresponding golden section.
Formatting and unrelated probe output are ignored.

**Use one production-order verification oracle.** `./gradlew headlessBuild` bootstraps the language, generates the sandbox, runs modelcheck, and compiles generated Java against the Causeway, Jakarta, and application-support classpath.
A successful run is the compile-time coexistence milestone.

**Keep runtime introspection separate.** Booting a Causeway application context under `ENCAPSULATION_ENABLED` requires runtime assembly beyond this classpath-interoperability change and remains a follow-up.

## Risks / Trade-offs

- **MPS may only warn when an application stub path is broken** → validate `OrderService` through an actual typed sandbox reference and confirm generated-Java compilation.
- **Importing the complete golden application could introduce duplicate `customers` classifiers** → stage only application-support classes such as `app.OrderService`.
- **Generated output may not byte-match the golden because of formatting or retained probes** → compare the `placeOrder` structure and semantics rather than the whole file.
- **The external reference may not survive copying through the generator** → treat modelcheck and generated-Java compilation as separate mandatory gates.

## Discovered Java Type-Bridge Blocker

The staged `reference-app-stubs.jar` and its `java_classes` model root successfully expose `app.OrderService` to MPS.
Its concrete `placeOrder(customers.Customer, customers.Product, int)` signature nevertheless remains unresolved because the JAR intentionally omits the golden `customers.Customer` and `customers.Product` classifiers.
Those classifiers are produced only after MPS generation, while modelcheck needs them beforehand to validate the external call, creating a circular dependency.

Adding an `Object` overload to the hand-written service was considered and rejected because it would permanently weaken the application API even though the generated action itself would remain typed.
A separate MPS-only erased-signature stub JAR would isolate that workaround from application and generated code, but it would also weaken MPS argument-type verification and has not been adopted.

The preferred long-term solution is a shared contract layer whose stable Java interfaces are visible to MPS, whose interfaces are implemented by generated entities, and whose compatibility is represented by the Causeway DSL typesystem.
This is a medium-to-large follow-up because it affects contracts, `EntityType` compatibility, generation, modelcheck, and tests.
Retaining the exact concrete `Customer` and `Product` service signature instead would require a more complex two-phase generation and bootstrap pipeline.

Task 2.2 was rolled back after proving this blocker, so the sandbox model remains free of the incomplete `placeOrder` action.
The change must choose and specify a type-bridge strategy before tasks 1.3, 2.2, and 2.3 can be completed honestly.
