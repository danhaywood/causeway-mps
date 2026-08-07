# Sandbox examples

## Solution and model

- Sandbox solution: `c44a8d28-571f-4fff-b536-5883d8cb98df(causeway.sandbox)`.
- Editable model: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)`.

## Representative roots

- `Customer` entity: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717565`.
- `Product` entity: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717569`.
- `customers` module metadata: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717632`.
- Explicit-target `topLevelProbe` action: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814600598575`.
- Explicit-target `topLevelVoidProbe` action: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407658`.
- Nested `Customer.recentCustomer` derived property: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559141598468`.
- Same-model explicit-target `externalLabel` derived property: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559141598502`.

## Useful subtrees

- `Customer.name` property: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717566`.
- `Product.name` property: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717570`.
- `Product.price` property: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5357476581549964898`.
- `Customer.scopeProbe` action: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596702852`.
- Action hide scope fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822339`.
- Action validate scope fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822360`.
- First-parameter choices/validate fixtures: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822219` and `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822240`.
- Second-parameter choices/validate fixtures: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822270` and `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814597822300`.
- Second-parameter default/auto-complete/hide/disable fixtures: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599121957`, `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599121971`, `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599121985`, and `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599121999`.
- Action disable fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599122013`.
- Typed `orderService` injected-service fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596702855`; its `Object` Java type wrapper is `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814599509128`.
- Nested `placeOrder(Product, int): Customer` action: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/7283007142387414327`.
- Nested `invokePlaceOrder(Product, int): Customer` caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/7283007142389228559`.
- Its nested-action invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/7283007142389228568`.
- Nested `invokeTopLevelProbe(): Customer` caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/7283007142389542233`.
- Its explicit-target invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/7283007142389543532`.
- Nested void `recordOrder(Product, int)` action: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407630`.
- Synchronous nested default-control caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407737`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407746`.
- Synchronous explicit-target controlled caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407760`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407764`.
- Asynchronous nested value caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407780`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407790`.
- Asynchronous explicit-target value caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407804`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407809`.
- Asynchronous nested void controlled caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407821`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136411567`.
- Asynchronous explicit-target void controlled caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136407848`; wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559136411583`.
- Mixed raw/wrapped caller: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559137068018`; outer wrapped invocation: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/4835663559137068027`.

`Customer.name` demonstrates a `JavaType` wrapping BaseLanguage `ClassifierType(String)`.
`Product.price` demonstrates a `JavaType` wrapping BaseLanguage `IntegerType`.
`Customer.scopeProbe` exercises the lifecycle scope lattice and generator across action hide/disable/validate/body plus every per-parameter supporting-method family.
Its supporting fixtures are typed `LifecycleBlock` wrappers whose `body` children contain BaseLanguage scope probes followed by contract-compatible returns.
Its `product : String`, `quantity : int`, typed `orderService : Object`, and `Customer` smart references provide positive examples of ordered parameter scope plus universal service/mixee scope.
The typed parameters drive generator tasks 6.1 and 6.2: `Customer.java` receives `scopeProbe.Params` with ordered final fields, a public `(String, int)` constructor, and `product()`/`quantity()` accessors, followed by `act` and the present by-name PAT supporting methods.
Generated `act` references are direct arguments; generated lifecycle references use `params.product()` or `params.quantity()`.
The generated action mixin also contains `@Inject private Object orderService;`, proving explicit service declarations become Jakarta-injected fields.
Name-based resolution rejects out-of-scope parameter names, and a deliberately forced out-of-scope persistent reference is reported as `The reference … is out of search scope` by the model checker.
Temporarily moving `quantity` before `product` also exercises the parameter-order warning because `quantity`'s supporting blocks depend on `product`.
The action is a scope-validation fixture rather than the final `placeOrder` sample.

`invokePlaceOrder` demonstrates exact-target resolution to the nested `Customer.placeOrder` action with entity, primitive, and entity-return typing.
Its generated body uses `__factoryService.mixin(placeOrder.class, mixee).act(product, quantity)` because the caller and target are nested in the same generated entity class.
`invokeTopLevelProbe` demonstrates resolution to the root `topLevelProbe` action whose explicit target is `Customer`.
Its generated body uses `__factoryService.mixin(Customer_topLevelProbe.class, mixee).act()`.
Both raw caller mixins receive the reserved `FactoryService` field, while `placeOrder` and `Customer_topLevelProbe` do not because they contain no transparent invocation.
The wrapped callers cover nested and explicit-target placement, synchronous and asynchronous mode, default and explicit controls, and value and void results.
Their generated bodies use `wrapMixin`, `asyncWrapMixin(...).applyAsync(...)`, or `asyncWrapMixin(...).acceptAsync(...)` as appropriate.
Wrapped-only callers receive `WrapperFactory`, while `mixedRawAndWrapped` receives both reserved service fields and nests raw dispatch inside wrapped dispatch.

`Customer.recentCustomer` demonstrates an entity-returning nested derived property whose body references both the `Customer` mixee and an injected `OrderService`.
It generates as public static `Customer.recentCustomer` with `@Property`, an injected service field, a final mixee field, an explicit constructor, and `Customer prop()`.
The root `externalLabel` demonstrates same-model explicit targeting and a Java `String` result.
It generates as top-level `customers.Customer_externalLabel` with `String prop()`.
Neither fixture adds a JPA field, entity getter, or setter.
