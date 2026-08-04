## Why

The project now has a generated Causeway action model and a reproducible headless build, but it has not yet proven that an embedded DSL action body can call hand-written application code.
This change closes that coexistence milestone through the existing `customers` sandbox program.

## What Changes

- Reuse the shared `causeway.stubs` solution for Causeway and Jakarta libraries, and add application-support stubs from `reference-app` so embedded BaseLanguage bodies can resolve `OrderService`.
- Extend the existing `customers` sandbox program with `Customer.placeOrder(Product, int)`, typed `OrderService` injection, and a body that invokes the hand-written service.
- Compare the generated `placeOrder` mixin against the corresponding golden reference shape while preserving the existing sandbox probe actions.
- Run `./gradlew headlessBuild` so bootstrap, generation, modelcheck, and generated-Java compilation verify the complete coexistence path.

## Capabilities

### New Capabilities
<!-- None -->

### Modified Capabilities
- `java-classpath-interop`: Add application-support stubs, embedded action-body references to hand-written services, and generated/hand-written code sharing one compile classpath.

## Impact

- **`causeway.sandbox`**: adds the sample `placeOrder` action and application-support stub dependency while retaining existing scope and generator probes.
- **`reference-app` and build wiring**: expose the hand-written `OrderService` to MPS type resolution and generated-Java compilation without generating into the hand-written sources.
- **Completed prerequisites**: `shared-stubs-solution`, `dsl-action-model`, `causeway-generator-first-slice`, and `headless-mps-build` are implemented and archived.
- **Verification**: a focused golden comparison plus `./gradlew headlessBuild` establishes the compile-time coexistence milestone.
- **Out of scope**: Causeway runtime/UI boot and introspection remain a separate follow-up.
