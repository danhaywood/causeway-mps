# Tasks

Authored headlessly; each step validated with `./gradlew checkModels`. New languages' concept IDs
captured once via the GUI (the spike technique), then edited as XML.

## 1. Type union

- [x] 1.1 Capture `InterfaceConceptDeclaration` (`PlHQZ`) + baseLanguage wiring via GUI — DONE. Also added `jetbrains.mps.baseLanguage` as a `causeway` language dependency (the embedding milestone); baseLanguage `Type` = `tpee:fz3vP1H`.
- [x] 1.2 Author `Type` (interface) + `EntityType` (reference → Entity) + `JavaType` (child → baseLanguage `Type`) — DONE
- [x] 1.3 Repoint `Property.type` and `Parameter.type` to a `Type` child — DONE
- [x] 1.4 Validate headlessly — DONE: `./gradlew checkModels` BUILD SUCCESSFUL, 0 errors

## 2. Action behavior (incl. embedded baseLanguage)

- [ ] 2.1 Capture the baseLanguage `StatementList` concept id + the used-language/devkit imports from a GUI reference node
- [ ] 2.2 Add `Action.returnType` (`Type`) and `Action.body` (embedded baseLanguage `StatementList`)
- [ ] 2.3 Add `Action.semantics` referencing Causeway `SemanticsOf` (enum stub; fall back to a local enum mirror if needed)
- [ ] 2.4 Validate headlessly; confirm a body can reference an external (stubbed) type

## 3. Constraints & typesystem

- [ ] 3.1 Constraint: unique member names within an entity (properties; actions)
- [ ] 3.2 Typesystem/scoping: `EntityType`/`JavaType` references resolve; unresolved → error
- [ ] 3.3 Validate headlessly (deliberately-broken model fails; clean model passes)
