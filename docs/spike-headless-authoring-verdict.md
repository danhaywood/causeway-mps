# Spike verdict: headless authoring of MPS models

Change: `spike-headless-authoring`. Date: 2026-06-16. **Deliverable = this verdict.**

## Verdict: GO (caveat closed)

Claude **can** author MPS structure concepts headlessly as the primary Phase B workflow.
Pure GUI authoring is **not** required.

### Update — caveat fully resolved (2026-06-16)

The `conceptId` gap was closed via option (a): one throwaway `SampleEntity` concept was created
in the MPS GUI and saved, which revealed the full ID pattern (`conceptId` property `EcuMT`
= `6714410169261853888`, plus `PropertyDeclaration`/`LinkDeclaration`/`InterfaceConceptReference`
ids and the `tpck:` targets for `BaseConcept`/`INamedConcept`/`string`). Using that pattern,
**five real concepts — `Module`, `Entity`, `Property`, `Action`, `Parameter` — were authored
entirely by editing `causeway.structure.mps` by hand** (names via `INamedConcept`, `implements`,
aggregation child collections, reference links, fresh unique `conceptId`/`linkId`s).

`./gradlew checkModels --rerun-tasks` → **BUILD SUCCESSFUL, 0 errors** (the only 3 warnings are
the unrelated empty-generator-model warning). The headless author → validate loop works
end-to-end.

**Remaining refinements (not blockers, deferred):**
- **Cardinality:** the sample didn't capture `sourceCardinality`, so child collections currently
  use MPS's default (single), not `0..n`. Need that one encoding (set `0..n` on one link in the
  GUI + save, or look it up) to make `entities`/`properties`/`actions`/`parameters` true collections.
- **Type union** (interface concept + baseLanguage-type arm), **Action.returnType**, **Action.semantics**
  (enum), and **Action.body** (embedded baseLanguage `StatementList`) need IDs from those other
  languages — capture them the same way (reference them once in the GUI) or import the languages.
- **Editor**: relying on MPS default editors (no editor aspect authored).
- **Generator**: the separately-hard aspect; out of this spike's scope.

The original blocker analysis below is retained for the record.

---

## What was proven to work

1. **The headless build + modelcheck oracle works** in this environment.
   - Bootstrapped a Gradle **9.0.0** wrapper. (Gradle 8.x fails: the plugin needs a Kotlin-2
     runtime — `NoClassDefFoundError kotlin/coroutines/jvm/internal/SpillingKt`.)
   - `de.itemis.mps.gradle.common` 1.30.x `MpsCheck`/`MpsGenerate` tasks, MPS **2025.3**
     resolved from `artifacts.itemis.cloud`. (`com.specificlanguages.mps` was a dead end —
     it's packaging-oriented and no-ops without an MPS *build solution*.)
   - `./gradlew checkModels` runs modelcheck over the real project in ~6 s (after the one-time
     ~1 GB MPS download) and reports precise diagnostics. **This is a reliable validator.**

2. **Hand-authored `.mps` XML loads and is understood.** A `Module` `ConceptDeclaration`,
   hand-written in `causeway.structure.mps`, was parsed by MPS and recognised as a concept
   named `Module`. The persistence-v9 format is learnable: the `<registry>` maps a short
   `index` alias → real metamodel `id`; `index` aliases only need to be self-consistent
   (mirrors the existing `…@generator.mps` model in this repo).

## The one caveat (the qualifier)

A **manually-created concept needs its stable IDs generated** — the `conceptId` (and per-feature
IDs) that the MPS GUI's *“Generate IDs”* intention auto-assigns. modelcheck flagged exactly this:

```
de.itemis.mps.gradle.modelcheck printError
  If this concept was created manually, invoke the "Generate IDs" intention on it
  [.../causeway.structure)/...]
```

This is a **specific, documented, fixable** issue — not a wall. It could not be closed in this
session only because the exact `conceptId` property id is not extractable from the shipped MPS
distribution (no source structure models ship; descriptor models don't reference it), and
inventing it from memory risks more failed iterations.

### The attempted model (for reference / next session)

```xml
<registry>
  <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
    <concept id="1071489090640" name="…ConceptDeclaration" flags="ig" index="cp1c">
      <property id="1096454100552" name="rootable" index="n9X3I" />
    </concept>
  </language>
  <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
    <concept id="1169194658468" name="…INamedConcept" flags="ngI" index="TrEIO">
      <property id="1169194664001" name="name" index="TrG5h" />
    </concept>
  </language>
</registry>
<node concept="cp1c" id="8463398836524515931">
  <property role="TrG5h" value="Module" />   <!-- name = "Module": loaded fine -->
  <property role="n9X3I" value="true" />     <!-- rootable -->
</node>
<!-- MISSING: the ConceptDeclaration.conceptId (+ feature ids) that "Generate IDs" assigns -->
```

(Reverted from `causeway.structure.mps` after the run, to keep the baseline modelcheck green.
The model is preserved here as evidence.)

## Recommended Phase B strategy: hybrid headless authoring

1. **Validate continuously via the headless oracle** (`./gradlew checkModels`) — works now.
2. **Close the conceptId gap** one of these ways (pick when resuming):
   - **(a) Seed the ID reference once** — author one skeleton concept in the MPS GUI (or pull a
     sample `structure.mps`), capture the `conceptId`/feature property ids, then Claude authors
     and extends concepts headlessly with correct ids. *Lowest effort, recommended.*
   - **(b) Headless “Generate IDs”** — run MPS's id-generation via an Open API / `execute`-style
     script in the build, so even from-scratch concepts get valid ids without the GUI.
3. After the gap is closed, Claude can do the bulk of Phase B structure authoring headlessly;
   the **generator** aspect remains the separately-hard piece (out of this spike's scope).

## Bottom line

The big unknowns are resolved: the build/validate loop is real and green, and hand-authored
models load. Headless authoring is viable for Phase B; it needs a small, one-time conceptId
bootstrap (option a or b) rather than full GUI authoring.
