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
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="8r06" ref="r:a368ec60-55f1-4094-8a91-a029e7c7bd6b(recommendations)" />
  </imports>
  <registry>
    <language id="8585453e-6bfb-4d80-98de-b16074f1d86c" name="jetbrains.mps.lang.test">
      <concept id="1215603922101" name="jetbrains.mps.lang.test.structure.NodeOperationsContainer" flags="ng" index="7CXmI">
        <child id="1215604436604" name="nodeOperations" index="7EUXB" />
      </concept>
      <concept id="7835233914436786109" name="jetbrains.mps.lang.test.structure.NodeUnknownErrorCheckOperation" flags="ng" index="mDk06" />
      <concept id="511191073233700873" name="jetbrains.mps.lang.test.structure.ScopesTest" flags="ng" index="2rqxmr">
        <reference id="5449224527592117654" name="checkingReference" index="1BTHP0" />
        <child id="3655334166513314307" name="nodes" index="3KTr4d" />
      </concept>
      <concept id="1216913645126" name="jetbrains.mps.lang.test.structure.NodesTestCase" flags="lg" index="1lH9Xt">
        <property id="2616911529524314943" name="accessMode" index="3DII0k" />
        <child id="1217501822150" name="nodesToCheck" index="1SKRRt" />
      </concept>
      <concept id="1216989428737" name="jetbrains.mps.lang.test.structure.TestNode" flags="ng" index="1qefOq">
        <child id="1216989461394" name="nodeToCheck" index="1qenE9" />
      </concept>
      <concept id="3655334166513314291" name="jetbrains.mps.lang.test.structure.ScopesExpectedNode" flags="ng" index="3KTrbX">
        <reference id="4052780437578824735" name="ref" index="3AHY9a" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1513279640923991009" name="jetbrains.mps.baseLanguage.structure.IGenericClassCreator" flags="ngI" index="366HgL">
        <property id="1513279640906337053" name="inferTypeParams" index="373rjd" />
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
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
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
        <child id="4835663559142270629" name="elementType" index="2OS_N7" />
      </concept>
      <concept id="4835663559140888301" name="causeway.structure.DerivedProperty" flags="ng" index="2OZRif">
        <reference id="4835663559140888305" name="target" index="2OZRij" />
        <child id="4835663559140888302" name="resultType" index="2OZRic" />
        <child id="4835663559140888303" name="body" index="2OZRid" />
      </concept>
      <concept id="5455126814596559395" name="causeway.structure.ActionVariableReference" flags="ng" index="Z2fbc">
        <reference id="5455126814596559396" name="variable" index="Z2fbb" />
      </concept>
      <concept id="8900000000000000008" name="causeway.structure.JavaType" flags="ng" index="3Zuirg">
        <child id="8900000000000000032" name="javaType" index="3ZuirS" />
      </concept>
      <concept id="8900000000000000002" name="causeway.structure.Entity" flags="ng" index="3Zuirq">
        <child id="4835663559142270667" name="collections" index="2OS_MD" />
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
      <concept id="1196978630214" name="jetbrains.mps.lang.core.structure.IResolveInfo" flags="ngI" index="2Lv6Xg">
        <property id="1196978656277" name="resolveInfo" index="2Lvdk3" />
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
    <node concept="1qefOq" id="4crIAbRW_cg" role="1SKRRt">
      <node concept="2OZRif" id="4crIAbRW_ci" role="1qenE9">
        <property role="TrG5h" value="name" />
        <ref role="2OZRij" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirg" id="4crIAbRW_cl" role="2OZRic">
          <node concept="3uibUv" id="4crIAbRW_cm" role="3ZuirS">
            <ref role="3uigEE" to="wyt6:~String" resolve="String" />
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRW_cn" role="2OZRid">
          <node concept="3cpWs6" id="4crIAbRW_co" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbRW_cp" role="3cqZAk" />
          </node>
        </node>
        <node concept="7CXmI" id="4crIAbRW_cq" role="lGtFl">
          <node concept="mDk06" id="4crIAbRW_cr" role="7EUXB">
            <property role="TrG5h" value="crossModelIdentity" />
            <property role="OYnhT" value="crossModelIdentity" />
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1lH9Xt" id="4crIAbS2a_x">
    <property role="3DII0k" value="2hh8MJdVwqX/command" />
    <property role="TrG5h" value="CollectionNegativeCases" />
    <node concept="1qefOq" id="4crIAbS2a_y" role="1SKRRt">
      <node concept="2OS_N6" id="4crIAbS2a_$" role="1qenE9">
        <property role="TrG5h" value="missingTarget" />
        <node concept="3Zuirg" id="4crIAbS2a_B" role="2OS_N7">
          <node concept="3uibUv" id="4crIAbS2a_C" role="3ZuirS">
            <ref role="3uigEE" to="wyt6:~String" resolve="String" />
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbS2a_D" role="2OS_N4">
          <node concept="3cpWs6" id="4crIAbS2a_E" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbS2a_F" role="3cqZAk" />
          </node>
        </node>
        <node concept="7CXmI" id="4crIAbS2a_G" role="lGtFl">
          <node concept="mDk06" id="4crIAbS2a_H" role="7EUXB">
            <property role="TrG5h" value="" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2a_I" role="1SKRRt">
      <node concept="2OS_N6" id="4crIAbS2a_K" role="1qenE9">
        <property role="TrG5h" value="missingElementType" />
        <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3clFbS" id="4crIAbS2a_N" role="2OS_N4">
          <node concept="3cpWs6" id="4crIAbS2a_O" role="3cqZAp">
            <node concept="10Nm6u" id="4crIAbS2a_P" role="3cqZAk" />
          </node>
        </node>
        <node concept="7CXmI" id="4crIAbS2a_Q" role="lGtFl">
          <node concept="mDk06" id="4crIAbS2a_R" role="7EUXB">
            <property role="TrG5h" value="" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2a_S" role="1SKRRt">
      <node concept="2OS_N6" id="4crIAbS2a_U" role="1qenE9">
        <property role="TrG5h" value="primitiveElementType" />
        <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirg" id="4crIAbS2a_X" role="2OS_N7">
          <node concept="10Oyi0" id="4crIAbS2a_Y" role="3ZuirS" />
        </node>
        <node concept="3clFbS" id="4crIAbS2a_Z" role="2OS_N4" />
        <node concept="7CXmI" id="4crIAbS2aA0" role="lGtFl">
          <node concept="mDk06" id="4crIAbS2aA1" role="7EUXB">
            <property role="TrG5h" value="" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2aA2" role="1SKRRt">
      <node concept="2OS_N6" id="4crIAbS2aA4" role="1qenE9">
        <property role="TrG5h" value="incompatibleReturn" />
        <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirv" id="4crIAbS2aA7" role="2OS_N7">
          <ref role="3Zuir7" to="46v8:_$TiGuwUPX" resolve="Customer" />
        </node>
        <node concept="3clFbS" id="4crIAbS2aA8" role="2OS_N4">
          <node concept="3cpWs6" id="4crIAbS2aA9" role="3cqZAp">
            <node concept="3cmrfG" id="4crIAbS2aAa" role="3cqZAk">
              <property role="3cmrfH" value="1" />
              <node concept="7CXmI" id="4crIAbS2aAb" role="lGtFl">
                <node concept="mDk06" id="4crIAbS2aAc" role="7EUXB">
                  <property role="TrG5h" value="incompatibleReturn" />
                  <property role="OYnhT" value="incompatibleReturn" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2aAd" role="1SKRRt">
      <node concept="3Zuirq" id="4crIAbS2aAf" role="1qenE9">
        <property role="TrG5h" value="InvalidPlacementEntity" />
        <node concept="2OS_N6" id="4crIAbS2aAg" role="2OS_MD">
          <property role="TrG5h" value="nestedWithTarget" />
          <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
          <node concept="3Zuirg" id="4crIAbS2aAj" role="2OS_N7">
            <node concept="3uibUv" id="4crIAbS2aAk" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbS2aAl" role="2OS_N4">
            <node concept="3cpWs6" id="4crIAbS2aAm" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbS2aAn" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbS2aAo" role="lGtFl">
            <node concept="mDk06" id="4crIAbS2aAp" role="7EUXB">
              <property role="TrG5h" value="" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2aAq" role="1SKRRt">
      <node concept="3Zuirq" id="4crIAbS2aAs" role="1qenE9">
        <property role="TrG5h" value="DuplicateCollectionEntity" />
        <node concept="2OS_N6" id="4crIAbS2aAt" role="2OS_MD">
          <property role="TrG5h" value="duplicateCollection" />
          <node concept="3Zuirg" id="4crIAbS2aAw" role="2OS_N7">
            <node concept="3uibUv" id="4crIAbS2aAx" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbS2aAy" role="2OS_N4">
            <node concept="3cpWs6" id="4crIAbS2aAz" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbS2aA$" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbS2aA_" role="lGtFl">
            <node concept="mDk06" id="4crIAbS2aAA" role="7EUXB">
              <property role="TrG5h" value="" />
            </node>
          </node>
        </node>
        <node concept="2OS_N6" id="4crIAbS2aAB" role="2OS_MD">
          <property role="TrG5h" value="duplicateCollection" />
          <node concept="3Zuirg" id="4crIAbS2aAE" role="2OS_N7">
            <node concept="3uibUv" id="4crIAbS2aAF" role="3ZuirS">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbS2aAG" role="2OS_N4">
            <node concept="3cpWs6" id="4crIAbS2aAH" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbS2aAI" role="3cqZAk" />
            </node>
          </node>
          <node concept="7CXmI" id="4crIAbS2aAJ" role="lGtFl">
            <node concept="mDk06" id="4crIAbS2aAK" role="7EUXB">
              <property role="TrG5h" value="" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1qefOq" id="4crIAbS2aAL" role="1SKRRt">
      <node concept="2OS_N6" id="4crIAbS2aAN" role="1qenE9">
        <property role="TrG5h" value="outOfScopeParameter" />
        <ref role="2OS_Na" to="46v8:_$TiGuwUPX" resolve="Customer" />
        <node concept="3Zuirg" id="4crIAbS2aAQ" role="2OS_N7">
          <node concept="3uibUv" id="4crIAbS2aAR" role="3ZuirS">
            <ref role="3uigEE" to="wyt6:~String" resolve="String" />
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbS2aAS" role="2OS_N4">
          <node concept="3cpWs8" id="4crIAbS2aAT" role="3cqZAp">
            <node concept="3cpWsn" id="4crIAbS2aAW" role="3cpWs9">
              <property role="TrG5h" value="result" />
              <property role="OYnhT" value="local variable" />
              <property role="2Lvdk3" value="result" />
              <node concept="2ShNRf" id="4crIAbS2aAY" role="33vP2m">
                <node concept="1pGfFk" id="4crIAbS2aB0" role="2ShVmc">
                  <property role="373rjd" value="true" />
                  <ref role="37wK5l" to="33ny:~ArrayList.&lt;init&gt;()" resolve="ArrayList" />
                </node>
              </node>
              <node concept="3uibUv" id="4crIAbS2aB1" role="1tU5fm">
                <ref role="3uigEE" to="33ny:~List" resolve="List" />
              </node>
            </node>
          </node>
          <node concept="3clFbJ" id="4crIAbS4Vh_" role="3cqZAp">
            <node concept="3y3z36" id="4crIAbS4VhC" role="3clFbw">
              <node concept="Z2fbc" id="4crIAbS4VhF" role="3uHU7B">
                <ref role="Z2fbb" to="46v8:_$TiGuwUPX" resolve="Customer" />
                <node concept="2rqxmr" id="4crIAbS4VhG" role="lGtFl">
                  <ref role="1BTHP0" to="46v8:_$TiGuwUPX" resolve="Customer" />
                  <node concept="3KTrbX" id="4crIAbS4VhH" role="3KTr4d">
                    <ref role="3AHY9a" to="46v8:_$TiGuwUPX" resolve="Customer" />
                  </node>
                </node>
              </node>
              <node concept="10Nm6u" id="4crIAbS4VhI" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4crIAbS4VhJ" role="3clFbx" />
          </node>
          <node concept="3cpWs6" id="4crIAbS2aBc" role="3cqZAp">
            <node concept="37vLTw" id="4crIAbS2aBd" role="3cqZAk">
              <ref role="3cqZAo" node="4crIAbS2aAW" resolve="result" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

