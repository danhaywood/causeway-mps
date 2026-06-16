## Why

The generator (once built) needs to be exercised by a real DSL program, and the project's central bet —
that embedded action bodies can call into hand-written Causeway code on a shared classpath — must be
proven end-to-end. This change wires the `causeway.sandbox` solution to the Causeway + app stubs,
authors the `customers` sample DSL program, and runs the full generate → diff → compile loop, closing
the coexistence milestone.

## What Changes

- Import the Causeway applib + Jakarta Persistence/Inject + the hand-written `reference-app` into
  `causeway.sandbox` as Java classpath **stubs**, so DSL programs and their embedded baseLanguage bodies
  can reference those external types.
- Author a sample DSL program in `causeway.sandbox`: module `customers`, entity `Customer` with a
  `String name` property and a `placeOrder(Product, int)` action whose body calls the hand-written
  `OrderService` (the coexistence milestone).
- Run end-to-end: generate the sandbox, diff the output against the golden `reference-app` classes,
  compile the generated Java together with the hand-written app on one classpath.
- (Deferred check) boot a Causeway app context to confirm the metamodel introspects the generated
  classes under `ENCAPSULATION_ENABLED` (compile-time has been proven; runtime has not).

## Capabilities

### New Capabilities
- `java-classpath-interop`: Coexistence with hand-written Java — importing the Causeway API and app as
  classpath stubs so embedded action bodies reference external types, with strictly one-way generation
  and generated/hand-written code sharing one classpath.

### Modified Capabilities
<!-- None -->

## Impact

- **`causeway.sandbox`**: stub/library dependencies + the first DSL program.
- **`headless-mps-build`**: this change exercises its generate + compile steps (tasks 2.4, 3.x).
- **Depends on** `causeway-generator-first-slice` (needs the generator) and `dsl-type-system` (the sample
  uses a `JavaType String`, an `EntityType Product`, and an `Action` body).
- **Verified** via the headless build; the action-body-calls-`OrderService` compile is the milestone.
- **Out of scope:** runtime/UI behavior beyond the deferred introspection smoke check; further slices.
