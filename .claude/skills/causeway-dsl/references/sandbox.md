# Sandbox examples

## Solution and model

- Sandbox solution: `c44a8d28-571f-4fff-b536-5883d8cb98df(causeway.sandbox)`.
- Editable model: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)`.

## Representative roots

- `Customer` entity: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717565`.
- `Product` entity: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717569`.
- `customers` module metadata: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/676917817370717632`.

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

`Customer.name` demonstrates a `JavaType` wrapping BaseLanguage `ClassifierType(String)`.
`Product.price` demonstrates a `JavaType` wrapping BaseLanguage `IntegerType`.
`Customer.scopeProbe` exercises the lifecycle scope lattice and generator across action hide/disable/validate/body plus every per-parameter supporting-method family.
Its supporting fixtures are typed `LifecycleBlock` wrappers whose `body` children contain BaseLanguage scope probes followed by contract-compatible returns.
Its `product : String`, `quantity : int`, `orderService`, and `Customer` smart references provide positive examples of ordered parameter scope plus universal service/mixee scope.
The typed parameters drive generator tasks 6.1 and 6.2: `Customer.java` receives `scopeProbe.Params` with ordered final fields, a public `(String, int)` constructor, and `product()`/`quantity()` accessors, followed by `act` and the present by-name PAT supporting methods.
Generated `act` references are direct arguments; generated lifecycle references use `params.product()` or `params.quantity()`.
Name-based resolution rejects out-of-scope parameter names, and a deliberately forced out-of-scope persistent reference is reported as `The reference … is out of search scope` by the model checker.
Temporarily moving `quantity` before `product` also exercises the parameter-order warning because `quantity`'s supporting blocks depend on `product`.
The action is a scope-validation fixture rather than the final `placeOrder` sample.
