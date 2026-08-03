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

`Customer.name` demonstrates a `JavaType` wrapping BaseLanguage `ClassifierType(String)`.
`Product.price` demonstrates a `JavaType` wrapping BaseLanguage `IntegerType`.
`Customer.scopeProbe` exercises the prototype action-body scope with `product`, `orderService`, and `Customer` smart references.
The action is a scope-validation fixture rather than the final `placeOrder` sample.
