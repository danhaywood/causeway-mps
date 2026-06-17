# Tasks

Oracle = `./gradlew generateModels` then compile the output against `reference-app`'s classpath;
diff every generated file against the golden `reference-app/src/main/java/customers/`.

## 0. Re-golden reference-app to mixin form (the generator's verified target)

- [x] 0.1 Move `Customer.placeOrder` from an inline method to a `Customer_placeOrder` mixin class (class `@Action`, single-arg ctor = mixee, `act` method `@MemberSupport`, injected `OrderService`); `Customer` keeps only persisted state. Verified idiom against Causeway docs.
- [x] 0.2 Compile the re-goldened `reference-app` against real Causeway 3.6.0 — DONE (Customer + Customer_placeOrder + Product compile). Updated `SETUP.md`.

## 1. Generator scaffolding

- [x] 1.1 Confirm `generateModels` (`MpsGenerate`) wiring — DONE: `./gradlew generateModels` BUILD SUCCESSFUL; generated the `causeway` language's own impl Java into `source_gen` (incl. `EnumerationDescriptor_SemanticsOf`, `unique_member_names_NonTypesystemRule`), proving the task + our models are valid. NB this is the *language's* code, not yet Causeway *domain* code (needs the templates + a sandbox program).
- [ ] 1.2 Set up the generator model in `causeway.generator` (capture template-language ids via GUI where hand-XML is impractical; record what needs the GUI)

## 2. Templates

- [ ] 2.1 `Module` → package + `@Named` prefix
- [ ] 2.2 `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class (root mapping rule)
- [ ] 2.3 `Property` → private JPA field (field-access) + explicit `@Property @Domain.Include` private getter, no Lombok, no setter
- [ ] 2.4 `Action` → public `@Action(semantics=…)` method with params, return type, and the generated baseLanguage body
- [ ] 2.5 `Type` resolution: `EntityType` → generated class name; `JavaType` → underlying Java type

## 3. Verify against golden

- [ ] 3.1 `./gradlew generateModels` green
- [ ] 3.2 Diff generated output vs `reference-app/src/main/java/customers/` — investigate any delta
- [ ] 3.3 Compile generated Java against Causeway 3.6.0 + Jakarta (reuse `reference-app` deps)
