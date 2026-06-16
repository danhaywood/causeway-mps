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

- [ ] 3.1 Constraint: unique member names within an entity (properties; actions)
- [ ] 3.2 Typesystem/scoping: `EntityType`/`JavaType` references resolve; unresolved → error
- [ ] 3.3 Validate headlessly (deliberately-broken model fails; clean model passes)
