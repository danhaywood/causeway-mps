package customers;

import jakarta.inject.Inject;

import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.applib.annotation.MemberSupport;
import org.apache.causeway.applib.annotation.SemanticsOf;

import app.OrderService;

/**
 * GOLDEN reference for generator output — the mixin form of an action.
 *
 * Under mixins-everywhere, every action generates as a `Mixee_member` mixin class:
 *  - class annotated @Action; public single-arg constructor whose parameter type
 *    is the mixee (Customer); member name "placeOrder" derives from the class name.
 *  - the action body lives in a method named `act` carrying @MemberSupport
 *    (the encapsulation-compatible mixin form).
 *  - the body references hand-written external code ({@link OrderService}) —
 *    later this is the generated embedded-baseLanguage body.
 */
@Action(semantics = SemanticsOf.IDEMPOTENT)
public class Customer_placeOrder {

    private final Customer customer;

    public Customer_placeOrder(final Customer customer) {
        this.customer = customer;
    }

    @MemberSupport
    public Customer act(final Product product, final int quantity) {
        orderService.placeOrder(customer, product, quantity);
        return customer;
    }

    @Inject
    private OrderService orderService;
}
