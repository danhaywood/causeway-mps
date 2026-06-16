## ADDED Requirements

### Requirement: Headless generation of MPS modules
The build SHALL generate the `causeway` language, `causeway.runtime`, and `causeway.sandbox` modules from the command line, without launching the MPS GUI.

#### Scenario: Generate from the CLI
- **WHEN** the headless build's generate task is run on a clean checkout
- **THEN** MPS generates the output for all three modules and the task completes successfully without any GUI interaction

### Requirement: Pinned MPS and JDK versions
The build SHALL pin the MPS version to 2025.3 (baseline 253) and SHALL select a JDK 17+ independently of the machine's default `java` (which is 11), e.g. via a Gradle Java toolchain. The pinned versions SHALL be declared in a single location.

#### Scenario: Build uses pinned toolchain, not default java
- **WHEN** the build runs on a machine whose default `java` is 11
- **THEN** the build resolves and uses the pinned JDK 17+ (21) and the pinned MPS 2025.3 distribution, not the default JDK

### Requirement: Modelcheck gate
The build SHALL run MPS modelcheck over the modules and SHALL fail when model errors are present.

#### Scenario: Modelcheck passes
- **WHEN** modelcheck runs against models with no errors
- **THEN** the build proceeds to the compile step

#### Scenario: Modelcheck fails the build
- **WHEN** a model contains an error (e.g. an unresolved reference)
- **THEN** the build fails at the modelcheck step with the MPS diagnostic, before any Java compile

### Requirement: Compile generated Causeway Java headlessly
The build SHALL compile the Java generated from `causeway.sandbox` against the Causeway applib + Jakarta Persistence/Inject (aligned with `reference-app`: Causeway 3.6.0, Jakarta Persistence 3.1.0, Jakarta Inject 2.0.1), on a classpath that also includes the hand-written application code.

#### Scenario: Generated Java compiles in the headless build
- **WHEN** the generate and modelcheck steps have succeeded
- **THEN** the generated sources compile against the Causeway + Jakarta dependencies together with the hand-written `reference-app` code, with no compile errors

### Requirement: Single-command pipeline, fail-fast
The build SHALL expose a single command that runs generate → modelcheck → compile in order, failing fast on the first failed step.

#### Scenario: One command runs the whole pipeline
- **WHEN** the single build command is invoked
- **THEN** it runs generate, then modelcheck, then compile, and stops at the first step that fails with that step's diagnostics
