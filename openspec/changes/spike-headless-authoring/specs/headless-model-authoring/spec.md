## ADDED Requirements

### Requirement: Headless build runs in this environment
The spike SHALL produce a runnable headless build (Gradle wrapper bootstrapped, MPS 2025.3 resolved) that can execute `generate` and `modelcheck` without the MPS GUI.

#### Scenario: Build executes headlessly
- **WHEN** the headless build's generate/modelcheck command is run from the command line
- **THEN** it resolves the pinned MPS 2025.3 distribution and runs to completion (pass or fail) without launching the GUI

#### Scenario: Bootstrap failure is recorded as a no-go signal
- **WHEN** the Gradle wrapper bootstrap or MPS download cannot complete in this environment
- **THEN** the spike records that as an explicit blocker and a no-go signal for headless authoring here

### Requirement: Green baseline on the empty scaffold
The spike SHALL first establish that `generate` + `modelcheck` pass against the current empty-but-valid `causeway` scaffold, before any concept is authored.

#### Scenario: Empty scaffold builds clean
- **WHEN** the headless build runs against the unmodified scaffold
- **THEN** generate and modelcheck both succeed, establishing the validation oracle and baseline

### Requirement: Hand-authored Module concept validates headlessly
The spike SHALL add the `Module` root concept (`INamedConcept` with an `entities` child collection) to `causeway.structure.mps` by editing the model XML directly, and SHALL prove it passes modelcheck and generates without errors.

#### Scenario: Authored concept passes modelcheck
- **WHEN** the `Module` concept has been hand-authored and the headless build is run
- **THEN** modelcheck reports no errors for the structure model and the language generates successfully

#### Scenario: Iterate to green against the oracle
- **WHEN** modelcheck or generate reports an error in the hand-authored concept
- **THEN** the spike uses that diagnostic to correct the XML and re-runs, until the build is green or the iteration cap is reached

### Requirement: Recorded go/no-go verdict
The spike SHALL record an explicit written verdict on whether headless hand-authoring is viable as the `entity-property-action-slice` Phase B strategy, with supporting build evidence, regardless of outcome.

#### Scenario: Verdict captured either way
- **WHEN** the spike concludes (success or failure)
- **THEN** a written go/no-go is recorded with the build evidence, and it states the recommended Phase B authoring approach (headless vs GUI-driven)
