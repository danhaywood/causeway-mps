<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)">
  <persistence version="9" />
  <languages>
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="3348158742936976480" name="jetbrains.mps.lang.structure.structure.EnumerationMemberDeclaration" flags="ng" index="25R33">
        <property id="1421157252384165432" name="memberId" index="3tVfz5" />
        <property id="672037151186491528" name="presentation" index="1L1pqM" />
      </concept>
      <concept id="3348158742936976479" name="jetbrains.mps.lang.structure.structure.EnumerationDeclaration" flags="ng" index="25R3W">
        <reference id="1075010451642646892" name="defaultMember" index="1H5jkz" />
        <child id="3348158742936976577" name="members" index="25R1y" />
      </concept>
      <concept id="7862711839422615209" name="jetbrains.mps.lang.structure.structure.DocumentedNodeAnnotation" flags="ng" index="t5JxF">
        <property id="7862711839422615217" name="text" index="t5JxN" />
      </concept>
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765907488" name="conceptShortDescription" index="R4oN_" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
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
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
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
    <node concept="1TJgyi" id="6kis6yMDDAU" role="1TKVEl">
      <property role="IQ2nx" value="8900000000000000020" />
      <property role="TrG5h" value="logicalTypeNamePrefix" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
    <node concept="1TJgyi" id="6kis6yMDDAZ" role="1TKVEl">
      <property role="IQ2nx" value="8900000000000000021" />
      <property role="TrG5h" value="schema" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
    </node>
  </node>
  <node concept="1TIwiD" id="2">
    <property role="EcuMT" value="8900000000000000002" />
    <property role="TrG5h" value="Entity" />
    <property role="19KtqR" value="true" />
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
    <node concept="PrWs8" id="4IOweXOJ78F" role="PzmwI">
      <ref role="PrY4T" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
    </node>
    <node concept="1TJgyj" id="4crIAbRTcW6" role="1TKVEi">
      <property role="IQ2ns" value="4835663559140888326" />
      <property role="20kJfa" value="derivedProperties" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4crIAbRTcVH" resolve="DerivedProperty" />
    </node>
    <node concept="1TJgyj" id="4crIAbRYurb" role="1TKVEi">
      <property role="IQ2ns" value="4835663559142270667" />
      <property role="20kJfa" value="collections" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="4crIAbRYuq$" resolve="Collection" />
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
    <property role="19KtqR" value="true" />
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
    <node concept="1TJgyj" id="45" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000045" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="hide" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="46" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000046" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="disable" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="47" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000047" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="validate" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="48" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000048" />
      <property role="20kJfa" value="target" />
      <ref role="20lvS9" node="2" resolve="Entity" />
    </node>
    <node concept="1TJgyi" id="43" role="1TKVEl">
      <property role="IQ2nx" value="8900000000000000043" />
      <property role="TrG5h" value="semantics" />
      <ref role="AX2Wp" node="9" resolve="SemanticsOf" />
    </node>
    <node concept="PrWs8" id="4IOweXOJpnz" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
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
    <node concept="1TJgyj" id="50" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000050" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="choices" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="51" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000051" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="default" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="52" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000052" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="validate" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="53" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000053" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="autoComplete" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="54" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000054" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="hide" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="1TJgyj" id="55" role="1TKVEi">
      <property role="IQ2ns" value="8900000000000000055" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="disable" />
      <ref role="20lvS9" node="4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="PrWs8" id="4IOweXOJ78L" role="PzmwI">
      <ref role="PrY4T" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
    </node>
    <node concept="PrWs8" id="4IOweXOKzPE" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
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
    <node concept="PrWs8" id="4IOweXOJ78I" role="PzmwI">
      <ref role="PrY4T" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
    </node>
  </node>
  <node concept="PlHQZ" id="6">
    <property role="EcuMT" value="8900000000000000006" />
    <property role="TrG5h" value="Type" />
  </node>
  <node concept="1TIwiD" id="7">
    <property role="EcuMT" value="8900000000000000007" />
    <property role="TrG5h" value="EntityType" />
    <ref role="1TJDcQ" to="tpee:fz3vP1H" />
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
  <node concept="1TIwiD" id="4IOweXOJ78z">
    <property role="EcuMT" value="5455126814596559395" />
    <property role="TrG5h" value="ActionVariableReference" />
    <property role="R4oN_" value="Reference to an action parameter, mixee, or injected service visible in the current action block." />
    <property role="3GE5qa" value="actions" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="1TJgyj" id="4IOweXOJ78$" role="1TKVEi">
      <property role="IQ2ns" value="5455126814596559396" />
      <property role="20kJfa" value="variable" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:4H$HgYMZ7sw" resolve="IVariableDeclaration" />
    </node>
    <node concept="PrWs8" id="4IOweXOJ78_" role="PzmwI">
      <ref role="PrY4T" to="tpee:SORzhOp6jM" resolve="IVariableReference" />
    </node>
  </node>
  <node concept="1TIwiD" id="4IOweXONzdR">
    <property role="EcuMT" value="5455126814597722999" />
    <property role="TrG5h" value="LifecycleBlock" />
    <property role="R4oN_" value="typed action lifecycle block" />
    <property role="3GE5qa" value="action" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="t5JxF" id="4IOweXONzdS" role="lGtFl">
      <property role="t5JxN" value="An embedded BaseLanguage block whose expected return type is derived from its action or parameter role." />
    </node>
    <node concept="PrWs8" id="4IOweXONzdT" role="PzmwI">
      <ref role="PrY4T" to="tpee:i2fhoOR" resolve="IMethodLike" />
    </node>
    <node concept="1TJgyj" id="4IOweXONPWK" role="1TKVEi">
      <property role="IQ2ns" value="5455126814597799728" />
      <property role="20kJfa" value="body" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
  </node>
  <node concept="1TIwiD" id="6kis6yMFgl1">
    <property role="EcuMT" value="7283007142388106561" />
    <property role="TrG5h" value="ActionInvocation" />
    <property role="34LRSv" value="action invocation" />
    <property role="R4oN_" value="Invokes a DSL action transparently on an entity expression." />
    <property role="3GE5qa" value="behavior" />
    <ref role="1TJDcQ" to="tpee:fz3vP1J" resolve="Expression" />
    <node concept="t5JxF" id="6kis6yMFgl2" role="lGtFl">
      <property role="t5JxN" value="References a nested or explicit-target Action and generates Causeway FactoryService mixin invocation plumbing." />
    </node>
    <node concept="1TJgyj" id="6kis6yMFgl3" role="1TKVEi">
      <property role="IQ2ns" value="7283007142388106563" />
      <property role="20kJfa" value="target" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="6kis6yMFgl4" role="1TKVEi">
      <property role="IQ2ns" value="7283007142388106564" />
      <property role="20kJfa" value="arguments" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
    <node concept="1TJgyj" id="6kis6yMFgl5" role="1TKVEi">
      <property role="IQ2ns" value="7283007142388106565" />
      <property role="20kJfa" value="action" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="4" resolve="Action" />
    </node>
  </node>
  <node concept="25R3W" id="4crIAbRzeRl">
    <property role="3F6X1D" value="4835663559135129045" />
    <property role="TrG5h" value="WrappedInvocationMode" />
    <ref role="1H5jkz" node="4crIAbRzeRn" resolve="SYNC" />
    <node concept="25R33" id="4crIAbRzeRn" role="25R1y">
      <property role="3tVfz5" value="6066639903038245635" />
      <property role="TrG5h" value="SYNC" />
      <property role="1L1pqM" value="wrap" />
    </node>
    <node concept="25R33" id="4crIAbRzeRo" role="25R1y">
      <property role="3tVfz5" value="319164778960753092" />
      <property role="TrG5h" value="ASYNC" />
      <property role="1L1pqM" value="asyncWrap" />
    </node>
  </node>
  <node concept="1TIwiD" id="4crIAbRzeRv">
    <property role="EcuMT" value="4835663559135129055" />
    <property role="TrG5h" value="WrappedActionInvocation" />
    <property role="R4oN_" value="Invokes a DSL action through Causeway WrapperFactory" />
    <ref role="1TJDcQ" node="6kis6yMFgl1" resolve="ActionInvocation" />
    <node concept="t5JxF" id="4crIAbRzeRw" role="lGtFl">
      <property role="t5JxN" value="Explicit synchronous or asynchronous Causeway wrapper dispatch for a DSL-defined action." />
    </node>
    <node concept="1TJgyi" id="4crIAbRzeRx" role="1TKVEl">
      <property role="IQ2nx" value="4835663559135129057" />
      <property role="TrG5h" value="mode" />
      <ref role="AX2Wp" node="4crIAbRzeRl" resolve="WrappedInvocationMode" />
    </node>
    <node concept="1TJgyj" id="4crIAbRzeRy" role="1TKVEi">
      <property role="IQ2ns" value="4835663559135129058" />
      <property role="20kJfa" value="control" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <ref role="20lvS9" to="tpee:fz3vP1J" resolve="Expression" />
    </node>
  </node>
  <node concept="1TIwiD" id="4crIAbRTcVH">
    <property role="EcuMT" value="4835663559140888301" />
    <property role="TrG5h" value="DerivedProperty" />
    <property role="34LRSv" value="derived property" />
    <property role="R4oN_" value="Calculated scalar property contributed to an entity" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="4crIAbRTcVI" role="1TKVEi">
      <property role="IQ2ns" value="4835663559140888302" />
      <property role="20kJfa" value="resultType" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="4crIAbRTcVJ" role="1TKVEi">
      <property role="IQ2ns" value="4835663559140888303" />
      <property role="20kJfa" value="body" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
    <node concept="1TJgyj" id="4crIAbRTcVK" role="1TKVEi">
      <property role="IQ2ns" value="4835663559140888304" />
      <property role="20kJfa" value="injectedServices" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="10" resolve="InjectedService" />
    </node>
    <node concept="1TJgyj" id="4crIAbRTcVL" role="1TKVEi">
      <property role="IQ2ns" value="4835663559140888305" />
      <property role="20kJfa" value="target" />
      <ref role="20lvS9" node="2" resolve="Entity" />
    </node>
    <node concept="PrWs8" id="4crIAbRTcVM" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="PrWs8" id="4crIAbRTcVN" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
    </node>
    <node concept="PrWs8" id="4crIAbRTxTH" role="PzmwI">
      <ref role="PrY4T" to="tpee:i2fhoOR" resolve="IMethodLike" />
    </node>
  </node>
  <node concept="1TIwiD" id="4crIAbRYuq$">
    <property role="EcuMT" value="4835663559142270628" />
    <property role="TrG5h" value="Collection" />
    <property role="34LRSv" value="collection" />
    <property role="R4oN_" value="Calculated read-only list contributed to an entity" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" />
    <node concept="1TJgyj" id="4crIAbRYuq_" role="1TKVEi">
      <property role="IQ2ns" value="4835663559142270629" />
      <property role="20kJfa" value="elementType" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6" resolve="Type" />
    </node>
    <node concept="1TJgyj" id="4crIAbRYuqA" role="1TKVEi">
      <property role="IQ2ns" value="4835663559142270630" />
      <property role="20kJfa" value="body" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" to="tpee:fzclF80" resolve="StatementList" />
    </node>
    <node concept="1TJgyj" id="4crIAbRYuqB" role="1TKVEi">
      <property role="IQ2ns" value="4835663559142270631" />
      <property role="20kJfa" value="injectedServices" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="10" resolve="InjectedService" />
    </node>
    <node concept="1TJgyj" id="4crIAbRYuqC" role="1TKVEi">
      <property role="IQ2ns" value="4835663559142270632" />
      <property role="20kJfa" value="target" />
      <ref role="20lvS9" node="2" resolve="Entity" />
    </node>
    <node concept="PrWs8" id="4crIAbRYuqD" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="PrWs8" id="4crIAbRYuqE" role="PzmwI">
      <ref role="PrY4T" to="tpck:3fifI_xCcJN" resolve="ScopeProvider" />
    </node>
    <node concept="PrWs8" id="4crIAbRYuqF" role="PzmwI">
      <ref role="PrY4T" to="tpee:i2fhoOR" resolve="IMethodLike" />
    </node>
  </node>
</model>

