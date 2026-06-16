## ADDED Requirements

### Requirement: Sandbox imports external Java as classpath stubs
The `causeway.sandbox` solution SHALL import the Causeway applib API and a hand-written sample application as Java classpath stubs, so that DSL programs and their embedded baseLanguage bodies can reference those external types.

#### Scenario: External types are resolvable in the model
- **WHEN** the sandbox is configured with the Causeway applib and a sample application on its classpath
- **THEN** types from those libraries (e.g. a Causeway service interface or a hand-written class) are resolvable as baseLanguage types within sandbox models

### Requirement: Embedded action body can reference an external type
An `Action` body SHALL be able to reference and invoke external Java types (Causeway APIs and hand-written application classes) imported as stubs, and that reference SHALL survive generation into compilable Java. This is the milestone that proves coexistence.

#### Scenario: Action body calls into hand-written code
- **WHEN** an `Action` body references a hand-written application type (e.g. injects/calls a domain service) imported as a stub
- **THEN** the model resolves the reference, and the generated method body compiles against that external type on the shared classpath

### Requirement: Coexistence boundary is one-way via the classpath
The MPS model and hand-written Java SHALL meet only on the JVM classpath. The model SHALL NOT read generated Java, and hand-written Java SHALL NOT be required to read the model; they SHALL interoperate as plain Java on a shared classpath.

#### Scenario: Generated and hand-written code share one classpath
- **WHEN** generated entity classes and hand-written classes are placed on the same classpath
- **THEN** each can reference the other as ordinary Java (e.g. via Spring injection or direct type references) without any model-level coupling
