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
 * GOLDEN reference for generator output. A second entity, referenced by
 * {@link Customer#placeOrder} as a DSL-entity-typed parameter (proving the
 * Type union's "reference to another DSL Entity" arm).
 */
@Named("customers.Product")
@DomainObject(nature = Nature.ENTITY, introspection = Introspection.ENCAPSULATION_ENABLED)
@Entity
@Table(schema = "customers", name = "Product")
public class Product {

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
