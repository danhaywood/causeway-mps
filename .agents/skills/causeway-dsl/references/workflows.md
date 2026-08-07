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

## Create a derived property

For a nested calculated property, add `causeway.structure.DerivedProperty` under an entity's `derivedProperties` role.
Start from `blueprints/derived-property-java-type-subtree.json` for a Java `String` result, or replace the result with `EntityType` for a DSL entity result.
Give every declaration a non-void result type and a BaseLanguage `StatementList` body whose returned expressions satisfy that type.
Use `ActionVariableReference` expressions for the target mixee and declared injected services.
A nested declaration derives its target from its containing entity and must not set `target`.
For an explicit-target property, insert `DerivedProperty` as a model root and set `target` to an entity in the same model or an imported model.
For a cross-model target, add a model import to the entity-owning model and keep the contribution root in the declaring model; do not duplicate the generated Java classifier name.
Ensure the declaring and target models import `causeway.devkit`, which supplies `CausewayGenerationPlan` and preserves `entityToClass` through checkpoint `after_causeway`.
Do not add a solution-local Custom Generation facet or a second independently genplan-bearing DevKit.
Validate the declaration and its containing entity, regenerate, and inspect either the nested public static class or top-level `Entity_property` class.
Confirm `@Property`, the final mixee field, public constructor, typed `prop()`, copied body, service fields, and absence of entity persistence state.
See `docs/derived-properties.md` for the full contract.

## Invoke a DSL action transparently

Use `causeway.structure.ActionInvocation` only inside the body or lifecycle subtree of a DSL `Action`.
Populate its mandatory `target` expression, mandatory `action` reference, and ordered `arguments` expressions.
Start from `blueprints/action-invocation-subtree.json` when the target and arguments are `ActionVariableReference` expressions.
Use persistent `r:` references for the action and variables when names are ambiguous; otherwise in-scope names use the same resolution rules as editor completion.
The target must resolve to an exact DSL entity type.
The action scope includes actions nested directly in that entity and root actions explicitly targeting it, but excludes inheritance, Java assignability, and handwritten Java mixins.
Match argument count and positional types to the referenced action.
Use the invocation as an expression: return or consume non-void results rather than leaving a value-producing invocation as an illegal statement.
Remember that generated `FactoryService.mixin(...).act(...)` is a raw direct call, not a Causeway wrapper invocation with rule-checking and interaction semantics.
Validate the containing action or entity root, then run `verifyGeneratedSourceStructure`, `compileGeneratedJava`, and `verifyGeneratedMixins` for generator-sensitive changes.
See `docs/transparent-action-invocation.md` for the complete contract and deferred capabilities.

## Invoke a DSL action through the Causeway wrapper boundary

Use `causeway.structure.WrappedActionInvocation` only inside the body or lifecycle subtree of a DSL `Action`.
Start from `blueprints/wrapped-action-invocation-subtree.json` for an asynchronous controlled example, or omit `mode` and `control` for the synchronous default-control form.
Populate the inherited target, action, and ordered arguments exactly as for raw invocation.
Set mode to `SYNC` for `wrap` or `ASYNC` for `asyncWrap` through the MPS property API rather than guessing serialized enum values.
Use a `SyncControl` expression only with `SYNC` and an `AsyncControl` expression only with `ASYNC`.
Return or otherwise consume asynchronous results because both value and void asynchronous calls produce `TryFuture` values.
Generation selects `wrapMixin`, `applyAsync`, or `acceptAsync` from the mode and referenced action result, and selects the class literal from the action's nested or explicit-target placement.
Confirm that the containing generated mixin has `__wrapperFactory`, that raw-only callers retain only `__factoryService`, and that mixed callers receive both fields.
See `docs/wrapped-action-invocation.md` for the complete wrapper-boundary contract.

## Choose a type

Use `JavaType` when the value is represented by a BaseLanguage type such as `String` or `int`.
Use `EntityType` when the type points to another Causeway entity.
Prefer persistent `r:` references for entity targets when names are ambiguous.

## Validate and generate

Run `mps_mcp_check_root_node_problems` on each changed root.
Run `./gradlew checkModels` after DSL model changes.
Run `./gradlew generateModels` after changes affecting generated output.
For checkpoint-sensitive changes, delete `languages/causeway.sandbox/source_gen` before generation to prove that all checkpoint registries and persisted checkpoint models are recreated from a clean state.
Run `./gradlew verifyGeneratedSourceStructure` to check raw and wrapped class-literal forms, same-model and cross-model action/property mixin shapes, external classifier imports, every synchronous and asynchronous wrapper shape, conditional or mixed service injection, absence of unresolved mapping markers, and absence of derived persistence state.
Run `./gradlew compileGeneratedJava verifyGeneratedMixins` with JDK 21 to compile generated calls, process action and property mixins through the Causeway programming model, and exercise the recording `WrapperFactory` boundary.
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
