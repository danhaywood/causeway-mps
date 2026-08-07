<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a368ec60-55f1-4094-8a91-a029e7c7bd6b(recommendations)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
    <devkit ref="7c9b6f21-fd96-42ab-b49b-a290b97fc134(causeway.devkit)" />
  </languages>
  <imports>
    <import index="46v8" ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
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
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
    </language>
    <language id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway">
      <concept id="4835663559142270628" name="causeway.structure.Collection" flags="ng" index="2OS_N6">
        <reference id="4835663559142270632" name="target" index="2OS_Na" />
        <child id="4835663559142270630" name="body" index="2OS_N4" />
        <child id="4835663559142270631" name="injectedServices" index="2OS_N5" />
        <child id="4835663559142270629" name="elementType" index="2OS_N7" />
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
      <concept id="8900000000000000010" name="causeway.structure.InjectedService" flags="ng" index="3Zuiri">
        <child id="8900000000000000033" name="type" index="3ZuirT" />
      </concept>
      <concept id="8900000000000000004" name="causeway.structure.Action" flags="ng" index="3Zuirs">
        <property id="8900000000000000043" name="semantics" index="3ZuirN" />
        <reference id="8900000000000000048" name="target" index="3ZuirC" />
        <child id="8900000000000000041" name="body" index="3ZuirL" />
        <child id="8900000000000000042" name="returnType" index="3ZuirM" />
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
  <node concept="2OZRif" id="4crIAbRWzT3">
    <property role="TrG5h" value="recommendedCustomer" />
    <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
    <node concept="3Zuirv" id="4crIAbRW$x_" role="2OZRic">
      <ref role="3Zuir7" to="46v8:_$TiGuwUQ1" resolve="Product" />
    </node>
    <node concept="3clFbS" id="4crIAbRWzT8" role="2OZRid">
      <node concept="3cpWs6" id="4crIAbRWzT9" role="3cqZAp">
        <node concept="Z2fbc" id="4crIAbRW$xM" role="3cqZAk">
          <ref role="Z2fbb" node="4crIAbRW$x9" resolve="recommendedProduct" />
        </node>
      </node>
    </node>
    <node concept="3Zuiri" id="4crIAbRW$x9" role="2OZRii">
      <property role="TrG5h" value="recommendedProduct" />
      <node concept="3Zuirv" id="4crIAbRW$xa" role="3ZuirT">
        <ref role="3Zuir7" to="46v8:_$TiGuwUQ1" resolve="Product" />
      </node>
    </node>
  </node>
  <node concept="3Zuirs" id="4crIAbRW$WR">
    <property role="TrG5h" value="crossModelProbe" />
    <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
    <ref role="3ZuirC" to="46v8:_$TiGuwUPX" resolve="Customer" />
    <node concept="3Zuirv" id="4crIAbRW$WS" role="3ZuirM">
      <ref role="3Zuir7" to="46v8:_$TiGuwUPX" resolve="Customer" />
    </node>
    <node concept="3clFbS" id="4crIAbRW$WT" role="3ZuirL">
      <node concept="3cpWs6" id="4crIAbRW$WU" role="3cqZAp">
        <node concept="10Nm6u" id="4crIAbRW$WV" role="3cqZAk" />
      </node>
    </node>
  </node>
  <node concept="2OS_N6" id="4crIAbS1jVM">
    <property role="TrG5h" value="recommendedProducts" />
    <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
    <node concept="3Zuirv" id="4crIAbS1jVP" role="2OS_N7">
      <ref role="3Zuir7" to="46v8:_$TiGuwUQ1" resolve="Product" />
    </node>
    <node concept="3Zuiri" id="4crIAbS1jVQ" role="2OS_N5">
      <property role="TrG5h" value="recommendedProduct" />
      <node concept="3Zuirv" id="4crIAbS1jVR" role="3ZuirT">
        <ref role="3Zuir7" to="46v8:_$TiGuwUQ1" resolve="Product" />
      </node>
    </node>
    <node concept="3clFbS" id="4crIAbS1jVS" role="2OS_N4">
      <node concept="3cpWs8" id="4crIAbS1jWj" role="3cqZAp">
        <node concept="3cpWsn" id="4crIAbS1jWi" role="3cpWs9">
          <property role="TrG5h" value="result" />
          <node concept="3uibUv" id="4crIAbS1jWk" role="1tU5fm">
            <ref role="3uigEE" to="33ny:~List" resolve="java.util.List" />
          </node>
          <node concept="2ShNRf" id="4crIAbS1jWr" role="33vP2m">
            <node concept="1pGfFk" id="4crIAbS1jWw" role="2ShVmc">
              <ref role="37wK5l" to="33ny:~ArrayList.&lt;init&gt;()" resolve="ArrayList" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3clFbJ" id="4crIAbS4ztL" role="3cqZAp">
        <node concept="3y3z36" id="4crIAbS4ztO" role="3clFbw">
          <node concept="Z2fbc" id="4crIAbS4ztR" role="3uHU7B">
            <ref role="Z2fbb" node="4crIAbS1jVQ" resolve="recommendedProduct" />
          </node>
          <node concept="10Nm6u" id="4crIAbS4ztS" role="3uHU7w" />
        </node>
        <node concept="3clFbS" id="4crIAbS4ztT" role="3clFbx" />
      </node>
      <node concept="3cpWs6" id="4crIAbS1jWp" role="3cqZAp">
        <node concept="37vLTw" id="4crIAbS1jWq" role="3cqZAk">
          <ref role="3cqZAo" node="4crIAbS1jWi" resolve="result" />
        </node>
      </node>
    </node>
  </node>
</model>

