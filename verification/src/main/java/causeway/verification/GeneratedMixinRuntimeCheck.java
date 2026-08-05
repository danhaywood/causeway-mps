package causeway.verification;

import app.OrderService;
import customers.Customer;
import customers.Customer_topLevelProbe;
import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.core.metamodel.facets.object.mixin.MixinFacet;

/** Executable runtime contract checks for generated Causeway action mixins. */
public final class GeneratedMixinRuntimeCheck {
    private GeneratedMixinRuntimeCheck() {
    }

    public static void main(String[] args) throws Exception {
        try (var verifier = new GeneratedMixinVerifier(new OrderService())) {
            if (args.length == 1 && "--probe-invalid".equals(args[0])) {
                verifyValid(
                        verifier,
                        InvalidActionMixin.class,
                        Customer.class,
                        "invalidActionMixin");
                throw new AssertionError("The invalid action mixin unexpectedly passed verification");
            }

            verifyValid(verifier, Customer.placeOrder.class, Customer.class, "placeOrder");
            verifyValid(verifier, Customer_topLevelProbe.class, Customer.class, "topLevelProbe");
            verifyInvalidRejected(verifier);
            System.out.println("Generated nested and top-level action mixins satisfy the Causeway runtime contract.");
        }
    }

    private static void verifyValid(
            GeneratedMixinVerifier verifier,
            Class<?> mixinType,
            Class<?> mixeeType,
            String expectedMemberId) throws Exception {
        MixinFacet facet = verifier.process(mixinType);
        require(facet != null, mixinType.getName() + " has no MixinFacet");
        require(facet.isMixinFor(mixeeType), mixinType.getName() + " does not target " + mixeeType.getName());
        require("act".equals(facet.getMainMethodName()), mixinType.getName() + " does not select act");
        require(
                expectedMemberId.equals(verifier.memberId(mixinType)),
                mixinType.getName() + " has the wrong member id");

        var constructor = mixinType.getConstructor(mixeeType);
        require(constructor.getParameterCount() == 1, mixinType.getName() + " has the wrong constructor");

        Object mixee = mixeeType.getConstructor().newInstance();
        Object mixin = facet.instantiate(mixee);
        require(mixinType.isInstance(mixin), mixinType.getName() + " could not be instantiated for its mixee");
    }

    private static void verifyInvalidRejected(GeneratedMixinVerifier verifier) {
        try {
            verifyValid(
                    verifier,
                    InvalidActionMixin.class,
                    Customer.class,
                    "invalidActionMixin");
            throw new AssertionError("The invalid action mixin unexpectedly passed verification");
        } catch (Exception | AssertionError expected) {
            System.out.println("Invalid action mixin rejected: " + expected.getMessage());
        }
    }

    private static void require(boolean condition, String message) {
        if (!condition) {
            throw new AssertionError(message);
        }
    }

    @Action
    public static final class InvalidActionMixin {
        public void act() {
        }
    }
}
