<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:691ed17b-305d-4913-8f32-d71cf5f56b6e(causeway.generator.templates@generator)">
  <persistence version="9" />
  <languages>
    <use id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator" version="4" />
    <devkit ref="a2eb3a43-fcc2-4200-80dc-c60110c4862d(jetbrains.mps.devkit.templates)" />
  </languages>
  <imports>
    <import index="xj8n" ref="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.applib.annotation(causeway.stubs/)" />
    <import index="p99f" ref="c31c5f46-778f-4244-90d0-c92808fc2b16/java:jakarta.persistence(causeway.stubs/)" />
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1465982738277781862" name="jetbrains.mps.baseLanguage.structure.PlaceholderMember" flags="nn" index="2tJIrI" />
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
        <child id="1188214630783" name="value" index="2B76xF" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ngI" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
      </concept>
      <concept id="1188214545140" name="jetbrains.mps.baseLanguage.structure.AnnotationInstanceValue" flags="ng" index="2B6LJw">
        <reference id="1188214555875" name="key" index="2B6OnR" />
        <child id="1188214607812" name="value" index="2B70Vg" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1083260308424" name="jetbrains.mps.baseLanguage.structure.EnumConstantReference" flags="nn" index="Rm8GO">
        <reference id="1083260308426" name="enumConstantDeclaration" index="Rm8GQ" />
        <reference id="1144432896254" name="enumClass" index="1Px2BO" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1068390468200" name="jetbrains.mps.baseLanguage.structure.FieldDeclaration" flags="ig" index="312cEg" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
    </language>
    <language id="b401a680-8325-4110-8fd3-84331ff25bef" name="jetbrains.mps.lang.generator">
      <concept id="1095416546421" name="jetbrains.mps.lang.generator.structure.MappingConfiguration" flags="ig" index="bUwia">
        <child id="1167514678247" name="rootMappingRule" index="3lj3bC" />
      </concept>
      <concept id="1168619357332" name="jetbrains.mps.lang.generator.structure.RootTemplateAnnotation" flags="lg" index="n94m4">
        <reference id="1168619429071" name="applicableConcept" index="n9lRv" />
      </concept>
      <concept id="1167169188348" name="jetbrains.mps.lang.generator.structure.TemplateFunctionParameter_sourceNode" flags="nn" index="30H73N" />
      <concept id="1167169308231" name="jetbrains.mps.lang.generator.structure.BaseMappingRule" flags="ng" index="30H$t8">
        <reference id="1167169349424" name="applicableConcept" index="30HIoZ" />
      </concept>
      <concept id="1087833241328" name="jetbrains.mps.lang.generator.structure.PropertyMacro" flags="ln" index="17Uvod">
        <child id="1167756362303" name="propertyValueFunction" index="3zH0cK" />
      </concept>
      <concept id="1167514355419" name="jetbrains.mps.lang.generator.structure.Root_MappingRule" flags="lg" index="3lhOvk">
        <reference id="1167514355421" name="template" index="3lhOvi" />
      </concept>
      <concept id="1167756080639" name="jetbrains.mps.lang.generator.structure.PropertyMacro_GetPropertyValue" flags="in" index="3zFVjK" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="3364660638048049750" name="jetbrains.mps.lang.core.structure.PropertyAttribute" flags="ng" index="A9Btg">
        <property id="1757699476691236117" name="name_DebugInfo" index="2qtEX9" />
        <property id="1341860900487648621" name="propertyId" index="P4ACc" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
      <concept id="779128492853369165" name="jetbrains.mps.lang.core.structure.SideTransformInfo" flags="ng" index="1KehLL">
        <property id="779128492853934523" name="cellId" index="1K8rM7" />
        <property id="779128492853699361" name="side" index="1Kfyot" />
      </concept>
    </language>
  </registry>
  <node concept="bUwia" id="4eUqHDdy7EW">
    <property role="TrG5h" value="main" />
    <node concept="3lhOvk" id="_$TiGuwKgD" role="3lj3bC">
      <ref role="30HIoZ" to="k3bw:2" resolve="Entity" />
      <ref role="3lhOvi" node="_$TiGuwKgF" resolve="map_Entity" />
    </node>
  </node>
  <node concept="312cEu" id="_$TiGuwKgF">
    <property role="TrG5h" value="map_Entity" />
    <node concept="3Tm1VV" id="_$TiGuwKgG" role="1B3o_S" />
    <node concept="n94m4" id="_$TiGuwKgH" role="lGtFl">
      <ref role="n9lRv" to="k3bw:2" resolve="Entity" />
    </node>
    <node concept="17Uvod" id="_$TiGuwKgW" role="lGtFl">
      <property role="2qtEX9" value="name" />
      <property role="P4ACc" value="ceab5195-25ea-4f22-9b92-103b95ca8c0c/1169194658468/1169194664001" />
      <node concept="3zFVjK" id="_$TiGuwKgX" role="3zH0cK">
        <node concept="3clFbS" id="_$TiGuwKgY" role="2VODD2">
          <node concept="3clFbF" id="_$TiGuwKny" role="3cqZAp">
            <node concept="2OqwBi" id="_$TiGuwKDD" role="3clFbG">
              <node concept="30H73N" id="_$TiGuwKnx" role="2Oq$k0" />
              <node concept="3TrcHB" id="_$TiGuwKUA" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1shQjzjzwtu" role="jymVt" />
    <node concept="2tJIrI" id="1shQjzjzAy6" role="jymVt" />
    <node concept="1KehLL" id="1shQjzjzwuu" role="lGtFl">
      <property role="1K8rM7" value="classKeyword" />
      <property role="1Kfyot" value="Fg1jLUVyTf/left" />
    </node>
    <node concept="2AHcQZ" id="1shQjzjzwUD" role="2AJF6D">
      <ref role="2AI5Lk" to="xj8n:~DomainObject" resolve="DomainObject" />
      <node concept="2B6LJw" id="1shQjzjzx4d" role="2B76xF">
        <ref role="2B6OnR" to="xj8n:~DomainObject.nature()" resolve="nature" />
        <node concept="Rm8GO" id="1shQjzjzx8V" role="2B70Vg">
          <ref role="Rm8GQ" to="xj8n:~Nature.ENTITY" resolve="ENTITY" />
          <ref role="1Px2BO" to="xj8n:~Nature" resolve="Nature" />
        </node>
      </node>
      <node concept="2B6LJw" id="1shQjzjzx8W" role="2B76xF">
        <ref role="2B6OnR" to="xj8n:~DomainObject.introspection()" resolve="introspection" />
        <node concept="Rm8GO" id="1shQjzjzxcC" role="2B70Vg">
          <ref role="Rm8GQ" to="xj8n:~Introspection.ENCAPSULATION_ENABLED" resolve="ENCAPSULATION_ENABLED" />
          <ref role="1Px2BO" to="xj8n:~Introspection" resolve="Introspection" />
        </node>
      </node>
    </node>
    <node concept="2AHcQZ" id="1shQjzjz_d8" role="2AJF6D">
      <ref role="2AI5Lk" to="p99f:~Entity" resolve="Entity" />
    </node>
    <node concept="312cEg" id="1shQjzjzAp8" role="jymVt">
      <property role="TrG5h" value="id" />
      <node concept="3Tm6S6" id="1shQjzjzAnP" role="1B3o_S" />
      <node concept="3uibUv" id="1shQjzjzAoY" role="1tU5fm">
        <ref role="3uigEE" to="wyt6:~Long" resolve="Long" />
      </node>
      <node concept="2AHcQZ" id="1shQjzjzAJG" role="2AJF6D">
        <ref role="2AI5Lk" to="p99f:~Id" resolve="Id" />
      </node>
      <node concept="2AHcQZ" id="1shQjzjzAKi" role="2AJF6D">
        <ref role="2AI5Lk" to="p99f:~Column" resolve="Column" />
        <node concept="2B6LJw" id="1shQjzjzAL2" role="2B76xF">
          <ref role="2B6OnR" to="p99f:~Column.nullable()" resolve="nullable" />
          <node concept="3clFbT" id="1shQjzjzALT" role="2B70Vg" />
        </node>
        <node concept="2B6LJw" id="1shQjzjzALZ" role="2B76xF">
          <ref role="2B6OnR" to="p99f:~Column.name()" resolve="name" />
          <node concept="Xl_RD" id="1shQjzjzAMw" role="2B70Vg">
            <property role="Xl_RC" value="id" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2tJIrI" id="1shQjzjzAzf" role="jymVt" />
  </node>
</model>

