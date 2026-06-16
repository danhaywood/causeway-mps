## Context

`/opsx:apply` of `entity-property-action-slice` stalled on the realization that MPS models (`.mps`) are projectional-editor XML normally authored through the GUI. But `headless-mps-build` task 1.1 confirmed a headless build is feasible (MPS 2025.3 downloadable; `com.specificlanguages.mps` 2.0.1 published; JDK 21 available). That makes a headless **validation oracle** possible — `modelcheck`/`generate` will report whether a hand-authored model is valid. This spike tests whether that oracle is enough to let Claude author concepts without the GUI.

## Goals / Non-Goals

**Goals:**
- A working headless `generate` + `modelcheck` loop in this environment.
- One hand-authored concept (`Module`) that passes modelcheck and generates clean.
- A clear, recorded go/no-go on headless authoring as the Phase B strategy.

**Non-Goals:**
- The rest of the language, any generator templates, any editor aspect, CI wiring.
- A polished/promotable build (minimal is fine; promotion to `headless-mps-build` is later).
- Proving runtime Causeway behaviour (that is the other changes' concern).

## Decisions

**Establish a green baseline before authoring anything.** Run the headless build against the *current empty scaffold* first. Rationale: separates "the build/oracle works" from "my hand-authored XML is correct." If the empty scaffold doesn't generate/modelcheck clean, that's a toolchain problem to fix before authoring — otherwise the first authoring error is indistinguishable from a build setup error.

**Author the structure aspect by editing `.mps` XML directly.** Structure is the most tractable aspect to hand-write: `ConceptDeclaration` plus property/link declarations, against the fixed concept IDs of `jetbrains.mps.lang.structure`. Alternative — the MPS Open API via an `execute`/ant script — is more setup and no easier for a single concept; deferred unless hand-XML proves unreliable.

**Pick `Module` as the spike concept.** It is the simplest root concept (`INamedConcept` + one child collection `entities`), needs no types/references/behaviour, and is the foundation everything else hangs off. A clean result generalizes to Entity/Property/Action.

**Rely on MPS default editors.** MPS auto-generates a usable projectional editor for any concept lacking one, so the spike needs no editor aspect — removing the hardest-to-hand-author *needed* piece from the path. The generator (the genuinely hard aspect) is explicitly out of scope here.

**Time-box and force a written verdict.** The deliverable is the decision, not the concept. Record go/no-go with evidence (build output) regardless of result, so a failure is still a useful outcome that redirects Phase B.

## Risks / Trade-offs

- **Hand-authored XML may be rejected/silently dropped by MPS** → That is exactly what the spike measures; the build oracle surfaces it. Iterate against modelcheck; cap iterations and record the verdict.
- **Gradle bootstrap / ~1 GB MPS download may fail in this sandbox** → We verified the artifacts are reachable (HTTP 200); if the download or wrapper bootstrap fails, that itself is a no-go signal for "Claude does it headlessly here" and is recorded.
- **A green empty-scaffold build might mask issues that only appear with real concepts** → Mitigated by authoring a real concept (`Module`) immediately after baseline, not stopping at the empty build.
- **Spike effort could balloon** → Strict scope (one concept, default editors, no generator) and a forced written verdict bound it.
- **Concept-ID / persistence-format details may be MPS-version-specific (2025.3 / persistence v9)** → Cross-check against the existing scaffold's own `.mps` headers (already persistence v9) rather than from memory.
