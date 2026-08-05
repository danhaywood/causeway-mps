## MODIFIED Requirements

### Requirement: Module concept
The `causeway` language SHALL provide a `Module` root concept that is an `INamedConcept` and a singleton
metadata root per model (one MPS model = one module; the model name maps to the package). It SHALL NOT
contain `Entity` or `Action` children — entities are top-level roots of the model. Beyond `name` (the
module's identity), a `Module` SHALL carry two **optional** string properties that the generator reads,
each falling back to `name` when unset:

- `logicalTypeNamePrefix` — the prefix applied to each member's `@Named` logical-type-name; and
- `schema` — the JPA database schema for the module's entities.

These two are deliberately distinct: a module's logical-type-name prefix (e.g. `sharedKernel.customers`)
may differ from its database schema (e.g. `customers`). The generator SHALL produce each member's
`@Named` from `logicalTypeNamePrefix` (or `name` if unset) and each entity's `@Table(schema=…)` from
`schema` (or `name` if unset), and SHALL produce no class from the `Module` itself (it is abandoned in
generation).

#### Scenario: Defaults fall back to name
- **WHEN** a `Module` named `customers` sets neither `logicalTypeNamePrefix` nor `schema`
- **THEN** generated members are `@Named("customers.<Member>")` and entities are
  `@Table(schema = "customers", …)`

#### Scenario: Prefix and schema diverge
- **WHEN** a `Module` named `customers` sets `logicalTypeNamePrefix = "sharedKernel.customers"` and
  `schema = "customers"`
- **THEN** `Customer` generates `@Named("sharedKernel.customers.Customer")` and
  `@Table(schema = "customers", name = "Customer")`
