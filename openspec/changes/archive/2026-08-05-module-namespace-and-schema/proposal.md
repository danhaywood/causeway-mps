## Why

The `Module` singleton currently carries a single `name`, and the generator uses it for **two distinct
purposes**: the `@Named` logical-type-name prefix *and* the JPA `@Table(schema = …)`. Those are
conceptually different and can legitimately diverge. Example: a module that lives inside a shared kernel
might want its logical-type-name prefix to be `sharedKernel.customers` (namespacing its types within a
larger application) while its **database schema** is just `customers`. Conflating both into one `name`
makes that impossible.

This change models them as **separate `Module` fields** so each generator output reads the right one.

> Captured 2026-06-21 during `causeway-generator-first-slice` B2 (Entity-template authoring). The current
> B2 macros read `Module.name` for **both** `@Named` and `@Table(schema=…)` as a stand-in; this change
> repoints them once the fields exist. Not yet implemented.

## What Changes

- **`Module` gains two optional string properties**, distinct from `name` (the module's identity/display
  name):
  - `logicalTypeNamePrefix` — the prefix for each member's `@Named` logical-type-name (e.g.
    `sharedKernel.customers`).
  - `schema` — the JPA database schema for the module's entities (e.g. `customers`).
- **Fallback semantics:** when a field is unset it falls back to `name`, so simple modules still need only
  `name` and behave exactly as today.
- **Generator repoint:** the Entity template's `@Named` macro reads `logicalTypeNamePrefix` (fallback
  `name`); the `@Table(schema=…)` macro reads `schema` (fallback `name`).

## Capabilities

### Modified Capabilities
- `dsl-domain-model`: the `Module` concept gains `logicalTypeNamePrefix` and `schema` (optional, each
  falling back to `name`), separating the `@Named` prefix from the JPA schema.

## Impact

- **`causeway.structure`**: add two optional string properties to `Module`.
- **`causeway.generator`**: repoint the `@Named` value macro to `logicalTypeNamePrefix ?? name` and the
  `@Table` schema macro to `schema ?? name` (today both read `node.model.roots(Module).first.name`).
- **`causeway.sandbox` (`customers`)**: optionally set the new fields to demonstrate divergence (e.g.
  `logicalTypeNamePrefix = sharedKernel.customers`, `schema = customers`); leaving them unset keeps the
  current behaviour.
- **Golden (`reference-app`)**: a divergent example would change `@Named`/`@Table` values; the default
  (both = `name`) leaves the current golden unchanged.
- **Out of scope**: further `Module` metadata (`ModuleWithFixtures` flag, module dependencies,
  permissions) — still deferred from `model-equals-module`.
