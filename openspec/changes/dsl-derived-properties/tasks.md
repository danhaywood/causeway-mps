## 1. Language Structure and Semantics

- [ ] 1.1 Verify the pinned Causeway 3.6 property-mixin contract, including `@Property`, the `prop()` main method, mixee construction, runtime facet metadata, and whether `@MemberSupport` belongs on the main method.
- [ ] 1.2 Add rootable and entity-nested `DerivedProperty` structure with a required result `Type`, embedded BaseLanguage getter body, injected services, and nested or explicit-target placement.
- [ ] 1.3 Add the `Entity.derivedProperties` containment and an editor projection that clearly distinguishes nested declarations from explicit-target roots.
- [ ] 1.4 Implement derived-property scope behavior so getter code sees only the exact target mixee and declared injected services through typed variable references.
- [ ] 1.5 Implement expected-result typing and diagnostics for missing types, void results, and incompatible returned expressions.
- [ ] 1.6 Implement placement and exact-target identity diagnostics, including nested/root derived-property collisions and persisted-property name collisions without treating action names as conflicts.

## 2. Causeway Property-Mixin Generation

- [ ] 2.1 Add generator query helpers for effective target, nested versus explicit-target placement, generated class naming, result-type mapping, and copied variable references.
- [ ] 2.2 Generate nested derived properties as public static `@Property` mixin classes with an explicit mixee field, constructor, and typed no-argument `prop()` method.
- [ ] 2.3 Generate explicit-target root derived properties as top-level `Entity_property` mixins in the declaring model package, including cross-model target types.
- [ ] 2.4 Copy authored getter bodies and injected services into generated mixins while mapping mixee and service references to their generated fields.
- [ ] 2.5 Ensure derived-property generation adds no JPA field, entity getter, setter, or other persistent state and does not change output for models without derived properties.

## 3. Fixtures and Verification

- [ ] 3.1 Add positive sandbox fixtures for nested and explicit-target derived properties returning representative Java and entity types.
- [ ] 3.2 Add a fixture whose getter references both its mixee and an injected service, plus a cross-model explicit-target fixture if a second model is required to prove package and target mapping.
- [ ] 3.3 Add negative `@tests` fixtures for invalid placement, a missing root target, missing or void result type, incompatible returns, and duplicate persisted or derived property identities.
- [ ] 3.4 Extend generated-source verification for class placement, annotations, constructors, `prop()` signatures, copied bodies, service injection, cross-model types, and absence of persistent state.
- [ ] 3.5 Extend Java 21 compilation and runtime verification to confirm that Causeway discovers nested and top-level generated classes as property mixins with the expected mixee, member id, and main method.
- [ ] 3.6 Confirm existing persisted-property and action generated-source and runtime checks remain unchanged and passing.

## 4. Documentation and Validation

- [ ] 4.1 Document derived-property syntax, placement, result typing, scope, generated Causeway shape, identity rules, and deferred access sugar.
- [ ] 4.2 Refresh the project-local Causeway DSL skill with the new concept, sandbox references, reusable blueprints, authoring workflow, and generation or typing gotchas.
- [ ] 4.3 Run focused positive and negative MPS checks and confirm every changed structure, editor, behavior, constraints, typesystem, generator, sandbox, and test root has no unexpected problems.
- [ ] 4.4 Run `./gradlew headlessBuild --no-daemon --stacktrace` with pinned JDK 21 and JDK 25 toolchains and confirm generation, model checking, Java compilation, existing verification, and property-mixin runtime verification succeed.
- [ ] 4.5 Run strict OpenSpec validation and confirm the derived-property and Causeway-generation deltas remain coherent with the verified implementation.
