# Generated action golden comparison

This comparison records `dsl-action-model` task 7.2 against the Causeway 3.6 golden established by task 7.1.

## Inputs

The generated input is `Customer.scopeProbe` from `languages/causeway.sandbox/source_gen/customers/Customer.java`.
The golden input is `Customer.placeOrder` from `reference-app/src/main/java/customers/Customer.java`.
Both are static nested action mixins with the same lifecycle-block coverage.

## Raw differences

The two actions intentionally use different domain fixtures.
The generated scope fixture is named `scopeProbe`, uses `String product`, returns `void`, and declares `Object orderService`.
The golden business fixture is named `placeOrder`, uses `Product product`, returns `Customer`, and declares `OrderService orderService`.
The golden uses source-level `final` parameter modifiers, while the MPS BaseLanguage template does not emit them.
Their method bodies also differ because one tests scope translation and the other demonstrates business behaviour.
The golden carries `@Action(semantics = SemanticsOf.IDEMPOTENT)`; dynamic generation of that pre-existing action-semantics concern remains tracked by `causeway-generator-first-slice` task 2.4 rather than by the action-lifecycle change.

## Structural normalization

The declaration comparison removes the golden `@Action` line and Java-irrelevant `final` modifiers.
It maps the fixture-specific action, product, service, and return types to their golden counterparts.
No method or field declaration is otherwise removed or rewritten.

After normalization, both sides contain 24 declarations and the unified declaration diff has zero lines.

The matching declarations cover:

- static nested mixin class;
- public static final immutable `Params` carrier;
- ordered parameter fields, complete public constructor, and record-style accessors;
- Jakarta `@Inject` service field;
- explicit final mixee field and one-argument constructor;
- `@MemberSupport` on `act`;
- action-level `hideAct`, `disableAct`, and `validateAct`;
- parameter choices, default, validate, auto-complete, hide, and disable methods;
- raw `Collection` signatures used by choices and auto-complete.

## Generation result

`JAVA_HOME=$HOME/.sdkman/candidates/java/21.0.10-tem ./gradlew generateModels --rerun-tasks` succeeds.
The generated Java contains no TextGen errors.
