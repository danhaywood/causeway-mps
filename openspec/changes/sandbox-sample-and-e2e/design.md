## Context

`reference-app` proves the target Causeway idiom with a hand-written `app.OrderService` and golden `customers.Customer` and `customers.Product` classes.
The Causeway generator, action DSL, shared library stubs, and reproducible headless build are now implemented and archived.
The remaining boundary is to resolve `OrderService` inside an MPS action body and compile the generated body against that same hand-written service.

## Goals / Non-Goals

**Goals:** expose exact `app.OrderService` signatures to MPS, infer embedded action-variable types, bridge matching DSL entity and Java classifier types, add `Customer.placeOrder(Product, int)` to the existing sandbox fixture, compare its generated shape with the golden mixin, and pass `./gradlew headlessBuild`.

**Non-Goals:** changing the language structure or generator, replacing the existing sandbox probe actions, exact whole-file equality with the golden classes, a general two-phase bootstrap for external code without precompiled entity-signature counterparts, and Causeway runtime/UI boot or introspection.

## Decisions

**Keep library, MPS-signature, and generated-compilation artifacts distinct.** `causeway.sandbox` continues to obtain Causeway applib 3.6.0, Jakarta Persistence 3.1.0, and Jakarta Inject 2.0.1 through the shared `causeway.stubs` solution.
The staged `reference-app-stubs.jar` becomes an MPS-only exact signature artifact containing `app.OrderService` and the golden `customers` classifiers required to resolve its concrete method descriptors.
A separate app-only support JAR supplies `app/**` to `compileGeneratedJava`, so golden `customers.Customer` and `customers.Product` classes never enter the generated-Java compilation classpath.
The sandbox imports the `app@java_stub` model for the injected service while the golden customer classifiers serve only as referenced signature counterparts.

**Bridge custom action expressions to exact Java signatures.** BaseLanguage's `typeOf_VarRef` rule applies to its concrete `VariableReference`, not to Causeway's custom `ActionVariableReference` implementation of `IVariableReference`.
A Causeway inference rule therefore unwraps `JavaType` declarations and assigns `EntityType` to entity-valued parameters and the mixee.
A focused type-lattice rule accepts a DSL `EntityType` where a Java `ClassifierType` is required only when the entity's generated FQN equals the classifier's qualified name.
Mismatched classifiers remain errors, preserving exact argument checking rather than erasing parameters to `Object`.

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
- **The exact MPS signature artifact contains golden `customers` classifiers that duplicate generated FQNs** → use it only as an MPS model root, import only `app@java_stub` directly into the sandbox, and exclude it from `compileGeneratedJava`.
- **Generated output may not byte-match the golden because of formatting or retained probes** → compare the `placeOrder` structure and semantics rather than the whole file.
- **The external reference may not survive copying through the generator** → treat modelcheck and generated-Java compilation as separate mandatory gates.

## Resolved Java Type-Bridge Investigation

The initial app-only `reference-app-stubs.jar` exposed `app.OrderService` but left its concrete `Customer` and `Product` method parameters unresolved.
A controlled spike showed that an MPS-only JAR containing the complete reference-app class set exposes `app@java_stub` and `customers@java_stub`, and that `OrderService.placeOrder(Customer, Product, int)` then has no stub-model errors.
The same spike showed that the remaining out-of-scope method reference is caused by `ActionVariableReference` having no inference rule, rather than by the external method signature.

Adding an `Object` overload to the hand-written service and using an erased MPS-only stub were rejected because both weaken the modeled API.
The approved design retains the exact method descriptor, adds explicit Causeway expression inference, and bridges entity types only to same-FQN Java classifiers.
Generated action code remains fully typed and the hand-written `OrderService` remains unchanged.

The complete reference-app classes are acceptable only as fixture signature counterparts for MPS.
Projects whose external code depends solely on classifiers that do not yet exist in any compilable form still require a shared contract layer or a two-phase generation/bootstrap design outside this change.
