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

> Spec for all of §2 is in `docs/generator-template-authoring.md` (node-by-node + macro logic). **B2 done
> (2026-06-22):** the Entity template (annotations + property field/getter) was GUI-authored and the stub
> dependency resolved via the `shared-stubs-solution` (`causeway.stubs` + JDK + full transitive Spring
> closure, and the template model must *import* the stub models). Generated entities compile against
> Causeway 3.6.0. **Still open:** §2.4 (Action template — nested→inner class, needs a sandbox action +
> `dsl-action-model`) and §2.5 (faithful `Type` resolution — needs a non-`String` property).

- [x] 2.1 `Module` → `@Named` prefix — DONE (B2): package = model name; `@Named` namespace read from the
  `Module` singleton root via a property macro `node.model.roots(Module).first.name`. The unmatched
  `Module` root is abandoned implicitly (no rule; doesn't leak). (Explicit abandon-root rule not needed.)
- [x] 2.2 `Entity` → annotated class (root mapping rule) — DONE (B2): emits `@DomainObject(nature=ENTITY,
  introspection=ENCAPSULATION_ENABLED)`, `@Entity`, `@Table(schema=<module>, name=<entity>)`, `@Named`
  (macros for `@Named`/`@Table`), plus the fixed `@Id @Column(name="id", nullable=false) Long id`. Stubs
  reachable via the `shared-stubs-solution` (`causeway.stubs`) + template-model imports.
- [x] 2.3 `Property` → private JPA field + explicit `@Property` private getter — DONE (B2): `$LOOP$` over
  `node.properties` emits `@Column(name=<prop>, nullable=false, length=255) private <type> <prop>;` and
  `@Property private <type> get<Prop>() { return <field>; }`. Getter body field-ref resolves per-property
  by shared input node (no mapping label). `@Domain.Include` dropped — `@Property` meta-includes it.
- [ ] 2.4 `Action` → mixin class — OUT OF B2 SCOPE (the `customers` sandbox has no action). Per
  `model-equals-module`: a **nested** action generates as a non-static inner class via a `$LOOP$` over
  `Entity.actions`; a top-level action via its own root rule. Needs a sandbox action + the injected-service
  scope work (`dsl-action-model`).
- [~] 2.5 `Type` resolution — PARTIAL: field/getter type is hardcoded `String` (the String-only slice
  simplification, matching the `customers` golden). Faithful resolution — `JavaType` → `COPY_SRC
  node.type.javaType`; `EntityType` → reference macro via an `entityToClass` label — is deferred until a
  non-`String`/entity-typed property exists to exercise it (a richer sandbox).

## 3. Verify against golden

- [x] 3.1 `./gradlew generateModels` green — DONE: generates `customers/Customer.java` + `Product.java`
  with the full entity-state.
- [x] 3.2 Diff generated output vs golden — DONE: entity-state matches; remaining deltas are **cosmetic
  and Java-irrelevant** (annotation order, `@Column` arg order, 2- vs 4-space indent) plus the
  out-of-scope `placeOrder` action + the golden's javadoc.
- [x] 3.3 Compile generated Java against Causeway 3.6.0 + Jakarta — DONE: `javac -cp causeway.stubs/libs/*`
  compiles `Customer.java` + `Product.java` cleanly (exit 0). DSL → generated Java → compiles against real
  Causeway, end to end.
