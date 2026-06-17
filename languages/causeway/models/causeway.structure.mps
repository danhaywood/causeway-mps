<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="3348158742936976480" name="jetbrains.mps.lang.structure.structure.EnumerationMemberDeclaration" flags="ng" index="25R33">
        <property id="1421157252384165432" name="memberId" index="3tVfz5" />
      </concept>
      <concept id="3348158742936976479" name="jetbrains.mps.lang.structure.structure.EnumerationDeclaration" flags="ng" index="25R3W">
        <child id="3348158742936976577" name="members" index="25R1y" />
      </concept>
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ" />
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="1">
    <property role="EcuMT" value="8900000000000000001" />
    <property role="TrG5h" value="Module" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="11" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="21" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000021" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="entities" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="2" resolve="Entity" />
    </node>
  </node>
  <node concept="1TIwiD" id="2">
    <property role="EcuMT" value="8900000000000000002" />
    <property role="TrG5h" value="Entity" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="12" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="22" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000022" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="properties" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="3" resolve="Property" />
    </node>
    <node concept="1TJgyj" id="23" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000023" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="actions" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4" resolve="Action" />
    </node>
  </node>
  <node concept="1TIwiD" id="3">
    <property role="EcuMT" value="8900000000000000003" />
    <property role="TrG5h" value="Property" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="13" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="24" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000024" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
  </node>
  <node concept="1TIwiD" id="4">
    <property role="EcuMT" value="8900000000000000004" />
    <property role="TrG5h" value="Action" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="14" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="25" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000025" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="parameters" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="5" resolve="Parameter" />
    </node>
    <node concept="1TJgyj" id="42" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000042" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="returnType" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="41" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000041" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="body" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
    <node concept="1TJgyj" id="44" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000044" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="injectedServices" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="10" resolve="InjectedService" />
    </node>
    <node concept="1TJgyi" id="43" role="1TKVEl">
      <property role="IQ2nx" value="8900000000000000043" />
      <property role="TrG5h" value="semantics" />
      <ref role="AX2Wp" node="9" resolve="SemanticsOf" />
    </node>
  </node>
  <node concept="1TIwiD" id="5">
    <property role="EcuMT" value="8900000000000000005" />
    <property role="TrG5h" value="Parameter" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="15" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="26" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000026" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
  </node>
  <node concept="1TIwiD" id="10">
    <property role="EcuMT" value="8900000000000000010" />
    <property role="TrG5h" value="InjectedService" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="19" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="1TJgyj" id="33" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000033" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="type" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
  </node>
  <node concept="PlHQZ" id="6">
    <property role="EcuMT" value="8900000000000000006" />
    <property role="TrG5h" value="Type" />
  </node>
  <node concept="1TIwiD" id="7">
    <property role="EcuMT" value="8900000000000000007" />
    <property role="TrG5h" value="EntityType" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="17" role="PzmwI">
      <ref role="PrY4T" node="6" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="31" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000031" />
      <property role="20kJfa" value="entity" />
      <ref role="20lvS9" node="2" resolve="Entity" />
    </node>
  </node>
  <node concept="1TIwiD" id="8">
    <property role="EcuMT" value="8900000000000000008" />
    <property role="TrG5h" value="JavaType" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="18" role="PzmwI">
      <ref role="PrY4T" node="6" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="32" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000032" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="javaType" />
      <ref role="20lvS9" to="tpee:fz3vP1H" resolve="Type" />
    </node>
  </node>
  <node concept="25R3W" id="9">
    <property role="3F6X1D" value="8900000000000000009" />
    <property role="TrG5h" value="SemanticsOf" />
    <node concept="25R33" id="91" role="25R1y">
      <property role="3tVfz5" value="8900000000000000091" />
      <property role="TrG5h" value="SAFE_AND_REQUEST_CACHEABLE" />
    </node>
    <node concept="25R33" id="92" role="25R1y">
      <property role="3tVfz5" value="8900000000000000092" />
      <property role="TrG5h" value="SAFE" />
    </node>
    <node concept="25R33" id="93" role="25R1y">
      <property role="3tVfz5" value="8900000000000000093" />
      <property role="TrG5h" value="IDEMPOTENT" />
    </node>
    <node concept="25R33" id="94" role="25R1y">
      <property role="3tVfz5" value="8900000000000000094" />
      <property role="TrG5h" value="IDEMPOTENT_ARE_YOU_SURE" />
    </node>
    <node concept="25R33" id="95" role="25R1y">
      <property role="3tVfz5" value="8900000000000000095" />
      <property role="TrG5h" value="NON_IDEMPOTENT" />
    </node>
    <node concept="25R33" id="96" role="25R1y">
      <property role="3tVfz5" value="8900000000000000096" />
      <property role="TrG5h" value="NON_IDEMPOTENT_ARE_YOU_SURE" />
    </node>
  </node>
</model>

