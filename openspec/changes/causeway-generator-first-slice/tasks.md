# Tasks

Oracle = `./gradlew generateModels` then compile the output against `reference-app`'s classpath;
diff every generated file against the golden `reference-app/src/main/java/customers/`.

## 0. Re-golden reference-app to mixin form (the generator's verified target)

- [x] 0.1 Move `Customer.placeOrder` from an inline method to a `Customer_placeOrder` mixin class (class `@Action`, single-arg ctor = mixee, `act` method `@MemberSupport`, injected `OrderService`); `Customer` keeps only persisted state. Verified idiom against Causeway docs.
- [x] 0.2 Compile the re-goldened `reference-app` against real Causeway 3.6.0 — DONE (Customer + Customer_placeOrder + Product compile). Updated `SETUP.md`.

## 1. Generator scaffolding

- [x] 1.1 Confirm `generateModels` (`MpsGenerate`) wiring — DONE: `./gradlew generateModels` BUILD SUCCESSFUL; generated the `causeway` language's own impl Java into `source_gen` (incl. `EnumerationDescriptor_SemanticsOf`, `unique_member_names_NonTypesystemRule`), proving the task + our models are valid. NB this is the *language's* code, not yet Causeway *domain* code (needs the templates + a sandbox program).
- [x] 1.2 Set up the generator model in `causeway.generator` and document the GUI-authored template workflow — DONE. The `main` MappingConfiguration now contains the entity and nested-action generation implemented through the subsequent template tasks, while `docs/generator-template-authoring.md` records the template design, concept inventory, authoring playbook, and GUI-only steps.

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
- [x] 2.4a Generate a nested `Action` as a static nested mixin with an immutable `Params` PAT carrier, explicit mixee field/constructor, Jakarta-injected service fields, `@MemberSupport` `act`, and every action/per-parameter supporting-method family.
- [x] 2.4b Generate each nested action's configured `@Action(semantics = ...)` value instead of a fixed semantics literal — DONE: the template emits an `@Action` annotation whose `$REF$` macro resolves the Causeway `SemanticsOf` constant by the DSL enumeration member name; sandbox `scopeProbe` generates `SemanticsOf.SAFE` from its model value rather than the template's `IDEMPOTENT` placeholder.
- [ ] 2.4c Add the separate root mapping rule for a top-level `Action` targeting its referenced entity.
- [x] 2.5a Resolve `JavaType` to its wrapped Java type with a reduction rule, exercised by sandbox `Product.price : int`.
- [ ] 2.5b Resolve `EntityType` to the referenced entity's generated class through the `entityToClass` mapping label. The groundwork exists, but the reduction-rule fragment currently cannot resolve a `ClassifierType` in its scope; revisit the model imports or use `InlineTemplateWithContextRuleConsequence`.

## 3. Verify against golden

- [x] 3.1 `./gradlew generateModels` green — DONE: generates `customers/Customer.java` + `Product.java`
  with the full entity-state.
- [x] 3.2 Diff generated output vs golden — DONE: entity-state matches; remaining deltas are **cosmetic
  and Java-irrelevant** (annotation order, `@Column` arg order, 2- vs 4-space indent) plus the
  out-of-scope `placeOrder` action + the golden's javadoc.
- [x] 3.3 Compile generated Java against Causeway 3.6.0 + Jakarta — DONE: `javac -cp causeway.stubs/libs/*`
  compiles `Customer.java` + `Product.java` cleanly (exit 0). DSL → generated Java → compiles against real
  Causeway, end to end.
