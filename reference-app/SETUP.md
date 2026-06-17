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

    @Property @Domain.Include
    private String getName() { return name; }                            // explicit private getter, read-only
}
```

Under **mixins-everywhere**, the entity class holds only persisted state; every
action generates as a `Mixee_member` **mixin class** (state stays in the entity):

```java
@Action(semantics = SemanticsOf.IDEMPOTENT)                              // @Action on the CLASS
public class Customer_placeOrder {
    private final Customer customer;                                      // mixee = single-arg ctor param
    public Customer_placeOrder(final Customer customer) { this.customer = customer; }

    @MemberSupport                                                        // mixin main method `act`, encapsulation-ok
    public Customer act(final Product product, final int quantity) {
        orderService.placeOrder(customer, product, quantity);            // body references external hand-written code
        return customer;
    }
    @Inject private OrderService orderService;                           // injected service (allowed; not domain state)
}
```

## Mapping to the MPS sandbox stubs (Phase B)

When the MPS work begins, `causeway.sandbox` must import the **same** jars as Java
classpath stubs so embedded action bodies can resolve external types:

- `causeway-applib` (annotations: `@DomainObject`, `@Property`, `@Action`, `@Domain`, `SemanticsOf`, …)
- `jakarta.persistence-api`, `jakarta.inject-api`
- this `reference-app` jar (or the hand-written app) — so bodies can call `OrderService` etc.

The generator should emit into a generated-sources location of a module like this one,
alongside the hand-written `app/` code.

## What this proves — and what it does NOT

**Proven (compile-time):** the idiom is valid Java against real Causeway + Jakarta
APIs; `jakarta.inject.Named`, `@DomainObject(... introspection = ENCAPSULATION_ENABLED)`,
`@Domain.Include` on an explicit private getter, `@Action(semantics=…)`, and
bidirectional generated↔hand-written references all compile. The "no-Lombok →
annotations on the explicit getter" decision needs no `onMethod_` workaround.

**NOT proven (runtime):** that Causeway's metamodel *introspects* these classes
correctly under `ENCAPSULATION_ENABLED` (private getter recognised as a property,
action wired up). That requires booting a Causeway application context and is a
deeper validation deferred to later work.
