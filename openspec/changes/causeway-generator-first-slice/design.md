## Context

The structure concepts exist and validate headlessly; `reference-app/` holds the compile-verified
golden Java the generator must reproduce. MPS generators are themselves models (templates in
`jetbrains.mps.lang.generator`, mixing baseLanguage). Authoring is headless where feasible, validated by
`./gradlew generateModels` then compiling the output against Causeway.

## Goals / Non-Goals

**Goals:** templates for `Module`/`Entity`/`Property`/`Action`/`Type` producing the golden idiom;
generated Java compiles; `./gradlew generateModels` is green.

**Non-Goals:** the sandbox sample + e2e wiring (separate change); editability/collections/services/
mixins/layouts; runtime introspection verification (that's the e2e change).

## Decisions

**Target the golden `reference-app` output exactly.** The generator's correctness oracle is a diff
against `reference-app/src/main/java/customers/` plus a compile. Rationale: the idiom is already
compile-verified against real Causeway, so "matches golden + compiles" is a precise, trustworthy target.

**Root mapping rule per `Module`/`Entity`.** Each `Entity` maps to one generated class (root template);
`Property`/`Action` are reduction rules within it. `Module` provides the package + `@Named` prefix.

**Generator authoring may need the MPS GUI more than structure did.** Generator templates are richer
models (template language + baseLanguage). The spike proved structure authoring headless; templates are
the next test. Approach: capture template fragments via the GUI where hand-XML is impractical, but keep
the headless generate+compile loop as the oracle. Honestly flag if any template step requires the GUI.

**`Action` body generation copies the embedded baseLanguage through.** The modelled `StatementList`
becomes the generated method body; external references resolve via the shared classpath.

## Risks / Trade-offs

- **Generator templates may be hard to author headlessly** (richer than structure) → use the GUI for
  template fragments if needed; the generate+compile loop still validates. Record what needed the GUI.
- **Output drift from the golden idiom** → diff every generated file against `reference-app`; treat any
  delta as a failure to investigate.
- **baseLanguage body round-trip** → verify a body that calls an external service generates valid Java
  (ties to `sandbox-sample-and-e2e`).
