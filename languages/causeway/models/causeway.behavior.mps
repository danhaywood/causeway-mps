<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:649c60cc-9a1a-4bef-8eeb-350f253ffdbd(causeway.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <use id="d8f591ec-4d86-4af2-9f92-a9e93c803ffa" name="jetbrains.mps.lang.scopes" version="0" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="o8zo" ref="r:314576fc-3aee-4386-a0a5-a38348ac317d(jetbrains.mps.scope)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" />
    <import index="tpek" ref="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="2k9e" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.structure(MPS.Core/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="6xgk" ref="r:6e9ad488-5df2-49e4-8c01-8a7f3812adf7(jetbrains.mps.lang.scopes.runtime)" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1076505808687" name="jetbrains.mps.baseLanguage.structure.WhileStatement" flags="nn" index="2$JKZl">
        <child id="1076505808688" name="condition" index="2$JKZa" />
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
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
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
        <child id="4972241301747169160" name="typeArgument" index="3PaCim" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk">
        <child id="1212687122400" name="typeParameter" index="1pMfVU" />
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
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="6677504323281689838" name="jetbrains.mps.lang.smodel.structure.SConceptType" flags="in" index="3bZ5Sz" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1196978630214" name="jetbrains.mps.lang.core.structure.IResolveInfo" flags="ngI" index="2Lv6Xg">
        <property id="1196978656277" name="resolveInfo" index="2Lvdk3" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="13h7C7" id="4IOweXOJpo7">
    <property role="3GE5qa" value="handler" />
    <property role="TrG5h" value="ActionVariableReference_Behavior" />
    <ref role="13h7C2" to="k3bw:4IOweXOJ78z" resolve="ActionVariableReference" />
    <node concept="13hLZK" id="4IOweXOJpoa" role="13h7CW">
      <node concept="3clFbS" id="4IOweXOJpoc" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="4IOweXOJpod" role="13h7CS">
      <property role="TrG5h" value="getVariable" />
      <ref role="13i0hy" to="tpek:SORzhOpB6t" resolve="getVariable" />
      <node concept="3Tqbb2" id="4IOweXOJpoh" role="3clF45">
        <ref role="ehGHo" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
      </node>
      <node concept="3clFbS" id="4IOweXOJpoi" role="3clF47">
        <node concept="3clFbF" id="4IOweXOJpoj" role="3cqZAp">
          <node concept="2OqwBi" id="4IOweXOJpol" role="3clFbG">
            <node concept="13iPFW" id="4IOweXOJpoo" role="2Oq$k0" />
            <node concept="3TrEf2" id="4IOweXOJpop" role="2OqNvi">
              <ref role="3Tt5mk" to="k3bw:4IOweXOJ78$" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4IOweXOJpoq" role="1B3o_S" />
    </node>
  </node>
  <node concept="13h7C7" id="4IOweXOJpp0">
    <property role="TrG5h" value="Action_Behavior" />
    <ref role="13h7C2" to="k3bw:4" resolve="Action" />
    <node concept="13hLZK" id="4IOweXOJpp3" role="13h7CW">
      <node concept="3clFbS" id="4IOweXOJpp5" role="2VODD2" />
    </node>
    <node concept="13i0hz" id="4IOweXOJpp6" role="13h7CS">
      <property role="TrG5h" value="getScope" />
      <ref role="13i0hy" to="tpcu:52_Geb4QDV$" resolve="getScope" />
      <node concept="3uibUv" id="4IOweXOJppa" role="3clF45">
        <ref role="3uigEE" to="o8zo:3fifI_xCtN$" resolve="Scope" />
      </node>
      <node concept="37vLTG" id="4IOweXOJppb" role="3clF46">
        <property role="TrG5h" value="kind" />
        <property role="2Lvdk3" value="kind" />
        <node concept="3bZ5Sz" id="4IOweXOJppd" role="1tU5fm" />
      </node>
      <node concept="37vLTG" id="4IOweXOJppe" role="3clF46">
        <property role="TrG5h" value="child" />
        <property role="2Lvdk3" value="child" />
        <node concept="3Tqbb2" id="4IOweXOJppg" role="1tU5fm" />
      </node>
      <node concept="3clFbS" id="4IOweXOJpph" role="3clF47">
        <node concept="3cpWs8" id="4IOweXOJtmw" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOJtmv" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="4IOweXOJtmx" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="37vLTw" id="4IOweXOJtmy" role="33vP2m">
              <ref role="3cqZAo" node="4IOweXOJppe" resolve="child" />
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOJtmP" role="3cqZAp">
          <node concept="1Wc70l" id="4IOweXOJtmz" role="2$JKZa">
            <node concept="3y3z36" id="4IOweXOJtm$" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOJtm_" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
              </node>
              <node concept="10Nm6u" id="4IOweXOJtmA" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="4IOweXOJtmB" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOJtyi" role="3fr31v">
                <node concept="2OqwBi" id="4IOweXOJtpx" role="2Oq$k0">
                  <node concept="37vLTw" id="4IOweXOJtoh" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
                  </node>
                  <node concept="liA8E" id="4IOweXOJtpy" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOJtyj" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="2YIFZM" id="4IOweXOJtyk" role="37wK5m">
                    <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                    <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
                    <node concept="1adDum" id="4IOweXOJtyl" role="37wK5m">
                      <property role="1adDun" value="-7368721030553710934L" />
                    </node>
                    <node concept="1adDum" id="4IOweXOJtym" role="37wK5m">
                      <property role="1adDun" value="-6140377635379736700L" />
                    </node>
                    <node concept="1adDum" id="4IOweXOJtyn" role="37wK5m">
                      <property role="1adDun" value="8900000000000000004L" />
                    </node>
                    <node concept="Xl_RD" id="4IOweXOJtyo" role="37wK5m">
                      <property role="Xl_RC" value="causeway.structure.Action" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOJtmK" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOJtmL" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOJtmM" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOJtmN" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
                </node>
                <node concept="2OqwBi" id="4IOweXOJtpH" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOJtoo" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
                  </node>
                  <node concept="liA8E" id="4IOweXOJtpI" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOJtmQ" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOJtmR" role="3clFbw">
            <node concept="37vLTw" id="4IOweXOJtmS" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
            </node>
            <node concept="10Nm6u" id="4IOweXOJtmT" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOJtmV" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOJtmW" role="3cqZAp">
              <node concept="2YIFZM" id="4IOweXOJAmU" role="3cqZAk">
                <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
                <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" />
                <node concept="2YIFZM" id="4IOweXOJAmX" role="37wK5m">
                  <ref role="1Pybhc" to="33ny:~Collections" resolve="Collections" />
                  <ref role="37wK5l" to="33ny:~Collections.emptyList()" />
                  <node concept="3uibUv" id="4IOweXOJAmY" role="3PaCim">
                    <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOJtn1" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOJtn0" role="3cpWs9">
            <property role="TrG5h" value="variables" />
            <node concept="3uibUv" id="4IOweXOJtn2" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~List" resolve="java.util.List" />
              <node concept="3uibUv" id="4IOweXOJtn3" role="11_B2D">
                <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
              </node>
            </node>
            <node concept="2ShNRf" id="4IOweXOJtos" role="33vP2m">
              <node concept="1pGfFk" id="4IOweXOJtox" role="2ShVmc">
                <property role="373rjd" value="true" />
                <ref role="37wK5l" to="33ny:~ArrayList.&lt;init&gt;()" resolve="ArrayList" />
                <node concept="3uibUv" id="4IOweXOJtoy" role="1pMfVU">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4IOweXOJtn6" role="3cqZAp">
          <node concept="2OqwBi" id="4IOweXOJtpT" role="1DdaDG">
            <node concept="37vLTw" id="4IOweXOJtoz" role="2Oq$k0">
              <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
            </node>
            <node concept="liA8E" id="4IOweXOJtpU" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="2YIFZM" id="4IOweXOJtyq" role="37wK5m">
                <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
                <node concept="1adDum" id="4IOweXOJtyr" role="37wK5m">
                  <property role="1adDun" value="-7368721030553710934L" />
                </node>
                <node concept="1adDum" id="4IOweXOJtys" role="37wK5m">
                  <property role="1adDun" value="-6140377635379736700L" />
                </node>
                <node concept="1adDum" id="4IOweXOJtyt" role="37wK5m">
                  <property role="1adDun" value="8900000000000000004L" />
                </node>
                <node concept="1adDum" id="4IOweXOJtyu" role="37wK5m">
                  <property role="1adDun" value="8900000000000000025L" />
                </node>
                <node concept="Xl_RD" id="4IOweXOJtyv" role="37wK5m">
                  <property role="Xl_RC" value="parameters" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4IOweXOJtnc" role="1Duv9x">
            <property role="TrG5h" value="variable" />
            <node concept="3uibUv" id="4IOweXOJtne" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOJtn8" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOJtn9" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOJtsj" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOJtoF" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOJtn0" resolve="variables" />
                </node>
                <node concept="liA8E" id="4IOweXOJtsk" role="2OqNvi">
                  <ref role="37wK5l" to="33ny:~List.add(java.lang.Object)" resolve="add" />
                  <node concept="37vLTw" id="4IOweXOJtsl" role="37wK5m">
                    <ref role="3cqZAo" node="4IOweXOJtnc" resolve="variable" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4IOweXOJtnm" role="3cqZAp">
          <node concept="2OqwBi" id="4IOweXOJtsw" role="1DdaDG">
            <node concept="37vLTw" id="4IOweXOJtoI" role="2Oq$k0">
              <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
            </node>
            <node concept="liA8E" id="4IOweXOJtsx" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="2YIFZM" id="4IOweXOJtyw" role="37wK5m">
                <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
                <node concept="1adDum" id="4IOweXOJtyx" role="37wK5m">
                  <property role="1adDun" value="-7368721030553710934L" />
                </node>
                <node concept="1adDum" id="4IOweXOJtyy" role="37wK5m">
                  <property role="1adDun" value="-6140377635379736700L" />
                </node>
                <node concept="1adDum" id="4IOweXOJtyz" role="37wK5m">
                  <property role="1adDun" value="8900000000000000004L" />
                </node>
                <node concept="1adDum" id="4IOweXOJty$" role="37wK5m">
                  <property role="1adDun" value="8900000000000000044L" />
                </node>
                <node concept="Xl_RD" id="4IOweXOJty_" role="37wK5m">
                  <property role="Xl_RC" value="injectedServices" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4IOweXOJtns" role="1Duv9x">
            <property role="TrG5h" value="variable" />
            <node concept="3uibUv" id="4IOweXOJtnu" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOJtno" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOJtnp" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOJtuU" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOJtoQ" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOJtn0" resolve="variables" />
                </node>
                <node concept="liA8E" id="4IOweXOJtuV" role="2OqNvi">
                  <ref role="37wK5l" to="33ny:~List.add(java.lang.Object)" resolve="add" />
                  <node concept="37vLTw" id="4IOweXOJtuW" role="37wK5m">
                    <ref role="3cqZAo" node="4IOweXOJtns" resolve="variable" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOJtnB" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOJtnA" role="3cpWs9">
            <property role="TrG5h" value="mixee" />
            <node concept="3uibUv" id="4IOweXOJtnC" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOJtv7" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOJtoT" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOJtmv" resolve="action" />
              </node>
              <node concept="liA8E" id="4IOweXOJtv8" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOJtnW" role="3cqZAp">
          <node concept="1Wc70l" id="4IOweXOJtnE" role="2$JKZa">
            <node concept="3y3z36" id="4IOweXOJtnF" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOJtnG" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
              </node>
              <node concept="10Nm6u" id="4IOweXOJtnH" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="4IOweXOJtnI" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOJtz5" role="3fr31v">
                <node concept="2OqwBi" id="4IOweXOJtvr" role="2Oq$k0">
                  <node concept="37vLTw" id="4IOweXOJtp3" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
                  </node>
                  <node concept="liA8E" id="4IOweXOJtvs" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOJtz6" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="2YIFZM" id="4IOweXOJtz7" role="37wK5m">
                    <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                    <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
                    <node concept="1adDum" id="4IOweXOJtz8" role="37wK5m">
                      <property role="1adDun" value="-7368721030553710934L" />
                    </node>
                    <node concept="1adDum" id="4IOweXOJtz9" role="37wK5m">
                      <property role="1adDun" value="-6140377635379736700L" />
                    </node>
                    <node concept="1adDum" id="4IOweXOJtza" role="37wK5m">
                      <property role="1adDun" value="8900000000000000002L" />
                    </node>
                    <node concept="Xl_RD" id="4IOweXOJtzb" role="37wK5m">
                      <property role="Xl_RC" value="causeway.structure.Entity" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOJtnR" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOJtnS" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOJtnT" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOJtnU" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
                </node>
                <node concept="2OqwBi" id="4IOweXOJtvB" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOJtpa" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
                  </node>
                  <node concept="liA8E" id="4IOweXOJtvC" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOJtnX" role="3cqZAp">
          <node concept="3y3z36" id="4IOweXOJtnY" role="3clFbw">
            <node concept="37vLTw" id="4IOweXOJtnZ" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
            </node>
            <node concept="10Nm6u" id="4IOweXOJto0" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOJto2" role="3clFbx">
            <node concept="3clFbF" id="4IOweXOJto3" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOJtxV" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOJtpc" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOJtn0" resolve="variables" />
                </node>
                <node concept="liA8E" id="4IOweXOJtxW" role="2OqNvi">
                  <ref role="37wK5l" to="33ny:~List.add(java.lang.Object)" resolve="add" />
                  <node concept="37vLTw" id="4IOweXOJtxX" role="37wK5m">
                    <ref role="3cqZAo" node="4IOweXOJtnA" resolve="mixee" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4IOweXOJto6" role="3cqZAp">
          <node concept="2YIFZM" id="4IOweXOJAnc" role="3cqZAk">
            <ref role="1Pybhc" to="o8zo:4IP40Bi3e_R" resolve="ListScope" />
            <ref role="37wK5l" to="o8zo:4IP40Bi3eAf" />
            <node concept="37vLTw" id="4IOweXOJAnd" role="37wK5m">
              <ref role="3cqZAo" node="4IOweXOJtn0" resolve="variables" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4IOweXOJppi" role="1B3o_S" />
    </node>
  </node>
</model>

