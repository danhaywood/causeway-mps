# Design

## Three fields, not one

| Field | Purpose | Example | Used by |
|---|---|---|---|
| `name` | module identity / display; default for the other two | `customers` | `@Named` + `@Table` (fallback) |
| `logicalTypeNamePrefix` | prefix for `@Named` logical-type-names | `sharedKernel.customers` | Entity/Action `@Named` |
| `schema` | JPA database schema | `customers` | Entity `@Table(schema=…)` |

`logicalTypeNamePrefix` and `schema` are **optional**. The generator uses `logicalTypeNamePrefix ?? name`
for the `@Named` prefix and `schema ?? name` for the schema. So:

- a plain module sets only `name` and gets `@Named("<name>.<Entity>")` + `@Table(schema="<name>", …)` —
  identical to today;
- a shared-kernel module sets `logicalTypeNamePrefix = sharedKernel.customers`, `schema = customers` and
  gets `@Named("sharedKernel.customers.Customer")` + `@Table(schema="customers", …)`.

## Why optional + fallback (not required, not a rename)

- Keeping `name` as the single required identity means existing models and the current sandbox/golden are
  unaffected — the change is purely additive.
- Fallback-to-`name` encodes the common case (all three equal) without forcing every module to repeat the
  value three times.
- Not renaming `name` avoids churning the `model-equals-module` work that just landed (Module singleton,
  `@Named` namespace = `Module.name`).

## Generator macro shape

The B2 macros currently read `node.model.roots(Module).first.name` for both. After this change:

- `@Named` value: `<module>.logicalTypeNamePrefix is empty ? <module>.name : <module>.logicalTypeNamePrefix` `+ "." + node.name`
- `@Table` schema: `<module>.schema is empty ? <module>.name : <module>.schema`

where `<module>` is `node.model.roots(Module).first`. (Exact MPS smodel null/empty-guard syntax settled at
implementation time.)

## Alternatives considered

- **Keep one `name`, derive schema by convention** (e.g. strip the prefix): rejected — fragile and
  surprising; the two values are independent, not derivable from each other.
- **Separate `Schema` concept / per-entity schema override**: out of scope; schema is a module-level
  concern here. Per-entity overrides can be a later slice if needed.
