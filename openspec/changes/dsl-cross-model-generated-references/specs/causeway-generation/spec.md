## ADDED Requirements

### Requirement: Cross-model explicit-target derived properties generate against the target classifier

The generator SHALL emit a root `DerivedProperty` declared in one model as a top-level Causeway property mixin even when its explicit target entity belongs to another imported model.
The top-level mixin SHALL remain in the declaring model's generated package while its final mixee field and public constructor SHALL use the target entity's generated classifier.
Entity-typed result and service references SHALL resolve to their owning generated classifiers regardless of source-model ownership.

#### Scenario: Cross-model derived property generates in its declaring package

- **WHEN** derived property `recommendedCustomer` is declared in model `recommendations` and targets `customers.Customer`
- **THEN** generation emits `recommendations.Customer_recommendedCustomer` with a final `customers.Customer` mixee field and public constructor accepting `customers.Customer`

#### Scenario: Cross-model property result references another entity

- **WHEN** a derived property declared in `recommendations` targets `customers.Customer` and returns `products.Product`
- **THEN** its generated `prop()` method compiles with return type `products.Product`

### Requirement: Cross-model generated references pass all verification boundaries

Generated cross-model contribution references SHALL resolve during MPS generation, compile with Java 21, and preserve Causeway 3.6 mixin discovery and execution semantics.
Generation output SHALL contain no null classifier target, unresolved-reference marker, or fallback string-based classifier identity.

#### Scenario: Headless build verifies a cross-model property mixin

- **WHEN** the sandbox contains a valid root derived property targeting an entity from an imported model
- **THEN** model checking, clean generation, generated-source verification, Java 21 compilation, and Causeway runtime property-mixin verification all succeed

#### Scenario: Causeway discovers the cross-model mixin

- **WHEN** the runtime verifier processes the generated cross-model property class
- **THEN** Causeway identifies the expected external mixee, property member id, no-argument `prop()` method, and executable calculated result

### Requirement: Cross-model action references use shared infrastructure when required

The implementation SHALL test explicit-target actions across model boundaries against the checkpointed classifier resolver.
If the existing action generator cannot resolve the external mixee classifier, it SHALL use the same shared cross-model reference mechanism as derived properties without changing action placement, invocation, or runtime semantics.

#### Scenario: Explicit-target action crosses a model boundary

- **WHEN** an action declared in model `recommendations` explicitly targets `customers.Customer`
- **THEN** generation either proves the existing action path resolves the external classifier or applies the shared resolver and produces a compiling Causeway action mixin with unchanged behavior
