## Context

The current Causeway generator has two action placements.
An action contained by an `Entity` generates as a public static nested class of the generated entity, while a root action with an explicit `target` generates as a top-level class named from the mixee and member.
Both forms carry class-level `@Action`, a public single-argument mixee constructor, and an `act` method.

Causeway 3.6 defines `@Action` as a type-capable annotation meta-annotated with `@DomainObject(nature = Nature.MIXIN, mixinMethod = "act")`.
Its mixin naming strategy derives a member id from the final token of either an underscore-separated top-level name or a dollar-separated nested binary name.
Causeway's own metamodel tests use static nested `@Action` classes as valid mixins.

The generated classes therefore follow supported Causeway forms, but this project currently verifies only source shape and Java compilation.
The promoted `causeway-generation` specification also conflicts with the implementation by requiring every action to generate as a separate top-level `Mixee_member` class.

## Goals / Non-Goals

**Goals:**

- Prove that Causeway 3.6 recognizes generated nested and top-level action classes as mixins.
- Verify the inferred mixee type, `act` main method, logical member id, and public mixee constructor.
- Preserve the existing generation topology.
- Make runtime mixin verification part of the reproducible headless pipeline.
- Reconcile the promoted generation specification with the implemented topology.

**Non-Goals:**

- Starting a complete Causeway Spring application or UI.
- Changing nested actions into top-level classes.
- Adding derived properties or collections.
- Introducing `IContributedMember` or another generic member abstraction.
- Adding transparent `target.member(...)` or `wrap(target).member(...)` invocation.
- Resolving hand-written mixins or assignability through entity inheritance.

## Decisions

### Preserve authored placement in generated topology

A nested DSL action remains a static nested Java mixin class, and a root action with an explicit target remains a top-level Java mixin class.
This preserves the existing generator, keeps same-entity actions colocated with their entity, and retains top-level classes for cross-model contributions.

The alternative of flattening every action to `Mixee_member` would invalidate the current golden shape and offers no Causeway compatibility benefit because the framework explicitly supports dollar-separated nested class names.

### Treat class-level `@Action` as the mixin declaration

The generator SHALL continue to place `@Action` on the generated mixin class.
It SHALL not add a redundant explicit `@DomainObject(nature = Nature.MIXIN)` annotation because Causeway's `@Action` already carries that meta-annotation and selects `act` as the main method.

### Verify with Causeway's metamodel, not annotation reflection alone

The verification shall process generated action classes through `MetaModelContext_forTesting` and the active Causeway `ProgrammingModel` factories.
For each representative generated action class, it shall obtain a `MixinFacet` and assert:

- the facet exists;
- `isMixinFor` accepts the generated target entity type;
- the main method name is `act`;
- the public single-argument constructor accepts the target entity type;
- the facet can instantiate the mixin for a target instance; and
- `ProgrammingModel.mixinNamingStrategy().memberId(...)` yields the authored action name.

Direct annotation reflection would prove only metadata presence and could miss programming-model or constructor incompatibilities.
A full Spring application startup would prove more but adds unrelated module assembly and service configuration to this focused contract test.

### Cover both generated forms

The verification shall include at least one nested generated action, such as `Customer.placeOrder`, and one explicit-target top-level action, such as `Customer_topLevelProbe`.
This guards both the dollar-token and underscore-token naming paths.

### Integrate verification after generated Java compilation

The headless pipeline shall run mixin verification only after generated Java and its support classes have compiled.
The verifier shall use the same Causeway 3.6 dependency baseline as generated-source compilation.
Failure to recognize either representative class as a mixin shall fail the build.

### Defer derived members to a separate change

The earlier design combined action mixins with persisted-versus-derived properties and a not-yet-defined collection model.
That scope is removed because the current `Property` concept has no derived body and the DSL has no `Collection` concept.
A future change should decide whether derived members use distinct concepts or conditional forms before adding their generation and invocation semantics.

### Narrow the successor behavior extension

`dsl-behavior-extensions` can initially resolve only DSL `Action` nodes.
For a target entity it can gather nested actions plus root actions whose explicit target is that entity, then lower invocation to `FactoryService.mixin(...).act(...)` or `WrapperFactory.wrapMixin(...).act(...)`.
A generic `IContributedMember` abstraction is not a prerequisite for that first slice.

## Risks / Trade-offs

- **The metamodel verifier does not prove Spring classpath discovery.** It deliberately proves Causeway programming-model recognition while leaving full application assembly to a later end-to-end milestone.
- **Causeway internal test APIs may change.** Pinning verification to the project's Causeway 3.6 baseline keeps the contract explicit, and compilation will expose incompatible upgrades.
- **Nested binary names are less conventional than top-level underscore names.** Causeway's naming strategy explicitly handles dollar-separated names, and the verifier protects that behavior.
- **The change adds another headless verification dependency.** Keeping it as a post-compilation test avoids affecting generated application runtime dependencies.

## Migration Plan

1. Add representative runtime mixin assertions against the existing generated classes.
2. Add the verification step after generated Java compilation in the headless pipeline.
3. Correct the `causeway-generation` action-mixin requirement to describe nested and explicit-target forms.
4. Retain all existing generated Java and golden comparisons unless runtime verification exposes a real incompatibility.
5. Roll back by removing the verification step and restoring the prior specification; no model migration is required because this change does not alter DSL structure.

## Open Questions

None for this narrowed change.
Full Spring discovery, derived members, collections, and transparent invocation are explicitly separate follow-up decisions.
