## Context

`dsl-domain-model` (canonical, archived) provides `Module`/`Entity`/`Property`/`Action`/`Parameter`
with `type` as a bare `Entity` reference and `Action` as name + parameters. This change completes the
structure aspect. Authoring is headless (`spike-headless-authoring` verdict: GO), validated by
`./gradlew checkModels`; new languages' concept IDs are captured once via the GUI.

## Goals / Non-Goals

**Goals:** a `Type` union; `Action` return type + `SemanticsOf` + embedded baseLanguage body; unique
member-name constraint; `Type` reference resolution. All modelcheck-clean.

**Non-Goals:** the generator (separate change); the sandbox sample/e2e (separate change); a custom
expression language (we embed real Java); editor authoring (default editors).

## Decisions

**`Type` is a union via an interface concept.** `Type` is an `InterfaceConceptDeclaration`; `EntityType`
(reference → `Entity`) and `JavaType` (wraps a baseLanguage type) implement it. `Property.type`,
`Parameter.type`, and `Action.returnType` are children of type `Type`. Rationale: intra-model entity
references stay rename-safe (node references), while `JavaType` reaches arbitrary Java via stubs —
matching the locked design. Alternative (two separate optional references) was rejected as less uniform.

**`Action.body` is an embedded baseLanguage `StatementList`.** A child of MPS's
`jetbrains.mps.baseLanguage.StatementList`. This is the marquee capability; it requires importing
baseLanguage into the structure/used languages. The body resolves external types via the sandbox's
classpath stubs (proven in `reference-app`).

**`SemanticsOf` as an enum reference.** `Action.semantics` references the Causeway `SemanticsOf` enum
constants (via stub). If referencing the live enum proves awkward in structure, fall back to a local
enum-data-type mirror — decided during implementation against the oracle.

**Capture IDs once via the GUI.** `InterfaceConceptDeclaration`, the baseLanguage `StatementList`
concept, and the enum reference need IDs not yet in hand. Per the spike technique: reference each once
in MPS, save, read the IDs, then author headlessly.

## Risks / Trade-offs

- **baseLanguage embedding in structure may need extra used-language/devkit wiring** → capture the exact
  imports from a GUI-created reference node; iterate against `checkModels`.
- **`SemanticsOf` enum referencing** → fallback to a local enum mirror if the stub reference is awkward.
- **Constraint/typesystem aspects are new ground for headless authoring** → start with the simplest
  (unique-name constraint), validate, then add scoping.
