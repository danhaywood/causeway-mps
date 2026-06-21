# Tasks

Oracle = `./gradlew checkModels` then `./gradlew generateModels` over the `customers` sandbox; diff the
generated `@Named`/`@Table` against the expected values.

Deferred follow-up of `model-equals-module` + `causeway-generator-first-slice` B2 — the B2 macros read
`Module.name` for both `@Named` and `@Table(schema=…)` as a stand-in; this splits them.

## 1. Structure

- [ ] 1.1 Add optional `logicalTypeNamePrefix` (String) and `schema` (String) properties to `Module` in
  `causeway.structure` (hand-authored IDs per convention). `checkModels` green.

## 2. Generator

- [ ] 2.1 Repoint the Entity template `@Named` value macro to `logicalTypeNamePrefix ?? name`.
- [ ] 2.2 Repoint the `@Table` schema macro to `schema ?? name`. (`@Table` name stays `node.name`.)
- [ ] 2.3 `./gradlew generateModels` green; defaults (both unset) reproduce the current output.

## 3. Sandbox + verify

- [ ] 3.1 Optionally set the `customers` `Module` fields to demonstrate divergence (e.g.
  `logicalTypeNamePrefix = sharedKernel.customers`, `schema = customers`); confirm `@Named` and `@Table`
  pick up the distinct values.
- [ ] 3.2 Confirm the unset/default path still matches the golden.

## 4. Spec

- [ ] 4.1 At archive time, merge the `dsl-domain-model` Module delta into the promoted spec.
