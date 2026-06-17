# Tasks

Oracle = `./gradlew generateModels` then compile the output against `reference-app`'s classpath;
diff every generated file against the golden `reference-app/src/main/java/customers/`.

## 0. Re-golden reference-app to mixin form (the generator's verified target)

- [x] 0.1 Move `Customer.placeOrder` from an inline method to a `Customer_placeOrder` mixin class (class `@Action`, single-arg ctor = mixee, `act` method `@MemberSupport`, injected `OrderService`); `Customer` keeps only persisted state. Verified idiom against Causeway docs.
- [x] 0.2 Compile the re-goldened `reference-app` against real Causeway 3.6.0 — DONE (Customer + Customer_placeOrder + Product compile). Updated `SETUP.md`.

## 1. Generator scaffolding

- [x] 1.1 Confirm `generateModels` (`MpsGenerate`) wiring — DONE: `./gradlew generateModels` BUILD SUCCESSFUL; generated the `causeway` language's own impl Java into `source_gen` (incl. `EnumerationDescriptor_SemanticsOf`, `unique_member_names_NonTypesystemRule`), proving the task + our models are valid. NB this is the *language's* code, not yet Causeway *domain* code (needs the templates + a sandbox program).
- [~] 1.2 Set up the generator model in `causeway.generator` — PARTIAL. The `main` MappingConfiguration exists (empty). The **"record what needs the GUI" deliverable is DONE**: `docs/generator-template-authoring.md` captures the full template design (source→target mapping, every macro's logic), the source-side concept-ID inventory, the GUI playbook, and the honest GUI-only list. **Still needs the GUI**: capturing the generator-language / baseLanguage / Causeway-classifier IDs by authoring the nodes (fabricating them is the documented failure mode — spike verdict). **Dependency now satisfied** (2026-06-17): the Causeway/Jakarta classpath stubs (`sandbox-sample-and-e2e` task 1.1) were pulled forward and wired into `causeway.sandbox` (`java_classes` modelRoot over `${module}/libs`, staged by the `resolveSandboxStubs` Gradle task) — so templates can now resolve `@DomainObject`/`@Entity`/`SemanticsOf`/etc.

## 2. Templates

> Spec for all of §2 is in `docs/generator-template-authoring.md` (node-by-node + macro logic). These
> stay open: authoring the template bodies needs the MPS GUI, and faithful (annotated) output needs the
> Causeway/Jakarta stubs imported first. **Action template has an OPEN design gap** (the `@Inject`
> service field — see the doc; settle with `dsl-action-model`/`sandbox-sample-and-e2e`).

- [ ] 2.1 `Module` → package + `@Named` prefix — *design: no root template; package from output-model name; `@Named` computed in Entity template*
- [ ] 2.2 `Entity` → `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` class (root mapping rule) — *design + mapping-label `entityToClass` in doc*
- [ ] 2.3 `Property` → private JPA field (field-access) + explicit `@Property @Domain.Include` private getter, no Lombok, no setter — *design: `$LOOP$` over `Entity.properties` inside the Entity template*
- [ ] 2.4 `Action` → `Mixee_member` mixin class (`@Action(semantics=…)`, mixee ctor, `@MemberSupport act(..)`, `COPY_SRC` body) — *root mapping rule; blocked on the `@Inject` design gap*
- [ ] 2.5 `Type` resolution: `EntityType` → generated class name (reference macro via `entityToClass` label); `JavaType` → `COPY_SRC` the wrapped baseLanguage type

## 3. Verify against golden

- [ ] 3.1 `./gradlew generateModels` green
- [ ] 3.2 Diff generated output vs `reference-app/src/main/java/customers/` — investigate any delta
- [ ] 3.3 Compile generated Java against Causeway 3.6.0 + Jakarta (reuse `reference-app` deps)
