<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:7ade0248-9beb-4b25-b312-57f1aa5e51e4(causeway.textGen)">
  <persistence version="9" />
  <languages>
    <use id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen" version="1" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <devkit ref="fa73d85a-ac7f-447b-846c-fcdc41caa600(jetbrains.mps.devkit.aspect.textgen)" />
  </languages>
  <imports>
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" />
    <import index="w1kc" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel(MPS.Core/)" />
  </imports>
  <registry>
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
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1070534934090" name="jetbrains.mps.baseLanguage.structure.CastExpression" flags="nn" index="10QFUN">
        <child id="1070534934091" name="type" index="10QFUM" />
        <child id="1070534934092" name="expression" index="10QFUP" />
      </concept>
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu">
        <property id="1221565133444" name="isFinal" index="1EXbeo" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
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
      <concept id="1068580123140" name="jetbrains.mps.baseLanguage.structure.ConstructorDeclaration" flags="ig" index="3clFbW" />
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1079359253375" name="jetbrains.mps.baseLanguage.structure.ParenthesizedExpression" flags="nn" index="1eOMI4">
        <child id="1079359253376" name="expression" index="1eOMHV" />
      </concept>
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1171903916106" name="jetbrains.mps.baseLanguage.structure.UpperBoundType" flags="in" index="3qUE_q">
        <child id="1171903916107" name="bound" index="3qUE_r" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
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
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
    </language>
    <language id="b83431fe-5c8f-40bc-8a36-65e25f4dd253" name="jetbrains.mps.lang.textGen">
      <concept id="1237305334312" name="jetbrains.mps.lang.textGen.structure.NodeAppendPart" flags="ng" index="l9hG8">
        <child id="1237305790512" name="value" index="lb14g" />
      </concept>
      <concept id="1237306079178" name="jetbrains.mps.lang.textGen.structure.AppendOperation" flags="nn" index="lc7rE">
        <child id="1237306115446" name="part" index="lcghm" />
      </concept>
      <concept id="1233670071145" name="jetbrains.mps.lang.textGen.structure.ConceptTextGenDeclaration" flags="ig" index="WtQ9Q">
        <reference id="1233670257997" name="conceptDeclaration" index="WuzLi" />
        <child id="1233749296504" name="textGenBlock" index="11c4hB" />
      </concept>
      <concept id="1233748055915" name="jetbrains.mps.lang.textGen.structure.NodeParameter" flags="nn" index="117lpO" />
      <concept id="1233749247888" name="jetbrains.mps.lang.textGen.structure.GenerateTextDeclaration" flags="in" index="11bSqf" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="312cEu" id="4IOweXORYcr">
    <property role="TrG5h" value="ActionVariableTextGen" />
    <property role="1EXbeo" value="true" />
    <node concept="3Tm1VV" id="4IOweXORYcs" role="1B3o_S" />
    <node concept="3clFbW" id="4IOweXORYct" role="jymVt">
      <node concept="3cqZAl" id="4IOweXORYcu" role="3clF45" />
      <node concept="3clFbS" id="4IOweXORYcv" role="3clF47" />
      <node concept="3Tm6S6" id="4IOweXORYcw" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="4IOweXOSgG4" role="jymVt">
      <property role="TrG5h" value="render" />
      <node concept="37vLTG" id="4IOweXOSgG5" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="4IOweXOSgG6" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOSgG7" role="3clF47">
        <node concept="3cpWs8" id="4IOweXOSgG9" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSgG8" role="3cpWs9">
            <property role="TrG5h" value="references" />
            <node concept="3uibUv" id="4IOweXOSgGa" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~Iterator" resolve="java.util.Iterator" />
              <node concept="3qUE_q" id="4IOweXOSgGc" role="11_B2D">
                <node concept="3uibUv" id="4IOweXOSgGb" role="3qUE_r">
                  <ref role="3uigEE" to="mhbf:~SReference" resolve="org.jetbrains.mps.openapi.model.SReference" />
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="4IOweXOSgNh" role="33vP2m">
              <node concept="2OqwBi" id="4IOweXOSgJ5" role="2Oq$k0">
                <node concept="37vLTw" id="4IOweXOSgHL" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOSgG5" resolve="node" />
                </node>
                <node concept="liA8E" id="4IOweXOSgJ6" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getReferences()" resolve="getReferences" />
                </node>
              </node>
              <node concept="liA8E" id="4IOweXOSgNi" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~Iterable.iterator()" resolve="iterator" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOSgGf" role="3cqZAp">
          <node concept="3fqX7Q" id="4IOweXOSgGg" role="3clFbw">
            <node concept="2OqwBi" id="4IOweXOSgK7" role="3fr31v">
              <node concept="37vLTw" id="4IOweXOSgHP" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOSgG8" resolve="references" />
              </node>
              <node concept="liA8E" id="4IOweXOSgK8" role="2OqNvi">
                <ref role="37wK5l" to="33ny:~Iterator.hasNext()" resolve="hasNext" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOSgGj" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOSgGk" role="3cqZAp">
              <node concept="Xl_RD" id="4IOweXOSgGl" role="3cqZAk">
                <property role="Xl_RC" value="/* unresolved action variable */" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOSgGn" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSgGm" role="3cpWs9">
            <property role="TrG5h" value="reference" />
            <node concept="3uibUv" id="4IOweXOSgGo" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SReference" resolve="org.jetbrains.mps.openapi.model.SReference" />
            </node>
            <node concept="2OqwBi" id="4IOweXOSgL9" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOSgHT" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOSgG8" resolve="references" />
              </node>
              <node concept="liA8E" id="4IOweXOSgLa" role="2OqNvi">
                <ref role="37wK5l" to="33ny:~Iterator.next()" resolve="next" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOSgGr" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSgGq" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="4IOweXOSgGs" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOSgLl" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOSgHX" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOSgGm" resolve="reference" />
              </node>
              <node concept="liA8E" id="4IOweXOSgLm" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SReference.getTargetNode()" resolve="getTargetNode" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOSgGv" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSgGu" role="3cpWs9">
            <property role="TrG5h" value="name" />
            <node concept="3uibUv" id="4IOweXOSgGw" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="3K4zz7" id="4IOweXOSgGF" role="33vP2m">
              <node concept="3clFbC" id="4IOweXOSgGx" role="3K4Cdx">
                <node concept="37vLTw" id="4IOweXOSgGy" role="3uHU7B">
                  <ref role="3cqZAo" node="4IOweXOSgGq" resolve="target" />
                </node>
                <node concept="10Nm6u" id="4IOweXOSgGz" role="3uHU7w" />
              </node>
              <node concept="2OqwBi" id="4IOweXOSgI9" role="3K4E3e">
                <node concept="1eOMI4" id="4IOweXOSgGC" role="2Oq$k0">
                  <node concept="10QFUN" id="4IOweXOSgG_" role="1eOMHV">
                    <node concept="37vLTw" id="4IOweXOSgGA" role="10QFUP">
                      <ref role="3cqZAo" node="4IOweXOSgGm" resolve="reference" />
                    </node>
                    <node concept="3uibUv" id="4IOweXOSgGB" role="10QFUM">
                      <ref role="3uigEE" to="w1kc:~SReference" resolve="SReference" />
                    </node>
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOSgIa" role="2OqNvi">
                  <ref role="37wK5l" to="w1kc:~SReference.getResolveInfo()" resolve="getResolveInfo" />
                </node>
              </node>
              <node concept="2OqwBi" id="4IOweXOSgLx" role="3K4GZi">
                <node concept="37vLTw" id="4IOweXOSgId" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOSgGq" resolve="target" />
                </node>
                <node concept="liA8E" id="4IOweXOSgLy" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getProperty(java.lang.String)" resolve="getProperty" />
                  <node concept="Xl_RD" id="4IOweXOSgLz" role="37wK5m">
                    <property role="Xl_RC" value="name" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOSgGG" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOSgGH" role="3clFbw">
            <node concept="37vLTw" id="4IOweXOSgGI" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOSgGu" resolve="name" />
            </node>
            <node concept="10Nm6u" id="4IOweXOSgGJ" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOSgGL" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOSgGM" role="3cqZAp">
              <node concept="Xl_RD" id="4IOweXOSgGN" role="3cqZAk">
                <property role="Xl_RC" value="/* unnamed action variable */" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOSgGO" role="3cqZAp">
          <node concept="1rXfSq" id="4IOweXOSgGP" role="3clFbw">
            <ref role="37wK5l" node="4IOweXOSeQm" resolve="isParameter" />
            <node concept="37vLTw" id="4IOweXOSgGQ" role="37wK5m">
              <ref role="3cqZAo" node="4IOweXOSgG5" resolve="node" />
            </node>
            <node concept="37vLTw" id="4IOweXOSgGR" role="37wK5m">
              <ref role="3cqZAo" node="4IOweXOSgGu" resolve="name" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOSgGT" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOSgGU" role="3cqZAp">
              <node concept="3K4zz7" id="4IOweXOSgH5" role="3cqZAk">
                <node concept="2OqwBi" id="4IOweXOSgIu" role="3K4Cdx">
                  <node concept="Xl_RD" id="4IOweXOSgGW" role="2Oq$k0">
                    <property role="Xl_RC" value="act" />
                  </node>
                  <node concept="liA8E" id="4IOweXOSgIv" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                    <node concept="1rXfSq" id="4IOweXOSgIw" role="37wK5m">
                      <ref role="37wK5l" node="4IOweXOSeRz" resolve="containingMethodName" />
                      <node concept="37vLTw" id="4IOweXOSgIx" role="37wK5m">
                        <ref role="3cqZAo" node="4IOweXOSgG5" resolve="node" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="37vLTw" id="4IOweXOSgGZ" role="3K4E3e">
                  <ref role="3cqZAo" node="4IOweXOSgGu" resolve="name" />
                </node>
                <node concept="3cpWs3" id="4IOweXOSgH0" role="3K4GZi">
                  <node concept="3cpWs3" id="4IOweXOSgH1" role="3uHU7B">
                    <node concept="Xl_RD" id="4IOweXOSgH2" role="3uHU7B">
                      <property role="Xl_RC" value="params." />
                    </node>
                    <node concept="37vLTw" id="4IOweXOSgH3" role="3uHU7w">
                      <ref role="3cqZAo" node="4IOweXOSgGu" resolve="name" />
                    </node>
                  </node>
                  <node concept="Xl_RD" id="4IOweXOSgH4" role="3uHU7w">
                    <property role="Xl_RC" value="()" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOSgH6" role="3cqZAp">
          <node concept="1Wc70l" id="4IOweXOSgH7" role="3clFbw">
            <node concept="3y3z36" id="4IOweXOSgH8" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOSgH9" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOSgGq" resolve="target" />
              </node>
              <node concept="10Nm6u" id="4IOweXOSgHa" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="4IOweXOSgIK" role="3uHU7w">
              <node concept="Xl_RD" id="4IOweXOSgHc" role="2Oq$k0">
                <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.ClassConcept" />
              </node>
              <node concept="liA8E" id="4IOweXOSgIL" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                <node concept="2OqwBi" id="4IOweXOSgQh" role="37wK5m">
                  <node concept="2OqwBi" id="4IOweXOSgN_" role="2Oq$k0">
                    <node concept="37vLTw" id="4IOweXOSgLI" role="2Oq$k0">
                      <ref role="3cqZAo" node="4IOweXOSgGq" resolve="target" />
                    </node>
                    <node concept="liA8E" id="4IOweXOSgNA" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4IOweXOSgQi" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOSgHg" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOSgHh" role="3cqZAp">
              <node concept="Xl_RD" id="4IOweXOSgHi" role="3cqZAk">
                <property role="Xl_RC" value="mixee" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4IOweXOSgHj" role="3cqZAp">
          <node concept="37vLTw" id="4IOweXOSgHk" role="3cqZAk">
            <ref role="3cqZAo" node="4IOweXOSgGu" resolve="name" />
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4IOweXOSgHl" role="1B3o_S" />
      <node concept="3uibUv" id="4IOweXOSgHm" role="3clF45">
        <ref role="3uigEE" to="wyt6:~String" resolve="String" />
      </node>
    </node>
    <node concept="2YIFZL" id="4IOweXOSeQm" role="jymVt">
      <property role="TrG5h" value="isParameter" />
      <node concept="37vLTG" id="4IOweXOSeQn" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="4IOweXOSeQo" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="37vLTG" id="4IOweXOSeQp" role="3clF46">
        <property role="TrG5h" value="name" />
        <node concept="3uibUv" id="4IOweXOSeQq" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~String" resolve="String" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOSeQr" role="3clF47">
        <node concept="3cpWs8" id="4IOweXOSeQt" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSeQs" role="3cpWs9">
            <property role="TrG5h" value="ancestor" />
            <node concept="3uibUv" id="4IOweXOSeQu" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOSeTB" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOSeS5" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOSeQn" resolve="node" />
              </node>
              <node concept="liA8E" id="4IOweXOSeTC" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOSeQx" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSeQw" role="3cpWs9">
            <property role="TrG5h" value="actionClass" />
            <node concept="3uibUv" id="4IOweXOSeQy" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="10Nm6u" id="4IOweXOSeQz" role="33vP2m" />
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOSeQT" role="3cqZAp">
          <node concept="3y3z36" id="4IOweXOSeQ$" role="2$JKZa">
            <node concept="37vLTw" id="4IOweXOSeQ_" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOSeQs" resolve="ancestor" />
            </node>
            <node concept="10Nm6u" id="4IOweXOSeQA" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOSeQC" role="2LFqv$">
            <node concept="3clFbJ" id="4IOweXOSeQD" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOSeSl" role="3clFbw">
                <node concept="Xl_RD" id="4IOweXOSeQF" role="2Oq$k0">
                  <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.ClassConcept" />
                </node>
                <node concept="liA8E" id="4IOweXOSeSm" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="2OqwBi" id="4IOweXOSeXl" role="37wK5m">
                    <node concept="2OqwBi" id="4IOweXOSeW0" role="2Oq$k0">
                      <node concept="37vLTw" id="4IOweXOSeTN" role="2Oq$k0">
                        <ref role="3cqZAo" node="4IOweXOSeQs" resolve="ancestor" />
                      </node>
                      <node concept="liA8E" id="4IOweXOSeW1" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                      </node>
                    </node>
                    <node concept="liA8E" id="4IOweXOSeXm" role="2OqNvi">
                      <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXOSeQJ" role="3clFbx">
                <node concept="3clFbF" id="4IOweXOSeQK" role="3cqZAp">
                  <node concept="37vLTI" id="4IOweXOSeQL" role="3clFbG">
                    <node concept="37vLTw" id="4IOweXOSeQM" role="37vLTJ">
                      <ref role="3cqZAo" node="4IOweXOSeQw" resolve="actionClass" />
                    </node>
                    <node concept="37vLTw" id="4IOweXOSeQN" role="37vLTx">
                      <ref role="3cqZAo" node="4IOweXOSeQs" resolve="ancestor" />
                    </node>
                  </node>
                </node>
                <node concept="3zACq4" id="4IOweXOSeQO" role="3cqZAp" />
              </node>
            </node>
            <node concept="3clFbF" id="4IOweXOSeQP" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOSeQQ" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOSeQR" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOSeQs" resolve="ancestor" />
                </node>
                <node concept="2OqwBi" id="4IOweXOSeTZ" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOSeSr" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOSeQs" resolve="ancestor" />
                  </node>
                  <node concept="liA8E" id="4IOweXOSeU0" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOSeQU" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOSeQV" role="3clFbw">
            <node concept="37vLTw" id="4IOweXOSeQW" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOSeQw" resolve="actionClass" />
            </node>
            <node concept="10Nm6u" id="4IOweXOSeQX" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOSeQZ" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOSeR0" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOSeR1" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4IOweXOSeR2" role="3cqZAp">
          <node concept="2OqwBi" id="4IOweXOSeUb" role="1DdaDG">
            <node concept="37vLTw" id="4IOweXOSeSv" role="2Oq$k0">
              <ref role="3cqZAo" node="4IOweXOSeQw" resolve="actionClass" />
            </node>
            <node concept="liA8E" id="4IOweXOSeUc" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren()" resolve="getChildren" />
            </node>
          </node>
          <node concept="3cpWsn" id="4IOweXOSeRr" role="1Duv9x">
            <property role="TrG5h" value="member" />
            <node concept="3uibUv" id="4IOweXOSeRt" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOSeR4" role="2LFqv$">
            <node concept="3clFbJ" id="4IOweXOSeR5" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOSeSJ" role="3clFbw">
                <node concept="Xl_RD" id="4IOweXOSeR7" role="2Oq$k0">
                  <property role="Xl_RC" value="Params" />
                </node>
                <node concept="liA8E" id="4IOweXOSeSK" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="2OqwBi" id="4IOweXOSeWb" role="37wK5m">
                    <node concept="37vLTw" id="4IOweXOSeUf" role="2Oq$k0">
                      <ref role="3cqZAo" node="4IOweXOSeRr" resolve="member" />
                    </node>
                    <node concept="liA8E" id="4IOweXOSeWc" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getProperty(java.lang.String)" resolve="getProperty" />
                      <node concept="Xl_RD" id="4IOweXOSeWd" role="37wK5m">
                        <property role="Xl_RC" value="name" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXOSeRb" role="3clFbx">
                <node concept="1DcWWT" id="4IOweXOSeRc" role="3cqZAp">
                  <node concept="2OqwBi" id="4IOweXOSeUr" role="1DdaDG">
                    <node concept="37vLTw" id="4IOweXOSeSP" role="2Oq$k0">
                      <ref role="3cqZAo" node="4IOweXOSeRr" resolve="member" />
                    </node>
                    <node concept="liA8E" id="4IOweXOSeUs" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getChildren()" resolve="getChildren" />
                    </node>
                  </node>
                  <node concept="3cpWsn" id="4IOweXOSeRn" role="1Duv9x">
                    <property role="TrG5h" value="paramsMember" />
                    <node concept="3uibUv" id="4IOweXOSeRp" role="1tU5fm">
                      <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                    </node>
                  </node>
                  <node concept="3clFbS" id="4IOweXOSeRe" role="2LFqv$">
                    <node concept="3clFbJ" id="4IOweXOSeRf" role="3cqZAp">
                      <node concept="2OqwBi" id="4IOweXOSeUE" role="3clFbw">
                        <node concept="37vLTw" id="4IOweXOSeST" role="2Oq$k0">
                          <ref role="3cqZAo" node="4IOweXOSeQp" resolve="name" />
                        </node>
                        <node concept="liA8E" id="4IOweXOSeUF" role="2OqNvi">
                          <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                          <node concept="2OqwBi" id="4IOweXOSeXw" role="37wK5m">
                            <node concept="37vLTw" id="4IOweXOSeWg" role="2Oq$k0">
                              <ref role="3cqZAo" node="4IOweXOSeRn" resolve="paramsMember" />
                            </node>
                            <node concept="liA8E" id="4IOweXOSeXx" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getProperty(java.lang.String)" resolve="getProperty" />
                              <node concept="Xl_RD" id="4IOweXOSeXy" role="37wK5m">
                                <property role="Xl_RC" value="name" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3clFbS" id="4IOweXOSeRk" role="3clFbx">
                        <node concept="3cpWs6" id="4IOweXOSeRl" role="3cqZAp">
                          <node concept="3clFbT" id="4IOweXOSeRm" role="3cqZAk">
                            <property role="3clFbU" value="true" />
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
        <node concept="3cpWs6" id="4IOweXOSeRv" role="3cqZAp">
          <node concept="3clFbT" id="4IOweXOSeRw" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4IOweXOSeRx" role="1B3o_S" />
      <node concept="10P_77" id="4IOweXOSeRy" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="4IOweXOSeRz" role="jymVt">
      <property role="TrG5h" value="containingMethodName" />
      <node concept="37vLTG" id="4IOweXOSeR$" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="4IOweXOSeR_" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOSeRA" role="3clF47">
        <node concept="3cpWs8" id="4IOweXOSeRC" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOSeRB" role="3cpWs9">
            <property role="TrG5h" value="ancestor" />
            <node concept="3uibUv" id="4IOweXOSeRD" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOSeUR" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOSeSZ" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOSeR$" resolve="node" />
              </node>
              <node concept="liA8E" id="4IOweXOSeUS" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOSeRY" role="3cqZAp">
          <node concept="3y3z36" id="4IOweXOSeRF" role="2$JKZa">
            <node concept="37vLTw" id="4IOweXOSeRG" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOSeRB" resolve="ancestor" />
            </node>
            <node concept="10Nm6u" id="4IOweXOSeRH" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOSeRJ" role="2LFqv$">
            <node concept="3clFbJ" id="4IOweXOSeRK" role="3cqZAp">
              <node concept="2OqwBi" id="4IOweXOSeYd" role="3clFbw">
                <node concept="2OqwBi" id="4IOweXOSeWR" role="2Oq$k0">
                  <node concept="2OqwBi" id="4IOweXOSeVj" role="2Oq$k0">
                    <node concept="37vLTw" id="4IOweXOSeTj" role="2Oq$k0">
                      <ref role="3cqZAo" node="4IOweXOSeRB" resolve="ancestor" />
                    </node>
                    <node concept="liA8E" id="4IOweXOSeVk" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4IOweXOSeWS" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOSeYe" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.endsWith(java.lang.String)" resolve="endsWith" />
                  <node concept="Xl_RD" id="4IOweXOSeYf" role="37wK5m">
                    <property role="Xl_RC" value="MethodDeclaration" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXOSeRQ" role="3clFbx">
                <node concept="3cpWs6" id="4IOweXOSeRR" role="3cqZAp">
                  <node concept="2OqwBi" id="4IOweXOSeVv" role="3cqZAk">
                    <node concept="37vLTw" id="4IOweXOSeTn" role="2Oq$k0">
                      <ref role="3cqZAo" node="4IOweXOSeRB" resolve="ancestor" />
                    </node>
                    <node concept="liA8E" id="4IOweXOSeVw" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getProperty(java.lang.String)" resolve="getProperty" />
                      <node concept="Xl_RD" id="4IOweXOSeVx" role="37wK5m">
                        <property role="Xl_RC" value="name" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="4IOweXOSeRU" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOSeRV" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOSeRW" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOSeRB" resolve="ancestor" />
                </node>
                <node concept="2OqwBi" id="4IOweXOSeVG" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOSeTs" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOSeRB" resolve="ancestor" />
                  </node>
                  <node concept="liA8E" id="4IOweXOSeVH" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4IOweXOSeRZ" role="3cqZAp">
          <node concept="10Nm6u" id="4IOweXOSeS0" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4IOweXOSeS1" role="1B3o_S" />
      <node concept="3uibUv" id="4IOweXOSeS2" role="3clF45">
        <ref role="3uigEE" to="wyt6:~String" resolve="String" />
      </node>
    </node>
  </node>
  <node concept="WtQ9Q" id="4IOweXOS4lx">
    <property role="TrG5h" value="ActionVariableReference_TextGen" />
    <ref role="WuzLi" to="k3bw:4IOweXOJ78z" resolve="ActionVariableReference" />
    <node concept="11bSqf" id="4IOweXOS4ly" role="11c4hB">
      <node concept="3clFbS" id="4IOweXOS4l$" role="2VODD2">
        <node concept="lc7rE" id="4IOweXOS4l_" role="3cqZAp">
          <node concept="l9hG8" id="4IOweXOS4lB" role="lcghm">
            <node concept="2YIFZM" id="4IOweXOS4lD" role="lb14g">
              <ref role="1Pybhc" node="4IOweXORYcr" resolve="ActionVariableTextGen" />
              <ref role="37wK5l" node="4IOweXOSgG4" />
              <node concept="117lpO" id="4IOweXOS4lE" role="37wK5m" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

