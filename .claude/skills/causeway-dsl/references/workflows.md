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
Add the action body and typed `LifecycleBlock` supporting blocks incrementally because they are large and scope-sensitive.
Each lifecycle block owns its BaseLanguage statements under the mandatory `body` child; do not place statements directly under the wrapper.
Use `ActionVariableReference` for parameters, the entity mixee, and injected services.
Action hide/disable blocks see no parameters, parameter blocks see earlier parameters (plus self for validate), and action validate/body see all parameters; mixee and services are universal.
Use `mps_mcp_parse_java_and_insert` for ordinary Java statements where the target role accepts parsed BaseLanguage nodes.
Use JSON blueprints for MPS-specific scope or model-language constructs that Java parsing cannot express.
When generating parameter support, use public PAT forms such as `boolean hideProduct(Params params)` and `String disableProduct(Params params)`.
Generate `Params` as a public static final immutable class whose public constructor covers the complete action signature and whose accessors use the parameter names.
Copy lifecycle `StatementList` bodies into the corresponding by-name methods and preserve
`ActionVariableReference` nodes for `ActionVariableReference_TextGen`: it emits direct parameter names in
`act`, `params.<name>()` in PAT methods, injected-service field names, and `mixee`.
Use `(Params params, String search)` for auto-complete.
Use raw `Collection` in generated choices/auto-complete method signatures so primitive parameter types
remain legal Java; the DSL lifecycle type rule remains responsible for the element-type contract.
For each `Action.injectedServices` declaration, generate `@Inject private <Type> <name>;` by copying the
service's `type.javaType` and deriving its declared name.
If reusing a parameter-type copy macro, retarget the query's feature reference to the distinct
`InjectedService.type` structure link before generation.

## Choose a type

Use `JavaType` when the value is represented by a BaseLanguage type such as `String` or `int`.
Use `EntityType` when the type points to another Causeway entity.
Prefer persistent `r:` references for entity targets when names are ambiguous.

## Validate and generate

Run `mps_mcp_check_root_node_problems` on each changed root.
Run `./gradlew checkModels` after DSL model changes.
Run `./gradlew generateModels` after changes affecting generated output.
Compare generated `customers` Java with `reference-app/src/main/java/customers/` when working on generator milestones.
Use `docs/action-golden-comparison.md` for the lifecycle mixin normalization rules and the known
`@Action(semantics=...)` boundary.
Compile the golden with JDK 21 using `mvn -q -f reference-app/pom.xml clean compile`; it targets Causeway
3.6.0 and Jakarta.
Use `javap` on `Customer$placeOrder` and `Customer$placeOrder$Params` when verifying the explicit mixee
constructor and public complete-signature PAT constructor.
For generated-source verification, resolve the classpath from `reference-app/pom.xml` and compile
`languages/causeway.sandbox/source_gen/customers/Customer.java` plus `Product.java` with the explicit JDK 21
`javac`; see `docs/action-golden-comparison.md` for the validated result and transient-reference warning.
