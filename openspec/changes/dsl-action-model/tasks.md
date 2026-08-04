# Tasks

Oracle = `./gradlew checkModels` (structure/scope/typesystem/constraints well-formed) then
`./gradlew generateModels` + compile the generated mixins against Causeway 3.6.0 (extend the
`reference-app` golden with the supporting-block + injected-service forms).

Depends on `dsl-mixins` (actions generate as mixins) and the archived `dsl-type-system` (Action /
Parameter / `Type` union / embedded baseLanguage body). The **scope provider** (§3) is the deepest MPS
work in the DSL — imperative baseLanguage scope extension → GUI-authored (hand-XML impractical, per the
generator-authoring boundary).

## 0. Injected services (the piece other changes wait on)

> Pulled to the front: this minimal, structure-only concept is what `causeway-generator-first-slice`
> (Action template) and `sandbox-sample-and-e2e` (the `placeOrder` sample, whose body calls
> `OrderService`) both need before they can move past a skeleton. Headless-authorable; settled in
> `design.md`.

- [x] 0.1 Add an `injectedServices` child to `Action` in `causeway.structure` — DONE: new
  `InjectedService` concept (`INamedConcept` + a single `type` child reusing the `Type` union;
  conceptId `8900000000000000010`) and `Action.injectedServices` link (`0..n`, linkId
  `8900000000000000044`), hand-authored with clean IDs per the spike convention. `./gradlew checkModels`
  green (no "Generate IDs" hint, no unresolved refs).
- [x] 0.2 Make each declared service in scope (as a variable) for the `act` body (simplest scope case — see §3.1).
  DONE: the `scopeProbe` sandbox action resolves `orderService` through `ActionVariableReference` using the action scope provider.
  MPS 2026.1 Make, MCP node validation, and the aligned MPS 2026.1 `./gradlew checkModels --rerun-tasks` oracle are green.
- [x] 0.3 Reflect that the concept now exists — DONE for the generator-template doc OPEN ITEM (no longer
  a design-only prerequisite). The promoted `dsl-domain-model` spec is updated at archive time (the delta
  in `specs/dsl-domain-model/spec.md` merges then), not hand-edited mid-change.

## 1. Structure concepts

- [x] 1.1 Action-level supporting blocks on `Action` — DONE: `hide` (45), `disable` (46), `validate`
  (47), each an optional (`0..1`) `StatementList` child (same shape as the `act` body / link 41).
- [x] 1.2 Per-parameter supporting blocks on `Parameter` — DONE: `choices` (50), `default` (51),
  `validate` (52), `autoComplete` (53), `hide` (54), `disable` (55), each an optional (`0..1`)
  `StatementList` child.
- [x] 1.3 Top-level / explicit-target action form — DONE: `Module.actions` (49, `0..n`) holds top-level
  actions, and `Action.target` (48) is an optional (`0..1`) **reference** to `Entity` (empty ⇒ nested,
  target implicit = enclosing entity; set ⇒ top-level / cross-module). **Deferred**: the explicit
  mixee-handle *name* (`as customer`) — defaults to the decapitalized target name for now; a string-typed
  property is a small refinement (the constraint "top-level ⇒ target set" is a §5 constraints concern).
- [x] 1.4 `./gradlew checkModels` green with all new links (also surfaced + fixed the reference-cardinality
  encoding gotcha — see `docs/spike-headless-authoring-verdict.md`).

## 3. Scope provider (the hard part — GUI-authored)

- [x] 3.1 Prototype the simplest case first: parameters + mixee + injected services visible in the `act` body (baseLanguage scope extension).
  DONE: `ActionVariableReference` is a smart-reference BaseLanguage expression, and `Action.getScope` exposes all action parameters, declared injected services, and the enclosing entity.
  The `scopeProbe` sandbox action resolves `product`, `orderService`, and `Customer` references from its body.
  MPS 2026.1 Make, MCP validation, `./gradlew checkModels --rerun-tasks`, and `./gradlew generateModels --rerun-tasks` are green.
- [x] 3.2 Implement the full lifecycle lattice (`dsl-action-scoping`): action `hide`/`disable` → no
  params; param *i* `default`/`choices`/`hide`/`disable`/`autoComplete` → `[0..i-1]`; param *i*
  `validate` → `[0..i]`; action `validate`/`act` → all. Mixee + services universal.
  DONE: `Action` scopes action-level blocks, while `Parameter` now implements `ScopeProvider` and scopes parameter-level blocks using declaration order.
  `Customer.scopeProbe` exercises action availability, action validation/body, first- and second-parameter choices, and parameter validation with resolved mixee/service references.
  MPS 2026.1 Make, MCP root validation, `./gradlew checkModels --rerun-tasks`, and `./gradlew generateModels --rerun-tasks` are green.
- [x] 3.3 Confirm completion offers only in-scope params and an out-of-scope reference is an edit-time
  error.
  DONE: name-based reference resolution, which uses the same search scope as completion, rejects `product` in action hide, `product` in its own choices block, and `quantity` in its own choices block with `NOT_FOUND`, while legal service and earlier-parameter names resolve.
  Forcing action hide to reference `product` by persistent node reference produces the edit-time model-checker error `The reference product (variable) is out of search scope`; restoring `orderService` returns the `Customer` root to its clean state.

## 4. Typesystem (typed blocks)

- [x] 4.1 Type each block to its contract: `hide`→`boolean`; `disable`/`validate`→reason `String`-or-null;
  `choices`/`autoComplete`→`Collection<ParamType>`; `default`→`ParamType`.
  DONE: lifecycle roles now contain `LifecycleBlock`, an `IMethodLike` wrapper around a BaseLanguage `StatementList`.
  `LifecycleBlock.getExpectedRetType()` derives `boolean`, `String`, the copied parameter type, or `Collection<copied ParamType>` from the block's containment role.
  `EntityType` now extends BaseLanguage `Type`, so both Java-backed and entity-backed parameter types can be embedded as generic arguments.
  The six `Customer.scopeProbe` supporting blocks were migrated without losing their scope-reference fixtures, and the language Make plus root checks are clean apart from the existing informational String recommendation and the behavior quotation's raw-Collection warning.
- [x] 4.2 Confirm a wrong-typed block body is an edit-time type error.
  DONE: added `typeOf_LifecycleBlock`, which collects the wrapper's return statements and constrains each returned expression to the behavior-derived expected type.
  A temporary `return "wrong"` in action hide produced the edit-time error `type string is not a subtype of boolean`.
  The deliberately invalid return was removed immediately afterward; `Customer` returned to its prior no-error state.

## 5. Constraints

- [x] 5.1 Warn at edit time when reordering parameters invalidates an existing reference (param order =
  dependency order).
  DONE: `warn_forward_parameter_reference` checks parameter-targeting `ActionVariableReference` nodes through the `LifecycleScopeChecks` helper and reports `parameter reference is out of scope after parameter reordering` when the owning parameter precedes its referenced dependency.
  Moving `quantity` before `product` in `Customer.scopeProbe` produced the explicit warning on both affected `product` references, alongside the existing out-of-search-scope error.
  Restoring `quantity` to index 1 returned `Customer` to its prior no-error state.
- [x] 5.2 Verify Causeway 3.6 support + signatures for per-param `hide`/`disable` (the proposal flags
  these as needing confirmation).
  DONE: verified against Apache Causeway tag `rel/causeway-3.6.0` at commit `07f4bea` that the default programming model registers both parameter factories.
  Mixin parameter-name conventions support `hide<ParamName>(Params)` returning primitive `boolean` and `disable<ParamName>(Params)` returning `String` or `TranslatableString`; indexed positional names are also supported.
  PAT discovery requires the generated `Params` type to expose a public constructor matching the complete action parameter signature, so task 6.1 must emit a public immutable value carrier.
  Evidence and source paths are recorded in `docs/causeway-3.6-parameter-lifecycle-signatures.md`.

## 6. Generator (parameters-class-style mixins)

- [x] 6.1 Generate the immutable `Params` value carrier from the single parameter-field declarations.
  DONE: the Entity root template now loops over nested actions and emits one static action shell containing
  `public static final class Params`, private final fields, a public full-arguments constructor, and
  record-style accessors generated from the ordered parameter declarations.
  The `scopeProbe` sandbox fixture now declares `product : String` and `quantity : int`; generated
  `Customer.java` contains the matching carrier, compiles with JDK 21 against Causeway 3.6.0, and satisfies
  Causeway PAT's public-constructor contract.
  MPS 2026.1 BaseLanguage has no Java `record` concept, so the approved record-equivalent class is the
  specified output.
- [x] 6.2 Generate by-name supporting methods from the blocks; map each parameter reference to the right
  form (`act` argument vs `Params` accessor).
  DONE: the Entity template now emits `act`, action-level `hideAct`/`disableAct`/`validateAct`, and
  per-parameter `choices<Name>`/`default<Name>`/`validate<Name>`/`autoComplete<Name>`/`hide<Name>`/
  `disable<Name>` methods only when their corresponding blocks exist.
  Supporting methods use Causeway 3.6 PAT signatures (`Params params`, plus `String search` for
  auto-complete), copy the embedded BaseLanguage bodies, and derive per-parameter names and return types.
  `ActionVariableReference_TextGen` maps copied parameter references to direct `act` arguments or
  `params.<name>()` accessors according to the generated enclosing method; service references remain field
  names and mixee references become the explicit `mixee` field.
  The static nested mixin now also has its explicit mixee field and constructor.
  The expanded `scopeProbe` fixture exercises every action-level and per-parameter supporting-method family.
  Generated choices/auto-complete signatures intentionally use raw `Collection`: Causeway discovers these
  methods by raw return type and the DSL already enforces `Collection<ParamType>`, while copying a primitive
  parameter type directly into a Java generic argument would produce illegal output such as
  `Collection<int>`.
- [x] 6.3 Generate `@Inject private <Type> <name>;` for each declared injected service.
  DONE: the nested action template loops over `Action.injectedServices`, copies each
  `InjectedService.type.javaType`, derives the field name, and retains Jakarta's `@Inject` annotation.
  `Customer.scopeProbe.orderService` is now explicitly typed as `Object`; generation emits
  `@Inject private Object orderService;`, all copied lifecycle references resolve to that field, and JDK 21
  compiles the generated `Customer.java` and `Product.java` against the Causeway 3.6/Jakarta classpath.

## 7. Verify against golden

- [x] 7.1 Extend the `reference-app` golden with an action carrying supporting blocks + an injected
  service; compile it against Causeway 3.6.0 (the verified target).
  DONE: `reference-app` now models `Customer.placeOrder` as the approved static nested mixin with an
  explicit `Customer` mixee constructor, public immutable `(Product, int)` `Params` carrier, Jakarta-
  injected `OrderService`, `act`, all three action lifecycle methods, and every per-parameter supporting-
  method family generated by the sandbox fixture.
  `JAVA_HOME=$HOME/.sdkman/candidates/java/21.0.10-tem mvn -q -f reference-app/pom.xml clean compile`
  succeeds against Causeway 3.6.0 and Jakarta.
  JDK 21 `javap` confirms the public one-argument mixee constructor, complete public `Params` constructor,
  record-style accessors, and the expected PAT method descriptors.
- [ ] 7.2 `./gradlew generateModels` green; diff generated mixins vs the extended golden.
- [ ] 7.3 Compile the generated mixins against Causeway 3.6.0 + Jakarta.
