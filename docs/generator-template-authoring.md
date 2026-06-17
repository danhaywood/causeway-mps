# Generator template authoring spec & GUI playbook

Change: `causeway-generator-first-slice`. Status: **authoring spec (headless deliverable)** — the
node-by-node design + ID inventory + GUI playbook for the `causeway` generator templates. This is the
output of task **1.2** ("capture template-language ids via GUI where hand-XML is impractical; record
what needs the GUI") and the implementation spec for tasks **2.1–2.5**.

## Why this is a spec, not the templates themselves

The headless author→validate loop (`./gradlew checkModels` / `generateModels`) is proven for *structure*
concepts (clean hand-rolled IDs) — see `docs/spike-headless-authoring-verdict.md`. Generator templates
are the "separately-hard piece" for two concrete reasons established during this change:

1. **Annotation-classifier dependency — NOW SATISFIED (2026-06-17).** A faithful template emits resolved
   references to `@Named`, `@DomainObject`, `@Entity`, `@Table`, `@Id`, `@Column`, `@Property`,
   `@Domain.Include`, `@Action`, `@MemberSupport`, `@Inject` and the `Nature`/`Introspection`/`SemanticsOf`
   enums. In MPS these are `AnnotationInstance` / `ClassifierType` references to real classifiers, which
   require the **Causeway applib 3.6.0 + Jakarta Persistence/Inject imported as classpath stubs**. This was
   `sandbox-sample-and-e2e` **task 1.1**, declared a dependency of this change — and has been **pulled
   forward**: `causeway.sandbox.msd` now declares a `java_classes` modelRoot over `${module}/libs`
   (`causeway-applib-3.6.0`, `jakarta.persistence-api-3.1.0`, `jakarta.inject-api-2.0.1`), staged there by
   the `resolveSandboxStubs` Gradle task and validated headlessly. The annotation classifiers now resolve.
   (Still deferred: the `reference-app` app-stub for action *bodies* — see the Action OPEN ITEM.)
2. **Template-body IDs need the GUI.** A Java-class root template (annotations, field-access fields, an
   explicit getter, plus template macros and their baseLanguage query functions) is far richer than the
   structure concepts. The only substantial baseLanguage tree already in this repo — the
   `unique_member_names` rule in `causeway.typesystem.mps` — carries **GUI-generated node IDs**
   (`_$TiGu…`), not the clean hand-rolled IDs of `causeway.structure.mps`. Fabricating
   generator-language / classifier concept IDs is the documented failure mode (spike verdict). So the
   honest split is: **this doc fixes the structure + macro logic headlessly; the GUI assigns the IDs.**

## The mapping at a glance

| Source concept (`causeway.structure`) | Target artifact | Generator construct |
|---|---|---|
| `Module` | package + `@Named` prefix | *No* root template. Package = containing output-model name (convention: name the program model after the module). The `@Named` value is computed in the Entity template by navigating `Entity → ancestor Module`. |
| `Entity` | one Java class (pure state) | **Root mapping rule** → root template class. `@Named`/`@DomainObject`/`@Entity`/`@Table`, fixed `id` field, properties via `$LOOP$`. Carries a **mapping label** so `EntityType` references can resolve to it. |
| `Property` | private JPA field + explicit `@Property @Domain.Include` getter | `$LOOP$` over `Entity.properties` inside the Entity template (idiomatic for members-of-a-class; the tasks file's "reduction rule" wording maps to this). |
| `Action` | a separate `Mixee_member` mixin class | **Root mapping rule** → root template class (`@Action`, mixee ctor, `@MemberSupport act(..)`, body via `COPY_SRC`). |
| `Type` (`EntityType` / `JavaType`) | a Java type reference | `JavaType` → `COPY_SRC` its wrapped baseLanguage `Type`. `EntityType` → reference macro resolving via the Entity rule's mapping label. |

## Source-side concept IDs (known — from `causeway.structure.mps`)

Stable; macro smodel queries (`node.properties`, `node.semantics`, …) resolve against these. Model ref
`r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)`.

| Concept / feature | `conceptId` / feature id | node id |
|---|---|---|
| `Module` (rootable) | `8900000000000000001` | `1` |
| `Module.entities` (0..n → Entity) | link `8900000000000000021` | — |
| `Entity` | `8900000000000000002` | `2` |
| `Entity.properties` (0..n → Property) | link `8900000000000000022` | — |
| `Entity.actions` (0..n → Action) | link `8900000000000000023` | — |
| `Property` | `8900000000000000003` | `3` |
| `Property.type` (→ Type) | link `8900000000000000024` | — |
| `Action` | `8900000000000000004` | `4` |
| `Action.parameters` (0..n → Parameter) | link `8900000000000000025` | — |
| `Action.returnType` (→ Type) | link `8900000000000000042` | — |
| `Action.body` (→ bL `StatementList` `tpee:fzclF80`) | link `8900000000000000041` | — |
| `Action.semantics` (→ `SemanticsOf`) | prop `8900000000000000043` | — |
| `Parameter` | `8900000000000000005` | `5` |
| `Parameter.type` (→ Type) | link `8900000000000000026` | — |
| `Type` (interface) | `8900000000000000006` | `6` |
| `EntityType` (impl Type) | `8900000000000000007` | `7` |
| `EntityType.entity` (→ Entity) | link `8900000000000000031` | — |
| `JavaType` (impl Type) | `8900000000000000008` | `8` |
| `JavaType.javaType` (→ bL `Type` `tpee:fz3vP1H`) | link `8900000000000000032` | — |
| `SemanticsOf` (enum) | datatype `8900000000000000009` | `9` |
| members: `SAFE_AND_REQUEST_CACHEABLE`/`SAFE`/`IDEMPOTENT`/`IDEMPOTENT_ARE_YOU_SURE`/`NON_IDEMPOTENT`/`NON_IDEMPOTENT_ARE_YOU_SURE` | `…091`…`…096` | — |

`INamedConcept.name` (for `node.name`): `tpck:h0TrG11` (property `TrG5h`), as already used in
`causeway.typesystem.mps`.

## Target-side IDs (must be captured from the GUI — do NOT fabricate)

These are auto-populated into the generator model's `<registry>` the moment you create the nodes in the
GUI. Listed so the author knows *which* concepts to reach for, not to hand-type their ids:

- **`jetbrains.mps.lang.generator`** (`b401a680-8325-4110-8fd3-84331ff25bef`): `MappingConfiguration`
  (already present, index `bUwia`), the **root mapping rule** concept, the **mapping-label declaration**,
  and the macros: **property macro**, **reference macro**, **node/`$LOOP$` macro**, **`COPY_SRC` macro**,
  and the **`RootTemplateAnnotation`** that marks a class as a root template. Each macro owns a
  baseLanguage query function (`(genContext, node, …) -> …`).
- **`jetbrains.mps.baseLanguage`** (`f3061a53-9226-4cc5-a443-f952ceaf5816`): `ClassConcept`,
  `FieldDeclaration`, `InstanceMethodDeclaration`, `ConstructorDeclaration`, `ParameterDeclaration`,
  `PublicVisibility`/`PrivateVisibility`, `ClassifierType`, `AnnotationInstance` (+ its
  `annotation`/value links), `ReturnStatement`, `ThisExpression`, `FieldReferenceOperation`. (Some — e.g.
  `StatementList`, `DotExpression`, `IntegerType` — already appear in `causeway.typesystem.mps`'s registry
  and can be cross-referenced.)
- **Causeway / Jakarta classifiers** (only after the stubs land — see dependency above): the annotation
  types and the `Nature`/`Introspection`/`SemanticsOf` enums, as JDK/library stub imports.

## Per-template authoring spec

### main `MappingConfiguration` (exists)
`causeway.generator.templates@generator.mps` already holds an empty `bUwia` named `main`. Add the two
root mapping rules below to it.

### Module → package + `@Named` prefix (task 2.1)
- **No root template.** Package comes from the output model; convention: the sandbox program models live
  in a model named after the module (`customers`), so generated roots land in package `customers`.
- The `@Named` prefix is *not* produced here; it is computed inside the Entity template (below) so each
  entity is self-contained. Navigation: `node.ancestor<concept = Entity>` is the entity; its module is
  `entity.ancestor<concept = Module>`; prefix = `module.name`.

### Entity → annotated state class (tasks 2.2, 2.3) — ROOT MAPPING RULE + mapping label
Create a root mapping rule: `sourceConcept = Entity`, `keepInputRoot = false`, **assign a mapping label**
(e.g. `entityToClass`) so `EntityType` can resolve to the produced class. Template = a root class:

```java
@Named( /*PM*/ "customers.Customer" )                                   // PM → module.name + "." + node.name
@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)  // static
@Entity                                                                  // static
@Table(schema = /*PM*/ "customers", name = /*PM*/ "Customer")            // PM schema → module.name; PM name → node.name
public class Customer {                                                  // class name PM → node.name

    @Id @Column(name = "id", nullable = false)
    private Long id;                                                     // static — every entity gets an id

    // $LOOP$ node.properties  → one field + one getter per property
    @Column(name = /*PM*/ "name", nullable = false, length = 255)        // PM name → prop.name; length=255 = slice simplification (String-only)
    private /*type*/ String name;                                        // type via Type-resolution (below); field name PM → prop.name

    @Property @Domain.Include
    private /*type*/ String getName() { return name; }                   // method name PM → "get"+capitalize(prop.name); body returns the field
}
```
Notes:
- `@DomainObject` is fully static (no macro) — `nature`/`introspection` are fixed for the slice.
- `length = 255` is hard-coded (slice has only `String`). Generalising length / per-type column attrs is
  a later slice.

### Property field + getter (task 2.3)
Implemented as the `$LOOP$ node.properties$` body inside the Entity template (above), not a standalone
rule — properties are *members of* the entity class. Each iteration:
- **field**: `@Column(name=<prop.name>, nullable=false, length=255) private <type> <prop.name>;`
- **getter**: `@Property @Domain.Include private <type> get<Prop.name>() { return <field>; }`
- No Lombok, no setter (read-only this slice).

### Type resolution (task 2.5)
Applies to property/parameter/return types.
- **`JavaType`** → `COPY_SRC node.javaType`: its `javaType` child *is already* a baseLanguage `Type`
  (`tpee:fz3vP1H`), so copy it straight into the type position. (`String name` → `java.lang.String`.)
- **`EntityType`** → **reference macro** resolving to the generated class via the mapping label:
  `genContext.get output ClassConcept for (node.entity)` against label `entityToClass`. Produces e.g.
  `customers.Product`.

### Action → `Mixee_member` mixin class (task 2.4) — ROOT MAPPING RULE
Create a second root mapping rule: `sourceConcept = Action`. Template = a root class:

```java
@Action(semantics = SemanticsOf.IDEMPOTENT)        // RM → Causeway SemanticsOf.<node.semantics member name> (names match 1:1)
public class Customer_placeOrder {                  // name PM → entity.name + "_" + node.name

    private final Customer customer;                // mixee type = entity's generated class (label); var = decapitalize(entity.name)

    public Customer_placeOrder(final Customer customer) {   // ctor name = class name; param type = mixee
        this.customer = customer;
    }

    @MemberSupport
    public Customer act(final Product product, final int quantity) {  // return type via Type-res; params via $LOOP$ node.parameters (final <type> <name>)
        orderService.placeOrder(customer, product, quantity);          // body = COPY_SRC node.body (embedded baseLanguage copied through)
        return customer;
    }

    @Inject
    private OrderService orderService;              // see OPEN ITEM below
}
```
Notes:
- mixee type, ctor param type, and any `EntityType` param/return all use the Type-resolution above (the
  mixee uses the same `entityToClass` label on `node.ancestor<Entity>`).
- `act` body is a `COPY_SRC` of `Action.body`; external refs (e.g. `OrderService`) resolve on the shared
  classpath — the coexistence milestone, proven in `sandbox-sample-and-e2e`.

> **RESOLVED — concept now exists (2026-06-17).** The golden mixin has
> `@Inject private OrderService orderService;` and the body references `orderService`. **Settled in
> `dsl-action-model/design.md` and implemented:** `Action` has an `injectedServices` child
> (`InjectedService` = named field + a `type` reusing the `Type` union; conceptId
> `8900000000000000010`, link `8900000000000000044`), now in `causeway.structure` and `checkModels`-green
> (dsl-action-model task 0.1). Each declared service generates as `@Inject private <Type> <name>;` on the
> mixin; auto-detecting services from the body is deferred v2 sugar. **Still pending** (dsl-action-model
> task 0.2): the *scope provider* so a body can actually reference the service — until that lands, the
> sample action body can't yet resolve `orderService`. The Entity/Property/Type templates have no such
> dependency.

## GUI playbook (fast, low-risk sequence)

Run in the MPS GUI on the `causeway` language; validate after each step with `./gradlew checkModels`,
and `generateModels` once the sandbox program exists.

1. **(Prereq — DONE) Causeway/Jakarta stubs** are wired into `causeway.sandbox` (`${module}/libs` via
   `resolveSandboxStubs`); the annotation classifiers resolve. Run `./gradlew checkModels` once to stage
   `libs/`. (The `reference-app` app-stub for action bodies is still deferred.)
2. Open `causeway.generator.templates@generator` → the `main` MappingConfiguration.
3. **Entity rule:** add a root mapping rule, sourceConcept `Entity`; create its root template class; build
   the class body per the Entity spec; attach property macros (class name, `@Named`, `@Table` args,
   field/getter loop) via the *Show Inspector* macro tools; add the `entityToClass` **mapping label** on
   the rule. Run `checkModels`.
4. **Type resolution:** in the field/getter type cells add the `JavaType` `COPY_SRC` and the `EntityType`
   reference macro (label `entityToClass`).
5. **Action rule:** add a second root mapping rule, sourceConcept `Action`; build the mixin class per the
   Action spec; `COPY_SRC` the `body`; resolve the `OPEN ITEM` first.
6. **Generate IDs** on anything authored manually (the intention that closed the spike's conceptId gap).
7. Capture into this doc any GUI-only steps / surprising IDs, so the next pass is reproducible.

## Validation loop (the oracle — unchanged)
1. `./gradlew checkModels` — model is well-formed (run after every GUI step).
2. Author the `customers` sandbox program (the `sandbox-sample-and-e2e` change) so there is input to
   generate from.
3. `./gradlew generateModels` — green (task 3.1).
4. Diff `source_gen` output vs `reference-app/src/main/java/customers/` — investigate any delta (task 3.2).
5. Compile generated Java against Causeway 3.6.0 + Jakarta, reusing `reference-app` deps (task 3.3).

## What needs the GUI (task 1.2 honest list)
- All generator template-language nodes (root mapping rules, root-template annotation, macros + their
  query functions) and their auto-assigned IDs.
- The `RootTemplateAnnotation` / mapping-label wiring.
- "Generate IDs" on any manually-created node.
- Resolving the Causeway/Jakarta classifier references (after the stub import lands).

What did **not** need the GUI (done headlessly, above): the full template *design* — source→target
mapping, every macro's logic, the source-side ID inventory, the dependency and the Action `@Inject`
design gap.
