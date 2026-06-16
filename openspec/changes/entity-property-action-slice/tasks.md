## 1. De-risk classpath-stub interop (do first)

- [ ] 1.1 Add Causeway applib API and Jakarta Persistence to the `causeway.sandbox` solution as Java classpath stubs
- [ ] 1.2 Add a minimal hand-written sample application (one domain service / class) on the sandbox classpath as a stub
- [ ] 1.3 Prove the milestone: in a throwaway baseLanguage node in the sandbox, reference an external Causeway type and the hand-written class and confirm both resolve
- [ ] 1.4 Document the exact stub/classpath/library setup so it is reproducible

## 2. Structure concepts (causeway.structure)

- [ ] 2.1 Add `Module` root concept (`INamedConcept`) with an `entities` child collection
- [ ] 2.2 Add `Entity` root concept (`INamedConcept`) with `properties` and `actions` child collections
- [ ] 2.3 Add `Type` union concept: alternative of an `Entity` reference vs a wrapped baseLanguage type
- [ ] 2.4 Add `Property` concept with `name` and a `Type`
- [ ] 2.5 Add `Parameter` concept with `name` and a `Type`
- [ ] 2.6 Add `Action` concept with `parameters`, return `Type`, `SemanticsOf` value, and an embedded baseLanguage `StatementList` body

## 3. Constraints, typesystem & editor

- [ ] 3.1 Constraint: member names unique within an entity (properties and actions)
- [ ] 3.2 Typesystem/scoping: `Type` entity-reference resolves to an `Entity` node; baseLanguage-type alternative resolves via stubs
- [ ] 3.3 Editor: projectional editors for `Module`, `Entity`, `Property`, `Action` (including inline baseLanguage body)

## 4. Generator (causeway.generator)

- [ ] 4.1 Template: `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class
- [ ] 4.2 Template: `Property` → plain private JPA-annotated field (field-access) + explicit `@Property @Domain.Include` private getter, no Lombok, no setter
- [ ] 4.3 Template: `Action` → public `@Action(semantics=…)` method with parameters, return type, and the generated baseLanguage body
- [ ] 4.4 Resolve `Type` entity references to the generated class name; resolve baseLanguage types directly

## 5. End-to-end verification

- [ ] 5.1 Author a sample DSL program in `causeway.sandbox`: module `customers`, entity `Customer` with a `String name` property and a `placeOrder` action whose body calls into the hand-written sample app
- [ ] 5.2 Generate and confirm the output matches the locked idiom (annotations, field+getter, action method)
- [ ] 5.3 Compile the generated sources against the Causeway applib + Jakarta Persistence on the shared classpath
- [ ] 5.4 Confirm the action body referencing the external type compiles (coexistence milestone met end-to-end)
