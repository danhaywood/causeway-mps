package causeway.verification;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.function.Consumer;
import java.util.function.Function;

import app.OrderService;
import customers.Customer;
import customers.Customer_externalLabel;
import customers.Customer_topLevelProbe;
import customers.Customer_topLevelVoidProbe;
import customers.Product;
import recommendations.Customer_crossModelProbe;
import recommendations.Customer_recommendedCustomer;
import org.apache.causeway.applib.annotation.Action;
import org.apache.causeway.applib.services.factory.FactoryService;
import org.apache.causeway.applib.services.wrapper.WrapperFactory;
import org.apache.causeway.applib.services.wrapper.control.AsyncControl;
import org.apache.causeway.applib.services.wrapper.control.SyncControl;
import org.apache.causeway.applib.services.wrapper.listeners.InteractionListener;
import org.apache.causeway.commons.functional.TryFuture;
import org.apache.causeway.core.metamodel.facets.object.mixin.MixinFacet;

/** Executable runtime contract checks for generated Causeway action and property mixins. */
public final class GeneratedMixinRuntimeCheck {
    private GeneratedMixinRuntimeCheck() {
    }

    public static void main(String[] args) throws Exception {
        var orderService = new RecordingOrderService();
        var wrapper = new RecordingWrapperFactory(orderService);
        FactoryService factoryService = factoryServiceProxy(orderService, wrapper);
        var injectableProduct = new Product();
        try (var verifier = new GeneratedMixinVerifier(
                orderService,
                injectableProduct,
                factoryService,
                wrapper.service(),
                SyncControl.defaults(),
                AsyncControl.defaults())) {
            if (args.length == 1 && "--probe-invalid".equals(args[0])) {
                verifyValid(verifier, InvalidActionMixin.class, Customer.class, "invalidActionMixin");
                throw new AssertionError("The invalid action mixin unexpectedly passed verification");
            }

            verifyGeneratedMixinShapes(verifier, factoryService, wrapper, orderService);
            verifyWrappedInvocationBoundary(factoryService, wrapper, orderService);
            verifyInvalidRejected(verifier);
            System.out.println(
                    "Generated action and property targets plus raw and wrapped invocation callers satisfy the Causeway runtime contract.");
        }
    }

    private static void verifyGeneratedMixinShapes(
            GeneratedMixinVerifier verifier,
            FactoryService factoryService,
            RecordingWrapperFactory wrapper,
            RecordingOrderService orderService) throws Exception {
        verifyValid(verifier, Customer.placeOrder.class, Customer.class, "placeOrder");
        verifyValid(verifier, Customer.recordOrder.class, Customer.class, "recordOrder");
        verifyValid(verifier, Customer_topLevelProbe.class, Customer.class, "topLevelProbe");
        verifyValid(verifier, Customer_topLevelVoidProbe.class, Customer.class, "topLevelVoidProbe");
        Object crossModelAction = verifyValid(
                verifier,
                Customer_crossModelProbe.class,
                Customer.class,
                "crossModelProbe");
        require(
                Customer_crossModelProbe.class.getMethod("act").invoke(crossModelAction) == null,
                "cross-model action returned the wrong value");
        verifyGeneratedPropertyMixins(verifier, orderService);
        Object nestedCaller = verifyValid(verifier, Customer.invokePlaceOrder.class, Customer.class, "invokePlaceOrder");
        Object topLevelCaller = verifyValid(
                verifier,
                Customer.invokeTopLevelProbe.class,
                Customer.class,
                "invokeTopLevelProbe");
        verifyFactoryServiceInjection(nestedCaller, factoryService);
        verifyFactoryServiceInjection(topLevelCaller, factoryService);

        for (Class<?> callerType : List.of(
                Customer.wrappedSyncNested.class,
                Customer.wrappedSyncTopLevelControlled.class,
                Customer.wrappedAsyncValueNested.class,
                Customer.wrappedAsyncValueTopLevel.class,
                Customer.wrappedAsyncVoidNestedControlled.class,
                Customer.wrappedAsyncVoidTopLevelControlled.class,
                Customer.mixedRawAndWrapped.class)) {
            Object caller = verifyValid(verifier, callerType, Customer.class, callerType.getSimpleName());
            inject(caller, "__wrapperFactory", wrapper.service());
            verifyWrapperFactoryInjection(caller, wrapper.service());
        }
    }

    private static void verifyGeneratedPropertyMixins(
            GeneratedMixinVerifier verifier,
            OrderService orderService) throws Exception {
        verifyPropertyValid(
                verifier,
                Customer.recentCustomer.class,
                Customer.class,
                "recentCustomer");
        var nestedMixee = new Customer();
        var nested = new Customer.recentCustomer(nestedMixee);
        inject(nested, "orderService", orderService);
        require(nested.prop() == nestedMixee, "nested property mixin returned the wrong value");

        Object topLevel = verifyPropertyValid(
                verifier,
                Customer_externalLabel.class,
                Customer.class,
                "externalLabel");
        Object topLevelResult = Customer_externalLabel.class.getMethod("prop").invoke(topLevel);
        require("external".equals(topLevelResult), "top-level property mixin returned the wrong value");

        Object crossModel = verifyPropertyValid(
                verifier,
                Customer_recommendedCustomer.class,
                Customer.class,
                "recommendedCustomer");
        var recommendedProduct = new Product();
        inject(crossModel, "recommendedProduct", recommendedProduct);
        Object crossModelResult = Customer_recommendedCustomer.class.getMethod("prop").invoke(crossModel);
        require(crossModelResult == recommendedProduct, "cross-model property mixin returned the wrong value");
    }

    private static void verifyWrappedInvocationBoundary(
            FactoryService factoryService,
            RecordingWrapperFactory wrapper,
            RecordingOrderService orderService) throws Exception {
        var customer = new Customer();
        var product = new Product();

        wrapper.reset();
        var syncNested = new Customer.wrappedSyncNested(customer);
        inject(syncNested, "__wrapperFactory", wrapper.service());
        require(syncNested.act(product, 7) == customer, "synchronous nested wrapper returned the wrong target");
        wrapper.requireLast(Customer.placeOrder.class, customer, null, "sync");
        orderService.requireLast(customer, product, 7);
        require(wrapper.factoryCalls() == 0, "wrapped synchronous dispatch fell back to FactoryService");

        var syncControl = SyncControl.defaults().withSkipRules();
        var syncTopLevel = new Customer.wrappedSyncTopLevelControlled(customer);
        inject(syncTopLevel, "syncControl", syncControl);
        inject(syncTopLevel, "__wrapperFactory", wrapper.service());
        syncTopLevel.act();
        wrapper.requireLast(Customer_topLevelProbe.class, customer, syncControl, "sync");

        var asyncValueNested = new Customer.wrappedAsyncValueNested(customer);
        inject(asyncValueNested, "__wrapperFactory", wrapper.service());
        require(asyncValueNested.act(product, 11) instanceof TryFuture, "async value call did not return TryFuture");
        wrapper.requireLast(Customer.placeOrder.class, customer, null, "applyAsync");
        orderService.requireLast(customer, product, 11);

        var asyncValueTopLevel = new Customer.wrappedAsyncValueTopLevel(customer);
        inject(asyncValueTopLevel, "__wrapperFactory", wrapper.service());
        require(asyncValueTopLevel.act() instanceof TryFuture, "async top-level value call did not return TryFuture");
        wrapper.requireLast(Customer_topLevelProbe.class, customer, null, "applyAsync");

        var asyncControl = AsyncControl.defaults().withSkipRules();
        var asyncVoidNested = new Customer.wrappedAsyncVoidNestedControlled(customer);
        inject(asyncVoidNested, "asyncControl", asyncControl);
        inject(asyncVoidNested, "__wrapperFactory", wrapper.service());
        require(asyncVoidNested.act(product, 13) instanceof TryFuture, "async void call did not return TryFuture");
        wrapper.requireLast(Customer.recordOrder.class, customer, asyncControl, "acceptAsync");
        orderService.requireLast(customer, product, 13);

        var asyncVoidTopLevel = new Customer.wrappedAsyncVoidTopLevelControlled(customer);
        inject(asyncVoidTopLevel, "asyncControl", asyncControl);
        inject(asyncVoidTopLevel, "__wrapperFactory", wrapper.service());
        require(asyncVoidTopLevel.act() instanceof TryFuture, "async top-level void call did not return TryFuture");
        wrapper.requireLast(Customer_topLevelVoidProbe.class, customer, asyncControl, "acceptAsync");
        require(wrapper.notificationCount() >= 6, "wrapper boundary did not publish interaction notifications");
        require(wrapper.factoryCalls() == 0, "wrapped-only callers used raw FactoryService dispatch");

        int notificationsBeforeRejection = wrapper.notificationCount();
        wrapper.rejectNext();
        try {
            syncNested.act(product, 17);
            throw new AssertionError("wrapper rule rejection was not propagated");
        } catch (IllegalStateException expected) {
            require(expected.getMessage().contains("rule rejected"), "unexpected wrapper rejection: " + expected);
        }
        require(
                wrapper.notificationCount() == notificationsBeforeRejection,
                "rejected interaction was incorrectly published as successful");
        require(wrapper.factoryCalls() == 0, "rule rejection fell back to raw FactoryService dispatch");

        var mixed = new Customer.mixedRawAndWrapped(customer);
        inject(mixed, "__factoryService", factoryService);
        inject(mixed, "__wrapperFactory", wrapper.service());
        require(mixed.act(product, 19) == customer, "mixed raw/wrapped caller returned the wrong target");
        require(wrapper.factoryCalls() == 1, "mixed caller did not use exactly one raw dispatch");
        wrapper.requireLast(Customer.placeOrder.class, customer, null, "sync");
    }

    private static Object verifyValid(
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
        return mixin;
    }

    private static Object verifyPropertyValid(
            GeneratedMixinVerifier verifier,
            Class<?> mixinType,
            Class<?> mixeeType,
            String expectedMemberId) throws Exception {
        MixinFacet facet = verifier.process(mixinType);
        require(facet != null, mixinType.getName() + " has no MixinFacet");
        require(facet.isMixinFor(mixeeType), mixinType.getName() + " does not target " + mixeeType.getName());
        require("prop".equals(facet.getMainMethodName()), mixinType.getName() + " does not select prop");
        require(
                expectedMemberId.equals(verifier.memberId(mixinType)),
                mixinType.getName() + " has the wrong member id");

        var constructor = mixinType.getConstructor(mixeeType);
        require(constructor.getParameterCount() == 1, mixinType.getName() + " has the wrong constructor");
        Object mixee = mixeeType.getConstructor().newInstance();
        Object mixin = facet.instantiate(mixee);
        require(mixinType.isInstance(mixin), mixinType.getName() + " could not be instantiated for its mixee");
        require(mixinType.getMethod("prop").getParameterCount() == 0, mixinType.getName() + " has the wrong prop method");
        return mixin;
    }

    private static FactoryService factoryServiceProxy(
            RecordingOrderService orderService,
            RecordingWrapperFactory wrapper) {
        return (FactoryService) Proxy.newProxyInstance(
                FactoryService.class.getClassLoader(),
                new Class<?>[] {FactoryService.class},
                (proxy, method, args) -> switch (method.getName()) {
                    case "mixin" -> {
                        wrapper.recordFactoryCall();
                        yield instantiateMixin((Class<?>) args[0], args[1], orderService);
                    }
                    case "toString" -> "FactoryService verification proxy";
                    case "hashCode" -> System.identityHashCode(proxy);
                    case "equals" -> proxy == args[0];
                    default -> throw new UnsupportedOperationException(
                            "FactoryService verification proxy does not invoke " + method.getName());
                });
    }

    private static Object instantiateMixin(
            Class<?> mixinType,
            Object mixee,
            RecordingOrderService orderService) throws Exception {
        Object mixin = mixinType.getConstructor(mixee.getClass()).newInstance(mixee);
        try {
            inject(mixin, "orderService", orderService);
        } catch (NoSuchFieldException ignored) {
            // Not every generated action uses the hand-written service.
        }
        return mixin;
    }

    private static void verifyFactoryServiceInjection(Object mixin, FactoryService expected) throws Exception {
        var field = mixin.getClass().getDeclaredField("__factoryService");
        field.setAccessible(true);
        require(field.get(mixin) == expected, mixin.getClass().getName() + " did not receive FactoryService");
    }

    private static void verifyWrapperFactoryInjection(Object mixin, WrapperFactory expected) throws Exception {
        var field = mixin.getClass().getDeclaredField("__wrapperFactory");
        field.setAccessible(true);
        require(field.get(mixin) == expected, mixin.getClass().getName() + " did not receive WrapperFactory");
    }

    private static void inject(Object target, String fieldName, Object value) throws Exception {
        var field = target.getClass().getDeclaredField(fieldName);
        field.setAccessible(true);
        field.set(target, value);
    }

    private static void verifyInvalidRejected(GeneratedMixinVerifier verifier) {
        try {
            verifyValid(verifier, InvalidActionMixin.class, Customer.class, "invalidActionMixin");
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

    private static final class RecordingOrderService extends OrderService {
        private Customer customer;
        private Product product;
        private int quantity;

        @Override
        public void placeOrder(Customer customer, Product product, int quantity) {
            this.customer = customer;
            this.product = product;
            this.quantity = quantity;
        }

        private void requireLast(Customer expectedCustomer, Product expectedProduct, int expectedQuantity) {
            require(customer == expectedCustomer, "wrapper forwarded the wrong customer");
            require(product == expectedProduct, "wrapper forwarded the wrong product");
            require(quantity == expectedQuantity, "wrapper forwarded the wrong quantity");
        }
    }

    private static final class RecordingWrapperFactory {
        private final RecordingOrderService orderService;
        private final List<InteractionListener> listeners = new ArrayList<>();
        private final WrapperFactory service;
        private Class<?> mixinClass;
        private Object target;
        private Object control;
        private String operation;
        private boolean rejectNext;
        private int notificationCount;
        private int factoryCalls;

        private RecordingWrapperFactory(RecordingOrderService orderService) {
            this.orderService = orderService;
            this.service = (WrapperFactory) Proxy.newProxyInstance(
                    WrapperFactory.class.getClassLoader(),
                    new Class<?>[] {WrapperFactory.class},
                    this::invoke);
        }

        private Object invoke(Object proxy, java.lang.reflect.Method method, Object[] args) throws Throwable {
            return switch (method.getName()) {
                case "wrapMixin" -> wrapMixin(args);
                case "asyncWrapMixin" -> asyncWrapMixin(args);
                case "unwrap" -> args[0];
                case "isWrapper" -> false;
                case "getListeners" -> List.copyOf(listeners);
                case "addInteractionListener" -> listeners.add((InteractionListener) args[0]);
                case "removeInteractionListener" -> listeners.remove(args[0]);
                case "notifyListeners" -> {
                    notificationCount++;
                    yield null;
                }
                case "toString" -> "Recording WrapperFactory";
                case "hashCode" -> System.identityHashCode(proxy);
                case "equals" -> proxy == args[0];
                default -> throw new UnsupportedOperationException("Recording WrapperFactory does not invoke " + method);
            };
        }

        private Object wrapMixin(Object[] args) throws Exception {
            record(args, "sync");
            rejectIfRequested();
            notificationCount++;
            return instantiateMixin(mixinClass, target, orderService);
        }

        private Object asyncWrapMixin(Object[] args) throws Exception {
            record(args, "async");
            rejectIfRequested();
            Object mixin = instantiateMixin(mixinClass, target, orderService);
            return Proxy.newProxyInstance(
                    WrapperFactory.AsyncProxy.class.getClassLoader(),
                    new Class<?>[] {WrapperFactory.AsyncProxy.class},
                    (proxy, method, methodArgs) -> {
                        Object value;
                        if ("applyAsync".equals(method.getName())) {
                            operation = "applyAsync";
                            value = ((Function<Object, ?>) methodArgs[0]).apply(mixin);
                        } else if ("acceptAsync".equals(method.getName())) {
                            operation = "acceptAsync";
                            ((Consumer<Object>) methodArgs[0]).accept(mixin);
                            value = null;
                        } else {
                            throw new UnsupportedOperationException("Recording AsyncProxy does not invoke " + method);
                        }
                        notificationCount++;
                        return new TryFuture<>(CompletableFuture.completedFuture(value));
                    });
        }

        private void record(Object[] args, String operation) {
            this.mixinClass = (Class<?>) args[0];
            this.target = args[1];
            this.control = args.length == 3 ? args[2] : null;
            this.operation = operation;
        }

        private void rejectIfRequested() {
            if (rejectNext) {
                rejectNext = false;
                throw new IllegalStateException("rule rejected by recording WrapperFactory");
            }
        }

        private void requireLast(Class<?> expectedMixin, Object expectedTarget, Object expectedControl, String expectedOperation) {
            require(mixinClass == expectedMixin, "wrapper received the wrong mixin class");
            require(target == expectedTarget, "wrapper received the wrong target");
            require(control == expectedControl, "wrapper received the wrong control");
            require(expectedOperation.equals(operation), "wrapper used " + operation + " instead of " + expectedOperation);
        }

        private WrapperFactory service() {
            return service;
        }

        private void rejectNext() {
            rejectNext = true;
        }

        private void recordFactoryCall() {
            factoryCalls++;
        }

        private int notificationCount() {
            return notificationCount;
        }

        private int factoryCalls() {
            return factoryCalls;
        }

        private void reset() {
            mixinClass = null;
            target = null;
            control = null;
            operation = null;
            rejectNext = false;
            notificationCount = 0;
            factoryCalls = 0;
        }
    }

    @Action
    public static final class InvalidActionMixin {
        public void act() {
        }
    }
}
