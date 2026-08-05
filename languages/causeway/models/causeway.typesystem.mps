<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:bdf61bbe-2bbc-43ea-97e7-6e690ac637df(causeway.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <use id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage" version="12" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections" version="2" />
    <use id="c7fb639f-be78-4307-89b0-b5959c3fa8c8" name="jetbrains.mps.lang.text" version="0" />
    <use id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation" version="5" />
    <use id="99bd0b43-8ce5-4eaa-aac8-ff12e0700f84" name="causeway" version="0" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="k3bw" ref="r:4e8cfae1-fc0f-442b-b22c-99efd9c6acf9(causeway.structure)" />
    <import index="9x1t" ref="r:649c60cc-9a1a-4bef-8eeb-350f253ffdbd(causeway.behavior)" />
    <import index="tpee" ref="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" />
    <import index="tpcu" ref="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" />
    <import index="tpek" ref="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" />
    <import index="tpeh" ref="r:00000000-0000-4000-0000-011c895902c5(jetbrains.mps.baseLanguage.typesystem)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" />
    <import index="mhbf" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.model(MPS.OpenAPI/)" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" />
    <import index="2k9e" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel.adapter.structure(MPS.Core/)" />
    <import index="c17a" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.language(MPS.OpenAPI/)" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="3235159848334022093" name="jetbrains.mps.lang.behavior.structure.Node_ConceptMethodCall" flags="nn" index="3zqWPK" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1080223426719" name="jetbrains.mps.baseLanguage.structure.OrExpression" flags="nn" index="22lmx$" />
      <concept id="1082485599095" name="jetbrains.mps.baseLanguage.structure.BlockStatement" flags="nn" index="9aQIb">
        <child id="1082485599096" name="statements" index="9aQI4" />
      </concept>
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="1076505808687" name="jetbrains.mps.baseLanguage.structure.WhileStatement" flags="nn" index="2$JKZl">
        <child id="1076505808688" name="condition" index="2$JKZa" />
      </concept>
      <concept id="1239714755177" name="jetbrains.mps.baseLanguage.structure.AbstractUnaryNumberOperation" flags="nn" index="2$Kvd9">
        <child id="1239714902950" name="expression" index="2$L3a6" />
      </concept>
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
      <concept id="1081236700938" name="jetbrains.mps.baseLanguage.structure.StaticMethodDeclaration" flags="ig" index="2YIFZL" />
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070534058343" name="jetbrains.mps.baseLanguage.structure.NullLiteral" flags="nn" index="10Nm6u" />
      <concept id="1070534370425" name="jetbrains.mps.baseLanguage.structure.IntegerType" flags="in" index="10Oyi0" />
      <concept id="1070534644030" name="jetbrains.mps.baseLanguage.structure.BooleanType" flags="in" index="10P_77" />
      <concept id="1068390468198" name="jetbrains.mps.baseLanguage.structure.ClassConcept" flags="ig" index="312cEu">
        <child id="1070462273904" name="staticMethod" index="WxwA9" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="4269842503726207156" name="jetbrains.mps.baseLanguage.structure.LongLiteral" flags="nn" index="1adDum">
        <property id="4269842503726207157" name="value" index="1adDun" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123152" name="jetbrains.mps.baseLanguage.structure.EqualsExpression" flags="nn" index="3clFbC" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123159" name="jetbrains.mps.baseLanguage.structure.IfStatement" flags="nn" index="3clFbJ">
        <child id="1082485599094" name="ifFalseStatement" index="9aQIa" />
        <child id="1068580123160" name="condition" index="3clFbw" />
        <child id="1068580123161" name="ifTrue" index="3clFbx" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068580123137" name="jetbrains.mps.baseLanguage.structure.BooleanConstant" flags="nn" index="3clFbT">
        <property id="1068580123138" name="value" index="3clFbU" />
      </concept>
      <concept id="1068580320020" name="jetbrains.mps.baseLanguage.structure.IntegerConstant" flags="nn" index="3cmrfG">
        <property id="1068580320021" name="value" index="3cmrfH" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6">
        <child id="1068581517676" name="expression" index="3cqZAk" />
      </concept>
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1081506762703" name="jetbrains.mps.baseLanguage.structure.GreaterThanExpression" flags="nn" index="3eOSWO" />
      <concept id="1081516740877" name="jetbrains.mps.baseLanguage.structure.NotExpression" flags="nn" index="3fqX7Q">
        <child id="1081516765348" name="expression" index="3fr31v" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1080120340718" name="jetbrains.mps.baseLanguage.structure.AndExpression" flags="nn" index="1Wc70l" />
      <concept id="8064396509828172209" name="jetbrains.mps.baseLanguage.structure.UnaryMinus" flags="nn" index="1ZRNhn" />
    </language>
    <language id="3a13115c-633c-4c5c-bbcc-75c4219e9555" name="jetbrains.mps.lang.quotation">
      <concept id="5455284157994012186" name="jetbrains.mps.lang.quotation.structure.NodeBuilderInitLink" flags="ng" index="2pIpSj">
        <reference id="5455284157994012188" name="link" index="2pIpSl" />
        <child id="1595412875168045827" name="initValue" index="28nt2d" />
      </concept>
      <concept id="5455284157993863837" name="jetbrains.mps.lang.quotation.structure.NodeBuilder" flags="nn" index="2pJPEk">
        <child id="5455284157993863838" name="quotedNode" index="2pJPEn" />
      </concept>
      <concept id="5455284157993863840" name="jetbrains.mps.lang.quotation.structure.NodeBuilderNode" flags="nn" index="2pJPED">
        <reference id="5455284157993910961" name="concept" index="2pJxaS" />
        <child id="5455284157993911099" name="values" index="2pJxcM" />
      </concept>
      <concept id="8182547171709752110" name="jetbrains.mps.lang.quotation.structure.NodeBuilderExpression" flags="nn" index="36biLy">
        <child id="8182547171709752112" name="expression" index="36biLW" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1207055528241" name="jetbrains.mps.lang.typesystem.structure.WarningStatement" flags="nn" index="a7r0C">
        <child id="1207055552304" name="warningText" index="a7wSD" />
      </concept>
      <concept id="1185788614172" name="jetbrains.mps.lang.typesystem.structure.NormalTypeClause" flags="ng" index="mw_s8">
        <child id="1185788644032" name="normalType" index="mwGJk" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <property id="1195213689297" name="overrides" index="18ip37" />
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G">
        <property id="7181286126212894140" name="doNotApplyOnTheFly" index="1$Xk0j" />
      </concept>
      <concept id="6405009306797516074" name="jetbrains.mps.lang.typesystem.structure.SubstituteTypeRule" flags="ig" index="3qnSWH">
        <child id="7323318266641100480" name="body" index="3hT0BD" />
      </concept>
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174643105530" name="jetbrains.mps.lang.typesystem.structure.InferenceRule" flags="ig" index="1YbPZF" />
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
      <concept id="1174657487114" name="jetbrains.mps.lang.typesystem.structure.TypeOfExpression" flags="nn" index="1Z2H0r">
        <child id="1174657509053" name="term" index="1Z2MuG" />
      </concept>
      <concept id="1174658326157" name="jetbrains.mps.lang.typesystem.structure.CreateEquationStatement" flags="nn" index="1Z5TYs" />
      <concept id="1174660718586" name="jetbrains.mps.lang.typesystem.structure.AbstractEquationStatement" flags="nn" index="1Zf1VF">
        <child id="1174660783413" name="leftExpression" index="1ZfhK$" />
        <child id="1174660783414" name="rightExpression" index="1ZfhKB" />
      </concept>
      <concept id="1174663118805" name="jetbrains.mps.lang.typesystem.structure.CreateLessThanInequationStatement" flags="nn" index="1ZobV4" />
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1171999116870" name="jetbrains.mps.lang.smodel.structure.Node_IsNullOperation" flags="nn" index="3w_OXm" />
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1156234966388" name="shortDescription" index="OYnhT" />
      </concept>
      <concept id="1196978630214" name="jetbrains.mps.lang.core.structure.IResolveInfo" flags="ngI" index="2Lv6Xg">
        <property id="1196978656277" name="resolveInfo" index="2Lvdk3" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1151689724996" name="jetbrains.mps.baseLanguage.collections.structure.SequenceType" flags="in" index="A3Dl8">
        <child id="1151689745422" name="elementType" index="A3Ik2" />
      </concept>
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
  <node concept="1YbPZF" id="4IOweXOOxUG">
    <property role="TrG5h" value="typeOf_LifecycleBlock" />
    <property role="18ip37" value="false" />
    <node concept="1YaCAy" id="4IOweXOOxUJ" role="1YuTPh">
      <property role="TrG5h" value="lifecycleBlock" />
      <ref role="1YaFvo" to="k3bw:4IOweXONzdR" resolve="LifecycleBlock" />
    </node>
    <node concept="3clFbS" id="4IOweXOOxUK" role="18ibNy">
      <node concept="3cpWs8" id="4IOweXOOxUL" role="3cqZAp">
        <node concept="3cpWsn" id="4IOweXOOxUO" role="3cpWs9">
          <property role="3TUv4t" value="true" />
          <property role="OYnhT" value="local variable" />
          <property role="TrG5h" value="expectedRetType" />
          <property role="2Lvdk3" value="expectedRetType" />
          <node concept="2OqwBi" id="4IOweXOOxUQ" role="33vP2m">
            <node concept="1YBJjd" id="4IOweXOOxUT" role="2Oq$k0">
              <ref role="1YBMHb" node="4IOweXOOxUJ" resolve="lifecycleBlock" />
            </node>
            <node concept="3zqWPK" id="4IOweXOOxUU" role="2OqNvi">
              <ref role="37wK5l" to="tpek:i2fhBNC" resolve="getExpectedRetType" />
            </node>
          </node>
          <node concept="3Tqbb2" id="4IOweXOOxUV" role="1tU5fm" />
        </node>
      </node>
      <node concept="3cpWs8" id="4IOweXOOxUW" role="3cqZAp">
        <node concept="3cpWsn" id="4IOweXOOxUZ" role="3cpWs9">
          <property role="OYnhT" value="local variable" />
          <property role="TrG5h" value="returnStatements" />
          <property role="2Lvdk3" value="returnStatements" />
          <node concept="2YIFZM" id="4IOweXOOxV1" role="33vP2m">
            <ref role="1Pybhc" to="tpeh:h84y26V" resolve="RulesFunctions_BaseLanguage" />
            <ref role="37wK5l" to="tpeh:h9DlRYQ" resolve="collectReturnStatements" />
            <node concept="2OqwBi" id="4IOweXOOxV2" role="37wK5m">
              <node concept="1YBJjd" id="4IOweXOOxV5" role="2Oq$k0">
                <ref role="1YBMHb" node="4IOweXOOxUJ" resolve="lifecycleBlock" />
              </node>
              <node concept="3TrEf2" id="4IOweXOOxV6" role="2OqNvi">
                <ref role="3Tt5mk" to="k3bw:4IOweXONPWK" />
              </node>
            </node>
          </node>
          <node concept="A3Dl8" id="4IOweXOOxV7" role="1tU5fm">
            <node concept="3Tqbb2" id="4IOweXOOxV9" role="A3Ik2">
              <ref role="ehGHo" to="tpee:fzcpWvY" resolve="ReturnStatement" />
            </node>
          </node>
        </node>
      </node>
      <node concept="2Gpval" id="4IOweXOOxVa" role="3cqZAp">
        <node concept="2GrKxI" id="4IOweXOOxVe" role="2Gsz3X">
          <property role="TrG5h" value="returnStatement" />
        </node>
        <node concept="37vLTw" id="4IOweXOOxVf" role="2GsD0m">
          <ref role="3cqZAo" node="4IOweXOOxUZ" resolve="returnStatements" />
        </node>
        <node concept="3clFbS" id="4IOweXOOxVg" role="2LFqv$">
          <node concept="3clFbJ" id="4IOweXOOxVh" role="3cqZAp">
            <node concept="2OqwBi" id="4IOweXOOxVk" role="3clFbw">
              <node concept="2OqwBi" id="4IOweXOOxVn" role="2Oq$k0">
                <node concept="2GrUjf" id="4IOweXOOxVq" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="4IOweXOOxVe" resolve="returnStatement" />
                </node>
                <node concept="3TrEf2" id="4IOweXOOxVr" role="2OqNvi">
                  <ref role="3Tt5mk" to="tpee:fzcqZ_G" />
                </node>
              </node>
              <node concept="3w_OXm" id="4IOweXOOxVs" role="2OqNvi" />
            </node>
            <node concept="3clFbS" id="4IOweXOOxVt" role="3clFbx">
              <node concept="2MkqsV" id="4IOweXOOxVu" role="3cqZAp">
                <node concept="Xl_RD" id="4IOweXOOxVx" role="2MkJ7o">
                  <property role="Xl_RC" value="should return value" />
                </node>
                <node concept="2GrUjf" id="4IOweXOOxVy" role="1urrMF">
                  <ref role="2Gs0qQ" node="4IOweXOOxVe" resolve="returnStatement" />
                </node>
              </node>
            </node>
            <node concept="9aQIb" id="4IOweXOOxVz" role="9aQIa">
              <node concept="3clFbS" id="4IOweXOOxV_" role="9aQI4">
                <node concept="1ZobV4" id="4IOweXOOxVA" role="3cqZAp">
                  <node concept="mw_s8" id="4IOweXOOxVD" role="1ZfhK$">
                    <node concept="1Z2H0r" id="4IOweXOOxVF" role="mwGJk">
                      <node concept="2OqwBi" id="4IOweXOOxVH" role="1Z2MuG">
                        <node concept="2GrUjf" id="4IOweXOOxVK" role="2Oq$k0">
                          <ref role="2Gs0qQ" node="4IOweXOOxVe" resolve="returnStatement" />
                        </node>
                        <node concept="3TrEf2" id="4IOweXOOxVL" role="2OqNvi">
                          <ref role="3Tt5mk" to="tpee:fzcqZ_G" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="mw_s8" id="4IOweXOOxVM" role="1ZfhKB">
                    <node concept="37vLTw" id="4IOweXOOxVO" role="mwGJk">
                      <ref role="3cqZAo" node="4IOweXOOxUO" resolve="expectedRetType" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="312cEu" id="4IOweXOOHl9">
    <property role="TrG5h" value="LifecycleScopeChecks" />
    <node concept="3Tm1VV" id="4IOweXOOHla" role="1B3o_S" />
    <node concept="2YIFZL" id="4IOweXOOHnv" role="WxwA9">
      <property role="TrG5h" value="isForwardParameterReference" />
      <node concept="37vLTG" id="4IOweXOOHnw" role="3clF46">
        <property role="TrG5h" value="referenceNode" />
        <node concept="3uibUv" id="4IOweXOOHnx" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4IOweXOOHny" role="3clF47">
        <node concept="3clFbJ" id="4IOweXOOHnz" role="3cqZAp">
          <node concept="3clFbC" id="4IOweXOOHn$" role="3clFbw">
            <node concept="37vLTw" id="4IOweXOOHn_" role="3uHU7B">
              <ref role="3cqZAo" node="4IOweXOOHnw" resolve="referenceNode" />
            </node>
            <node concept="10Nm6u" id="4IOweXOOHnA" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4IOweXOOHnD" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOOHnB" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOOHnC" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOOHnF" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOOHnE" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="4IOweXOOHnG" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOOHr_" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOOHpN" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOOHnw" resolve="referenceNode" />
              </node>
              <node concept="liA8E" id="4IOweXOOHrA" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="2YIFZM" id="4IOweXOOHtW" role="37wK5m">
                  <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                  <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
                  <node concept="1ZRNhn" id="4IOweXOOHtX" role="37wK5m">
                    <node concept="1adDum" id="4IOweXOOHtY" role="2$L3a6">
                      <property role="1adDun" value="7368721030553710934L" />
                    </node>
                  </node>
                  <node concept="1ZRNhn" id="4IOweXOOHtZ" role="37wK5m">
                    <node concept="1adDum" id="4IOweXOOHu0" role="2$L3a6">
                      <property role="1adDun" value="6140377635379736700L" />
                    </node>
                  </node>
                  <node concept="1adDum" id="4IOweXOOHu1" role="37wK5m">
                    <property role="1adDun" value="5455126814596559395L" />
                  </node>
                  <node concept="1adDum" id="4IOweXOOHu2" role="37wK5m">
                    <property role="1adDun" value="5455126814596559396L" />
                  </node>
                  <node concept="Xl_RD" id="4IOweXOOHu3" role="37wK5m">
                    <property role="Xl_RC" value="variable" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOOHnQ" role="3cqZAp">
          <node concept="22lmx$" id="4IOweXOOHnR" role="3clFbw">
            <node concept="3clFbC" id="4IOweXOOHnS" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOOHnT" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHnE" resolve="target" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOHnU" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="4IOweXOOHnV" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOOHuB" role="3fr31v">
                <node concept="2OqwBi" id="4IOweXOOHs1" role="2Oq$k0">
                  <node concept="37vLTw" id="4IOweXOOHq7" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOOHnE" resolve="target" />
                  </node>
                  <node concept="liA8E" id="4IOweXOOHs2" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOOHuC" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="2YIFZM" id="4IOweXOOHuD" role="37wK5m">
                    <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                    <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
                    <node concept="1ZRNhn" id="4IOweXOOHuE" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHuF" role="2$L3a6">
                        <property role="1adDun" value="7368721030553710934L" />
                      </node>
                    </node>
                    <node concept="1ZRNhn" id="4IOweXOOHuG" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHuH" role="2$L3a6">
                        <property role="1adDun" value="6140377635379736700L" />
                      </node>
                    </node>
                    <node concept="1adDum" id="4IOweXOOHuI" role="37wK5m">
                      <property role="1adDun" value="8900000000000000005L" />
                    </node>
                    <node concept="Xl_RD" id="4IOweXOOHuJ" role="37wK5m">
                      <property role="Xl_RC" value="causeway.structure.Parameter" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHo7" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOOHo5" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOOHo6" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOOHo9" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOOHo8" role="3cpWs9">
            <property role="TrG5h" value="owner" />
            <node concept="3uibUv" id="4IOweXOOHoa" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOOHsc" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOOHqk" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOOHnw" resolve="referenceNode" />
              </node>
              <node concept="liA8E" id="4IOweXOOHsd" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOOHow" role="3cqZAp">
          <node concept="1Wc70l" id="4IOweXOOHoc" role="2$JKZa">
            <node concept="3y3z36" id="4IOweXOOHod" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOOHoe" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOHof" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="4IOweXOOHog" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOOHvd" role="3fr31v">
                <node concept="2OqwBi" id="4IOweXOOHsw" role="2Oq$k0">
                  <node concept="37vLTw" id="4IOweXOOHqw" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
                  </node>
                  <node concept="liA8E" id="4IOweXOOHsx" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOOHve" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="2YIFZM" id="4IOweXOOHvf" role="37wK5m">
                    <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                    <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
                    <node concept="1ZRNhn" id="4IOweXOOHvg" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHvh" role="2$L3a6">
                        <property role="1adDun" value="7368721030553710934L" />
                      </node>
                    </node>
                    <node concept="1ZRNhn" id="4IOweXOOHvi" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHvj" role="2$L3a6">
                        <property role="1adDun" value="6140377635379736700L" />
                      </node>
                    </node>
                    <node concept="1adDum" id="4IOweXOOHvk" role="37wK5m">
                      <property role="1adDun" value="8900000000000000005L" />
                    </node>
                    <node concept="Xl_RD" id="4IOweXOOHvl" role="37wK5m">
                      <property role="Xl_RC" value="causeway.structure.Parameter" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHor" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOOHos" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOOHot" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOOHou" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
                </node>
                <node concept="2OqwBi" id="4IOweXOOHsG" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOOHqH" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
                  </node>
                  <node concept="liA8E" id="4IOweXOOHsH" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOOHox" role="3cqZAp">
          <node concept="22lmx$" id="4IOweXOOHoy" role="3clFbw">
            <node concept="3clFbC" id="4IOweXOOHoz" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOOHo$" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOHo_" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="4IOweXOOHoA" role="3uHU7w">
              <node concept="37vLTw" id="4IOweXOOHoB" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
              </node>
              <node concept="37vLTw" id="4IOweXOOHoC" role="3uHU7w">
                <ref role="3cqZAo" node="4IOweXOOHnE" resolve="target" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHoF" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOOHoD" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOOHoE" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4IOweXOOHoH" role="3cqZAp">
          <node concept="3cpWsn" id="4IOweXOOHoG" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="4IOweXOOHoI" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4IOweXOOHsS" role="33vP2m">
              <node concept="37vLTw" id="4IOweXOOHqL" role="2Oq$k0">
                <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
              </node>
              <node concept="liA8E" id="4IOweXOOHsT" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="4IOweXOOHp4" role="3cqZAp">
          <node concept="1Wc70l" id="4IOweXOOHoK" role="2$JKZa">
            <node concept="3y3z36" id="4IOweXOOHoL" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOOHoM" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOHoN" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="4IOweXOOHoO" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOOHvY" role="3fr31v">
                <node concept="2OqwBi" id="4IOweXOOHtc" role="2Oq$k0">
                  <node concept="37vLTw" id="4IOweXOOHqX" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
                  </node>
                  <node concept="liA8E" id="4IOweXOOHtd" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4IOweXOOHvZ" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="2YIFZM" id="4IOweXOOHw0" role="37wK5m">
                    <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                    <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
                    <node concept="1ZRNhn" id="4IOweXOOHw1" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHw2" role="2$L3a6">
                        <property role="1adDun" value="7368721030553710934L" />
                      </node>
                    </node>
                    <node concept="1ZRNhn" id="4IOweXOOHw3" role="37wK5m">
                      <node concept="1adDum" id="4IOweXOOHw4" role="2$L3a6">
                        <property role="1adDun" value="6140377635379736700L" />
                      </node>
                    </node>
                    <node concept="1adDum" id="4IOweXOOHw5" role="37wK5m">
                      <property role="1adDun" value="8900000000000000004L" />
                    </node>
                    <node concept="Xl_RD" id="4IOweXOOHw6" role="37wK5m">
                      <property role="Xl_RC" value="causeway.structure.Action" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHoZ" role="2LFqv$">
            <node concept="3clFbF" id="4IOweXOOHp0" role="3cqZAp">
              <node concept="37vLTI" id="4IOweXOOHp1" role="3clFbG">
                <node concept="37vLTw" id="4IOweXOOHp2" role="37vLTJ">
                  <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
                </node>
                <node concept="2OqwBi" id="4IOweXOOHto" role="37vLTx">
                  <node concept="37vLTw" id="4IOweXOOHra" role="2Oq$k0">
                    <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
                  </node>
                  <node concept="liA8E" id="4IOweXOOHtp" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4IOweXOOHp5" role="3cqZAp">
          <node concept="22lmx$" id="4IOweXOOHp6" role="3clFbw">
            <node concept="3clFbC" id="4IOweXOOHp7" role="3uHU7B">
              <node concept="37vLTw" id="4IOweXOOHp8" role="3uHU7B">
                <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
              </node>
              <node concept="10Nm6u" id="4IOweXOOHp9" role="3uHU7w" />
            </node>
            <node concept="3y3z36" id="4IOweXOOHpa" role="3uHU7w">
              <node concept="2OqwBi" id="4IOweXOOHt$" role="3uHU7B">
                <node concept="37vLTw" id="4IOweXOOHre" role="2Oq$k0">
                  <ref role="3cqZAo" node="4IOweXOOHnE" resolve="target" />
                </node>
                <node concept="liA8E" id="4IOweXOOHt_" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                </node>
              </node>
              <node concept="37vLTw" id="4IOweXOOHpc" role="3uHU7w">
                <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHpf" role="3clFbx">
            <node concept="3cpWs6" id="4IOweXOOHpd" role="3cqZAp">
              <node concept="3clFbT" id="4IOweXOOHpe" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4IOweXOOHpg" role="3cqZAp">
          <node concept="2OqwBi" id="4IOweXOOHtK" role="1DdaDG">
            <node concept="37vLTw" id="4IOweXOOHri" role="2Oq$k0">
              <ref role="3cqZAo" node="4IOweXOOHoG" resolve="action" />
            </node>
            <node concept="liA8E" id="4IOweXOOHtL" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="2YIFZM" id="4IOweXOOHwa" role="37wK5m">
                <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
                <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
                <node concept="1ZRNhn" id="4IOweXOOHwb" role="37wK5m">
                  <node concept="1adDum" id="4IOweXOOHwc" role="2$L3a6">
                    <property role="1adDun" value="7368721030553710934L" />
                  </node>
                </node>
                <node concept="1ZRNhn" id="4IOweXOOHwd" role="37wK5m">
                  <node concept="1adDum" id="4IOweXOOHwe" role="2$L3a6">
                    <property role="1adDun" value="6140377635379736700L" />
                  </node>
                </node>
                <node concept="1adDum" id="4IOweXOOHwf" role="37wK5m">
                  <property role="1adDun" value="8900000000000000004L" />
                </node>
                <node concept="1adDum" id="4IOweXOOHwg" role="37wK5m">
                  <property role="1adDun" value="8900000000000000025L" />
                </node>
                <node concept="Xl_RD" id="4IOweXOOHwh" role="37wK5m">
                  <property role="Xl_RC" value="parameters" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4IOweXOOHpx" role="1Duv9x">
            <property role="TrG5h" value="candidate" />
            <node concept="3uibUv" id="4IOweXOOHpz" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4IOweXOOHpi" role="2LFqv$">
            <node concept="3clFbJ" id="4IOweXOOHpj" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOOHpk" role="3clFbw">
                <node concept="37vLTw" id="4IOweXOOHpl" role="3uHU7B">
                  <ref role="3cqZAo" node="4IOweXOOHpx" resolve="candidate" />
                </node>
                <node concept="37vLTw" id="4IOweXOOHpm" role="3uHU7w">
                  <ref role="3cqZAo" node="4IOweXOOHnE" resolve="target" />
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXOOHpp" role="3clFbx">
                <node concept="3cpWs6" id="4IOweXOOHpn" role="3cqZAp">
                  <node concept="3clFbT" id="4IOweXOOHpo" role="3cqZAk" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="4IOweXOOHpq" role="3cqZAp">
              <node concept="3clFbC" id="4IOweXOOHpr" role="3clFbw">
                <node concept="37vLTw" id="4IOweXOOHps" role="3uHU7B">
                  <ref role="3cqZAo" node="4IOweXOOHpx" resolve="candidate" />
                </node>
                <node concept="37vLTw" id="4IOweXOOHpt" role="3uHU7w">
                  <ref role="3cqZAo" node="4IOweXOOHo8" resolve="owner" />
                </node>
              </node>
              <node concept="3clFbS" id="4IOweXOOHpw" role="3clFbx">
                <node concept="3cpWs6" id="4IOweXOOHpu" role="3cqZAp">
                  <node concept="3clFbT" id="4IOweXOOHpv" role="3cqZAk">
                    <property role="3clFbU" value="true" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4IOweXOOHpH" role="3cqZAp">
          <node concept="3clFbT" id="4IOweXOOHpI" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm1VV" id="4IOweXOOHpJ" role="1B3o_S" />
      <node concept="10P_77" id="4IOweXOOHpK" role="3clF45" />
    </node>
  </node>
  <node concept="18kY7G" id="4IOweXOOIQU">
    <property role="TrG5h" value="warn_forward_parameter_reference" />
    <property role="18ip37" value="false" />
    <property role="1$Xk0j" value="false" />
    <node concept="1YaCAy" id="4IOweXOOIQX" role="1YuTPh">
      <property role="TrG5h" value="actionVariableReference" />
      <ref role="1YaFvo" to="k3bw:4IOweXOJ78z" resolve="ActionVariableReference" />
    </node>
    <node concept="3clFbS" id="4IOweXOOIQY" role="18ibNy">
      <node concept="3clFbJ" id="4IOweXOOIQZ" role="3cqZAp">
        <node concept="2YIFZM" id="4IOweXOOIR2" role="3clFbw">
          <ref role="1Pybhc" node="4IOweXOOHl9" resolve="LifecycleScopeChecks" />
          <ref role="37wK5l" node="4IOweXOOHnv" resolve="isForwardParameterReference" />
          <node concept="1YBJjd" id="4IOweXOOIR3" role="37wK5m">
            <ref role="1YBMHb" node="4IOweXOOIQX" resolve="actionVariableReference" />
          </node>
        </node>
        <node concept="3clFbS" id="4IOweXOOIR4" role="3clFbx">
          <node concept="a7r0C" id="4IOweXOOIR5" role="3cqZAp">
            <node concept="Xl_RD" id="4IOweXOOIR8" role="a7wSD">
              <property role="Xl_RC" value="parameter reference is out of scope after parameter reordering" />
            </node>
            <node concept="1YBJjd" id="4IOweXOOIR9" role="1urrMF">
              <ref role="1YBMHb" node="4IOweXOOIQX" resolve="actionVariableReference" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1YbPZF" id="6kis6yMC07W">
    <property role="TrG5h" value="typeof_ActionVariableReference" />
    <node concept="3clFbS" id="6kis6yMC07Z" role="18ibNy">
      <node concept="1Z5TYs" id="6kis6yMC080" role="3cqZAp">
        <node concept="mw_s8" id="6kis6yMC083" role="1ZfhK$">
          <node concept="1Z2H0r" id="6kis6yMC085" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC087" role="1Z2MuG">
              <ref role="1YBMHb" node="6kis6yMC08h" resolve="actionVariableReference" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6kis6yMC088" role="1ZfhKB">
          <node concept="1Z2H0r" id="6kis6yMC08a" role="mwGJk">
            <node concept="2OqwBi" id="6kis6yMC08c" role="1Z2MuG">
              <node concept="1YBJjd" id="6kis6yMC08f" role="2Oq$k0">
                <ref role="1YBMHb" node="6kis6yMC08h" resolve="actionVariableReference" />
              </node>
              <node concept="3TrEf2" id="6kis6yMC08g" role="2OqNvi">
                <ref role="3Tt5mk" to="k3bw:4IOweXOJ78$" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6kis6yMC08h" role="1YuTPh">
      <property role="TrG5h" value="actionVariableReference" />
      <ref role="1YaFvo" to="k3bw:4IOweXOJ78z" resolve="ActionVariableReference" />
    </node>
  </node>
  <node concept="1YbPZF" id="6kis6yMC08i">
    <property role="TrG5h" value="typeof_Parameter" />
    <node concept="3clFbS" id="6kis6yMC08l" role="18ibNy">
      <node concept="1Z5TYs" id="6kis6yMC08m" role="3cqZAp">
        <node concept="mw_s8" id="6kis6yMC08p" role="1ZfhK$">
          <node concept="1Z2H0r" id="6kis6yMC08r" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC08t" role="1Z2MuG">
              <ref role="1YBMHb" node="6kis6yMC08_" resolve="parameter" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6kis6yMC08u" role="1ZfhKB">
          <node concept="2OqwBi" id="6kis6yMC08w" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC08z" role="2Oq$k0">
              <ref role="1YBMHb" node="6kis6yMC08_" resolve="parameter" />
            </node>
            <node concept="3TrEf2" id="6kis6yMC08$" role="2OqNvi">
              <ref role="3Tt5mk" to="k3bw:26" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6kis6yMC08_" role="1YuTPh">
      <property role="TrG5h" value="parameter" />
      <ref role="1YaFvo" to="k3bw:5" resolve="Parameter" />
    </node>
  </node>
  <node concept="1YbPZF" id="6kis6yMC08A">
    <property role="TrG5h" value="typeof_InjectedService" />
    <node concept="3clFbS" id="6kis6yMC08D" role="18ibNy">
      <node concept="1Z5TYs" id="6kis6yMC08E" role="3cqZAp">
        <node concept="mw_s8" id="6kis6yMC08H" role="1ZfhK$">
          <node concept="1Z2H0r" id="6kis6yMC08J" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC08L" role="1Z2MuG">
              <ref role="1YBMHb" node="6kis6yMC08T" resolve="injectedService" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6kis6yMC08M" role="1ZfhKB">
          <node concept="2OqwBi" id="6kis6yMC08O" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC08R" role="2Oq$k0">
              <ref role="1YBMHb" node="6kis6yMC08T" resolve="injectedService" />
            </node>
            <node concept="3TrEf2" id="6kis6yMC08S" role="2OqNvi">
              <ref role="3Tt5mk" to="k3bw:33" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6kis6yMC08T" role="1YuTPh">
      <property role="TrG5h" value="injectedService" />
      <ref role="1YaFvo" to="k3bw:10" resolve="InjectedService" />
    </node>
  </node>
  <node concept="1YbPZF" id="6kis6yMC08U">
    <property role="TrG5h" value="typeof_Entity" />
    <node concept="3clFbS" id="6kis6yMC08X" role="18ibNy">
      <node concept="1Z5TYs" id="6kis6yMC08Y" role="3cqZAp">
        <node concept="mw_s8" id="6kis6yMC091" role="1ZfhK$">
          <node concept="1Z2H0r" id="6kis6yMC093" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMC095" role="1Z2MuG">
              <ref role="1YBMHb" node="6kis6yMC09f" resolve="entity" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6kis6yMC096" role="1ZfhKB">
          <node concept="2pJPEk" id="6kis6yMCjFo" role="mwGJk">
            <node concept="2pJPED" id="6kis6yMCjFq" role="2pJPEn">
              <ref role="2pJxaS" to="k3bw:7" resolve="EntityType" />
              <node concept="2pIpSj" id="6kis6yMCjFr" role="2pJxcM">
                <ref role="2pIpSl" to="k3bw:31" />
                <node concept="36biLy" id="6kis6yMCjFt" role="28nt2d">
                  <node concept="1YBJjd" id="6kis6yMCjFv" role="36biLW">
                    <ref role="1YBMHb" node="6kis6yMC09f" resolve="entity" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6kis6yMC09f" role="1YuTPh">
      <property role="TrG5h" value="entity" />
      <ref role="1YaFvo" to="k3bw:2" resolve="Entity" />
    </node>
  </node>
  <node concept="3qnSWH" id="6kis6yMC09g">
    <property role="TrG5h" value="substitute_JavaType" />
    <node concept="3clFbS" id="6kis6yMC09j" role="3hT0BD">
      <node concept="3cpWs6" id="6kis6yMC09k" role="3cqZAp">
        <node concept="2OqwBi" id="6kis6yMC09l" role="3cqZAk">
          <node concept="1YBJjd" id="6kis6yMC09o" role="2Oq$k0">
            <ref role="1YBMHb" node="6kis6yMC09q" resolve="javaType" />
          </node>
          <node concept="3TrEf2" id="6kis6yMC09p" role="2OqNvi">
            <ref role="3Tt5mk" to="k3bw:32" />
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6kis6yMC09q" role="1YuTPh">
      <property role="TrG5h" value="javaType" />
      <ref role="1YaFvo" to="k3bw:8" resolve="JavaType" />
    </node>
  </node>
</model>

