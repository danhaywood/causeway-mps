## ADDED Requirements

### Requirement: Headless generation of MPS modules
The build SHALL generate the `causeway` language, `causeway.runtime`, and `causeway.sandbox` modules from the command line, without launching the MPS GUI.

#### Scenario: Generate from the CLI
- **WHEN** the headless build's generate task is run on a clean checkout
- **THEN** MPS generates the output for all three modules and the task completes successfully without any GUI interaction

### Requirement: Pinned MPS and JDK versions
The build SHALL pin MPS 2026.1 (baseline 261), JDK 25 for the MPS Make worker, and JDK 21 for generated application Java independently of the machine's default `java`.
The pinned versions SHALL be declared in a single location and selected through Gradle toolchains.

#### Scenario: Build uses pinned toolchains, not default java
- **WHEN** the build runs on a machine whose default `java` is 11
- **THEN** the build resolves and uses pinned JDK 25 and JDK 21 toolchains plus the pinned MPS 2026.1 distribution, not the default JDK

### Requirement: Modelcheck gate
The build SHALL run MPS modelcheck over the modules and SHALL fail when model errors are present.

#### Scenario: Modelcheck passes
- **WHEN** modelcheck runs against models with no errors
- **THEN** the build proceeds to the compile step

#### Scenario: Modelcheck fails the build
- **WHEN** a model contains an error (e.g. an unresolved reference)
- **THEN** the build fails at the modelcheck step with the MPS diagnostic, before any Java compile

### Requirement: Compile generated Causeway Java headlessly
The build SHALL compile the Java generated from `causeway.sandbox` against the dependency versions established by `reference-app`: Causeway 3.6.0, Jakarta Persistence 3.1.0, and Jakarta Inject 2.0.1.

#### Scenario: Generated Java compiles in the headless build
- **WHEN** the generate and modelcheck steps have succeeded
- **THEN** the generated sources compile against the Causeway and Jakarta dependencies with no compile errors

### Requirement: Single-command pipeline, fail-fast
The build SHALL expose a single command that runs generate → modelcheck → compile in order, failing fast on the first failed step.

#### Scenario: One command runs the whole pipeline
- **WHEN** the single build command is invoked
- **THEN** it runs generate, then modelcheck, then compile, and stops at the first step that fails with that step's diagnostics
