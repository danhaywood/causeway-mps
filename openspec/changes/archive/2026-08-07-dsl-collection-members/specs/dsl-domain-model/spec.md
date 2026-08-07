## ADDED Requirements

### Requirement: Collection concept

The language SHALL provide a named, rootable `Collection` concept for read-only list-valued contributed members.
An entity SHALL contain zero or more nested collections, and a collection root SHALL optionally reference an explicit target entity according to placement constraints.
A collection SHALL contain one element type, injected services, and one BaseLanguage body.

#### Scenario: Entity contains a nested collection

- **WHEN** `Customer` contains collection `recentOrders` with element type `Order`
- **THEN** the entity exposes the collection as a nested member

#### Scenario: Collection is an explicit-target root

- **WHEN** root collection `recommendedProducts` targets `Customer`
- **THEN** the model represents a collection contribution independently of the target entity root

#### Scenario: Collection targets an entity in another model

- **WHEN** a collection root in `recommendations` targets `Customer` in `customers`
- **THEN** the target resolves by persistent cross-model entity reference

#### Scenario: Collection body uses a service

- **WHEN** a collection declares an injected service and references it from its body
- **THEN** the reference resolves through the collection's body scope
