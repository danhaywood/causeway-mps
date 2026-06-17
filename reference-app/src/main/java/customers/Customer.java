package customers;

import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import org.apache.causeway.applib.annotation.Domain;
import org.apache.causeway.applib.annotation.DomainObject;
import org.apache.causeway.applib.annotation.Introspection;
import org.apache.causeway.applib.annotation.Nature;
import org.apache.causeway.applib.annotation.Property;

/**
 * GOLDEN reference for generator output.
 *
 * Under the mixins-everywhere decision, an entity class is PURE PERSISTED STATE:
 *  - per-object @DomainObject(... introspection = ENCAPSULATION_ENABLED)
 *  - JPA annotations on the FIELD (field-access), no Lombok
 *  - explicit private getter carrying @Property + @Domain.Include (read-only)
 * All behaviour lives in mixin classes (see {@link Customer_placeOrder}).
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
}
