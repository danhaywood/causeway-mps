<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:bdf61bbe-2bbc-43ea-97e7-6e690ac637df(causeway.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1154032098014" name="jetbrains.mps.baseLanguage.structure.AbstractLoopStatement" flags="nn" index="2LF5Ji">
        <child id="1154032183016" name="body" index="2LFqv$" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
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
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1153943597977" name="jetbrains.mps.baseLanguage.collections.structure.ForEachStatement" flags="nn" index="2Gpval">
        <child id="1153944400369" name="variable" index="2Gsz3X" />
        <child id="1153944424730" name="inputSequence" index="2GsD0m" />
      </concept>
      <concept id="1153944193378" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariable" flags="nr" index="2GrKxI" />
      <concept id="1153944233411" name="jetbrains.mps.baseLanguage.collections.structure.ForEachVariableReference" flags="nn" index="2GrUjf">
        <reference id="1153944258490" name="variable" index="2Gs0qQ" />
      </concept>
    </language>
  </registry>
  <node concept="18kY7G" id="_$TiGu7AG1">
    <property role="TrG5h" value="unique_member_names" />
    <node concept="3clFbS" id="_$TiGu7AG2" role="18ibNy">
      <node concept="2Gpval" id="_$TiGu8eAS" role="3cqZAp">
        <node concept="2GrKxI" id="_$TiGu8eAT" role="2Gsz3X">
          <property role="TrG5h" value="p" />
        </node>
        <node concept="2OqwBi" id="_$TiGu8eLt" role="2GsD0m">
          <node concept="1YBJjd" id="_$TiGu8eBa" role="2Oq$k0">
            <ref role="1YBMHb" node="_$TiGu7AG6" resolve="entity" />
          </node>
          <node concept="3Tsc0h" id="_$TiGu8fb5" role="2OqNvi">
            <ref role="3TtcxE" to="k3bw:22" resolve="properties" />
          </node>
        </node>
        <node concept="3clFbS" id="_$TiGu8eAV" role="2LFqv$">
          <node concept="3cpWs8" id="_$TiGu8ffb" role="3cqZAp">
            <node concept="3cpWsn" id="_$TiGu8ffe" role="3cpWs9">
              <property role="TrG5h" value="count" />
              <node concept="10Oyi0" id="_$TiGu8ffa" role="1tU5fm" />
              <node concept="3cmrfG" id="_$TiGu8ffo" role="33vP2m">
                <property role="3cmrfH" value="0" />
              </node>
            </node>
          </node>
          <node concept="2Gpval" id="_$TiGu8ffD" role="3cqZAp">
            <node concept="2GrKxI" id="_$TiGu8ffF" role="2Gsz3X">
              <property role="TrG5h" value="q" />
            </node>
            <node concept="2OqwBi" id="_$TiGu8fqf" role="2GsD0m">
              <node concept="1YBJjd" id="_$TiGu8ffW" role="2Oq$k0">
                <ref role="1YBMHb" node="_$TiGu7AG6" resolve="entity" />
              </node>
              <node concept="3Tsc0h" id="_$TiGu8fIQ" role="2OqNvi">
                <ref role="3TtcxE" to="k3bw:22" resolve="properties" />
              </node>
            </node>
            <node concept="3clFbS" id="_$TiGu8ffJ" role="2LFqv$">
              <node concept="3clFbJ" id="_$TiGu8fMR" role="3cqZAp">
                <node concept="2OqwBi" id="_$TiGu8hps" role="3clFbw">
                  <node concept="2OqwBi" id="_$TiGu8fX8" role="2Oq$k0">
                    <node concept="2GrUjf" id="_$TiGu8fN0" role="2Oq$k0">
                      <ref role="2Gs0qQ" node="_$TiGu8eAT" resolve="p" />
                    </node>
                    <node concept="3TrcHB" id="_$TiGu8gHk" role="2OqNvi">
                      <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                    </node>
                  </node>
                  <node concept="liA8E" id="_$TiGu8hZw" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                    <node concept="2OqwBi" id="_$TiGu8ivR" role="37wK5m">
                      <node concept="2GrUjf" id="_$TiGu8iqc" role="2Oq$k0">
                        <ref role="2Gs0qQ" node="_$TiGu8ffF" resolve="q" />
                      </node>
                      <node concept="3TrcHB" id="_$TiGu8j4K" role="2OqNvi">
                        <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbS" id="_$TiGu8fMT" role="3clFbx">
                  <node concept="3clFbF" id="_$TiGu8jf3" role="3cqZAp">
                    <node concept="37vLTI" id="_$TiGu8lek" role="3clFbG">
                      <node concept="3cpWs3" id="_$TiGu8ndY" role="37vLTx">
                        <node concept="37vLTw" id="_$TiGu8lez" role="3uHU7B">
                          <ref role="3cqZAo" node="_$TiGu8ffe" resolve="count" />
                        </node>
                        <node concept="3cmrfG" id="_$TiGu8nFX" role="3uHU7w">
                          <property role="3cmrfH" value="1" />
                        </node>
                      </node>
                      <node concept="37vLTw" id="_$TiGu8jf2" role="37vLTJ">
                        <ref role="3cqZAo" node="_$TiGu8ffe" resolve="count" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbJ" id="_$TiGu8nZB" role="3cqZAp">
            <node concept="3clFbS" id="_$TiGu8nZD" role="3clFbx">
              <node concept="2MkqsV" id="_$TiGu8qme" role="3cqZAp">
                <node concept="Xl_RD" id="_$TiGu8qmr" role="2MkJ7o">
                  <property role="Xl_RC" value="duplicate property name" />
                </node>
                <node concept="2GrUjf" id="_$TiGu8qni" role="1urrMF">
                  <ref role="2Gs0qQ" node="_$TiGu8eAT" resolve="p" />
                </node>
              </node>
            </node>
            <node concept="3eOSWO" id="_$TiGu8q4a" role="3clFbw">
              <node concept="37vLTw" id="_$TiGu8ofs" role="3uHU7B">
                <ref role="3cqZAo" node="_$TiGu8ffe" resolve="count" />
              </node>
              <node concept="3cmrfG" id="_$TiGu8qlQ" role="3uHU7w">
                <property role="3cmrfH" value="1" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="_$TiGu7AG6" role="1YuTPh">
      <property role="TrG5h" value="entity" />
      <ref role="1YaFvo" to="k3bw:2" resolve="Entity" />
    </node>
  </node>
</model>

