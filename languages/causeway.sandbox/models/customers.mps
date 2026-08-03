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
      <concept id="5455126814597722999" name="causeway.structure.LifecycleBlock" flags="ng" index="ZuFeo">
        <child id="5455126814597799728" name="body" index="ZuXZv" />
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
                <node concept="10Nm6u" id="4IOweXONVtJ" role="3uHU7w" />
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
              <node concept="10Nm6u" id="4IOweXOOkKc" role="3uHU7w" />
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

