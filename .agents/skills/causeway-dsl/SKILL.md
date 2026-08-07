---
name: causeway-dsl
description: Use when creating, editing, validating, generating, or inspecting Causeway DSL models in this project.
---

# Causeway DSL

The `causeway` language models Apache Causeway domain modules, entities, properties, actions, parameters, injected services, and Java or entity types.
The current generator emits Causeway 3.6 entity-state Java, nested and same-model explicit-target action mixins, and calculated property mixins.
Derived properties generate `@Property` classes with explicit mixee constructors, Jakarta-injected service fields, and typed no-argument `prop()` methods without persistent state.
Actions retain explicit mixee constructors, immutable `Params` carriers, Jakarta-injected service fields, `act`, and all by-name PAT supporting-method families from the `customers` sandbox.
Embedded action code can use raw `ActionInvocation` as `target.action(args)` or explicit `WrappedActionInvocation` as `wrap(target[, control]).action(args)` and `asyncWrap(target[, control]).action(args)`.
Raw generation uses `FactoryService.mixin(...).act(...)`, while wrapped generation uses Causeway `WrapperFactory` with placement-correct class literals, asynchronous `applyAsync` or `acceptAsync`, and conditional service plumbing.
`reference-app` contains the compiling golden for the complete action shape.
`docs/transparent-action-invocation.md`, `docs/wrapped-action-invocation.md`, and `docs/derived-properties.md` document the invocation and calculated-property contracts.

## Critical rules

- Use MPS MCP tools for every model operation; never read or hand-edit serialized `.mps` XML.
- Use `mps_mcp_get_concept_details` with `l:99bd0b43-8ce5-4eaa-aac8-ff12e0700f84:causeway`.
- Use fully qualified concept names in JSON blueprints.
- Prefer a root skeleton followed by incremental child insertion for actions and BaseLanguage bodies.
- Dry-run JSON before insertion.
- Validate changed roots with `mps_mcp_check_root_node_problems`.
- Run `./gradlew checkModels` after model changes and `./gradlew generateModels` after generator-relevant changes.

## Quick start

1. Use model `r:2adc303c-3561-45fa-953b-45530ec39751(customers)` for examples or new sandbox roots.
2. Start from `references/blueprints/` for known-valid shapes.
3. Dry-run roots with `mps_mcp_insert_root_node_from_json`.
4. Insert roots, then add uncertain or large child-role subtrees with `mps_mcp_update_node`.
5. Validate the changed root and run the relevant Gradle checks.

## Project references

- Language module: `99bd0b43-8ce5-4eaa-aac8-ff12e0700f84(causeway)`.
- Concept-tools language reference: `l:99bd0b43-8ce5-4eaa-aac8-ff12e0700f84:causeway`.
- Sandbox solution: `c44a8d28-571f-4fff-b536-5883d8cb98df(causeway.sandbox)`.
- Runtime solution: `bcd38118-0485-45d2-b327-9440f8727737(causeway.runtime)`.
- Shared classpath stubs: `c31c5f46-778f-4244-90d0-c92808fc2b16(causeway.stubs)`.
- Generator: `a95688c2-ec8f-4d71-bc52-3274f445df31(causeway.generator)`.
- The language directly depends on BaseLanguage, JDK, and `causeway.stubs`.

## References

- [Concept catalog](references/concepts.md)
- [Sandbox examples](references/sandbox.md)
- [Authoring workflows](references/workflows.md)
- [Known gotchas](references/gotchas.md)
- [Entity root skeleton](references/blueprints/entity-skeleton.json)
- [Java-typed persisted property subtree](references/blueprints/property-java-type-subtree.json)
- [Java-typed derived property subtree](references/blueprints/derived-property-java-type-subtree.json)
- [Transparent action invocation subtree](references/blueprints/action-invocation-subtree.json)
- [Wrapped asynchronous controlled invocation subtree](references/blueprints/wrapped-action-invocation-subtree.json)
- [Transparent action invocation guide](../../../docs/transparent-action-invocation.md)
- [Wrapped action invocation guide](../../../docs/wrapped-action-invocation.md)
- [Derived property guide](../../../docs/derived-properties.md)
