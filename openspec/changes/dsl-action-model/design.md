## Context

Explore-mode capture (2026-06-17). `dsl-type-system` gave `Action` a name, parameters, return type,
semantics, and a single embedded baseLanguage `body`. This change models the *full* action programming
model — supporting behaviours and parameter dependencies — as nested, scoped blocks, eliminating the
repetition Causeway's Java forces. Builds on `dsl-mixins` (actions → mixin classes).

## Goals / Non-Goals

**Goals:** params-as-fields; action- and param-level supporting blocks; lifecycle parameter-scoping
enforced at edit time; nested + top-level-targeted forms; parameters-class-style generation.

**Non-Goals:** declarative `when/reason` sugar (later); auto-injected services (candidate v2);
property/collection supporting blocks (same machinery, separate slice); the scope-provider implementation
specifics (captured as the known-hard part, not designed here).

## Decisions

**Params-as-fields + nested supporting blocks.** Each parameter is declared once; `act`/`hide`/`disable`/
`validate` (action) and `choices`/`default`/`validate`/`autoComplete`/`hide`/`disable` (per param) are
nested blocks referencing params by name. Kills both the name repetition and the param-list repetition.

**Lifecycle parameter-scoping (the headline value-add).** A block sees every param entered *before it
runs*:

```
 phase                       block(s)                              params in scope
 ─────────────────────────   ───────────────────────────────────  ─────────────────────
 action availability         hide · disable        (action)        — (none)
 dialog, per param i          default_i · choices_i · hide_i ·     [0 .. i-1]
   (DECLARED order)           disable_i · autoComplete_i
   user enters param i        validate_i                           [0 .. i]
 all entered                 validate              (action)        [all]
 invoke                      act                                   [all]
 ─────────────────────────────────────────────────────────────────────────────────────
 ALWAYS in scope: the mixee (e.g. `customer`) + injected services
```

**Why this beats both Java styles.** Positional supporting methods are safe (can't read a later param)
but clunky and name-repeating; the parameters-class style is clean by-name but its `Params` record exposes
not-yet-entered params (reading an unset later param is a real, silent bug). The DSL generates the clean
parameters-class style **but** the edit-time scope only ever offers preceding params — so the generated
body never reads an unentered param. By-name cleanliness + positional safety.

**Param order = dependency order.** Forward references are impossible (completion offers only earlier
params); reordering params can invalidate references → an edit-time warning. Makes Causeway's implicit
positional dependency explicit and checked.

**Mixee handle.** Top-level form names it (`action … on Customer as customer`); nested form defaults it to
the enclosing entity (`this`/`self`, or the entity's members directly in scope). Both forms supported.

**Generate parameters-class-style mixins.** By-name supporting methods + a generated `Params` record from
the single param-field declarations. A param reference maps per block: `act` arg vs `Params` accessor vs
the validated-param arg — the generator picks.

**Typed baseLanguage blocks (no sugar yet).** Each block body is typed to its contract (`hide`→boolean,
`disable`/`validate`→reason-or-null, `choices`→`Collection<ParamType>`, `default`→`ParamType`,
`autoComplete`→`Collection<ParamType>` + search arg). Declarative `when/reason` sugar deferred.

## Risks / Trade-offs

- **The scope provider is the hard part** → exposing params to embedded baseLanguage as in-scope,
  position-dependent variables = baseLanguage **scope extension**. The deepest MPS work in the DSL;
  imperative → GUI-authored. Prototype the simplest case (params visible in `act`) before the full lattice.
- **Per-param `hide`/`disable` correctness** → verify Causeway's support + signatures (3.6) when building.
- **Reorder breaks references** → warn at edit time; otherwise a silent semantic change.
- **Scope creep** → this is the richest concept; keep properties'/collections' blocks and the sugar out
  of the first cut.

## Note (2026-06-17): the `@Inject` service-field gap (surfaced by `causeway-generator-first-slice`)

Building the Action generator template exposed a concrete gap this change must resolve. The golden
`Customer_placeOrder` mixin has `@Inject private OrderService orderService;` and its `act` body calls
`orderService`. But today `Action` models a `body` and **no injected-service field**, so a copied-through
body has nothing to resolve `orderService` against — the generated mixin can't compile. Options:
(a) model an injected-service field on `Action` that the body references; (b) **auto-detect** referenced
service types in the body and emit `@Inject` fields (this is the "auto-injected services" candidate v2
already noted as a Non-Goal above — this finding is the concrete motivation for it); (c) for a single
sample, declare it in the sandbox program. **Until settled, the Action template in
`causeway-generator-first-slice` can only emit a skeleton mixin, not the golden.** See
`docs/generator-template-authoring.md` (OPEN ITEM). The Entity/Property/Type templates have no such gap.
