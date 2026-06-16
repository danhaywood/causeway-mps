## Why

The delivered foundation (`dsl-domain-model`) models `Property`/`Parameter` types as bare
references to `Entity`, and `Action` as just a name + parameters. To model real Causeway domain
objects we need (1) a proper **`Type` union** — either a reference to a DSL `Entity` or a wrapped
baseLanguage Java type (`String`, `BigDecimal`, hand-written classes) — and (2) **`Action` behavior**:
a return type, a `SemanticsOf` value, and a body that is **real embedded MPS baseLanguage**. The
embedded-Java body is the feature that justified choosing MPS over Xtext, so it is the centerpiece.

## What Changes

- Add a `Type` concept that is a union: an `EntityType` (reference to a DSL `Entity`, rename-safe) or
  a `JavaType` (wraps a baseLanguage type resolved via classpath stubs).
- Repoint `Property.type` and `Parameter.type` from a direct `Entity` reference to a `Type`.
- Extend `Action` with: a return `Type`, a `SemanticsOf` value (Causeway enum), and a `body` that is
  an embedded baseLanguage `StatementList` (real Java).
- Add constraints/typesystem: unique member names within an entity; `Type` references resolve.
- Capture the needed `InterfaceConceptDeclaration`, enum, and baseLanguage concept IDs via the
  one-time GUI technique, then author headlessly and validate with `./gradlew checkModels`.

## Capabilities

### New Capabilities
- `dsl-constraints`: Structural soundness rules — unique member names within an entity, and `Type`
  reference resolution (scoping/typesystem).

### Modified Capabilities
- `dsl-domain-model`: `Property`/`Parameter` types become a `Type` union; `Action` gains a return
  `Type`, `SemanticsOf`, and an embedded baseLanguage body; a `Type` concept is introduced.

## Impact

- **`causeway.structure`**: new `Type`/`EntityType`/`JavaType` concepts; `Action` extended; `Property`/`Parameter` repointed.
- **New language dependencies**: imports of `jetbrains.mps.baseLanguage` (for `StatementList`) and the
  Causeway `SemanticsOf` enum (via stubs) — captured once in the GUI, then authored headlessly.
- **`causeway.constraints` / `causeway.typesystem`** aspects gain rules.
- **Validated** headlessly via `./gradlew checkModels`. Editor: MPS default editors for v1.
- Depends on the archived `entity-property-action-slice` foundation. Feeds `causeway-generator-first-slice`.
