package customers;

import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.applib.annotation.Domain;
import org.apache.causeway.applib.annotation.DomainObject;
import org.apache.causeway.applib.annotation.Introspection;
import org.apache.causeway.applib.annotation.Nature;
import org.apache.causeway.applib.annotation.Property;
import org.apache.causeway.applib.annotation.SemanticsOf;

import app.OrderService;

/**
 * GOLDEN reference for generator output (change: entity-property-action-slice).
 *
 * Demonstrates the LOCKED idiom that the MPS generator must emit:
 *  - per-object @DomainObject(... introspection = ENCAPSULATION_ENABLED)
 *  - JPA annotations on the FIELD (field-access), no Lombok
 *  - explicit private getter carrying @Property + @Domain.Include (read-only)
 *  - @Action method whose body is (here, hand-written; later, embedded baseLanguage)
 *    and which references hand-written external code ({@link OrderService}).
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

    @Action(semantics = SemanticsOf.IDEMPOTENT)
    public Customer placeOrder(final Product product, final int quantity) {
        // stands in for the embedded baseLanguage body; the milestone is that an
        // action body can reference external hand-written code on the classpath.
        orderService.placeOrder(this, product, quantity);
        return this;
    }

    @Inject
    @Transient
    private transient OrderService orderService;
}
