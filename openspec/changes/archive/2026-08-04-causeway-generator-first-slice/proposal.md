## Why

The `causeway` language now has structure concepts but no generator — so it produces no Java. This
change builds the MPS generator that turns the modelled concepts into compilable, annotated Causeway
Java, matching the compile-verified golden idiom in `reference-app/`. This is the payoff of the whole
DSL: model the domain at altitude, generate the conventional boilerplate.

## What Changes

- Add MPS generator templates (in `causeway.generator`) mapping concepts → Causeway Java:
  - `Module` → Java package + `@Named` logical-type-name prefix.
  - `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class.
  - `Property` → a plain private JPA-annotated field (field-access) + an explicit private getter
    annotated `@Property` + `@Domain.Include` (no Lombok, no setter — read-only).
  - `Action` → a public `@Action(semantics=…)` method with parameters, return type, and the generated
    baseLanguage body.
  - `Type`: `EntityType` → the referenced entity's generated class name; `JavaType` → the wrapped Java type.
- Generation is strictly one-way (DSL → Java; generated sources never hand-edited).
- Verify headlessly: `./gradlew generateModels` produces Java that matches the golden reference and
  compiles against Causeway 3.6.0 + Jakarta.

## Capabilities

### New Capabilities
- `causeway-generation`: The MPS generator that emits compilable, annotated Causeway Java from the
  domain model, following the locked idiom, with output matching the golden `reference-app`.

### Modified Capabilities
<!-- None -->

## Impact

- **`causeway.generator`**: new templates (reduction rules / root mapping) for the concepts.
- **Depends on** `dsl-type-system` (needs `Type` union + `Action` body to generate field/param types and
  method bodies). Builds on the archived `dsl-domain-model` foundation.
- **Target**: `reference-app/src/main/java/customers/` golden classes (the compile-verified contract).
- **Verified** via `headless-mps-build`'s generate + the `reference-app` compile classpath.
- **Out of scope:** the sandbox sample program and end-to-end diff/compile (`sandbox-sample-and-e2e`);
  editability/setters, collections, view models, services, mixins, layouts.
