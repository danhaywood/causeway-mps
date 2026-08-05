## 1. Runtime Verification Harness

- [ ] 1.1 Add a Java 21 verification source set and a separate Causeway 3.6 core-metamodel dependency configuration without changing generated application runtime dependencies.
- [ ] 1.2 Add a reusable verifier that processes a generated class through `MetaModelContext_forTesting` and obtains its `MixinFacet`.
- [ ] 1.3 Verify the generated nested `Customer.placeOrder` class has mixee type `Customer`, main method `act`, member id `placeOrder`, and a working mixee constructor.
- [ ] 1.4 Verify the generated top-level `Customer_topLevelProbe` class has mixee type `Customer`, main method `act`, member id `topLevelProbe`, and a working mixee constructor.
- [ ] 1.5 Add a deliberately invalid action-mixin fixture or equivalent negative assertion that proves incompatible metadata, main method, or constructor shape is rejected.

## 2. Headless Pipeline Integration

- [ ] 2.1 Add a `verifyGeneratedMixins` task that depends on generated Java compilation and runs the verifier with generated classes, application support, and Causeway metamodel dependencies on its classpath.
- [ ] 2.2 Make `headlessBuild` depend on `verifyGeneratedMixins` after `compileGeneratedJava` while preserving fail-fast bootstrap, generation, modelcheck, and compilation ordering.
- [ ] 2.3 Document the runtime mixin verification stage and its narrower scope compared with a full Causeway Spring application startup.

## 3. Verification

- [ ] 3.1 Run the focused verifier and confirm both generated action forms satisfy the Causeway 3.6 mixin contract.
- [ ] 3.2 Run the negative fixture or deliberate failure probe and confirm invalid mixin output fails verification.
- [ ] 3.3 Run `./gradlew headlessBuild --no-daemon --stacktrace` with the pinned JDKs and confirm the complete pipeline succeeds.
- [ ] 3.4 Run strict OpenSpec validation and confirm the promoted `causeway-generation` delta remains coherent with the generated golden shape.
