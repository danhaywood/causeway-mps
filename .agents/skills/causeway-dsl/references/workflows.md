# Causeway DSL workflows

## Create an entity

1. Dry-run `blueprints/entity-skeleton.json` against the target model with `mps_mcp_insert_root_node_from_json`.
2. Insert the root after changing its name.
3. Add properties incrementally through the `properties` role with `mps_mcp_update_node`.
4. Use `blueprints/property-java-type-subtree.json` for a classifier-backed Java property.
5. Validate the entity root.
6. Run `./gradlew checkModels` and, when generation matters, `./gradlew generateModels`.

## Create a module metadata root

Insert a `causeway.structure.Module` root with only its inherited `name` property.
Keep one Module metadata root per DSL model.
The generator reads this singleton root for module-level metadata and does not emit it as a Java file.

## Create an action

Start with a small `causeway.structure.Action` root or nested child containing only `name`, `semantics`, parameters, and types.
Add BaseLanguage statement-list bodies and supporting blocks incrementally because they are large and scope-sensitive.
Do not claim parameter, mixee, or injected-service references work until the `dsl-action-model` scope-provider tasks are complete and validated.
Use `mps_mcp_parse_java_and_insert` for ordinary Java statements where the target role accepts parsed BaseLanguage nodes.
Use JSON blueprints for MPS-specific scope or model-language constructs that Java parsing cannot express.

## Choose a type

Use `JavaType` when the value is represented by a BaseLanguage type such as `String` or `int`.
Use `EntityType` when the type points to another Causeway entity.
Prefer persistent `r:` references for entity targets when names are ambiguous.

## Validate and generate

Run `mps_mcp_check_root_node_problems` on each changed root.
Run `./gradlew checkModels` after DSL model changes.
Run `./gradlew generateModels` after changes affecting generated output.
Compare generated `customers` Java with `reference-app/src/main/java/customers/` and compile against `causeway.stubs/libs/*` when working on generator milestones.
