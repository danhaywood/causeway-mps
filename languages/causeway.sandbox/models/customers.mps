<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
  </languages>
  <imports>
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
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
      <concept id="5455126814596559395" name="causeway.structure.ActionVariableReference" flags="ng" index="Z2fbc">
        <reference id="5455126814596559396" name="variable" index="Z2fbb" />
      </concept>
      <concept id="8900000000000000008" name="causeway.structure.JavaType" flags="ng" index="3Zuirg">
        <child id="8900000000000000032" name="javaType" index="3ZuirS" />
      </concept>
      <concept id="8900000000000000010" name="causeway.structure.InjectedService" flags="ng" index="3Zuiri" />
      <concept id="8900000000000000001" name="causeway.structure.Module" flags="ng" index="3Zuirp" />
      <concept id="8900000000000000002" name="causeway.structure.Entity" flags="ng" index="3Zuirq">
        <child id="8900000000000000022" name="properties" index="3Zuire" />
        <child id="8900000000000000023" name="actions" index="3Zuirf" />
      </concept>
      <concept id="8900000000000000003" name="causeway.structure.Property" flags="ng" index="3Zuirr">
        <child id="8900000000000000024" name="type" index="3Zuir0" />
      </concept>
      <concept id="8900000000000000004" name="causeway.structure.Action" flags="ng" index="3Zuirs">
        <property id="8900000000000000043" name="semantics" index="3ZuirN" />
        <child id="8900000000000000025" name="parameters" index="3Zuir1" />
        <child id="8900000000000000041" name="body" index="3ZuirL" />
        <child id="8900000000000000044" name="injectedServices" index="3ZuirO" />
        <child id="8900000000000000045" name="hide" index="3ZuirP" />
        <child id="8900000000000000047" name="validate" index="3ZuirR" />
      </concept>
      <concept id="8900000000000000005" name="causeway.structure.Parameter" flags="ng" index="3Zuirt">
        <child id="8900000000000000050" name="choices" index="3ZuirE" />
        <child id="8900000000000000052" name="validate" index="3ZuirG" />
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
        <node concept="3clFbS" id="4IOweXOKfC2" role="3ZuirE">
          <node concept="3clFbJ" id="4IOweXOKfC3" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfC6" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfC9" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCa" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCb" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfCc" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCf" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfCi" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCj" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCk" role="3clFbx" />
          </node>
        </node>
        <node concept="3clFbS" id="4IOweXOKfCl" role="3ZuirG">
          <node concept="3clFbJ" id="4IOweXOKfCm" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCp" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfCs" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCt" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCu" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfCv" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCy" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfC_" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCA" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCB" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfCC" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCF" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfCI" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCJ" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCK" role="3clFbx" />
          </node>
        </node>
      </node>
      <node concept="3Zuirt" id="4IOweXOJEa6" role="3Zuir1">
        <property role="TrG5h" value="quantity" />
        <node concept="3clFbS" id="4IOweXOKfCL" role="3ZuirE">
          <node concept="3clFbJ" id="4IOweXOKfCM" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCP" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfCS" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfCT" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfCU" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfCV" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfCY" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfD1" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfD2" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfD3" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfD4" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfD7" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfDa" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfDb" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfDc" role="3clFbx" />
          </node>
        </node>
        <node concept="3clFbS" id="4IOweXOKfDd" role="3ZuirG">
          <node concept="3clFbJ" id="4IOweXOKfDe" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfDh" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfDk" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfDl" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfDm" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfDn" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfDq" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfDt" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa6" resolve="quantity" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfDu" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfDv" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfDw" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfDz" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfDA" role="3uHU7B">
                <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfDB" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfDC" role="3clFbx" />
          </node>
          <node concept="3clFbJ" id="4IOweXOKfDD" role="3cqZAp">
            <node concept="3clFbC" id="4IOweXOKfDG" role="3clFbw">
              <node concept="Z2fbc" id="4IOweXOKfDJ" role="3uHU7B">
                <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
              </node>
              <node concept="10Nm6u" id="4IOweXOKfDK" role="3uHU7w" />
            </node>
            <node concept="3clFbS" id="4IOweXOKfDL" role="3clFbx" />
          </node>
        </node>
      </node>
      <node concept="3Zuiri" id="4IOweXOJEa7" role="3ZuirO">
        <property role="TrG5h" value="orderService" />
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
            <node concept="10Nm6u" id="4IOweXOKfDT" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfDU" role="3clFbx" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOKfBa" role="3ZuirP">
        <node concept="3clFbJ" id="4IOweXOKfBb" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBe" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfBh" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfBi" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfBj" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOKfBk" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBn" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfBq" role="3uHU7B">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfBr" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfBs" role="3clFbx" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOKfBt" role="3ZuirR">
        <node concept="3clFbJ" id="4IOweXOKfBu" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBx" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfB$" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa5" resolve="product" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfB_" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfBA" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOKfBB" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBE" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfBH" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa6" resolve="quantity" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfBI" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfBJ" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOKfBK" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBN" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfBQ" role="3uHU7B">
              <ref role="Z2fbb" node="4IOweXOJEa7" resolve="orderService" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfBR" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfBS" role="3clFbx" />
        </node>
        <node concept="3clFbJ" id="4IOweXOKfBT" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOKfBW" role="3clFbw">
            <node concept="Z2fbc" id="4IOweXOKfBZ" role="3uHU7B">
              <ref role="Z2fbb" node="_$TiGuwUPX" resolve="Customer" />
            </node>
            <node concept="10Nm6u" id="4IOweXOKfC0" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOKfC1" role="3clFbx" />
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
</model>

