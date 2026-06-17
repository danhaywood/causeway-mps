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
- [ ] 0.2 Make each declared service in scope (as a variable) for the `act` body (simplest scope case —
  see §3.1). Confirm a body reference to the service resolves. *(Needs the scope provider — §3; the
  structure exists but bodies can't yet reference services until scope is wired.)*
- [x] 0.3 Reflect that the concept now exists — DONE for the generator-template doc OPEN ITEM (no longer
  a design-only prerequisite). The promoted `dsl-domain-model` spec is updated at archive time (the delta
  in `specs/dsl-domain-model/spec.md` merges then), not hand-edited mid-change.

## 1. Structure concepts

- [ ] 1.1 Action-level supporting blocks on `Action`: `hide`, `disable`, `validate`, each an embedded
  baseLanguage block alongside the `act` body.
- [ ] 1.2 Per-parameter supporting blocks on `Parameter`: `choices`, `default`, `validate`,
  `autoComplete`, `hide`, `disable`, each an embedded baseLanguage block.
- [ ] 1.3 Top-level / explicit-target action form (`action … on <Entity> as <mixee>`) in addition to the
  nested form (target implicit = enclosing entity).
- [ ] 1.4 `./gradlew checkModels` green on a model exercising both forms + all block kinds.

## 3. Scope provider (the hard part — GUI-authored)

- [ ] 3.1 Prototype the simplest case first: parameters + mixee + injected services visible in the `act`
  body (baseLanguage scope extension).
- [ ] 3.2 Implement the full lifecycle lattice (`dsl-action-scoping`): action `hide`/`disable` → no
  params; param *i* `default`/`choices`/`hide`/`disable`/`autoComplete` → `[0..i-1]`; param *i*
  `validate` → `[0..i]`; action `validate`/`act` → all. Mixee + services universal.
- [ ] 3.3 Confirm completion offers only in-scope params and an out-of-scope reference is an edit-time
  error.

## 4. Typesystem (typed blocks)

- [ ] 4.1 Type each block to its contract: `hide`→`boolean`; `disable`/`validate`→reason `String`-or-null;
  `choices`/`autoComplete`→`Collection<ParamType>`; `default`→`ParamType`.
- [ ] 4.2 Confirm a wrong-typed block body is an edit-time type error.

## 5. Constraints

- [ ] 5.1 Warn at edit time when reordering parameters invalidates an existing reference (param order =
  dependency order).
- [ ] 5.2 Verify Causeway 3.6 support + signatures for per-param `hide`/`disable` (the proposal flags
  these as needing confirmation).

## 6. Generator (parameters-class-style mixins)

- [ ] 6.1 Generate the `Params` record from the single parameter-field declarations.
- [ ] 6.2 Generate by-name supporting methods from the blocks; map each param reference to the right form
  (`act` arg vs `Params` accessor vs validated-param arg).
- [ ] 6.3 Generate `@Inject private <Type> <name>;` for each declared injected service.

## 7. Verify against golden

- [ ] 7.1 Extend the `reference-app` golden with an action carrying supporting blocks + an injected
  service; compile it against Causeway 3.6.0 (the verified target).
- [ ] 7.2 `./gradlew generateModels` green; diff generated mixins vs the extended golden.
- [ ] 7.3 Compile the generated mixins against Causeway 3.6.0 + Jakarta.
