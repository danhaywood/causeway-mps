# Causeway concept catalog

Language reference: `l:99bd0b43-8ce5-4eaa-aac8-ff12e0700f84:causeway`.

## Rootable concepts

### `causeway.structure.Module`

A singleton metadata root for a model/module namespace.
It has the inherited `name` property and currently has no DSL children.

### `causeway.structure.Entity`

A Causeway domain entity root with inherited `name`.
Its `properties` role contains zero or more `Property` nodes.
Its `actions` role contains zero or more nested `Action` nodes.

### `causeway.structure.Action`

A rootable or entity-nested action with inherited `name` and `semantics : SemanticsOf`.
It contains `parameters`, optional `returnType`, optional BaseLanguage `body`, `injectedServices`, lifecycle/supporting blocks, and optional `target` entity nodes.
Its `ScopeProvider.getScope` implementation exposes all parameters in action validation and body blocks, but no parameters in action hide/disable blocks.
Injected services and the enclosing entity mixee remain visible in every action-level block.
Behavior root: `r:649c60cc-9a1a-4bef-8eeb-350f253ffdbd(causeway.behavior)/5455126814596634176`.
The generator emits static nested mixins for entity-contained actions and top-level `Entity_action` mixins for explicit-target root actions.
Both forms receive an explicit mixee field/constructor, immutable `Params` carrier, authored Jakarta-injected service fields, `@MemberSupport` `act`, and all action/per-parameter PAT supporting-method families.
A mixin whose lifecycle subtree contains `ActionInvocation` additionally receives the reserved `@Inject private FactoryService __factoryService` field.

## Member concepts

### `causeway.structure.Property`

A named entity property with an optional `type : Type` child.

### `causeway.structure.Parameter`

A named action parameter with an optional `type : Type` child.
It also owns `choices`, `default`, `validate`, `autoComplete`, `hide`, and `disable` typed `LifecycleBlock` roles.
It implements `ScopeProvider`: non-validation blocks see only earlier parameters, while validation also sees the current parameter; mixee and injected services are always visible.
Behavior root: `r:649c60cc-9a1a-4bef-8eeb-350f253ffdbd(causeway.behavior)/5455126814596961145`.

### `causeway.structure.InjectedService`

A named injected service with an optional `type : Type` child.
It implements BaseLanguage `IVariableDeclaration` and is exposed by the action and parameter scope providers.
The action generator loops over these declarations and emits `@Inject private <Type> <name>;`, copying the
wrapped BaseLanguage type.

### `causeway.structure.ActionVariableReference`

A smart-reference BaseLanguage expression whose `variable` reference targets `IVariableDeclaration`.
Its scope follows the lifecycle lattice implemented by the enclosing `Action` or `Parameter` scope provider.
The `warn_forward_parameter_reference` checking rule additionally warns when parameter reordering leaves it targeting a dependency now declared later than its owning parameter.
Copied generator bodies retain this concept and dispatch through TextGen root
`r:7ade0248-9beb-4b25-b312-57f1aa5e51e4(causeway.textGen)/5455126814598907233`.
Helper class `r:7ade0248-9beb-4b25-b312-57f1aa5e51e4(causeway.textGen)/5455126814598882075` renders direct argument names in `act`, `params.<name>()` in PAT supporting methods, service field names, and `mixee` for the generated entity handle.

### `causeway.structure.ActionInvocation`

A non-rootable BaseLanguage expression with mandatory `target : Expression`, ordered `arguments : Expression[0..n]`, and mandatory `action : Action` reference.
Its structure declaration is `r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)/7283007142388106561`.
Its editor projects `target.action(arguments)` and its reference scope is derived from the target's exact DSL `EntityType`.
The scope contains actions nested directly in that entity and root actions whose explicit target is that same entity.
The expression is valid only within embedded DSL `Action` code.
Its type is the referenced action return type, or BaseLanguage `void` when no return type is declared.
Model checking diagnoses non-entity targets, unresolved or ambiguous identity, incorrect arity, and incompatible positional argument types.
Generation selects either the nested `action.class` form or top-level `Entity_action.class` form from the referenced declaration and lowers the expression to `__factoryService.mixin(...).act(...)`.

### `causeway.structure.LifecycleBlock`

An `IMethodLike` wrapper containing a mandatory BaseLanguage `StatementList` in its `body` role.
Its expected return type is derived from its containment role: hide is `boolean`, disable/validate is `String`, default is the parameter type, and choices/autoComplete is `Collection<ParamType>`.
Behavior root: `r:649c60cc-9a1a-4bef-8eeb-350f253ffdbd(causeway.behavior)/5455126814597746873`.
Typesystem root: `r:bdf61bbe-2bbc-43ea-97e7-6e690ac637df(causeway.typesystem)/5455126814597979820`.
The typesystem rule collects return statements and constrains each returned expression to the behavior-derived expected type.
Editor root: `r:f92574fd-2f37-4189-8af1-9a167710122f(causeway.editor)/5455126814597830208`.

## Type concepts

### `causeway.structure.Type`

An abstract interface concept implemented by `JavaType` and `EntityType`.

### `causeway.structure.JavaType`

Wraps one BaseLanguage `Type` in its `javaType` role.
The generator currently handles this variant, including primitive `int` and classifier `String` examples.

### `causeway.structure.EntityType`

Extends BaseLanguage `Type`, implements the DSL `Type` union, and references an `Entity` through its optional `entity` reference.
Being a BaseLanguage type allows an entity-backed parameter type to participate in lifecycle contracts such as `Collection<ParamType>`.
Generator resolution uses the `entityToClass` mapping label so entity-backed parameters, returns, targets, and generated action class references resolve to the generated classifier.

## Enumeration

`Action.semantics` uses `SemanticsOf`.
Retrieve current enumeration literals with `mps_mcp_query_structure` operation `GET_ENUMERATION_LITERALS` rather than guessing serialized values.
