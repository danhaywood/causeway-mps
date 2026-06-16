# Tasks

Authored headlessly; each step validated with `./gradlew checkModels`. New languages' concept IDs
captured once via the GUI (the spike technique), then edited as XML.

## 1. Type union

- [ ] 1.1 Capture `InterfaceConceptDeclaration` id pattern once via GUI (reference it + save)
- [ ] 1.2 Author `Type` interface concept + `EntityType` (reference → Entity) + `JavaType` (wraps a baseLanguage type)
- [ ] 1.3 Repoint `Property.type` and `Parameter.type` from direct Entity ref to a `Type` child
- [ ] 1.4 Validate headlessly (modelcheck clean)

## 2. Action behavior (incl. embedded baseLanguage)

- [ ] 2.1 Capture the baseLanguage `StatementList` concept id + the used-language/devkit imports from a GUI reference node
- [ ] 2.2 Add `Action.returnType` (`Type`) and `Action.body` (embedded baseLanguage `StatementList`)
- [ ] 2.3 Add `Action.semantics` referencing Causeway `SemanticsOf` (enum stub; fall back to a local enum mirror if needed)
- [ ] 2.4 Validate headlessly; confirm a body can reference an external (stubbed) type

## 3. Constraints & typesystem

- [ ] 3.1 Constraint: unique member names within an entity (properties; actions)
- [ ] 3.2 Typesystem/scoping: `EntityType`/`JavaType` references resolve; unresolved → error
- [ ] 3.3 Validate headlessly (deliberately-broken model fails; clean model passes)
