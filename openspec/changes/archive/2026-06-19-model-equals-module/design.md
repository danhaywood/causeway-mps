# Design

## The 1-root → 1-file constraint

MPS generation maps **roots**. A root mapping rule takes one input root and produces one output root; it
does not fire on contained (non-root) nodes, and it cannot produce a *variable* number of output roots
from a single input. So any concept whose instances must each become **their own `.java` file** has to be
a root in the model. A `Module` root containing N entities cannot fan out to N entity files — this was
observed directly ("failed to generate output after 10 repeated mappings") and is what forced the pivot.

Corollary, and the key refinement in this change: a concept only needs to be a root **when it must become
its own file**. If a concept's output lives *inside another root's file*, it can stay contained and be
emitted by a `$LOOP$` (a node macro that repeats a template fragment per child) within the owning root's
template. That is exactly the case for nested actions.

## Why nested actions don't need to be roots

A Causeway mixin requires only a class with a single-argument constructor whose parameter type is the
mixee. For a Java **non-static inner class**:

```java
@DomainObject(nature = Nature.ENTITY)
public class Customer {
    // ... persisted state ...

    @Action(semantics = SemanticsOf.IDEMPOTENT)
    public class placeOrder {                 // non-static inner class == mixin
        @MemberSupport public Customer act(Product product, int quantity) {
            // mixee is Customer.this — no explicit field, no explicit ctor
            orderService.place(Customer.this, product, quantity);
            return Customer.this;
        }
        @Inject OrderService orderService;
    }
}
```

javac synthesises `placeOrder(Customer)` as the constructor (the enclosing-instance parameter). That *is*
the 1-arg-mixee constructor Causeway introspects for, and `Customer.this` gives the body the mixee with no
boilerplate. So a nested action:

- stays **contained** in its `Entity` (`Entity.actions`, link 23, is retained);
- is emitted by the `Entity` root template via `$LOOP$` over `actions` → one non-static inner class each;
- shares the entity's single output file — no fan-out, no `genContext` root-creation gymnastics.

A **top-level / cross-module** action is the genuine "own file" case: it contributes to an entity it does
not live beside (often in another module). It is a **root** with an explicit `target` reference and
generates as a separate top-level mixin class (`Mixee_member.java`) via its own root mapping rule. Because
the contribution crosses module/model boundaries, the `target` is a cross-model reference — MPS-native and
exactly Causeway's contributed-mixin pattern.

`Action` is therefore **both** a valid `Entity` child and rootable; MPS permits a concept to be used in
containment and as a root. The discriminator is the one `dsl-action-model` already defined: empty
`target` ⇒ nested; `target` set ⇒ top-level. No new discriminator, and `target` does **not** become
always-required.

## Module as a singleton metadata root

With model = module, the entities *are* the roots of the model; there is no `Module` node owning them. The
`Module` root that remains is a per-model singleton holding identity the generator reads but does not turn
into a class:

- the namespace prefix for each entity/action `@Named` logical-type-name;
- (future, out of scope here) a `ModuleWithFixtures` flag, module dependencies, permissions.

The generator **abandons** the `Module` root (produces no output for it); entity/action templates read its
namespace via a macro over `node.model.roots(Module)`. Dropping `Module.entities`/`Module.actions` makes
the metamodel match this: a `Module` that contained members would imply the old fan-out shape.

## Structure edits (minimal)

Against today's `causeway.structure.mps`:

| Concept | Link / flag | Action |
|---|---|---|
| `Module` (id 1) | `entities` (link 21, `0..n` → Entity) | **remove** |
| `Module` (id 1) | `actions` (link 49, `0..n` → Action) | **remove** |
| `Action` (id 4) | `19KtqR` (rootable) | **add** `=true` |
| `Entity` (id 2) | `properties` (22), `actions` (23) | keep |
| `Action` (id 4) | `target` (48, ref → Entity) | keep |

These are clean, hand-authorable structure edits (the spike established structure concepts with manual IDs
are headless-safe — unlike templates/scope). The risk is dangling references: removing `Module.entities`
is only safe because no model still *uses* it (the `customers` sandbox stores Entity roots, confirmed).
`checkModels` is the oracle for "no unresolved refs / no orphaned containment".

## Golden consequence

`reference-app`'s `Customer.placeOrder` was re-goldened to a *separate* `Customer_placeOrder.java` in
`causeway-generator-first-slice` task 0.1. Under this change, a nested action's verified target is a
**non-static inner class** of `Customer`. The golden must be re-goldened a second time to that form and
recompiled against Causeway 3.6.0, so the generator's oracle matches the chosen output shape. (A top-level
action, when one is added to the golden, would remain a separate file — both forms ultimately appear in the
golden.)

## Alternatives considered

- **Make every action a root (the original pivot note).** Rejected: forces a separate file per action even
  for the common nested case, loses the inner-class elegance, and would make `target` always-required —
  more boilerplate for the dominant form, for no gain.
- **Generate nested mixins as `static` nested classes with an explicit mixee field/ctor.** Works for
  Causeway, but throws away the free synthesised ctor and `Outer.this` mixee that the non-static inner
  class gives us — more generated boilerplate for the same result.
- **Create extra output roots programmatically from a reduction/weaving rule (`genContext`).** Rejected:
  this is the fragile, GUI-heavy generator corner the headless-authoring spike warned against; the
  inner-class approach avoids needing it at all.
