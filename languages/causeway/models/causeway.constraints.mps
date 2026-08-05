<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:05db7644-cf74-4c36-97d6-54bda00df318(causeway.constraints)">
  <persistence version="9" />
  <languages>
    <use id="5dae8159-ab99-46bb-a40d-0cee30ee7018" name="jetbrains.mps.lang.constraints.rules.kinds" version="0" />
    <use id="ea3159bf-f48e-4720-bde2-86dba75f0d34" name="jetbrains.mps.lang.context.defs" version="0" />
    <use id="e51810c5-7308-4642-bcb6-469e61b5dd18" name="jetbrains.mps.lang.constraints.msg.specification" version="0" />
    <use id="134c38d4-e3af-4d9e-b069-1c7df0a4005d" name="jetbrains.mps.lang.constraints.rules.skeleton" version="0" />
    <use id="b3551702-269c-4f05-ba61-58060cef4292" name="jetbrains.mps.lang.rulesAndMessages" version="0" />
    <use id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints" version="6" />
    <use id="13744753-c81f-424a-9c1b-cf8943bf4e86" name="jetbrains.mps.lang.sharedConcepts" version="0" />
    <use id="3ad5badc-1d9c-461c-b7b1-fa2fcd0a0ae7" name="jetbrains.mps.lang.context" version="0" />
    <use id="ad93155d-79b2-4759-b10c-55123e763903" name="jetbrains.mps.lang.messages" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <devkit ref="00000000-0000-4000-0000-5604ebd4f22c(jetbrains.mps.devkit.aspect.constraints)" />
  </languages>
  <imports>
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" />
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="1ka" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.typechecking(MPS.Core/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="2k9e" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.structure(MPS.Core/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1076505808687" name="jetbrains.mps.baseLanguage.structure.WhileStatement" flags="nn" index="2$JKZl">
        <child id="1076505808688" name="condition" index="2$JKZa" />
      </concept>
      <concept id="1239714755177" name="jetbrains.mps.baseLanguage.structure.AbstractUnaryNumberOperation" flags="nn" index="2$Kvd9">
        <child id="1239714902950" name="expression" index="2$L3a6" />
      </concept>
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070462154015" name="jetbrains.mps.baseLanguage.structure.StaticFieldDeclaration" flags="ig" index="Wx3nA" />
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1513279640923991009" name="jetbrains.mps.baseLanguage.structure.IGenericClassCreator" flags="ngI" index="366HgL">
        <property id="1513279640906337053" name="inferTypeParams" index="373rjd" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="4269842503726207156" name="jetbrains.mps.baseLanguage.structure.LongLiteral" flags="nn" index="1adDum">
        <property id="4269842503726207157" name="value" index="1adDun" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk">
        <child id="1212687122400" name="typeParameter" index="1pMfVU" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1081855346303" name="jetbrains.mps.baseLanguage.structure.BreakStatement" flags="nn" index="3zACq4" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
      <concept id="8064396509828172209" name="jetbrains.mps.baseLanguage.structure.UnaryMinus" flags="nn" index="1ZRNhn" />
    </language>
    <language id="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1" name="jetbrains.mps.lang.constraints">
      <concept id="6702802731807351367" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_CanBeAChild" flags="in" index="9S07l" />
      <concept id="1202989658459" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_parentNode" flags="nn" index="nLn13" />
      <concept id="8966504967485224688" name="jetbrains.mps.lang.constraints.structure.ConstraintFunctionParameter_contextNode" flags="nn" index="2rP1CM" />
      <concept id="5564765827938091039" name="jetbrains.mps.lang.constraints.structure.ConstraintFunction_ReferentSearchScope_Scope" flags="ig" index="3dgokm" />
      <concept id="8401916545537438642" name="jetbrains.mps.lang.constraints.structure.InheritedNodeScopeFactory" flags="ng" index="1dDu$B">
        <reference id="8401916545537438643" name="kind" index="1dDu$A" />
      </concept>
      <concept id="1213093968558" name="jetbrains.mps.lang.constraints.structure.ConceptConstraints" flags="ng" index="1M2fIO">
        <reference id="1213093996982" name="concept" index="1M2myG" />
        <child id="6702802731807737306" name="canBeChild" index="9Vyp8" />
        <child id="1213100494875" name="referent" index="1Mr941" />
      </concept>
      <concept id="1148687176410" name="jetbrains.mps.lang.constraints.structure.NodeReferentConstraint" flags="ng" index="1N5Pfh">
        <reference id="1148687202698" name="applicableLink" index="1N5Vy1" />
        <child id="1148687345559" name="searchScopeFactory" index="1N6uqs" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1M2fIO" id="4IOweXOJpnI">
    <ref role="1M2myG" to="k3bw:4IOweXOJ78z" resolve="ActionVariableReference" />
    <node concept="1N5Pfh" id="4IOweXOJpnJ" role="1Mr941">
      <ref role="1N5Vy1" to="k3bw:4IOweXOJ78$" />
      <node concept="1dDu$B" id="4IOweXOJpnK" role="1N6uqs">
        <ref role="1dDu$A" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
      </node>
    </node>
  </node>
  <node concept="312cEu" id="6kis6yMFsuq">
    <property role="TrG5h" value="ActionInvocationScopes" />
    <property role="3GE5qa" value="behavior" />
    <node concept="3Tm1VV" id="6kis6yMFsur" role="1B3o_S" />
    <node concept="Wx3nA" id="6kis6yMFsus" role="jymVt">
      <property role="TrG5h" value="ACTION_INVOCATION" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsut" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFsys" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFsyt" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyu" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsyv" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyw" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFsyx" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFsyy" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.ActionInvocation" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsu_" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsuA" role="jymVt">
      <property role="TrG5h" value="ENTITY_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsuB" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFsy_" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFsyA" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyB" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsyC" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyD" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFsyE" role="37wK5m">
          <property role="1adDun" value="8900000000000000007L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFsyF" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.EntityType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsuJ" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsuK" role="jymVt">
      <property role="TrG5h" value="ACTION" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsuL" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFsyI" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFsyJ" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyK" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsyL" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyM" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFsyN" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFsyO" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.Action" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsuT" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsuU" role="jymVt">
      <property role="TrG5h" value="INVOCATION_TARGET" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsuV" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="org.jetbrains.mps.openapi.language.SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFsyR" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFsyS" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyT" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsyU" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsyV" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFsyW" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="1adDum" id="6kis6yMFsyX" role="37wK5m">
          <property role="1adDun" value="7283007142388106563L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFsyY" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsv4" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsv5" role="jymVt">
      <property role="TrG5h" value="ENTITY_TYPE_ENTITY" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsv6" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFsz1" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMFsz2" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsz3" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsz4" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFsz5" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFsz6" role="37wK5m">
          <property role="1adDun" value="8900000000000000007L" />
        </node>
        <node concept="1adDum" id="6kis6yMFsz7" role="37wK5m">
          <property role="1adDun" value="8900000000000000031L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFsz8" role="37wK5m">
          <property role="Xl_RC" value="entity" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsvf" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsvg" role="jymVt">
      <property role="TrG5h" value="ENTITY_ACTIONS" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsvh" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="org.jetbrains.mps.openapi.language.SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFszb" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFszc" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFszd" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFsze" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFszf" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFszg" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="1adDum" id="6kis6yMFszh" role="37wK5m">
          <property role="1adDun" value="8900000000000000023L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFszi" role="37wK5m">
          <property role="Xl_RC" value="actions" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsvq" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFsvr" role="jymVt">
      <property role="TrG5h" value="ACTION_TARGET" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFsvs" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFszl" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMFszm" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFszn" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFszo" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFszp" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFszq" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="1adDum" id="6kis6yMFszr" role="37wK5m">
          <property role="1adDun" value="8900000000000000048L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFszs" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFsv_" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="6kis6yMFsvA" role="jymVt">
      <property role="TrG5h" value="scope" />
      <node concept="37vLTG" id="6kis6yMFsvB" role="3clF46">
        <property role="TrG5h" value="contextNode" />
        <node concept="3uibUv" id="6kis6yMFsvC" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFsvD" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFsvF" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFsvE" role="3cpWs9">
            <property role="TrG5h" value="actions" />
            <node concept="3uibUv" id="6kis6yMFsvG" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~List" resolve="java.util.List" />
              <node concept="3uibUv" id="6kis6yMFsvH" role="11_B2D">
                <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
              </node>
            </node>
            <node concept="2ShNRf" id="6kis6yMFszt" role="33vP2m">
              <node concept="1pGfFk" id="6kis6yMFszy" role="2ShVmc">
                <property role="373rjd" value="true" />
                <ref role="37wK5l" to="33ny:~ArrayList.&lt;init&gt;()" resolve="ArrayList" />
                <node concept="3uibUv" id="6kis6yMFszz" role="1pMfVU">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFsvK" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFsvL" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFsvM" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFsvB" resolve="contextNode" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFsvN" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFsvP" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFsvQ" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFszA" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
                <node concept="37vLTw" id="6kis6yMFszB" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFsvU" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFsvT" role="3cpWs9">
            <property role="TrG5h" value="invocation" />
            <node concept="3uibUv" id="6kis6yMFsvV" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="37vLTw" id="6kis6yMFsvW" role="33vP2m">
              <ref role="3cqZAo" node="6kis6yMFsvB" resolve="contextNode" />
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="6kis6yMFswb" role="3cqZAp">
          <node concept="1Wc70l" id="6kis6yMFsvX" role="2$JKZa">
            <node concept="3y3z36" id="6kis6yMFsvY" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFsvZ" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFsw0" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="6kis6yMFsw1" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMFsHZ" role="3fr31v">
                <node concept="2OqwBi" id="6kis6yMFsA8" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMFszM" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFsA9" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMFsI0" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMFsI1" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFsus" resolve="ACTION_INVOCATION" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFsw6" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFsw7" role="3cqZAp">
              <node concept="37vLTI" id="6kis6yMFsw8" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFsw9" role="37vLTJ">
                  <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
                </node>
                <node concept="2OqwBi" id="6kis6yMFsAk" role="37vLTx">
                  <node concept="37vLTw" id="6kis6yMFszQ" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFsAl" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFswc" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFswd" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFswe" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFswf" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFswh" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFswi" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFszU" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
                <node concept="37vLTw" id="6kis6yMFszV" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFswm" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFswl" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="6kis6yMFswn" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFswo" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFswp" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFsAw" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFszY" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFsvT" resolve="invocation" />
            </node>
            <node concept="liA8E" id="6kis6yMFsAx" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFsAy" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFsuU" resolve="INVOCATION_TARGET" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFswx" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <node concept="3uibUv" id="6kis6yMFswz" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFswr" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFsws" role="3cqZAp">
              <node concept="37vLTI" id="6kis6yMFswt" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFswu" role="37vLTJ">
                  <ref role="3cqZAo" node="6kis6yMFswl" resolve="target" />
                </node>
                <node concept="37vLTw" id="6kis6yMFswv" role="37vLTx">
                  <ref role="3cqZAo" node="6kis6yMFswx" resolve="child" />
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="6kis6yMFsww" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFswA" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFswB" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFswC" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFswl" resolve="target" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFswD" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFswF" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFswG" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFs$5" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
                <node concept="37vLTw" id="6kis6yMFs$6" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFswK" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFswJ" role="3cpWs9">
            <property role="TrG5h" value="targetType" />
            <node concept="3uibUv" id="6kis6yMFswL" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFsAL" role="33vP2m">
              <node concept="2YIFZM" id="6kis6yMFs$h" role="2Oq$k0">
                <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
              </node>
              <node concept="liA8E" id="6kis6yMFsAM" role="2OqNvi">
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getTypeOf(org.jetbrains.mps.openapi.model.SNode)" resolve="getTypeOf" />
                <node concept="37vLTw" id="6kis6yMFsAN" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFswl" resolve="target" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFswP" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMFswQ" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMFswR" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFswS" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFswJ" resolve="targetType" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFswT" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="6kis6yMFswU" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMFsIL" role="3fr31v">
                <node concept="2OqwBi" id="6kis6yMFsB6" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMFs$s" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFswJ" resolve="targetType" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFsB7" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMFsIM" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMFsIN" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFsuA" resolve="ENTITY_TYPE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFswZ" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFsx0" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFs$w" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
                <node concept="37vLTw" id="6kis6yMFs$x" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFsx4" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFsx3" role="3cpWs9">
            <property role="TrG5h" value="entity" />
            <node concept="3uibUv" id="6kis6yMFsx5" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFsBi" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFs$$" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFswJ" resolve="targetType" />
              </node>
              <node concept="liA8E" id="6kis6yMFsBj" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="6kis6yMFsBk" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsv5" resolve="ENTITY_TYPE_ENTITY" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFsx8" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFsx9" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFsxa" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFsx3" resolve="entity" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFsxb" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFsxd" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFsxe" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFs$F" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
                <node concept="37vLTw" id="6kis6yMFs$G" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFsxh" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFsBv" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFs$J" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFsx3" resolve="entity" />
            </node>
            <node concept="liA8E" id="6kis6yMFsBw" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFsBx" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFsvg" resolve="ENTITY_ACTIONS" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFsxn" role="1Duv9x">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMFsxp" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFsxj" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFsxk" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMFsDO" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFs$Q" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                </node>
                <node concept="liA8E" id="6kis6yMFsDP" role="2OqNvi">
                  <ref role="37wK5l" to="33ny:~List.add(java.lang.Object)" resolve="add" />
                  <node concept="37vLTw" id="6kis6yMFsDQ" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFsxn" resolve="action" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFBoU" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFBoT" role="3cpWs9">
            <property role="TrG5h" value="model" />
            <node concept="3uibUv" id="6kis6yMFBoV" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SModel" resolve="org.jetbrains.mps.openapi.model.SModel" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFBpa" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFBoZ" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFsvB" resolve="contextNode" />
              </node>
              <node concept="liA8E" id="6kis6yMFBpb" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFsxs" role="3cqZAp">
          <node concept="3y3z36" id="6kis6yMFsxt" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFHkn" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFBoT" resolve="model" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFsxv" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFsxx" role="3clFbx">
            <node concept="1DcWWT" id="6kis6yMFsxy" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMFsJ7" role="1DdaDG">
                <node concept="37vLTw" id="6kis6yMFEn$" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMFBoT" resolve="model" />
                </node>
                <node concept="liA8E" id="6kis6yMFsJ8" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SModel.getRootNodes()" resolve="getRootNodes" />
                </node>
              </node>
              <node concept="3cpWsn" id="6kis6yMFsxM" role="1Duv9x">
                <property role="TrG5h" value="root" />
                <node concept="3uibUv" id="6kis6yMFsxO" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMFsx$" role="2LFqv$">
                <node concept="3clFbJ" id="6kis6yMFsx_" role="3cqZAp">
                  <node concept="1Wc70l" id="6kis6yMFsxA" role="3clFbw">
                    <node concept="2OqwBi" id="6kis6yMFsJq" role="3uHU7B">
                      <node concept="2OqwBi" id="6kis6yMFsEA" role="2Oq$k0">
                        <node concept="37vLTw" id="6kis6yMFs_j" role="2Oq$k0">
                          <ref role="3cqZAo" node="6kis6yMFsxM" resolve="root" />
                        </node>
                        <node concept="liA8E" id="6kis6yMFsEB" role="2OqNvi">
                          <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                        </node>
                      </node>
                      <node concept="liA8E" id="6kis6yMFsJr" role="2OqNvi">
                        <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                        <node concept="37vLTw" id="6kis6yMFsJs" role="37wK5m">
                          <ref role="3cqZAo" node="6kis6yMFsuK" resolve="ACTION" />
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="6kis6yMFsEM" role="3uHU7w">
                      <node concept="37vLTw" id="6kis6yMFs_n" role="2Oq$k0">
                        <ref role="3cqZAo" node="6kis6yMFsx3" resolve="entity" />
                      </node>
                      <node concept="liA8E" id="6kis6yMFsEN" role="2OqNvi">
                        <ref role="37wK5l" to="wyt6:~Object.equals(java.lang.Object)" resolve="equals" />
                        <node concept="2OqwBi" id="6kis6yMFsK6" role="37wK5m">
                          <node concept="37vLTw" id="6kis6yMFsJx" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMFsxM" resolve="root" />
                          </node>
                          <node concept="liA8E" id="6kis6yMFsK7" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                            <node concept="37vLTw" id="6kis6yMFsK8" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMFsvr" resolve="ACTION_TARGET" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="6kis6yMFsxI" role="3clFbx">
                    <node concept="3clFbF" id="6kis6yMFsxJ" role="3cqZAp">
                      <node concept="2OqwBi" id="6kis6yMFsH8" role="3clFbG">
                        <node concept="37vLTw" id="6kis6yMFs_v" role="2Oq$k0">
                          <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
                        </node>
                        <node concept="liA8E" id="6kis6yMFsH9" role="2OqNvi">
                          <ref role="37wK5l" to="33ny:~List.add(java.lang.Object)" resolve="add" />
                          <node concept="37vLTw" id="6kis6yMFsHa" role="37wK5m">
                            <ref role="3cqZAo" node="6kis6yMFsxM" resolve="root" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFsxR" role="3cqZAp">
          <node concept="2YIFZM" id="6kis6yMFs_$" role="3cqZAk">
            <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
            <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" resolve="forNamedElements" />
            <node concept="37vLTw" id="6kis6yMFs__" role="37wK5m">
              <ref role="3cqZAo" node="6kis6yMFsvE" resolve="actions" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFsxU" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMFsxV" role="3clF45">
        <ref role="3uigEE" to="o8zo:3fifI_xCtN$" resolve="jetbrains.mps.scope.Scope" />
      </node>
    </node>
    <node concept="2YIFZL" id="6kis6yMFsxW" role="jymVt">
      <property role="TrG5h" value="isInAction" />
      <node concept="37vLTG" id="6kis6yMFsxX" role="3clF46">
        <property role="TrG5h" value="parentNode" />
        <node concept="3uibUv" id="6kis6yMFsxY" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFsxZ" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFsy1" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFsy0" role="3cpWs9">
            <property role="TrG5h" value="current" />
            <node concept="3uibUv" id="6kis6yMFsy2" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="37vLTw" id="6kis6yMFsy3" role="33vP2m">
              <ref role="3cqZAo" node="6kis6yMFsxX" resolve="parentNode" />
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="6kis6yMFsyl" role="3cqZAp">
          <node concept="3y3z36" id="6kis6yMFsy4" role="2$JKZa">
            <node concept="37vLTw" id="6kis6yMFsy5" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFsy0" resolve="current" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFsy6" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFsy8" role="2LFqv$">
            <node concept="3clFbJ" id="6kis6yMFsy9" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMFsJS" role="3clFbw">
                <node concept="2OqwBi" id="6kis6yMFsHt" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMFs_K" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFsy0" resolve="current" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFsHu" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMFsJT" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMFsJU" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFsuK" resolve="ACTION" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMFsye" role="3clFbx">
                <node concept="3cpWs6" id="6kis6yMFsyf" role="3cqZAp">
                  <node concept="3clFbT" id="6kis6yMFsyg" role="3cqZAk">
                    <property role="3clFbU" value="true" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="6kis6yMFsyh" role="3cqZAp">
              <node concept="37vLTI" id="6kis6yMFsyi" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFsyj" role="37vLTJ">
                  <ref role="3cqZAo" node="6kis6yMFsy0" resolve="current" />
                </node>
                <node concept="2OqwBi" id="6kis6yMFsHD" role="37vLTx">
                  <node concept="37vLTw" id="6kis6yMFs_O" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFsy0" resolve="current" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFsHE" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFsym" role="3cqZAp">
          <node concept="3clFbT" id="6kis6yMFsyn" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFsyo" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMFsyp" role="3clF45" />
    </node>
  </node>
  <node concept="1M2fIO" id="6kis6yMFwdN">
    <property role="TrG5h" value="ActionInvocation_Constraints" />
    <ref role="1M2myG" to="k3bw:6kis6yMFgl1" />
    <node concept="1N5Pfh" id="6kis6yMFwe0" role="1Mr941">
      <ref role="1N5Vy1" to="k3bw:6kis6yMFgl5" />
      <node concept="3dgokm" id="6kis6yMFwe1" role="1N6uqs">
        <node concept="3clFbS" id="6kis6yMFwe3" role="2VODD2">
          <node concept="3clFbF" id="6kis6yMFwe9" role="3cqZAp">
            <node concept="2YIFZM" id="6kis6yMFwed" role="3clFbG">
              <ref role="1Pybhc" node="6kis6yMFsuq" resolve="ActionInvocationScopes" />
              <ref role="37wK5l" node="6kis6yMFsvA" resolve="scope" />
              <node concept="2rP1CM" id="6kis6yMFwjK" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="9S07l" id="6kis6yMFwjS" role="9Vyp8">
      <node concept="3clFbS" id="6kis6yMFwjU" role="2VODD2">
        <node concept="3clFbF" id="6kis6yMFwk0" role="3cqZAp">
          <node concept="2YIFZM" id="6kis6yMFwk4" role="3clFbG">
            <ref role="1Pybhc" node="6kis6yMFsuq" resolve="ActionInvocationScopes" />
            <ref role="37wK5l" node="6kis6yMFsxW" resolve="isInAction" />
            <node concept="nLn13" id="6kis6yMFw$d" role="37wK5m" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

