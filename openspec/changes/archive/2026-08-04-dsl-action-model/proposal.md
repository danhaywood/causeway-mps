## Why

Causeway's action programming model is doubly repetitive: the action name is repeated across every
supporting method (`act`/`validateAct`/`disableAct`/`hideAct`/`choices0Act`/`default1Act`/…), and the
parameter list is re-stated per method (all params on `act`/`validate`, none on `hide`/`disable`, a
prefix on `choicesN`/`defaultN`, the Nth on `validateN`). Even Causeway's cleaner **parameters-class**
style still duplicates params (the `act(P,Q)` signature *and* the `Params` record fields). We can do
better: model an action **like a mixin**, with parameters declared **once as fields** and the supporting
behaviours as **nested blocks** that reference those params by name. This kills both repetitions — and,
crucially, lets the DSL **enforce Causeway's lifecycle parameter-scoping at edit time**, preventing a
bug class the Java models permit.

> **Stub:** proposal + design captured now (explore). Specs + tasks fleshed when scheduled.
> Depends on `dsl-mixins` (actions generate as mixins) and the archived `dsl-type-system` (Action/
> Parameter concepts + embedded baseLanguage body). This is the richest extension of the action concept.

## What Changes

- **Action gains action-level supporting blocks**: `hide`, `disable`, `validate` (cross-param), alongside
  `act` (the body) — each a scoped embedded-baseLanguage block.
- **Parameter gains per-param supporting blocks**: `choices`, `default`, `validate`, `autoComplete`,
  `hide`, `disable` — each scoped.
- **Lifecycle scoping** (the headline value-add): each block sees only the params entered before it runs
  (action `hide`/`disable` → none; param *i*'s `choices`/`default`/`hide`/`disable` → params `[0..i-1]`;
  its `validate` → `[0..i]`; action `validate`/`act` → all). The mixee + injected services are universal.
- **Two authoring forms** (both): **nested** in an `Entity` (target implicit = the enclosing entity) and
  **top-level** with an explicit target (`action … on Customer as customer`) for cross-module contribution.
- **Generation**: parameters-class-style mixins (by-name supporting methods + a generated `Params`
  record), derived from the single param-field declarations.
- **Typed baseLanguage blocks** (no declarative sugar yet): each block's body is typed to its contract
  (`hide`→boolean, `disable`/`validate`→reason-or-null, `choices`→`Collection<ParamType>`, `default`→`ParamType`).

## Capabilities

### New Capabilities
- `dsl-action-scoping`: The lifecycle parameter-scoping rules for action/parameter supporting blocks
  (which params each block may reference), enforced at edit time.

### Modified Capabilities
- `dsl-domain-model`: `Action` gains supporting blocks + an explicit-target form; `Parameter` gains its
  own supporting blocks; param order becomes significant (dependency order).

## Impact

- **`causeway.structure`**: supporting-block children on `Action`/`Parameter`; explicit-target form.
- **`causeway.constraints`/`causeway.typesystem`**: the lifecycle scope provider — **the technical crux**:
  exposing params to the embedded baseLanguage as in-scope, position-dependent variables (baseLanguage
  scope extension). Advanced MPS; imperative → GUI-authored, not headless hand-XML.
- **`causeway.generator`**: parameters-class-style mixin templates; map a param reference to the right
  form per block (act arg vs `Params` accessor vs validated arg).
- **Composes with**: member-invocation transparency (blocks can call mixee members) and a possible
  **auto-injected-services** freebie (generator detects referenced service types → emits `@Inject` fields).
- **Out of scope:** declarative `when/reason` sugar; auto-inject services (candidate v2); properties'/
  collections' supporting blocks (same machinery, separate slice).
