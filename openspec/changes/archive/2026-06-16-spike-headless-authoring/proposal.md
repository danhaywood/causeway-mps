## Why

We need to know whether Claude can author the MPS `causeway` language **without a human driving the MPS GUI** — because that determines the whole strategy for `entity-property-action-slice` Phase B. The key insight: the MPS GUI is required for *ergonomic projectional authoring*, but **not** for *validation* — `modelcheck` and `generate` run headlessly and report errors. So the hypothesis is testable: hand-author MPS model XML, then iterate-to-green against a headless build. This is a time-boxed spike with an explicit go/no-go outcome, not a feature — it de-risks the authoring approach cheaply before we commit to it.

## What Changes

- Bootstrap a **Gradle wrapper** in this environment (no Gradle is currently installed — download a distribution and generate the wrapper).
- Stand up a **minimal headless build** using the already-decided toolchain (`com.specificlanguages.mps` 2.0.1 + `com.jetbrains:mps:2025.3` from `artifacts.itemis.cloud` + a JDK 21 toolchain), reusing `docs/headless-build-research.md`.
- Establish a **green baseline**: headless `generate` + `modelcheck` pass against the *current empty-but-valid* `causeway` scaffold (this is the validation oracle).
- **Hand-author one concept** — the `Module` root concept (`INamedConcept` with an `entities` child collection) — by editing `causeway.structure.mps` XML directly.
- **Verify** the hand-authored concept modelchecks clean and the language generates headlessly, iterating against the build until green.
- Rely on MPS **default editors** (author no editor aspect).
- Record an explicit **go/no-go**: is headless hand-authoring viable as the Phase B strategy, or do we fall back to GUI authoring for concepts?

## Capabilities

### New Capabilities
- `headless-model-authoring`: The validated loop of authoring an MPS model artifact (here, one structure concept) outside the GUI and proving it correct via a headless `modelcheck`/`generate` build — plus the recorded go/no-go decision on using this loop for Phase B.

### Modified Capabilities
<!-- None — spike introduces a new (investigative) capability; existing change specs are unchanged. -->

## Impact

- **New build files**: a minimal Gradle build + wrapper (may be promoted into `headless-mps-build` later, or kept spike-local).
- **`languages/causeway/models/causeway.structure.mps`**: gains a hand-authored `Module` concept (the spike's central artifact).
- **One-time cost**: ~1 GB MPS 2025.3 download; acceptable for the spike.
- **Relationship**: consumes `headless-mps-build`'s toolchain decision (task 1.1, done); does **not** replace it (that remains the productionized CI build). Outcome informs `entity-property-action-slice` Phase B — success means Claude can author concepts headlessly; failure means concept authoring stays GUI-driven.
- **Out of scope:** the rest of the language (Entity/Property/Action/Type), any generator templates, any editor aspect, constraints/typesystem beyond what `Module` needs, and CI wiring.
