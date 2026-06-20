# Tasks

Oracle = `./gradlew generateModels` then compile the output against `reference-app`'s classpath;
diff every generated file against the golden `reference-app/src/main/java/customers/`.

## 0. Re-golden reference-app to mixin form (the generator's verified target)

- [x] 0.1 Move `Customer.placeOrder` from an inline method to a `Customer_placeOrder` mixin class (class `@Action`, single-arg ctor = mixee, `act` method `@MemberSupport`, injected `OrderService`); `Customer` keeps only persisted state. Verified idiom against Causeway docs.
- [x] 0.2 Compile the re-goldened `reference-app` against real Causeway 3.6.0 — DONE (Customer + Customer_placeOrder + Product compile). Updated `SETUP.md`.

## 1. Generator scaffolding

- [x] 1.1 Confirm `generateModels` (`MpsGenerate`) wiring — DONE: `./gradlew generateModels` BUILD SUCCESSFUL; generated the `causeway` language's own impl Java into `source_gen` (incl. `EnumerationDescriptor_SemanticsOf`, `unique_member_names_NonTypesystemRule`), proving the task + our models are valid. NB this is the *language's* code, not yet Causeway *domain* code (needs the templates + a sandbox program).
- [~] 1.2 Set up the generator model in `causeway.generator` — PARTIAL. The `main` MappingConfiguration exists (empty). The **"record what needs the GUI" deliverable is DONE**: `docs/generator-template-authoring.md` captures the full template design (source→target mapping, every macro's logic), the source-side concept-ID inventory, the GUI playbook, and the honest GUI-only list. **Still needs the GUI**: capturing the generator-language / baseLanguage / Causeway-classifier IDs by authoring the nodes (fabricating them is the documented failure mode — spike verdict). **Dependency now satisfied** (2026-06-20): the Causeway/Jakarta classpath stubs live in the shared `causeway.stubs` solution (`shared-stubs-solution` change), depended on by **the generator** (and the sandbox), staged by `resolveStubs` — so generator templates can now resolve `@DomainObject`/`@Entity`/`SemanticsOf`/etc. (An earlier step put them only in `causeway.sandbox`, visible to sandbox programs but not the generator — the gap `shared-stubs-solution` closed.)
  **GUI session (2026-06-18):** `main` now has a root mapping rule `Entity --> map_Entity` and a `map_Entity` root template (class name = property macro `node.name`). With the `customers` sandbox program (entity roots `Customer`/`Product`, `name : String`), `./gradlew generateModels` produces `customers/Customer.java` + `customers/Product.java` skeleton classes (correct package + name). **B1 (skeleton) done.**

> **Model = module pivot (2026-06-18).** A root mapping rule is 1 input-root → 1 output-root, so a single
> `Module` root containing entities can't fan out to N class files. Decision (see memory `model-equals-module`):
> **one model = one module**; class-producing concepts (`Entity`, later `Action`) are **roots**; `Module`
> becomes a lightweight **singleton metadata root** (namespace for `@Named`, future `ModuleWithFixtures`),
> read by templates and *abandoned* in the generator. `Entity` made rootable (`causeway.structure`). This
> revises §2.1 and touches the promoted `dsl-domain-model` spec + `dsl-action-model` (actions become roots
> too) — **follow-up OpenSpec change needed** to remove `Module.entities`/`Module.actions` containment and
> update the spec.

## 2. Templates

> Spec for all of §2 is in `docs/generator-template-authoring.md` (node-by-node + macro logic). These
> stay open: authoring the template bodies needs the MPS GUI, and faithful (annotated) output needs the
> Causeway/Jakarta stubs imported first. **Action template has an OPEN design gap** (the `@Inject`
> service field — see the doc; settle with `dsl-action-model`/`sandbox-sample-and-e2e`).

- [ ] 2.1 `Module` → package + `@Named` prefix — *revised (model=module): package = model name (done, skeleton); `@Named` namespace read from the `Module` singleton root, which the generator abandons. Pending: add the `Module` singleton + abandon-root + namespace macro (B2).*
- [~] 2.2 `Entity` → annotated class (root mapping rule) — class shell + name macro DONE (B1: skeleton generates). Pending (B2): `@Named` + `@DomainObject(nature=ENTITY, introspection=ENCAPSULATION_ENABLED)` + `@Entity`/`@Table` — needs the Causeway/Jakarta stubs reachable from the generator model.
- [ ] 2.3 `Property` → private JPA field (field-access) + explicit `@Property @Domain.Include` private getter, no Lombok, no setter — *design: `$LOOP$` over `Entity.properties` inside the Entity template*
- [ ] 2.4 `Action` → `Mixee_member` mixin class (`@Action(semantics=…)`, mixee ctor, `@MemberSupport act(..)`, `COPY_SRC` body) — *root mapping rule; blocked on the `@Inject` design gap*
- [ ] 2.5 `Type` resolution: `EntityType` → generated class name (reference macro via `entityToClass` label); `JavaType` → `COPY_SRC` the wrapped baseLanguage type

## 3. Verify against golden

- [ ] 3.1 `./gradlew generateModels` green
- [ ] 3.2 Diff generated output vs `reference-app/src/main/java/customers/` — investigate any delta
- [ ] 3.3 Compile generated Java against Causeway 3.6.0 + Jakarta (reuse `reference-app` deps)
