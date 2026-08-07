<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
  </languages>
  <imports>
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="22ox" ref="c31c5f46-778f-4244-90d0-c92808fc2b16/java:app(causeway.stubs/)" />
    <import index="shd6" ref="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.applib.services.wrapper.control(causeway.stubs/)" />
    <import index="p663" ref="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.commons.functional(causeway.stubs/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
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
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
    </language>
    <language id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway">
      <concept id="4835663559135129055" name="causeway.structure.WrappedActionInvocation" flags="ng" index="2O_PuX">
        <property id="4835663559135129057" name="mode" index="2O_Pu3" />
        <child id="4835663559135129058" name="control" index="2O_Pu0" />
      </concept>
      <concept id="4835663559140888301" name="causeway.structure.DerivedProperty" flags="ng" index="2OZRif">
        <reference id="4835663559140888305" name="target" index="2OZRij" />
        <child id="4835663559140888302" name="resultType" index="2OZRic" />
        <child id="4835663559140888303" name="body" index="2OZRid" />
        <child id="4835663559140888304" name="injectedServices" index="2OZRii" />
      </concept>
      <concept id="5455126814596559395" name="causeway.structure.ActionVariableReference" flags="ng" index="Z2fbc">
        <reference id="5455126814596559396" name="variable" index="Z2fbb" />
      </concept>
      <concept id="5455126814597722999" name="causeway.structure.LifecycleBlock" flags="ng" index="ZuFeo">
        <child id="5455126814597799728" name="body" index="ZuXZv" />
      </concept>
      <concept id="7283007142388106561" name="causeway.structure.ActionInvocation" flags="ng" index="3nJRkD">
        <reference id="7283007142388106565" name="action" index="3nJRkH" />
        <child id="7283007142388106563" name="target" index="3nJRkF" />
        <child id="7283007142388106564" name="arguments" index="3nJRkG" />
      </concept>
      <concept id="8900000000000000008" name="causeway.structure.JavaType" flags="ng" index="3Zuirg">
        <child id="8900000000000000032" name="javaType" index="3ZuirS" />
      </concept>
      <concept id="8900000000000000010" name="causeway.structure.InjectedService" flags="ng" index="3Zuiri">
        <child id="8900000000000000033" name="type" index="3ZuirT" />
      </concept>
      <concept id="8900000000000000001" name="causeway.structure.Module" flags="ng" index="3Zuirp" />
      <concept id="8900000000000000002" name="causeway.structure.Entity" flags="ng" index="3Zuirq">
        <child id="4835663559140888326" name="derivedProperties" index="2OZRl$" />
        <child id="8900000000000000022" name="properties" index="3Zuire" />
        <child id="8900000000000000023" name="actions" index="3Zuirf" />
      </concept>
      <concept id="8900000000000000003" name="causeway.structure.Property" flags="ng" index="3Zuirr">
        <child id="8900000000000000024" name="type" index="3Zuir0" />
      </concept>
      <concept id="8900000000000000004" name="causeway.structure.Action" flags="ng" index="3Zuirs">
        <property id="8900000000000000043" name="semantics" index="3ZuirN" />
        <reference id="8900000000000000048" name="target" index="3ZuirC" />
        <child id="8900000000000000025" name="parameters" index="3Zuir1" />
        <child id="8900000000000000041" name="body" index="3ZuirL" />
        <child id="8900000000000000042" name="returnType" index="3ZuirM" />
        <child id="8900000000000000044" name="injectedServices" index="3ZuirO" />
        <child id="8900000000000000045" name="hide" index="3ZuirP" />
        <child id="8900000000000000046" name="disable" index="3ZuirQ" />
        <child id="8900000000000000047" name="validate" index="3ZuirR" />
      </concept>
      <concept id="8900000000000000005" name="causeway.structure.Parameter" flags="ng" index="3Zuirt">
        <child id="8900000000000000026" name="type" index="3Zuir2" />
        <child id="8900000000000000050" name="choices" index="3ZuirE" />
        <child id="8900000000000000051" name="default" index="3ZuirF" />
        <child id="8900000000000000052" name="validate" index="3ZuirG" />
        <child id="8900000000000000053" name="autoComplete" index="3ZuirH" />
        <child id="8900000000000000054" name="hide" index="3ZuirI" />
        <child id="8900000000000000055" name="disable" index="3ZuirJ" />
      </concept>
      <concept id="8900000000000000007" name="causeway.structure.EntityType" flags="ig" index="3Zuirv">
        <reference id="8900000000000000031" name="entity" index="3Zuir7" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3Zuirq" id="_$TiGuwUPX">
    <property role="TrG5h" value="Customer" />
    <node concept="3Zuirr" id="_$TiGuwUPY" role="3Zuire">
      <property role="TrG5h" value="name" />
      <node concept="3Zuirg" id="_$TiGuwUPZ" role="3Zuir0">
        <node concept="3uibUv" id="_$TiGuwUQ0" role="3ZuirS">
          <ref role="3uigEE" to="wyt6:~String" resolve="String" />
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4IOweXOJEa4" role="3Zuirf">
      <property role="TrG5h" value="scopeProbe" />
      <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
      <node concept="3Zuirt" id="4IOweXOJEa5" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="ZuFeo" id="4IOweXONVsb" role="3ZuirE">
          <node concept="3clFbS" id="4IOweXOOktd" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXOOkte" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOOkth" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOOktk" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
                </node>
                <node concept="10Nm6u" id="4IOweXOOktl" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOOktm" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXOOktn" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOOktq" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOOktt" role="3uHU7B">
                  <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
                </node>
                <node concept="10Nm6u" id="4IOweXOOktu" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOOktv" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSpCu" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSpCv" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="ZuFeo" id="4IOweXONVsw" role="3ZuirG">
          <node concept="3clFbS" id="4IOweXONVsy" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXONVsz" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVsA" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVsD" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVsE" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVsF" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVsG" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVsJ" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVsM" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVsN" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVsO" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVsP" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVsS" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVsV" role="3uHU7B">
                  <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVsW" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVsX" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSpML" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSpMM" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3Zuirv" id="4IOweXOYUGy" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuiri" id="4IOweXOJEa7" role="3ZuirO">
        <property role="TrG5h" value="orderService" />
        <node concept="3Zuirg" id="4IOweXOUni8" role="3ZuirT">
          <node concept="3uibUv" id="4IOweXOUni9" role="3ZuirS">
            <ref role="3uigEE" to="wyt6:~Object" resolve="Object" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOJEa8" role="3ZuirL">
        <node concept="3clFbJ" id="4IOweXOJEas" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOJEat" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOJEdi" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
            </node>
            <node concept="10Nm6u" id="4IOweXOJEaw" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOJEay" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOJEam" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOJEan" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOJEdj" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
            </node>
            <node concept="10Nm6u" id="4IOweXOJEaq" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOJEav" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOJEb0" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOJEb1" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOJEdk" role="3uHU7B">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="10Nm6u" id="4IOweXOJEb3" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOJEb5" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOKfDM" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfDP" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfDS" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa6" resolve="quantity" />
            </node>
            <node concept="3cmrfG" id="4IOweXOSqjy" role="3uHU7w">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOKfDU" role="3clFbx" />
        </node>
      </node>
      <node concept="ZuFeo" id="4IOweXONVu3" role="3ZuirP">
        <node concept="3clFbS" id="4IOweXOOCUW" role="ZuXZv">
          <node concept="3clFbJ" id="4IOweXOOCUX" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOCV0" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOCV3" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOCV4" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOOCV5" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOOCV6" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOCV9" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOCVc" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOCVd" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOOCVe" role="3clFbx" />
          </node>
          <node concept="3cpWs6" id="4IOweXOSpkU" role="3cqZAp">
            <node concept="3clFbT" id="4IOweXOSpkV" role="3cqZAk" />
          </node>
        </node>
      </node>
      <node concept="ZuFeo" id="4IOweXONVuo" role="3ZuirR">
        <node concept="3clFbS" id="4IOweXOOkJV" role="ZuXZv">
          <node concept="3clFbJ" id="4IOweXOOkJW" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOkJZ" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOkK2" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOkK3" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOOkK4" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOOkK5" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOkK8" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOkKb" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa6" resolve="quantity" />
              </node>
              <node concept="3cmrfG" id="4IOweXOSqj$" role="3uHU7w">
                <property role="3cmrfH" value="0" />
              </node>
            </node>
            <node concept="3clFbS" id="4IOweXOOkKd" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOOkKe" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOkKh" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOkKk" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOkKl" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOOkKm" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOOkKn" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOOkKq" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOOkKt" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOkKu" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOOkKv" role="3clFbx" />
          </node>
          <node concept="3cpWs6" id="4IOweXOSpuz" role="3cqZAp">
            <node concept="10Nm6u" id="4IOweXOSpu$" role="3cqZAk" />
          </node>
        </node>
      </node>
      <node concept="3Zuirt" id="4IOweXOJEa6" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="ZuFeo" id="4IOweXONVsY" role="3ZuirE">
          <node concept="3clFbS" id="4IOweXONVt0" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXONVt1" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVt4" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVt7" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVt8" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVt9" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVta" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVtd" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVtg" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVth" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVti" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVtj" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVtm" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVtp" role="3uHU7B">
                  <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVtq" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVtr" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSpXm" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSpXn" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="ZuFeo" id="4IOweXONVts" role="3ZuirG">
          <node concept="3clFbS" id="4IOweXONVtu" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXONVtv" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVty" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVt_" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVtA" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVtB" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVtC" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVtF" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVtI" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa6" resolve="quantity" />
                </node>
                <node concept="3cmrfG" id="4IOweXOSqjz" role="3uHU7w">
                  <property role="3cmrfH" value="0" />
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXONVtK" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVtL" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVtO" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVtR" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVtS" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVtT" role="3clFbx" />
            </node>
            <node concept="3clFbJ" id="4IOweXONVtU" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXONVtX" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXONVu0" role="3uHU7B">
                  <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
                </node>
                <node concept="10Nm6u" id="4IOweXONVu1" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXONVu2" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSq8j" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSq8k" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3Zuirg" id="4IOweXOOVgE" role="3Zuir2">
          <node concept="10Oyi0" id="4IOweXOOVgF" role="3ZuirS" />
        </node>
        <node concept="ZuFeo" id="4IOweXOSSK_" role="3ZuirF">
          <node concept="3clFbS" id="4IOweXOSSKB" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXOSSKC" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOSSKF" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOSSKI" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXOSSKJ" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOSSKK" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSSKL" role="3cqZAp">
              <node concept="3cmrfG" id="4IOweXOSSKM" role="3cqZAk">
                <property role="3cmrfH" value="0" />
              </node>
            </node>
          </node>
        </node>
        <node concept="ZuFeo" id="4IOweXOSSKN" role="3ZuirH">
          <node concept="3clFbS" id="4IOweXOSSKP" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXOSSKQ" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOSSKT" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOSSKW" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXOSSKX" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOSSKY" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSSKZ" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSSL0" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="ZuFeo" id="4IOweXOSSL1" role="3ZuirI">
          <node concept="3clFbS" id="4IOweXOSSL3" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXOSSL4" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOSSL7" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOSSLa" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXOSSLb" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOSSLc" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSSLd" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOSSLe" role="3cqZAk">
                <property role="3clFbU" value="false" />
              </node>
            </node>
          </node>
        </node>
        <node concept="ZuFeo" id="4IOweXOSSLf" role="3ZuirJ">
          <node concept="3clFbS" id="4IOweXOSSLh" role="ZuXZv">
            <node concept="3clFbJ" id="4IOweXOSSLi" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOSSLl" role="3clFbw">
                <node concept="Z2fbc" id="4IOweXOSSLo" role="3uHU7B">
                  <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
                </node>
                <node concept="10Nm6u" id="4IOweXOSSLp" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4IOweXOSSLq" role="3clFbx" />
            </node>
            <node concept="3cpWs6" id="4IOweXOSSLr" role="3cqZAp">
              <node concept="10Nm6u" id="4IOweXOSSLs" role="3cqZAk" />
            </node>
          </node>
        </node>
      </node>
      <node concept="ZuFeo" id="4IOweXOSSLt" role="3ZuirQ">
        <node concept="3clFbS" id="4IOweXOSSLv" role="ZuXZv">
          <node concept="3cpWs6" id="4IOweXOSSLw" role="3cqZAp">
            <node concept="10Nm6u" id="4IOweXOSSLx" role="3cqZAk" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="6kis6yMCBkR" role="3Zuirf">
      <property role="TrG5h" value="placeOrder" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="6kis6yMCBkS" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="6kis6yMCBkT" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="6kis6yMCBkU" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="6kis6yMCBkV" role="3Zuir2">
          <node concept="10Oyi0" id="6kis6yMCBkW" role="3ZuirS" />
        </node>
      </node>
      <node concept="3Zuirv" id="6kis6yMCBkX" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3Zuiri" id="6kis6yMCBkY" role="3ZuirO">
        <property role="TrG5h" value="orderService" />
        <node concept="3Zuirg" id="6kis6yMCBkZ" role="3ZuirT">
          <node concept="3uibUv" id="6kis6yMCBl0" role="3ZuirS">
            <ref role="3uigEE" to="22ox:~OrderService" resolve="OrderService" />
          </node>
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMCBl1" role="3ZuirL">
        <node concept="3clFbF" id="6kis6yMCBl2" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMCBl4" role="3clFbG">
            <node concept="Z2fbc" id="6kis6yMCBl7" role="2Oq$k0">
              <ref role="Z2fbb" node="6kis6yMCBkY" resolve="orderService" />
            </node>
            <node concept="liA8E" id="6kis6yMCBl8" role="2OqNvi">
              <ref role="37wK5l" to="22ox:~OrderService.placeOrder(customers.Customer,customers.Product,int)" resolve="placeOrder" />
              <node concept="Z2fbc" id="6kis6yMCBl9" role="37wK5m">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="Z2fbc" id="6kis6yMCBla" role="37wK5m">
                <ref role="Z2fbb" node="6kis6yMCBkS" resolve="product" />
              </node>
              <node concept="Z2fbc" id="6kis6yMCBlb" role="37wK5m">
                <ref role="Z2fbb" node="6kis6yMCBkU" resolve="quantity" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMCBlc" role="3cqZAp">
          <node concept="Z2fbc" id="6kis6yMCBld" role="3cqZAk">
            <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="6kis6yMJygf" role="3Zuirf">
      <property role="TrG5h" value="invokePlaceOrder" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="6kis6yMJygg" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="6kis6yMJygh" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="6kis6yMJygi" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="6kis6yMJygj" role="3Zuir2">
          <node concept="10Oyi0" id="6kis6yMJygk" role="3ZuirS" />
        </node>
      </node>
      <node concept="3Zuirv" id="6kis6yMJygl" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3clFbS" id="6kis6yMJygm" role="3ZuirL">
        <node concept="3cpWs6" id="6kis6yMJygn" role="3cqZAp">
          <node concept="3nJRkD" id="6kis6yMJygo" role="3cqZAk">
            <ref role="3nJRkH" node="6kis6yMCBkR" resolve="placeOrder" />
            <node concept="Z2fbc" id="6kis6yMJygq" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="Z2fbc" id="6kis6yMJygr" role="3nJRkG">
              <ref role="Z2fbb" node="6kis6yMJygg" resolve="product" />
            </node>
            <node concept="Z2fbc" id="6kis6yMJygs" role="3nJRkG">
              <ref role="Z2fbb" node="6kis6yMJygi" resolve="quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="6kis6yMKIPp" role="3Zuirf">
      <property role="TrG5h" value="invokeTopLevelProbe" />
      <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
      <node concept="3clFbS" id="6kis6yMKIPq" role="3ZuirL">
        <node concept="3cpWs6" id="6kis6yMKJ9F" role="3cqZAp">
          <node concept="3nJRkD" id="6kis6yMKJ9G" role="3cqZAk">
            <ref role="3nJRkH" node="4IOweXOYxgJ" resolve="topLevelProbe" />
            <node concept="Z2fbc" id="6kis6yMKJ9I" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Zuirv" id="6kis6yMKJ9E" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC71e" role="3Zuirf">
      <property role="TrG5h" value="recordOrder" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="4crIAbRC71f" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="4crIAbRC71g" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRC71h" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="4crIAbRC71i" role="3Zuir2">
          <node concept="10Oyi0" id="4crIAbRC71j" role="3ZuirS" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRC71k" role="3ZuirL">
        <node concept="3clFbF" id="4crIAbRC71l" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRC71n" role="3clFbG">
            <node concept="Z2fbc" id="4crIAbRC71q" role="2Oq$k0">
              <ref role="Z2fbb" node="4crIAbRC71v" resolve="orderService" />
            </node>
            <node concept="liA8E" id="4crIAbRC71r" role="2OqNvi">
              <ref role="37wK5l" to="22ox:~OrderService.placeOrder(customers.Customer,customers.Product,int)" resolve="placeOrder" />
              <node concept="Z2fbc" id="4crIAbRC71s" role="37wK5m">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="Z2fbc" id="4crIAbRC71t" role="37wK5m">
                <ref role="Z2fbb" node="4crIAbRC71f" resolve="product" />
              </node>
              <node concept="Z2fbc" id="4crIAbRC71u" role="37wK5m">
                <ref role="Z2fbb" node="4crIAbRC71h" resolve="quantity" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4crIAbRC71v" role="3ZuirO">
        <property role="TrG5h" value="orderService" />
        <node concept="3Zuirg" id="4crIAbRC71w" role="3ZuirT">
          <node concept="3uibUv" id="4crIAbRC71x" role="3ZuirS">
            <ref role="3uigEE" to="22ox:~OrderService" resolve="OrderService" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC72T" role="3Zuirf">
      <property role="TrG5h" value="wrappedSyncNested" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="4crIAbRC72U" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="4crIAbRC72V" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRC72W" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="4crIAbRC72X" role="3Zuir2">
          <node concept="10Oyi0" id="4crIAbRC72Y" role="3ZuirS" />
        </node>
      </node>
      <node concept="3Zuirv" id="4crIAbRC72Z" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3clFbS" id="4crIAbRC730" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC731" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC732" role="3cqZAk">
            <ref role="3nJRkH" node="6kis6yMCBkR" resolve="placeOrder" />
            <node concept="Z2fbc" id="4crIAbRC734" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC735" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC72U" resolve="product" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC736" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC72W" resolve="quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC73g" role="3Zuirf">
      <property role="TrG5h" value="wrappedSyncTopLevelControlled" />
      <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
      <node concept="3Zuirv" id="4crIAbRC73h" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3clFbS" id="4crIAbRC73i" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC73j" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC73k" role="3cqZAk">
            <ref role="3nJRkH" node="4IOweXOYxgJ" resolve="topLevelProbe" />
            <node concept="Z2fbc" id="4crIAbRC73m" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC73n" role="2O_Pu0">
              <ref role="Z2fbb" node="4crIAbRC73o" resolve="syncControl" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4crIAbRC73o" role="3ZuirO">
        <property role="TrG5h" value="syncControl" />
        <node concept="3Zuirg" id="4crIAbRC73p" role="3ZuirT">
          <node concept="3uibUv" id="4crIAbRC73q" role="3ZuirS">
            <ref role="3uigEE" to="shd6:~SyncControl" resolve="SyncControl" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC73$" role="3Zuirf">
      <property role="TrG5h" value="wrappedAsyncValueNested" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirg" id="4crIAbRC73_" role="3ZuirM">
        <node concept="3uibUv" id="4crIAbRC73A" role="3ZuirS">
          <ref role="3uigEE" to="p663:~TryFuture" resolve="TryFuture" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRC73B" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="4crIAbRC73C" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRC73D" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="4crIAbRC73E" role="3Zuir2">
          <node concept="10Oyi0" id="4crIAbRC73F" role="3ZuirS" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRC73G" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC73H" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC73I" role="3cqZAk">
            <property role="2O_Pu3" value="hHTENELp74/ASYNC" />
            <ref role="3nJRkH" node="6kis6yMCBkR" resolve="placeOrder" />
            <node concept="Z2fbc" id="4crIAbRC73K" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC73L" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC73B" resolve="product" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC73M" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC73D" resolve="quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC73W" role="3Zuirf">
      <property role="TrG5h" value="wrappedAsyncValueTopLevel" />
      <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
      <node concept="3Zuirg" id="4crIAbRC73X" role="3ZuirM">
        <node concept="3uibUv" id="4crIAbRC73Y" role="3ZuirS">
          <ref role="3uigEE" to="p663:~TryFuture" resolve="TryFuture" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRC73Z" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC740" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC741" role="3cqZAk">
            <property role="2O_Pu3" value="hHTENELp74/ASYNC" />
            <ref role="3nJRkH" node="4IOweXOYxgJ" resolve="topLevelProbe" />
            <node concept="Z2fbc" id="4crIAbRC743" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC74d" role="3Zuirf">
      <property role="TrG5h" value="wrappedAsyncVoidNestedControlled" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="4crIAbRC74e" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="4crIAbRC74f" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRC74g" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="4crIAbRC74h" role="3Zuir2">
          <node concept="10Oyi0" id="4crIAbRC74i" role="3ZuirS" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRC74j" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC7YI" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC7YJ" role="3cqZAk">
            <property role="2O_Pu3" value="hHTENELp74/ASYNC" />
            <ref role="3nJRkH" node="4crIAbRC71e" resolve="recordOrder" />
            <node concept="Z2fbc" id="4crIAbRC7YL" role="2O_Pu0">
              <ref role="Z2fbb" node="4crIAbRC74s" resolve="asyncControl" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC7YM" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC7YN" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC74e" resolve="product" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC7YO" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRC74g" resolve="quantity" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4crIAbRC74s" role="3ZuirO">
        <property role="TrG5h" value="asyncControl" />
        <node concept="3Zuirg" id="4crIAbRC74t" role="3ZuirT">
          <node concept="3uibUv" id="4crIAbRC74u" role="3ZuirS">
            <ref role="3uigEE" to="shd6:~AsyncControl" resolve="AsyncControl" />
          </node>
        </node>
      </node>
      <node concept="3Zuirg" id="4crIAbRC7YC" role="3ZuirM">
        <node concept="3uibUv" id="4crIAbRC7YD" role="3ZuirS">
          <ref role="3uigEE" to="p663:~TryFuture" resolve="TryFuture" />
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRC74C" role="3Zuirf">
      <property role="TrG5h" value="wrappedAsyncVoidTopLevelControlled" />
      <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
      <node concept="3clFbS" id="4crIAbRC74D" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRC7YY" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRC7YZ" role="3cqZAk">
            <property role="2O_Pu3" value="hHTENELp74/ASYNC" />
            <ref role="3nJRkH" node="4crIAbRC71E" resolve="topLevelVoidProbe" />
            <node concept="Z2fbc" id="4crIAbRC7Z1" role="2O_Pu0">
              <ref role="Z2fbb" node="4crIAbRC74K" resolve="asyncControl" />
            </node>
            <node concept="Z2fbc" id="4crIAbRC7Z2" role="3nJRkF">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4crIAbRC74K" role="3ZuirO">
        <property role="TrG5h" value="asyncControl" />
        <node concept="3Zuirg" id="4crIAbRC74L" role="3ZuirT">
          <node concept="3uibUv" id="4crIAbRC74M" role="3ZuirS">
            <ref role="3uigEE" to="shd6:~AsyncControl" resolve="AsyncControl" />
          </node>
        </node>
      </node>
      <node concept="3Zuirg" id="4crIAbRC7YE" role="3ZuirM">
        <node concept="3uibUv" id="4crIAbRC7YF" role="3ZuirS">
          <ref role="3uigEE" to="p663:~TryFuture" resolve="TryFuture" />
        </node>
      </node>
    </node>
    <node concept="3Zuirs" id="4crIAbRECfM" role="3Zuirf">
      <property role="TrG5h" value="mixedRawAndWrapped" />
      <property role="3ZuirN" value="7I39Hy4Yw1t/IDEMPOTENT" />
      <node concept="3Zuirt" id="4crIAbRECfN" role="3Zuir1">
        <property role="TrG5h" value="product" />
        <node concept="3Zuirv" id="4crIAbRECfO" role="3Zuir2">
          <ref role="3Zuir7" node="_$TiGuwUQ1" resolve="Product" />
        </node>
      </node>
      <node concept="3Zuirt" id="4crIAbRECfP" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3Zuirg" id="4crIAbRECfQ" role="3Zuir2">
          <node concept="10Oyi0" id="4crIAbRECfR" role="3ZuirS" />
        </node>
      </node>
      <node concept="3Zuirv" id="4crIAbRECfS" role="3ZuirM">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3clFbS" id="4crIAbRECfT" role="3ZuirL">
        <node concept="3cpWs6" id="4crIAbRECfU" role="3cqZAp">
          <node concept="2O_PuX" id="4crIAbRECfV" role="3cqZAk">
            <ref role="3nJRkH" node="6kis6yMCBkR" resolve="placeOrder" />
            <node concept="3nJRkD" id="4crIAbRECfX" role="3nJRkF">
              <ref role="3nJRkH" node="6kis6yMCBkR" resolve="placeOrder" />
              <node concept="Z2fbc" id="4crIAbRECfZ" role="3nJRkF">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="Z2fbc" id="4crIAbRECg0" role="3nJRkG">
                <ref role="Z2fbb" node="4crIAbRECfN" resolve="product" />
              </node>
              <node concept="Z2fbc" id="4crIAbRECg1" role="3nJRkG">
                <ref role="Z2fbb" node="4crIAbRECfP" resolve="quantity" />
              </node>
            </node>
            <node concept="Z2fbc" id="4crIAbRECg2" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRECfN" resolve="product" />
            </node>
            <node concept="Z2fbc" id="4crIAbRECg3" role="3nJRkG">
              <ref role="Z2fbb" node="4crIAbRECfP" resolve="quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2OZRif" id="4crIAbRVUk4" role="2OZRl$">
      <property role="TrG5h" value="recentCustomer" />
      <node concept="3Zuirv" id="4crIAbRVUk7" role="2OZRic">
        <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
      </node>
      <node concept="3clFbS" id="4crIAbRVUk8" role="2OZRid">
        <node concept="3clFbJ" id="4crIAbRVUkc" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRVUkf" role="3clFbw">
            <node concept="Z2fbc" id="4crIAbRVUki" role="3uHU7B">
              <ref role="Z2fbb" node="4crIAbRVUk9" resolve="orderService" />
            </node>
            <node concept="10Nm6u" id="4crIAbRVUkj" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRVUkk" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4crIAbRVUkl" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRVUko" role="3clFbw">
            <node concept="Z2fbc" id="4crIAbRVUkr" role="3uHU7B">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="10Nm6u" id="4crIAbRVUks" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRVUkt" role="3clFbx" />
        </node>
        <node concept="3cpWs6" id="4crIAbRVUku" role="3cqZAp">
          <node concept="Z2fbc" id="4crIAbRVUkv" role="3cqZAk">
            <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4crIAbRVUk9" role="2OZRii">
        <property role="TrG5h" value="orderService" />
        <node concept="3Zuirg" id="4crIAbRVUka" role="3ZuirT">
          <node concept="3uibUv" id="4crIAbRVUkb" role="3ZuirS">
            <ref role="3uigEE" to="22ox:~OrderService" resolve="OrderService" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="3Zuirq" id="_$TiGuwUQ1">
    <property role="TrG5h" value="Product" />
    <node concept="3Zuirr" id="_$TiGuwUQ2" role="3Zuire">
      <property role="TrG5h" value="name" />
      <node concept="3Zuirg" id="_$TiGuwUQ3" role="3Zuir0">
        <node concept="3uibUv" id="_$TiGuwUQ4" role="3ZuirS">
          <ref role="3uigEE" to="wyt6:~String" resolve="String" />
        </node>
      </node>
    </node>
    <node concept="3Zuirr" id="4Dp_93nKBTy" role="3Zuire">
      <property role="TrG5h" value="price" />
      <node concept="3Zuirg" id="4Dp_93nKC7O" role="3Zuir0">
        <node concept="10Oyi0" id="4Dp_93nKCaG" role="3ZuirS" />
      </node>
    </node>
  </node>
  <node concept="3Zuirp" id="_$TiGuwUR0">
    <property role="TrG5h" value="customers" />
  </node>
  <node concept="3Zuirs" id="4IOweXOYxgJ">
    <property role="TrG5h" value="topLevelProbe" />
    <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
    <ref role="3ZuirC" node="_$TiGuwUPX" resolve="Customer" />
    <node concept="3Zuirv" id="6kis6yMKJ9x" role="3ZuirM">
      <ref role="3Zuir7" node="_$TiGuwUPX" resolve="Customer" />
    </node>
    <node concept="3clFbS" id="6kis6yMKJ9y" role="3ZuirL">
      <node concept="3cpWs6" id="6kis6yMKJ9z" role="3cqZAp">
        <node concept="10Nm6u" id="6kis6yMKJIr" role="3cqZAk" />
      </node>
    </node>
  </node>
  <node concept="3Zuirs" id="4crIAbRC71E">
    <property role="TrG5h" value="topLevelVoidProbe" />
    <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
    <ref role="3ZuirC" node="_$TiGuwUPX" resolve="Customer" />
    <node concept="3clFbS" id="4crIAbRC71F" role="3ZuirL" />
  </node>
  <node concept="2OZRif" id="4crIAbRVUkA">
    <property role="TrG5h" value="externalLabel" />
    <ref role="2OZRij" node="_$TiGuwUPX" resolve="Customer" />
    <node concept="3Zuirg" id="4crIAbRVUkD" role="2OZRic">
      <node concept="3uibUv" id="4crIAbRVUkE" role="3ZuirS">
        <ref role="3uigEE" to="wyt6:~String" resolve="String" />
      </node>
    </node>
    <node concept="3clFbS" id="4crIAbRVUkF" role="2OZRid">
      <node concept="3cpWs6" id="4crIAbRVUkH" role="3cqZAp">
        <node concept="Xl_RD" id="4crIAbRVUkI" role="3cqZAk">
          <property role="Xl_RC" value="external" />
        </node>
      </node>
    </node>
  </node>
</model>

