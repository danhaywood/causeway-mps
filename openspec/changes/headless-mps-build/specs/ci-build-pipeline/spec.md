## ADDED Requirements

### Requirement: CI runs the headless build on every change
A CI pipeline SHALL run the headless build (generate → modelcheck → compile) on every push and pull request, and SHALL report failure when any step fails.

#### Scenario: CI gates a change that breaks generation or compilation
- **WHEN** a change is pushed that causes modelcheck or the generated-Java compile to fail
- **THEN** the CI pipeline reports a failed status for that change

#### Scenario: CI passes for a valid change
- **WHEN** a change is pushed whose models check cleanly and whose generated Java compiles
- **THEN** the CI pipeline reports success

### Requirement: Reproducible CI environment
The CI pipeline SHALL provision the pinned JDK 17+ and the pinned MPS 2025.3 distribution, independent of any preinstalled IDE, and SHALL cache the MPS distribution and build dependencies for stable, repeatable runs.

#### Scenario: Fresh CI runner produces the same result
- **WHEN** the pipeline runs on a fresh runner with no MPS IDE installed
- **THEN** it provisions the pinned JDK and MPS distribution and runs the full pipeline to the same outcome as a local headless build

### Requirement: Reproduces entity-property-action-slice verification
The CI pipeline SHALL exercise the same generate → modelcheck → compile steps that the `entity-property-action-slice` verification tasks (5.3–5.5) require, so those checks run automatically rather than manually in the IDE.

#### Scenario: Slice verification runs automatically
- **WHEN** the `causeway.sandbox` contains the sample DSL program from `entity-property-action-slice`
- **THEN** CI generates it, model-checks it, and compiles the generated Java — covering tasks 5.3–5.5 without manual IDE steps
