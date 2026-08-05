## ADDED Requirements

### Requirement: Generated action classes are recognized as Causeway mixins
The build SHALL verify representative generated action classes with the Causeway 3.6 programming model.
Each verified class SHALL expose a `MixinFacet`, identify the generated entity as its mixee type, select `act` as its main method, provide a public single-argument mixee constructor, instantiate for a target entity instance, and derive the authored action name as its member id.

#### Scenario: Nested generated action is a runtime mixin
- **WHEN** Causeway's programming model processes the generated nested class for `Customer.placeOrder`
- **THEN** it recognizes the class as a mixin for `Customer`, selects `act`, constructs it for a `Customer`, and derives member id `placeOrder`

#### Scenario: Explicit-target generated action is a runtime mixin
- **WHEN** Causeway's programming model processes the generated top-level class for `Customer_topLevelProbe`
- **THEN** it recognizes the class as a mixin for `Customer`, selects `act`, constructs it for a `Customer`, and derives member id `topLevelProbe`

### Requirement: Headless build verifies generated action mixins
The reproducible headless pipeline SHALL run runtime mixin verification after generated Java compilation and SHALL fail when either representative generated action form is not recognized according to the runtime contract.

#### Scenario: Runtime mixin verification succeeds
- **WHEN** `headlessBuild` compiles generated Java whose nested and top-level action classes satisfy the Causeway mixin contract
- **THEN** the runtime mixin verification step succeeds

#### Scenario: Runtime mixin verification rejects an invalid generated action
- **WHEN** a generated action class lacks compatible mixin metadata, main method, or mixee constructor
- **THEN** the runtime mixin verification step fails the headless build
