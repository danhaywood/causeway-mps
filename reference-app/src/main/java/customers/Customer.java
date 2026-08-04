package customers;

import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.applib.annotation.DomainObject;
import org.apache.causeway.applib.annotation.Introspection;
import org.apache.causeway.applib.annotation.MemberSupport;
import org.apache.causeway.applib.annotation.Nature;
import org.apache.causeway.applib.annotation.Property;
import org.apache.causeway.applib.annotation.SemanticsOf;

import app.OrderService;

import java.util.Collection;
import java.util.List;

/**
 * GOLDEN reference for generator output.
 *
 * Under the mixins-everywhere decision, an entity class holds the PERSISTED STATE:
 *  - per-object @DomainObject(... introspection = ENCAPSULATION_ENABLED)
 *  - JPA annotations on the FIELD (field-access), no Lombok
 *  - explicit private getter carrying @Property (read-only; @Property meta-includes it under ENCAPSULATION)
 *
 * A <b>nested</b> action (model=module: an Action contained in its Entity)
 * generates as a <b>static nested mixin class</b> of the entity — see
 * {@link placeOrder}. The mixin has an explicit single-argument mixee constructor,
 * allowing it to contain the static {@code Params} carrier required by Causeway's
 * parameter-as-tuple supporting-method convention.
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
    private String getName() {
        return name;
    }

    /**
     * GOLDEN reference for a nested action, its immutable PAT parameter carrier,
     * action-level lifecycle methods, per-parameter supporting methods, explicit
     * mixee constructor, and injected service.
     */
    @Action(semantics = SemanticsOf.IDEMPOTENT)
    public static class placeOrder {

        public static final class Params {
            private final Product product;
            private final int quantity;

            public Params(final Product product, final int quantity) {
                this.product = product;
                this.quantity = quantity;
            }

            public Product product() {
                return product;
            }

            public int quantity() {
                return quantity;
            }
        }

        @Inject
        private OrderService orderService;

        private final Customer mixee;

        public placeOrder(final Customer mixee) {
            this.mixee = mixee;
        }

        @MemberSupport
        public Customer act(final Product product, final int quantity) {
            orderService.placeOrder(mixee, product, quantity);
            return mixee;
        }

        public boolean hideAct(final Params params) {
            return false;
        }

        public String disableAct(final Params params) {
            return null;
        }

        public String validateAct(final Params params) {
            if (params.product() == null) {
                return "Product is required";
            }
            return params.quantity() > 0 ? null : "Quantity must be positive";
        }

        public Collection choicesProduct(final Params params) {
            return List.of();
        }

        public Collection choicesQuantity(final Params params) {
            return List.of(1, 2, 3);
        }

        public int defaultQuantity(final Params params) {
            return 1;
        }

        public String validateProduct(final Params params) {
            return params.product() == null ? "Product is required" : null;
        }

        public String validateQuantity(final Params params) {
            return params.quantity() > 0 ? null : "Quantity must be positive";
        }

        public Collection autoCompleteQuantity(final Params params, final String search) {
            return List.of(1, 2, 3);
        }

        public boolean hideQuantity(final Params params) {
            return params.product() == null;
        }

        public String disableQuantity(final Params params) {
            return params.product() == null ? "Choose a product first" : null;
        }
    }
}
