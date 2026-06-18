<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2adc303c-3561-45fa-953b-45530ec39751(customers)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
  </languages>
  <imports>
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
    </language>
    <language id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway">
      <concept id="8900000000000000008" name="causeway.structure.JavaType" flags="ng" index="3Zuirg">
        <child id="8900000000000000032" name="javaType" index="3ZuirS" />
      </concept>
      <concept id="8900000000000000002" name="causeway.structure.Entity" flags="ng" index="3Zuirq">
        <child id="8900000000000000022" name="properties" index="3Zuire" />
      </concept>
      <concept id="8900000000000000003" name="causeway.structure.Property" flags="ng" index="3Zuirr">
        <child id="8900000000000000024" name="type" index="3Zuir0" />
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
  </node>
</model>

