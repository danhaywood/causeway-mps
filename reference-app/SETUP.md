# reference-app — de-risking the Causeway MPS DSL

This Maven module de-risks the change **`entity-property-action-slice`** without
requiring the MPS IDE. It proves the *locked generated idiom* is valid Java against
the real Apache Causeway APIs, and demonstrates coexistence between generated-style
and hand-written code on a single classpath.

It is **not** the MPS generator. The classes under `customers/` are a hand-written
**golden reference** for what the generator must eventually emit.

## Layout

```
reference-app/
├── pom.xml
└── src/main/java/
    ├── app/OrderService.java        ← hand-written "external" code (NOT generated)
    └── customers/
        ├── Customer.java            ← GOLDEN generator output (entity + property + action)
        └── Product.java             ← GOLDEN generator output (referenced entity)
```

`Customer.placeOrder(...)` calls `app.OrderService`, and `OrderService` references
`customers.Customer`/`Product` — bidirectional plain-Java references on one shared
classpath. This is the coexistence model: the MPS model and hand-written Java never
read each other; they meet only here, on the JVM classpath.

## Toolchain (reproducible)

| Component            | Value                                              |
|----------------------|----------------------------------------------------|
| JDK                  | 21 (Causeway 3.x requires 17+; default `java` is 11)|
| Causeway applib      | `org.apache.causeway.core:causeway-applib:3.6.0`   |
| Jakarta Persistence  | `jakarta.persistence:jakarta.persistence-api:3.1.0`|
| Jakarta Inject       | `jakarta.inject:jakarta.inject-api:2.0.1`          |

```bash
export JAVA_HOME="$HOME/.sdkman/candidates/java/21.0.10-tem"
cd reference-app && mvn compile
```

## The locked idiom (what the generator must emit)

```java
@Named("customers.Customer")                                              // jakarta.inject.Named — logical type name
@DomainObject(nature = Nature.ENTITY,
              introspection = Introspection.ENCAPSULATION_ENABLED)        // per-object, self-contained
@Entity @Table(schema = "customers", name = "Customer")
public class Customer {                                                   // PURE PERSISTED STATE

    @Column(name = "name", nullable = false, length = 255)
    private String name;                                                  // JPA on the FIELD, field-access, no Lombok

    @Property
    private String getName() { return name; }                            // explicit private getter; @Property meta-includes it
}
```

Under **mixins-everywhere**, the entity class holds only persisted state; every action generates as a **mixin class** while state stays in the entity.
Per the **model=module** decision, a nested action contained in its `Entity` generates as a static nested mixin class with no separate file:

```java
public class Customer {
    // ... persisted state ...

    @Action(semantics = SemanticsOf.IDEMPOTENT)
    public static class placeOrder {
        public static final class Params {
            private final Product product;
            private final int quantity;

            public Params(Product product, int quantity) {
                this.product = product;
                this.quantity = quantity;
            }

            public Product product() { return product; }
            public int quantity() { return quantity; }
        }

        @Inject private OrderService orderService;
        private final Customer mixee;

        public placeOrder(Customer mixee) {
            this.mixee = mixee;
        }

        @MemberSupport
        public Customer act(Product product, int quantity) {
            orderService.placeOrder(mixee, product, quantity);
            return mixee;
        }

        public boolean hideProduct(Params params) {
            return params.product() == null;
        }

        public String disableProduct(Params params) {
            return null;
        }
    }
}
```

The explicit `placeOrder(Customer)` constructor is the single-argument mixee constructor Causeway requires.
The static shape permits the public immutable `Params` carrier whose full-arguments constructor is required for Causeway's parameter-as-tuple supporting-method lookup.
By-name lifecycle methods take that carrier, while auto-complete additionally receives `String search`.
A top-level or cross-module action contributing to an entity it does not live beside instead generates as a separate top-level `Mixee_member` class with the same explicit mixee-constructor pattern.

## Mapping to the MPS sandbox stubs (Phase B)

When the MPS work begins, `causeway.sandbox` must import the **same** jars as Java
classpath stubs so embedded action bodies can resolve external types:

- `causeway-applib` (annotations: `@DomainObject`, `@Property`, `@Action`, `@MemberSupport`, `SemanticsOf`, …)
- `jakarta.persistence-api`, `jakarta.inject-api`
- this `reference-app` jar (or the hand-written app) — so bodies can call `OrderService` etc.

The generator should emit into a generated-sources location of a module like this one,
alongside the hand-written `app/` code.

## What this proves — and what it does NOT

**Proven (compile-time):** the idiom is valid Java against real Causeway and Jakarta APIs.
`jakarta.inject.Named`, `@DomainObject(... introspection = ENCAPSULATION_ENABLED)`, `@Property` on an explicit private getter, `@Action(semantics=…)`, the immutable PAT carrier, all action and parameter supporting-method families, the injected service, and bidirectional generated-to-hand-written references all compile.
The "no-Lombok → annotations on the explicit getter" decision needs no `onMethod_` workaround.

**NOT proven (runtime):** that Causeway's metamodel *introspects* these classes
correctly under `ENCAPSULATION_ENABLED` (private getter recognised as a property,
action wired up). That requires booting a Causeway application context and is a
deeper validation deferred to later work.
