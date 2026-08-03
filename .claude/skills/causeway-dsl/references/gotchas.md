# Causeway DSL gotchas

- Never inspect or edit `.mps` XML directly; use MPS MCP node tools.
- Concept-detail lookup requires `l:99bd0b43-8ce5-4eaa-aac8-ff12e0700f84:causeway`, not the module reference syntax.
- Use fully qualified concepts such as `causeway.structure.Entity` in blueprints.
- One MPS model corresponds to one Causeway module; `Module` is a singleton metadata root, while entities and top-level actions are roots.
- A root mapping rule emits one output root per input root, which is why class-producing concepts must be rootable.
- `JavaType` contains a BaseLanguage type node; it is not a textual type-name property.
- `EntityType` contains an entity reference and its generator reduction remains parked.
- Action-body variable references use the smart-reference expression `ActionVariableReference`; ordinary BaseLanguage variable references do not target Causeway declarations.
- Because `ActionVariableReference` extends BaseLanguage `Expression`, the `causeway` language must both extend and have a default dependency on `jetbrains.mps.baseLanguage`.
- The action template is outside the completed entity-state generator slice.
- Causeway/Jakarta stubs live in `causeway.stubs`; template models may still require explicit stub-model imports for classifier resolution.
- A broken stub path can warn without making `checkModels` fail, so retain positive type-resolution and generated-Java compilation checks.
- Use persistent `r:` node references rather than XML short IDs.
- A blueprint reference role accepts an `r:` node reference or an in-scope name, never a `c:` concept reference.
- Prefer skeleton-plus-subtree editing for action bodies and lifecycle blocks.
- Keep the headless MPS distribution aligned with the authoring IDE; mixing MPS 2026.1-generated behavior classes with an MPS 2025.3 runtime fails with an `SMethodBuilder` ABI mismatch.
- The project and Gradle oracle currently target MPS 2026.1 and require JDK 21.
