<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a368ec60-55f1-4094-8a91-a029e7c7bd6b(recommendations)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <devkit ref="7c9b6f21-fd96-42ab-b49b-a290b97fc134(causeway.devkit)" />
  </languages>
  <imports>
    <import index="46v8" ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
    </language>
    <language id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway">
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
</model>

