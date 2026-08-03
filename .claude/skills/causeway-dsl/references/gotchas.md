# Causeway DSL gotchas

- Never inspect or edit `.mps` XML directly; use MPS MCP node tools.
- Concept-detail lookup requires `l:99bd0b43-8ce5-4eaa-aac8-ff12e0700f84:causeway`, not the module reference syntax.
- Use fully qualified concepts such as `causeway.structure.Entity` in blueprints.
- One MPS model corresponds to one Causeway module; `Module` is a singleton metadata root, while entities and top-level actions are roots.
- A root mapping rule emits one output root per input root, which is why class-producing concepts must be rootable.
- `JavaType` contains a BaseLanguage type node; it is not a textual type-name property.
- `EntityType` contains an entity reference and its generator reduction remains parked.
- Action injected-service structure exists, but service variables do not resolve in action bodies until the scope provider is implemented.
- The action template is outside the completed entity-state generator slice.
- Causeway/Jakarta stubs live in `causeway.stubs`; template models may still require explicit stub-model imports for classifier resolution.
- A broken stub path can warn without making `checkModels` fail, so retain positive type-resolution and generated-Java compilation checks.
- Use persistent `r:` node references rather than XML short IDs.
- A blueprint reference role accepts an `r:` node reference or an in-scope name, never a `c:` concept reference.
- Prefer skeleton-plus-subtree editing for action bodies and lifecycle blocks.
