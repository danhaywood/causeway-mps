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
- Action hide scope fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856266`.
- Action validate scope fixture: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856285`.
- First-parameter choices/validate fixtures: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856322` and `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856341`.
- Second-parameter choices/validate fixtures: `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856369` and `r:2adc303c-3561-45fa-953b-45530ec39751(customers)/5455126814596856397`.

`Customer.name` demonstrates a `JavaType` wrapping BaseLanguage `ClassifierType(String)`.
`Product.price` demonstrates a `JavaType` wrapping BaseLanguage `IntegerType`.
`Customer.scopeProbe` exercises the lifecycle scope lattice across action hide, action validate/body, parameter choices, and parameter validate blocks.
Its `product`, `quantity`, `orderService`, and `Customer` smart references provide positive examples of ordered parameter scope plus universal service/mixee scope.
Name-based resolution rejects out-of-scope parameter names, and a deliberately forced out-of-scope persistent reference is reported as `The reference … is out of search scope` by the model checker.
The action is a scope-validation fixture rather than the final `placeOrder` sample.
