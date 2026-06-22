# GUI session — generator first slice (Entity / Property / Type)

> **STATUS (2026-06-22): entity slice COMPLETE & verified.** Checkpoints A, B1, B2, B3 are all done — the
> Entity template generates the full entity-state and the generated `Customer`/`Product` compile against
> Causeway 3.6.0. This doc is now mostly historical; live status is in the memory `generator-templates-state`
> and `openspec/changes/causeway-generator-first-slice/tasks.md`. **Two corrections to the steps below**
> (the as-built differs): the `@Named`/`@Table` namespace reads the **Module singleton**
> (`node.model.roots(Module).first.name`), **not** `node.ancestor<Module>` (model=module pivot); and
> `@Domain.Include` was **dropped** (`@Property` meta-includes it). **Type resolution:** JavaType is done
> via `COPY_SRC node.type` + a `JavaType` reduction rule; **EntityType is PARKED** (blocked — see the
> task/memory). **Open next:** §2.4 Action template; revisit 2.5b EntityType.

Operational checklist for authoring, in the MPS GUI, the first generator slice + the minimal program to
feed it. Companion to the design/ID spec in `docs/generator-template-authoring.md` (refer to its §2.x for
the per-template macro logic). Scope: state-only `Customer`/`Product` (the `placeOrder` mixin/action is
**deferred** — it needs the scope provider, dsl-action-model §3).

**Loop:** do a step, then tell me "validate" — I run the headless oracle (`./gradlew checkModels`, later
`generateModels` + diff) and report before you continue. Stop at each **✅ CHECKPOINT**.

---

## Part A — the sandbox program (the input to generate from)

The generated package comes from the **output model name**, which mirrors the input model name. To get
`package customers;` (matching the golden), author the program in a model named **`customers`**.

1. In the `causeway.sandbox` solution, create a new model **`customers`** (not inside the existing
   `causeway.sandbox` model). Used languages: **`causeway`** and **`jetbrains.mps.baseLanguage`** (the
   latter for the `JavaType`'s wrapped Java type). The Causeway/Jakarta stubs are already on the solution
   (`${module}/libs`).
2. Create a root node of concept **`Module`**, name it **`customers`**.
3. In the module, add an **`Entity`** named **`Customer`**.
4. In `Customer`, add a **`Property`** named **`name`**; set its `type` to a **`JavaType`** whose wrapped
   Java type is **`String`** (`java.lang.String`, resolved via the JDK stub). *This baseLanguage-type cell
   is the fiddliest part of Part A — if `String` won't resolve, that's the signal to check the model's
   baseLanguage import.*
5. Add a second **`Entity`** named **`Product`**, with the same `name : String` property.

✅ **CHECKPOINT A** — tell me to validate. I run `./gradlew checkModels`; green here also proves the
Causeway/Jakarta stub resolution end-to-end (closes `sandbox-sample-and-e2e` task 1.2). `generateModels`
at this point produces no domain Java yet (no templates) — expected.

---

## Part B — the generator templates (`causeway.generator`)

Author in the `main` MappingConfiguration of `causeway.generator.templates@generator`. Full macro logic
is in `generator-template-authoring.md` §2.2–§2.5; the operational order:

6. **Entity root mapping rule** (§2.2): `sourceConcept = Entity`; create its root template class; assign
   the **mapping label `entityToClass`** on the rule (so `EntityType` can resolve to the class later).
   Build the class shell first — package + class name property macro (`node.name`) — **no annotations
   yet**.

   ✅ **CHECKPOINT B1** — validate (`checkModels`), then `generateModels` and I diff the bare class
   against the golden's class declaration. Get the skeleton generating before adding detail.

7. **Annotations on the Entity class** (§2.2): `@Named` (property macro → `node.ancestor<Module>.name +
   "." + node.name`), static `@DomainObject(...)`, static `@Entity`, `@Table(schema=…, name=…)` (property
   macros → module name / entity name). The fixed `@Id … private Long id;` field is static boilerplate.

   ✅ **CHECKPOINT B2** — validate + diff.

8. **Property field + getter** (§2.3): inside the Entity template, a `$LOOP$ node.properties$` over a
   field (`@Column(name=…, length=255) private <type> <name>;`) + an explicit getter (`@Property
   @Domain.Include private <type> get<Name>() { return <name>; }`). Type via step 9.

9. **Type resolution** (§2.5): `JavaType` → `COPY_SRC node.javaType`; `EntityType` → reference macro via
   the `entityToClass` label.

   ✅ **CHECKPOINT B3** — validate, `generateModels`, and I run the **full diff** vs
   `reference-app/src/main/java/customers/Customer.java` and `Product.java` (state-only portions —
   ignore the `placeOrder` mixin, which is deferred). Investigate any delta (first-slice task 3.2).

10. Compile the generated Java against Causeway 3.6.0 + Jakarta (first-slice task 3.3) — I can drive this
    headlessly once the output matches.

---

## Diff command (what I run at B3)

```
./gradlew generateModels
# then diff each generated class against the golden state-only class:
#   <generated customers.Customer>  vs  reference-app/src/main/java/customers/Customer.java
#   <generated customers.Product>   vs  reference-app/src/main/java/customers/Product.java
```
(The generated sources land under the sandbox solution's `source_gen`; I'll locate the exact path at B1.)

## Notes / known wrinkles
- **`@Inject` / action mixin deferred** — the `Customer_placeOrder` mixin and the action body are out of
  this session (need the scope provider). The golden's `Customer.java`/`Product.java` are pure state, so
  they are a complete target for this session.
- **Capture GUI-only IDs** — if any generator-language / classifier id surprises you, note it so the next
  pass is reproducible (this is the standing task-1.2 ask).
- **`length = 255`** is hard-coded in the template (slice has only `String`); generalising is a later
  slice.
