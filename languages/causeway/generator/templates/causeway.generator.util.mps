<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:8e97c108-eedf-4a08-949b-1be65628da41(causeway.generator.util)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
  </languages>
  <imports>
    <import index="2k9e" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.structure(MPS.Core/)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
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
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu">
        <property id="1221565133444" name="isFinal" index="1EXbeo" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
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
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
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
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
      <concept id="8064396509828172209" name="jetbrains.mps.baseLanguage.structure.UnaryMinus" flags="nn" index="1ZRNhn" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="312cEu" id="6kis6yMGjul">
    <property role="TrG5h" value="ActionInvocationGeneratorQueries" />
    <property role="1EXbeo" value="true" />
    <node concept="3Tm1VV" id="6kis6yMGjum" role="1B3o_S" />
    <node concept="Wx3nA" id="6kis6yMGjun" role="jymVt">
      <property role="TrG5h" value="ACTION_INVOCATION" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMGjuo" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMGjxC" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMGjxD" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxE" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMGjxF" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxG" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMGjxH" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMGjxI" role="37wK5m">
          <property role="Xl_RC" value="ActionInvocation" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjuw" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMGjux" role="jymVt">
      <property role="TrG5h" value="ENTITY" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMGjuy" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMGjxL" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMGjxM" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxN" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMGjxO" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxP" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMGjxQ" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMGjxR" role="37wK5m">
          <property role="Xl_RC" value="Entity" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjuE" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMGjuF" role="jymVt">
      <property role="TrG5h" value="INVOKED_ACTION" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMGjuG" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMGjxU" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMGjxV" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxW" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMGjxX" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjxY" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMGjxZ" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="1adDum" id="6kis6yMGjy0" role="37wK5m">
          <property role="1adDun" value="7283007142388106565L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMGjy1" role="37wK5m">
          <property role="Xl_RC" value="action" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjuP" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMGjuQ" role="jymVt">
      <property role="TrG5h" value="EXPLICIT_TARGET" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMGjuR" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMGjy4" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMGjy5" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjy6" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMGjy7" role="37wK5m">
          <node concept="1adDum" id="6kis6yMGjy8" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMGjy9" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="1adDum" id="6kis6yMGjya" role="37wK5m">
          <property role="1adDun" value="8900000000000000048L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMGjyb" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjv0" role="1B3o_S" />
    </node>
    <node concept="3clFbW" id="6kis6yMGjv1" role="jymVt">
      <node concept="3cqZAl" id="6kis6yMGjv2" role="3clF45" />
      <node concept="3clFbS" id="6kis6yMGjv3" role="3clF47" />
      <node concept="3Tm6S6" id="6kis6yMGjv4" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="6kis6yMGjv5" role="jymVt">
      <property role="TrG5h" value="containsTransparentInvocation" />
      <node concept="37vLTG" id="6kis6yMGjv6" role="3clF46">
        <property role="TrG5h" value="action" />
        <node concept="3uibUv" id="6kis6yMGjv7" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjv8" role="3clF47">
        <node concept="3cpWs6" id="6kis6yMGjv9" role="3cqZAp">
          <node concept="1rXfSq" id="6kis6yMGjva" role="3cqZAk">
            <ref role="37wK5l" node="6kis6yMGjwl" resolve="containsTransparentInvocationRecursively" />
            <node concept="37vLTw" id="6kis6yMGjvb" role="37wK5m">
              <ref role="3cqZAo" node="6kis6yMGjv6" resolve="action" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMGjvc" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMGjvd" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMGjve" role="jymVt">
      <property role="TrG5h" value="referencedAction" />
      <node concept="37vLTG" id="6kis6yMGjvf" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMGjvg" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjvh" role="3clF47">
        <node concept="3clFbJ" id="6kis6yMGjvi" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMGjvj" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMGjvk" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMGjvl" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMGjvf" resolve="invocation" />
              </node>
              <node concept="10Nm6u" id="6kis6yMGjvm" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="6kis6yMGjvn" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMGj_X" role="3fr31v">
                <node concept="2OqwBi" id="6kis6yMGjzF" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMGjym" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMGjvf" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="6kis6yMGjzG" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMGj_Y" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMGj_Z" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMGjun" resolve="ACTION_INVOCATION" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMGjvs" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjvt" role="3cqZAp">
              <node concept="10Nm6u" id="6kis6yMGjvu" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMGjvv" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMGjzQ" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMGjyq" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMGjvf" resolve="invocation" />
            </node>
            <node concept="liA8E" id="6kis6yMGjzR" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
              <node concept="37vLTw" id="6kis6yMGjzS" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjuF" resolve="INVOKED_ACTION" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMGjvy" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMGjvz" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="6kis6yMGjv$" role="jymVt">
      <property role="TrG5h" value="referencedActionUsesNestedClass" />
      <node concept="37vLTG" id="6kis6yMGjv_" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMGjvA" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjvB" role="3clF47">
        <node concept="3cpWs6" id="6kis6yMGjvC" role="3cqZAp">
          <node concept="1rXfSq" id="6kis6yMGjvD" role="3cqZAk">
            <ref role="37wK5l" node="6kis6yMGjwV" resolve="isNestedAction" />
            <node concept="1rXfSq" id="6kis6yMGjvE" role="37wK5m">
              <ref role="37wK5l" node="6kis6yMGjve" resolve="referencedAction" />
              <node concept="37vLTw" id="6kis6yMGjvF" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjv_" resolve="invocation" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMGjvG" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMGjvH" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMI_DQ" role="jymVt">
      <property role="TrG5h" value="referencedActionUsesTopLevelClass" />
      <node concept="37vLTG" id="6kis6yMI_DR" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMI_DS" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMI_DT" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMI_DV" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMI_DU" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMI_DW" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="6kis6yMI_DX" role="33vP2m">
              <ref role="37wK5l" node="6kis6yMGjve" resolve="referencedAction" />
              <node concept="37vLTw" id="6kis6yMI_DY" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMI_DR" resolve="invocation" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMI_DZ" role="3cqZAp">
          <node concept="1Wc70l" id="6kis6yMI_E0" role="3cqZAk">
            <node concept="3y3z36" id="6kis6yMI_E1" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMI_E2" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMI_DU" resolve="action" />
              </node>
              <node concept="10Nm6u" id="6kis6yMI_E3" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="6kis6yMI_E4" role="3uHU7w">
              <node concept="1rXfSq" id="6kis6yMI_E5" role="3fr31v">
                <ref role="37wK5l" node="6kis6yMGjwV" resolve="isNestedAction" />
                <node concept="37vLTw" id="6kis6yMI_E6" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMI_DU" resolve="action" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMI_E7" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMI_E8" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMGjvI" role="jymVt">
      <property role="TrG5h" value="referencedGeneratedClassName" />
      <node concept="37vLTG" id="6kis6yMGjvJ" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMGjvK" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjvL" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMGjvN" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMGjvM" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMGjvO" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="6kis6yMGjvP" role="33vP2m">
              <ref role="37wK5l" node="6kis6yMGjve" resolve="referencedAction" />
              <node concept="37vLTw" id="6kis6yMGjvQ" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjvJ" resolve="invocation" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMGjvS" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMGjvR" role="3cpWs9">
            <property role="TrG5h" value="entity" />
            <node concept="3uibUv" id="6kis6yMGjvT" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="6kis6yMGjvU" role="33vP2m">
              <ref role="37wK5l" node="6kis6yMGjxe" resolve="targetEntity" />
              <node concept="37vLTw" id="6kis6yMGjvV" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjvM" resolve="action" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMGjvW" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMGjvX" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMGjvY" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMGjvZ" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMGjvM" resolve="action" />
              </node>
              <node concept="10Nm6u" id="6kis6yMGjw0" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="6kis6yMGjw1" role="3uHU7w">
              <node concept="37vLTw" id="6kis6yMGjw2" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMGjvR" resolve="entity" />
              </node>
              <node concept="10Nm6u" id="6kis6yMGjw3" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMGjw5" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjw6" role="3cqZAp">
              <node concept="10Nm6u" id="6kis6yMGjw7" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMGjw8" role="3cqZAp">
          <node concept="3cpWs3" id="6kis6yMGjw9" role="3cqZAk">
            <node concept="3cpWs3" id="6kis6yMGjwa" role="3uHU7B">
              <node concept="2OqwBi" id="6kis6yMGj$3" role="3uHU7B">
                <node concept="37vLTw" id="6kis6yMGjyx" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMGjvR" resolve="entity" />
                </node>
                <node concept="liA8E" id="6kis6yMGj$4" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
                </node>
              </node>
              <node concept="1eOMI4" id="6kis6yMGjwh" role="3uHU7w">
                <node concept="3K4zz7" id="6kis6yMGjwg" role="1eOMHV">
                  <node concept="1rXfSq" id="6kis6yMGjwc" role="3K4Cdx">
                    <ref role="37wK5l" node="6kis6yMGjwV" resolve="isNestedAction" />
                    <node concept="37vLTw" id="6kis6yMGjwd" role="37wK5m">
                      <ref role="3cqZAo" node="6kis6yMGjvM" resolve="action" />
                    </node>
                  </node>
                  <node concept="Xl_RD" id="6kis6yMGjwe" role="3K4E3e">
                    <property role="Xl_RC" value="." />
                  </node>
                  <node concept="Xl_RD" id="6kis6yMGjwf" role="3K4GZi">
                    <property role="Xl_RC" value="_" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="6kis6yMGj$f" role="3uHU7w">
              <node concept="37vLTw" id="6kis6yMGjy_" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMGjvM" resolve="action" />
              </node>
              <node concept="liA8E" id="6kis6yMGj$g" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMGjwj" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMGjwk" role="3clF45">
        <ref role="3uigEE" to="wyt6:~String" resolve="String" />
      </node>
    </node>
    <node concept="2YIFZL" id="6kis6yMGjwl" role="jymVt">
      <property role="TrG5h" value="containsTransparentInvocationRecursively" />
      <node concept="37vLTG" id="6kis6yMGjwm" role="3clF46">
        <property role="TrG5h" value="node" />
        <node concept="3uibUv" id="6kis6yMGjwn" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjwo" role="3clF47">
        <node concept="3clFbJ" id="6kis6yMGjwp" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMGjwq" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMGjwr" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMGjwm" resolve="node" />
            </node>
            <node concept="10Nm6u" id="6kis6yMGjws" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMGjwu" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjwv" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMGjww" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMGjwx" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMGjAj" role="3clFbw">
            <node concept="2OqwBi" id="6kis6yMGj$y" role="2Oq$k0">
              <node concept="37vLTw" id="6kis6yMGjyL" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMGjwm" resolve="node" />
              </node>
              <node concept="liA8E" id="6kis6yMGj$z" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
              </node>
            </node>
            <node concept="liA8E" id="6kis6yMGjAk" role="2OqNvi">
              <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
              <node concept="37vLTw" id="6kis6yMGjAl" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjun" resolve="ACTION_INVOCATION" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMGjwA" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjwB" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMGjwC" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMGjwD" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMGj$H" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMGjyP" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMGjwm" resolve="node" />
            </node>
            <node concept="liA8E" id="6kis6yMGj$I" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren()" resolve="getChildren" />
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMGjwN" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <node concept="3uibUv" id="6kis6yMGjwP" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMGjwF" role="2LFqv$">
            <node concept="3clFbJ" id="6kis6yMGjwG" role="3cqZAp">
              <node concept="1rXfSq" id="6kis6yMGjwH" role="3clFbw">
                <ref role="37wK5l" node="6kis6yMGjwl" resolve="containsTransparentInvocationRecursively" />
                <node concept="37vLTw" id="6kis6yMGjwI" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMGjwN" resolve="child" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMGjwK" role="3clFbx">
                <node concept="3cpWs6" id="6kis6yMGjwL" role="3cqZAp">
                  <node concept="3clFbT" id="6kis6yMGjwM" role="3cqZAk">
                    <property role="3clFbU" value="true" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMGjwR" role="3cqZAp">
          <node concept="3clFbT" id="6kis6yMGjwS" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjwT" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMGjwU" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMGjwV" role="jymVt">
      <property role="TrG5h" value="isNestedAction" />
      <node concept="37vLTG" id="6kis6yMGjwW" role="3clF46">
        <property role="TrG5h" value="action" />
        <node concept="3uibUv" id="6kis6yMGjwX" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjwY" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMGlIT" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMGlIS" role="3cpWs9">
            <property role="TrG5h" value="parent" />
            <node concept="3uibUv" id="6kis6yMGlIU" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="3K4zz7" id="6kis6yMGlJ0" role="33vP2m">
              <node concept="3clFbC" id="6kis6yMGlIV" role="3K4Cdx">
                <node concept="37vLTw" id="6kis6yMGlIW" role="3uHU7B">
                  <ref role="3cqZAo" node="6kis6yMGjwW" resolve="action" />
                </node>
                <node concept="10Nm6u" id="6kis6yMGlIX" role="3uHU7w" />
              </node>
              <node concept="10Nm6u" id="6kis6yMGlIY" role="3K4E3e" />
              <node concept="2OqwBi" id="6kis6yMGlJe" role="3K4GZi">
                <node concept="37vLTw" id="6kis6yMGlJ3" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMGjwW" resolve="action" />
                </node>
                <node concept="liA8E" id="6kis6yMGlJf" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMGjwZ" role="3cqZAp">
          <node concept="1Wc70l" id="6kis6yMGmJY" role="3cqZAk">
            <node concept="3y3z36" id="6kis6yMGmJZ" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMGmK0" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMGlIS" resolve="parent" />
              </node>
              <node concept="10Nm6u" id="6kis6yMGmK1" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="6kis6yMGmLn" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMGmK_" role="2Oq$k0">
                <node concept="37vLTw" id="6kis6yMGmKh" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMGlIS" resolve="parent" />
                </node>
                <node concept="liA8E" id="6kis6yMGmKA" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                </node>
              </node>
              <node concept="liA8E" id="6kis6yMGmLo" role="2OqNvi">
                <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                <node concept="37vLTw" id="6kis6yMGmLp" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMGjux" resolve="ENTITY" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjxc" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMGjxd" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMGjxe" role="jymVt">
      <property role="TrG5h" value="targetEntity" />
      <node concept="37vLTG" id="6kis6yMGjxf" role="3clF46">
        <property role="TrG5h" value="action" />
        <node concept="3uibUv" id="6kis6yMGjxg" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMGjxh" role="3clF47">
        <node concept="3clFbJ" id="6kis6yMGjxi" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMGjxj" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMGjxk" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMGjxf" resolve="action" />
            </node>
            <node concept="10Nm6u" id="6kis6yMGjxl" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMGjxn" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjxo" role="3cqZAp">
              <node concept="10Nm6u" id="6kis6yMGjxp" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMGjxq" role="3cqZAp">
          <node concept="1rXfSq" id="6kis6yMGjxr" role="3clFbw">
            <ref role="37wK5l" node="6kis6yMGjwV" resolve="isNestedAction" />
            <node concept="37vLTw" id="6kis6yMGjxs" role="37wK5m">
              <ref role="3cqZAo" node="6kis6yMGjxf" resolve="action" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMGjxu" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMGjxv" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMGj_u" role="3cqZAk">
                <node concept="37vLTw" id="6kis6yMGjzh" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMGjxf" resolve="action" />
                </node>
                <node concept="liA8E" id="6kis6yMGj_v" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMGjxx" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMGj_D" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMGjzl" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMGjxf" resolve="action" />
            </node>
            <node concept="liA8E" id="6kis6yMGj_E" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
              <node concept="37vLTw" id="6kis6yMGj_F" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMGjuQ" resolve="EXPLICIT_TARGET" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMGjx$" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMGjx_" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
      </node>
    </node>
  </node>
</model>

