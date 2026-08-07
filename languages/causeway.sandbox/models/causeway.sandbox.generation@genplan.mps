<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:523e9bd0-8ee7-4be3-838c-cf911a3d8260(causeway.sandbox.generation@genplan)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="7ab1a6fa-0a11-4b95-9e48-75f363d6cb00" name="jetbrains.mps.lang.generator.plan" version="3" />
  </languages>
  <imports />
  <registry>
    <language id="7ab1a6fa-0a11-4b95-9e48-75f363d6cb00" name="jetbrains.mps.lang.generator.plan">
      <concept id="1152961914448136207" name="jetbrains.mps.lang.generator.plan.structure.LanguageEntry" flags="ng" index="2Qf6Nf">
        <child id="1152961914448136208" name="language" index="2Qf6Ng" />
      </concept>
      <concept id="1820634577908471803" name="jetbrains.mps.lang.generator.plan.structure.Plan" flags="ng" index="2VgMpV">
        <child id="1820634577908471815" name="steps" index="2VgMA7" />
      </concept>
      <concept id="1820634577908471809" name="jetbrains.mps.lang.generator.plan.structure.Checkpoint" flags="ng" index="2VgMA1">
        <child id="3750601816081740498" name="cpSpec" index="3ps6aC" />
      </concept>
      <concept id="1820634577908471810" name="jetbrains.mps.lang.generator.plan.structure.Transform" flags="ng" index="2VgMA2">
        <property id="2209292798354050154" name="individualStepPerGenerator" index="1s431M" />
        <child id="1152961914448142326" name="entries" index="2Qf7GQ" />
      </concept>
      <concept id="3750601816081736033" name="jetbrains.mps.lang.generator.plan.structure.InPlaceCheckpointSpec" flags="ng" index="3ps74r" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="3542851458883438784" name="jetbrains.mps.lang.smodel.structure.LanguageId" flags="nn" index="2V$Bhx">
        <property id="3542851458883439831" name="namespace" index="2V$B1Q" />
        <property id="3542851458883439832" name="languageId" index="2V$B1T" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="2VgMpV" id="4crIAbRWzRR">
    <property role="TrG5h" value="CausewaySandboxPlan" />
    <node concept="2VgMA2" id="4crIAbRWzRT" role="2VgMA7">
      <property role="1s431M" value="false" />
      <node concept="2Qf6Nf" id="4crIAbRWzRU" role="2Qf7GQ">
        <node concept="2V$Bhx" id="4crIAbRWzRW" role="2Qf6Ng">
          <property role="2V$B1Q" value="causeway" />
          <property role="2V$B1T" value="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" />
        </node>
      </node>
    </node>
    <node concept="2VgMA1" id="4crIAbRWzRX" role="2VgMA7">
      <node concept="3ps74r" id="4crIAbRWzRZ" role="3ps6aC">
        <property role="TrG5h" value="after_causeway" />
      </node>
    </node>
    <node concept="2VgMA2" id="4crIAbRWzS0" role="2VgMA7">
      <property role="1s431M" value="false" />
      <node concept="2Qf6Nf" id="4crIAbRWzS1" role="2Qf7GQ">
        <node concept="2V$Bhx" id="4crIAbRWzS3" role="2Qf6Ng">
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguageInternal" />
          <property role="2V$B1T" value="df345b11-b8c7-4213-ac66-48d2a9b75d88" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="4crIAbRWzS4" role="2Qf7GQ">
        <node concept="2V$Bhx" id="4crIAbRWzS6" role="2Qf6Ng">
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage" />
          <property role="2V$B1T" value="f3061a53-9226-4cc5-a443-f952ceaf5816" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="4crIAbRW$68" role="2Qf7GQ">
        <node concept="2V$Bhx" id="4crIAbRW$6a" role="2Qf6Ng">
          <property role="2V$B1Q" value="jetbrains.mps.baseLanguage.closures" />
          <property role="2V$B1T" value="fd392034-7849-419d-9071-12563d152375" />
        </node>
      </node>
      <node concept="2Qf6Nf" id="4crIAbRW$PC" role="2Qf7GQ">
        <node concept="2V$Bhx" id="4crIAbRW$PE" role="2Qf6Ng">
          <property role="2V$B1Q" value="jetbrains.mps.lang.smodel" />
          <property role="2V$B1T" value="7866978e-a0f0-4cc7-81bc-4d213d9375e1" />
        </node>
      </node>
    </node>
  </node>
</model>

