<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2ae94244-2c6e-4c34-9880-a02de19969ff(causeway.tests@tests)">
  <persistence version="9" />
  <languages>
    <use id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test" version="6" />
    <use id="f61473f9-130f-42f6-b98d-6c438812c2f6" name="jetbrains.mps.baseLanguage.unitTest" version="1" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
  </languages>
  <imports>
    <import index="46v8" ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
  </imports>
  <registry>
    <language id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test">
      <concept id="1215603922101" name="jetbrains.mps.lang.test.structure.NodeOperationsContainer" flags="ng" index="7CXmI">
        <child id="1215604436604" name="nodeOperations" index="7EUXB" />
      </concept>
      <concept id="7835233914436786109" name="jetbrains.mps.lang.test.structure.NodeUnknownErrorCheckOperation" flags="ng" index="mDk06" />
      <concept id="1216913645126" name="jetbrains.mps.lang.test.structure.NodesTestCase" flags="lg" index="1lH9Xt">
        <property id="2616911529524314943" name="accessMode" index="3DII0k" />
        <child id="1217501822150" name="nodesToCheck" index="1SKRRt" />
      </concept>
      <concept id="1216989428737" name="jetbrains.mps.lang.test.structure.TestNode" flags="ng" index="1qefOq">
        <child id="1216989461394" name="nodeToCheck" index="1qenE9" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
    </language>
    <language id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway">
      <concept id="4835663559140888301" name="causeway.structure.DerivedProperty" flags="ng" index="2OZRif">
        <reference id="4835663559140888305" name="target" index="2OZRij" />
        <child id="4835663559140888302" name="resultType" index="2OZRic" />
        <child id="4835663559140888303" name="body" index="2OZRid" />
      </concept>
      <concept id="8900000000000000008" name="causeway.structure.JavaType" flags="ng" index="3Zuirg">
        <child id="8900000000000000032" name="javaType" index="3ZuirS" />
      </concept>
      <concept id="8900000000000000002" name="causeway.structure.Entity" flags="ng" index="3Zuirq">
        <child id="4835663559140888326" name="derivedProperties" index="2OZRl$" />
        <child id="8900000000000000022" name="properties" index="3Zuire" />
      </concept>
      <concept id="8900000000000000003" name="causeway.structure.Property" flags="ng" index="3Zuirr">
        <child id="8900000000000000024" name="type" index="3Zuir0" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1156234966388" name="shortDescription" index="OYnhT" />
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1lH9Xt" id="4crIAbRT4kH">
    <property role="3DII0k" value="2hh8MJdVwqX/command" />
    <property role="TrG5h" value="WrappedActionInvocationNegativeCases" />
    <node concept="1qefOq" id="4crIAbRT4nJ" role="1SKRRt">
      <node concept="3Zuirs" id="4crIAbRT4nL" role="1qenE9">
        <property role="TrG5h" value="placeOrder" />
        <property role="3ZuirN" value="7I39Hy4Yw1s/SAFE" />
        <ref role="3ZuirC" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirv" id="4crIAbRT4nM" role="3ZuirM">
          <ref role="3Zuir7" to="46v8:_$TiGuwUPX" resolve="Customer" />
        </node>
        <node concept="3clFbS" id="4crIAbRT4nN" role="3ZuirL">
          <node concept="3cpWs6" id="4crIAbRT4nO" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbRT4nP" role="3cqZAk" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1lH9Xt" id="4crIAbRVUN5">
    <property role="3DII0k" value="2hh8MJdVwqX/command" />
    <property role="TrG5h" value="DerivedPropertyNegativeCases" />
    <node concept="1qefOq" id="4crIAbRVUNt" role="1SKRRt">
      <node concept="2OZRif" id="4crIAbRVUNv" role="1qenE9">
        <property role="TrG5h" value="missingTarget" />
        <node concept="3Zuirg" id="4crIAbRVUNy" role="2OZRic">
          <node concept="3uibUv" id="4crIAbRVUNz" role="3ZuirS">
            <ref role="3uigEE" to="wyt6:~String" resolve="String" />
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRVUN$" role="2OZRid">
          <node concept="3cpWs6" id="4crIAbRVUN_" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbRVUNA" role="3cqZAk" />
          </node>
        </node>
        <node concept="7CXmI" id="4crIAbRVUNB" role="lGtFl">
          <node concept="mDk06" id="4crIAbRVUNC" role="7EUXB" />
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWXP" role="1SKRRt">
      <node concept="2OZRif" id="4crIAbRVWXR" role="1qenE9">
        <property role="TrG5h" value="missingType" />
        <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3clFbS" id="4crIAbRVWXU" role="2OZRid">
          <node concept="3cpWs6" id="4crIAbRVWXV" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbRVWXW" role="3cqZAk" />
          </node>
        </node>
        <node concept="7CXmI" id="4crIAbRVWXX" role="lGtFl">
          <node concept="mDk06" id="4crIAbRVWXY" role="7EUXB" />
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWXZ" role="1SKRRt">
      <node concept="2OZRif" id="4crIAbRVWY1" role="1qenE9">
        <property role="TrG5h" value="voidResult" />
        <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirg" id="4crIAbRVWY4" role="2OZRic">
          <node concept="3cqZAl" id="4crIAbRVWY5" role="3ZuirS" />
        </node>
        <node concept="3clFbS" id="4crIAbRVWY6" role="2OZRid" />
        <node concept="7CXmI" id="4crIAbRVWY8" role="lGtFl">
          <node concept="mDk06" id="4crIAbRVWY9" role="7EUXB" />
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWYa" role="1SKRRt">
      <node concept="2OZRif" id="4crIAbRVWYc" role="1qenE9">
        <property role="TrG5h" value="incompatibleReturn" />
        <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirv" id="4crIAbRVWYf" role="2OZRic">
          <ref role="3Zuir7" to="46v8:_$TiGuwUPX" resolve="Customer" />
        </node>
        <node concept="3clFbS" id="4crIAbRVWYg" role="2OZRid">
          <node concept="3cpWs6" id="4crIAbRVWYh" role="3cqZAp">
            <node concept="3cmrfG" id="4crIAbRVWYi" role="3cqZAk">
              <property role="3cmrfH" value="1" />
              <node concept="7CXmI" id="4crIAbRWhxk" role="lGtFl">
                <node concept="mDk06" id="4crIAbRWhxl" role="7EUXB">
                  <property role="TrG5h" value="incompatibleReturn" />
                  <property role="OYnhT" value="incompatibleReturn" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWYl" role="1SKRRt">
      <node concept="3Zuirq" id="4crIAbRVWYn" role="1qenE9">
        <property role="TrG5h" value="InvalidPlacementEntity" />
        <node concept="2OZRif" id="4crIAbRVWYo" role="2OZRl$">
          <property role="TrG5h" value="nestedWithTarget" />
          <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
          <node concept="3Zuirg" id="4crIAbRVWYr" role="2OZRic">
            <node concept="3uibUv" id="4crIAbRVWYs" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVWYt" role="2OZRid">
            <node concept="3cpWs6" id="4crIAbRVWYu" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbRVWYv" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbRVWYw" role="lGtFl">
            <node concept="mDk06" id="4crIAbRVWYx" role="7EUXB" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWYy" role="1SKRRt">
      <node concept="3Zuirq" id="4crIAbRVWY$" role="1qenE9">
        <property role="TrG5h" value="DuplicatePropertyEntity" />
        <node concept="3Zuirr" id="4crIAbRVWY_" role="3Zuire">
          <property role="TrG5h" value="name" />
          <node concept="3Zuirg" id="4crIAbRVWYA" role="3Zuir0">
            <node concept="3uibUv" id="4crIAbRVWYB" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
        </node>
        <node concept="2OZRif" id="4crIAbRVWYC" role="2OZRl$">
          <property role="TrG5h" value="name" />
          <node concept="3Zuirg" id="4crIAbRVWYF" role="2OZRic">
            <node concept="3uibUv" id="4crIAbRVWYG" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVWYH" role="2OZRid">
            <node concept="3cpWs6" id="4crIAbRVWYI" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbRVWYJ" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbRVWYK" role="lGtFl">
            <node concept="mDk06" id="4crIAbRVWYL" role="7EUXB" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbRVWYM" role="1SKRRt">
      <node concept="3Zuirq" id="4crIAbRVWYO" role="1qenE9">
        <property role="TrG5h" value="DuplicateDerivedEntity" />
        <node concept="2OZRif" id="4crIAbRVWYP" role="2OZRl$">
          <property role="TrG5h" value="duplicateDerived" />
          <node concept="3Zuirg" id="4crIAbRVWYS" role="2OZRic">
            <node concept="3uibUv" id="4crIAbRVWYT" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVWYU" role="2OZRid">
            <node concept="3cpWs6" id="4crIAbRVWYV" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbRVWYW" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbRVWYX" role="lGtFl">
            <node concept="mDk06" id="4crIAbRVWYY" role="7EUXB" />
          </node>
        </node>
        <node concept="2OZRif" id="4crIAbRVWYZ" role="2OZRl$">
          <property role="TrG5h" value="duplicateDerived" />
          <node concept="3Zuirg" id="4crIAbRVWZ2" role="2OZRic">
            <node concept="3uibUv" id="4crIAbRVWZ3" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVWZ4" role="2OZRid">
            <node concept="3cpWs6" id="4crIAbRVWZ5" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbRVWZ6" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbRVWZ7" role="lGtFl">
            <node concept="mDk06" id="4crIAbRVWZ8" role="7EUXB" />
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

