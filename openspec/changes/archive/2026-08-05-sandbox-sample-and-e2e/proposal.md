## Why

The project now has a generated Causeway action model and a reproducible headless build, but it has not yet proven that an embedded DSL action body can call hand-written application code.
This change closes that coexistence milestone through the existing `customers` sandbox program.

## What Changes

- Reuse the shared `causeway.stubs` solution for Causeway and Jakarta libraries, and split reference-app output into an exact MPS signature JAR and an app-only generated-Java support JAR.
- Add Causeway typesystem rules that infer custom action-variable references and bridge each DSL `EntityType` to the corresponding Java classifier when their generated FQNs match.
- Extend the existing `customers` sandbox program with `Customer.placeOrder(Product, int)`, typed `OrderService` injection, and a body that invokes the hand-written service.
- Correct the action template so a declared return type is generated on `act` while actions without a declared return type remain `void`.
- Compare the generated `placeOrder` mixin against the corresponding golden reference shape while preserving the existing sandbox probe actions.
- Run `./gradlew headlessBuild` so bootstrap, generation, modelcheck, and generated-Java compilation verify the complete coexistence path.

## Capabilities

### New Capabilities
<!-- None -->

### Modified Capabilities
- `java-classpath-interop`: Add application-support stubs, embedded action-body references to hand-written services, and generated/hand-written code sharing one compile classpath.

## Impact

- **`causeway.typesystem`**: infers `ActionVariableReference` types and bridges matching DSL entity and Java classifier types.
- **`causeway.generator`**: generates a declared action return type and retains `void` when the declaration is absent.
- **`causeway.sandbox`**: adds the sample `placeOrder` action and application-support stub dependency while retaining existing scope and generator probes.
- **`reference-app` and build wiring**: expose exact application signatures to MPS while keeping golden entity classes off the generated-Java compilation classpath.
- **Completed prerequisites**: `shared-stubs-solution`, `dsl-action-model`, `causeway-generator-first-slice`, and `headless-mps-build` are implemented and archived.
- **Verification**: focused type-system checks, a golden comparison, and `./gradlew headlessBuild` establish the compile-time coexistence milestone.
- **Out of scope**: Causeway runtime/UI boot, runtime introspection, and a general two-phase bootstrap for external code that has no precompiled entity-signature counterparts remain separate follow-ups.
