package customers;

import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.applib.annotation.Domain;
import org.apache.causeway.applib.annotation.DomainObject;
import org.apache.causeway.applib.annotation.Introspection;
import org.apache.causeway.applib.annotation.MemberSupport;
import org.apache.causeway.applib.annotation.Nature;
import org.apache.causeway.applib.annotation.Property;
import org.apache.causeway.applib.annotation.SemanticsOf;

import app.OrderService;

/**
 * GOLDEN reference for generator output.
 *
 * Under the mixins-everywhere decision, an entity class holds the PERSISTED STATE:
 *  - per-object @DomainObject(... introspection = ENCAPSULATION_ENABLED)
 *  - JPA annotations on the FIELD (field-access), no Lombok
 *  - explicit private getter carrying @Property + @Domain.Include (read-only)
 *
 * A <b>nested</b> action (model=module: an Action contained in its Entity)
 * generates as a <b>non-static inner mixin class</b> of the entity — see
 * {@link placeOrder}. The Java compiler synthesises that inner class's
 * constructor as {@code placeOrder(Customer)}, which IS the single-arg-mixee
 * constructor Causeway requires; the mixee is {@code Customer.this}, for free.
 */
@Named("customers.Customer")
@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)
@Entity
@Table(schema = "customers", name = "Customer")
public class Customer {

    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Property
    @Domain.Include
    private String getName() {
        return name;
    }

    /**
     * GOLDEN reference for a nested action's generated form: a non-static inner
     * mixin class. No explicit mixee field or constructor — the synthesised
     * {@code placeOrder(Customer)} ctor supplies the mixee as {@code Customer.this}.
     * The body references hand-written external code ({@link OrderService}); later
     * this is the generated embedded-baseLanguage body.
     */
    @Action(semantics = SemanticsOf.IDEMPOTENT)
    public class placeOrder {

        @MemberSupport
        public Customer act(final Product product, final int quantity) {
            orderService.placeOrder(Customer.this, product, quantity);
            return Customer.this;
        }

        @Inject
        private OrderService orderService;
    }
}
