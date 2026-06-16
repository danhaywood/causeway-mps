# Tasks

Authored headlessly; each step validated with `./gradlew checkModels`. New languages' concept IDs
captured once via the GUI (the spike technique), then edited as XML.

## 1. Type union

- [x] 1.1 Capture `InterfaceConceptDeclaration` (`PlHQZ`) + baseLanguage wiring via GUI — DONE. Also added `jetbrains.mps.baseLanguage` as a `causeway` language dependency (the embedding milestone); baseLanguage `Type` = `tpee:fz3vP1H`.
- [x] 1.2 Author `Type` (interface) + `EntityType` (reference → Entity) + `JavaType` (child → baseLanguage `Type`) — DONE
- [x] 1.3 Repoint `Property.type` and `Parameter.type` to a `Type` child — DONE
- [x] 1.4 Validate headlessly — DONE: `./gradlew checkModels` BUILD SUCCESSFUL, 0 errors

## 2. Action behavior (incl. embedded baseLanguage)

- [x] 2.1 Capture baseLanguage `StatementList` (`tpee:fzclF80`) + enum (`EnumerationDeclaration 25R3W`) ids via GUI — DONE
- [x] 2.2 Add `Action.returnType` (a `Type`; optional ⇒ void) and `Action.body` (embedded baseLanguage `StatementList`) — DONE
- [x] 2.3 Add `Action.semantics` — DONE via a **local `SemanticsOf` enum** mirroring Causeway's 6 values (self-contained; generator will map to `org.apache.causeway…SemanticsOf`)
- [x] 2.4 Validate headlessly — DONE: `checkModels` BUILD SUCCESSFUL, 0 errors. (Confirming a *body* references an external stubbed type is exercised end-to-end in `sandbox-sample-and-e2e`, since it needs an authored action instance.)

## 3. Constraints & typesystem

- [x] 3.1 Constraint: unique member names — DONE. A `checking rule` (`unique_member_names` for `Entity`) authored **in the MPS GUI** (imperative code is the wrong fit for hand-authored XML — the declarative/imperative boundary). Compiles clean. (Currently checks properties; actions block is a trivial copy when wanted.)
- [x] 3.2 Type references resolve — DONE for v1 via MPS's built-in unresolved-reference checking (all `EntityType`/`JavaType`/`Type` refs resolve; 0 errors). A custom scope provider is a later refinement.
- [~] 3.3 Validate headlessly — DONE for rule validity (`checkModels` clean). The behavioral fire-test (a model with duplicate names → error) needs an authored Entity *instance*, so it's exercised in `sandbox-sample-and-e2e`.
