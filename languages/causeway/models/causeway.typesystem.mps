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
    <import index="1ka" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.typechecking(MPS.Core/)" />
    <import index="zce0" ref="1ed103c3-3aa6-49b7-9c21-6765ee11f224/java:jetbrains.mps.smodel.action(MPS.Editor/)" />
    <import index="33ny" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.util(JDK/)" />
    <import index="dush" ref="8865b7a8-5271-43d3-884c-6fd1d9cfdd34/java:org.jetbrains.mps.openapi.persistence(MPS.OpenAPI/)" />
    <import index="w1kc" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.smodel(MPS.Core/)" />
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
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070462154015" name="jetbrains.mps.baseLanguage.structure.StaticFieldDeclaration" flags="ig" index="Wx3nA" />
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
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
        <child id="1128555889557" name="staticField" index="33b4aj" />
      </concept>
      <concept id="1171903916106" name="jetbrains.mps.baseLanguage.structure.UpperBoundType" flags="in" index="3qUE_q">
        <child id="1171903916107" name="bound" index="3qUE_r" />
      </concept>
      <concept id="7812454656619025412" name="jetbrains.mps.baseLanguage.structure.LocalMethodCall" flags="nn" index="1rXfSq" />
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
        <child id="1109201940907" name="parameter" index="11_B2D" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="1214918800624" name="jetbrains.mps.baseLanguage.structure.PostfixIncrementExpression" flags="nn" index="3uNrnE" />
      <concept id="1073239437375" name="jetbrains.mps.baseLanguage.structure.NotEqualsExpression" flags="nn" index="3y3z36" />
      <concept id="1081855346303" name="jetbrains.mps.baseLanguage.structure.BreakStatement" flags="nn" index="3zACq4" />
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="1144226303539" name="jetbrains.mps.baseLanguage.structure.ForeachStatement" flags="nn" index="1DcWWT">
        <child id="1144226360166" name="iterable" index="1DdaDG" />
      </concept>
      <concept id="1144230876926" name="jetbrains.mps.baseLanguage.structure.AbstractForStatement" flags="nn" index="1DupvO">
        <child id="1144230900587" name="variable" index="1Duv9x" />
      </concept>
      <concept id="1163668896201" name="jetbrains.mps.baseLanguage.structure.TernaryOperatorExpression" flags="nn" index="3K4zz7">
        <child id="1163668914799" name="condition" index="3K4Cdx" />
        <child id="1163668922816" name="ifTrue" index="3K4E3e" />
        <child id="1163668934364" name="ifFalse" index="3K4GZi" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1146644623116" name="jetbrains.mps.baseLanguage.structure.PrivateVisibility" flags="nn" index="3Tm6S6" />
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
      <concept id="1175147569072" name="jetbrains.mps.lang.typesystem.structure.AbstractSubtypingRule" flags="ig" index="2sgdUx">
        <property id="1175607673137" name="isWeak" index="2RFo0w" />
        <child id="1175147624276" name="body" index="2sgrp5" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1201607707634" name="jetbrains.mps.lang.typesystem.structure.InequationReplacementRule" flags="ig" index="35pCF_">
        <child id="1201607798918" name="supertypeNode" index="35pZ6h" />
        <child id="3592071576955708909" name="isApplicableClause" index="1xSnZW" />
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
      <concept id="3592071576955708904" name="jetbrains.mps.lang.typesystem.structure.IsReplacementRuleApplicable_ConceptFunction" flags="in" index="1xSnZT" />
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
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
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
  <node concept="312cEu" id="6kis6yMCrLK">
    <property role="TrG5h" value="EntityJavaTypeBridge" />
    <node concept="3Tm1VV" id="6kis6yMCrLL" role="1B3o_S" />
    <node concept="2YIFZL" id="6kis6yMCrLM" role="jymVt">
      <property role="TrG5h" value="matches" />
      <node concept="37vLTG" id="6kis6yMCrLN" role="3clF46">
        <property role="TrG5h" value="entityType" />
        <node concept="3uibUv" id="6kis6yMCrLO" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="37vLTG" id="6kis6yMCrLP" role="3clF46">
        <property role="TrG5h" value="classifierType" />
        <node concept="3uibUv" id="6kis6yMCrLQ" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMCrLR" role="3clF47">
        <node concept="3clFbJ" id="6kis6yMCrLS" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMCrLT" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMCrLU" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMCrLV" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMCrLN" resolve="entityType" />
              </node>
              <node concept="10Nm6u" id="6kis6yMCrLW" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="6kis6yMCrLX" role="3uHU7w">
              <node concept="37vLTw" id="6kis6yMCrLY" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMCrLP" resolve="classifierType" />
              </node>
              <node concept="10Nm6u" id="6kis6yMCrLZ" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMCrM2" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMCrM0" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMCrM1" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMCrM4" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMCrM3" role="3cpWs9">
            <property role="TrG5h" value="entity" />
            <node concept="3uibUv" id="6kis6yMCrM5" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMCrO9" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMCrMV" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMCrLN" resolve="entityType" />
              </node>
              <node concept="liA8E" id="6kis6yMCrOa" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(java.lang.String)" resolve="getReferenceTarget" />
                <node concept="Xl_RD" id="6kis6yMCrOb" role="37wK5m">
                  <property role="Xl_RC" value="entity" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMCrM9" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMCrM8" role="3cpWs9">
            <property role="TrG5h" value="classifier" />
            <node concept="3uibUv" id="6kis6yMCrMa" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMCrOl" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMCrN0" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMCrLP" resolve="classifierType" />
              </node>
              <node concept="liA8E" id="6kis6yMCrOm" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(java.lang.String)" resolve="getReferenceTarget" />
                <node concept="Xl_RD" id="6kis6yMCrOn" role="37wK5m">
                  <property role="Xl_RC" value="classifier" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMCrMd" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMCrMe" role="3clFbw">
            <node concept="22lmx$" id="6kis6yMCrMf" role="3uHU7B">
              <node concept="22lmx$" id="6kis6yMCrMg" role="3uHU7B">
                <node concept="3clFbC" id="6kis6yMCrMh" role="3uHU7B">
                  <node concept="37vLTw" id="6kis6yMCrMi" role="3uHU7B">
                    <ref role="3cqZAo" node="6kis6yMCrM3" resolve="entity" />
                  </node>
                  <node concept="10Nm6u" id="6kis6yMCrMj" role="3uHU7w" />
                </node>
                <node concept="3clFbC" id="6kis6yMCrMk" role="3uHU7w">
                  <node concept="37vLTw" id="6kis6yMCrMl" role="3uHU7B">
                    <ref role="3cqZAo" node="6kis6yMCrM8" resolve="classifier" />
                  </node>
                  <node concept="10Nm6u" id="6kis6yMCrMm" role="3uHU7w" />
                </node>
              </node>
              <node concept="3clFbC" id="6kis6yMCrMn" role="3uHU7w">
                <node concept="2OqwBi" id="6kis6yMCrOy" role="3uHU7B">
                  <node concept="37vLTw" id="6kis6yMCrN5" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMCrM3" resolve="entity" />
                  </node>
                  <node concept="liA8E" id="6kis6yMCrOz" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                  </node>
                </node>
                <node concept="10Nm6u" id="6kis6yMCrMp" role="3uHU7w" />
              </node>
            </node>
            <node concept="3clFbC" id="6kis6yMCrMq" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMCrOI" role="3uHU7B">
                <node concept="37vLTw" id="6kis6yMCrN9" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMCrM8" resolve="classifier" />
                </node>
                <node concept="liA8E" id="6kis6yMCrOJ" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                </node>
              </node>
              <node concept="10Nm6u" id="6kis6yMCrMs" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMCrMv" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMCrMt" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMCrMu" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMCrMx" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMCrMw" role="3cpWs9">
            <property role="TrG5h" value="entityFqn" />
            <node concept="3uibUv" id="6kis6yMCrMy" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="3cpWs3" id="6kis6yMCrMz" role="33vP2m">
              <node concept="3cpWs3" id="6kis6yMCrM$" role="3uHU7B">
                <node concept="2OqwBi" id="6kis6yMCrSm" role="3uHU7B">
                  <node concept="2OqwBi" id="6kis6yMCrQW" role="2Oq$k0">
                    <node concept="2OqwBi" id="6kis6yMCrPa" role="2Oq$k0">
                      <node concept="37vLTw" id="6kis6yMCrNt" role="2Oq$k0">
                        <ref role="3cqZAo" node="6kis6yMCrM3" resolve="entity" />
                      </node>
                      <node concept="liA8E" id="6kis6yMCrPb" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                      </node>
                    </node>
                    <node concept="liA8E" id="6kis6yMCrQX" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SModel.getName()" resolve="getName" />
                    </node>
                  </node>
                  <node concept="liA8E" id="6kis6yMCrSn" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SModelName.getLongName()" resolve="getLongName" />
                  </node>
                </node>
                <node concept="Xl_RD" id="6kis6yMCrMC" role="3uHU7w">
                  <property role="Xl_RC" value="." />
                </node>
              </node>
              <node concept="2OqwBi" id="6kis6yMCrPm" role="3uHU7w">
                <node concept="37vLTw" id="6kis6yMCrNx" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMCrM3" resolve="entity" />
                </node>
                <node concept="liA8E" id="6kis6yMCrPn" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMCrMF" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMCrME" role="3cpWs9">
            <property role="TrG5h" value="classifierFqn" />
            <node concept="3uibUv" id="6kis6yMCrMG" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="3cpWs3" id="6kis6yMCrMH" role="33vP2m">
              <node concept="3cpWs3" id="6kis6yMCrMI" role="3uHU7B">
                <node concept="2OqwBi" id="6kis6yMCrT3" role="3uHU7B">
                  <node concept="2OqwBi" id="6kis6yMCrRD" role="2Oq$k0">
                    <node concept="2OqwBi" id="6kis6yMCrPM" role="2Oq$k0">
                      <node concept="37vLTw" id="6kis6yMCrNP" role="2Oq$k0">
                        <ref role="3cqZAo" node="6kis6yMCrM8" resolve="classifier" />
                      </node>
                      <node concept="liA8E" id="6kis6yMCrPN" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                      </node>
                    </node>
                    <node concept="liA8E" id="6kis6yMCrRE" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SModel.getName()" resolve="getName" />
                    </node>
                  </node>
                  <node concept="liA8E" id="6kis6yMCrT4" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SModelName.getLongName()" resolve="getLongName" />
                  </node>
                </node>
                <node concept="Xl_RD" id="6kis6yMCrMM" role="3uHU7w">
                  <property role="Xl_RC" value="." />
                </node>
              </node>
              <node concept="2OqwBi" id="6kis6yMCrPY" role="3uHU7w">
                <node concept="37vLTw" id="6kis6yMCrNT" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMCrM8" resolve="classifier" />
                </node>
                <node concept="liA8E" id="6kis6yMCrPZ" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMCrMO" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMCrQe" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMCrNX" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMCrMw" resolve="entityFqn" />
            </node>
            <node concept="liA8E" id="6kis6yMCrQf" role="2OqNvi">
              <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
              <node concept="37vLTw" id="6kis6yMCrQg" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMCrME" resolve="classifierFqn" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMCrMR" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMCrMS" role="3clF45" />
    </node>
  </node>
  <node concept="35pCF_" id="6kis6yMCtcS">
    <property role="TrG5h" value="EntityType_subtypeOf_matching_ClassifierType" />
    <property role="2RFo0w" value="false" />
    <node concept="1YaCAy" id="6kis6yMCtcW" role="1YuTPh">
      <property role="TrG5h" value="entityType" />
      <ref role="1YaFvo" to="k3bw:7" resolve="EntityType" />
    </node>
    <node concept="1YaCAy" id="6kis6yMCtcX" role="35pZ6h">
      <property role="TrG5h" value="classifierType" />
      <ref role="1YaFvo" to="tpee:g7uibYu" resolve="ClassifierType" />
    </node>
    <node concept="1xSnZT" id="6kis6yMCtcY" role="1xSnZW">
      <node concept="3clFbS" id="6kis6yMCtd0" role="2VODD2">
        <node concept="3cpWs6" id="6kis6yMCtd1" role="3cqZAp">
          <node concept="2YIFZM" id="6kis6yMCtd2" role="3cqZAk">
            <ref role="1Pybhc" node="6kis6yMCrLK" resolve="EntityJavaTypeBridge" />
            <ref role="37wK5l" node="6kis6yMCrLM" resolve="matches" />
            <node concept="1YBJjd" id="6kis6yMCtd3" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMCtcW" resolve="entityType" />
            </node>
            <node concept="1YBJjd" id="6kis6yMCtd4" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMCtcX" resolve="classifierType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="3clFbS" id="6kis6yMCtd5" role="2sgrp5" />
  </node>
  <node concept="312cEu" id="6kis6yMFOWo">
    <property role="TrG5h" value="ActionInvocationTypes" />
    <property role="3GE5qa" value="action invocation" />
    <node concept="3Tm1VV" id="6kis6yMFOWp" role="1B3o_S" />
    <node concept="Wx3nA" id="6kis6yMFOWq" role="jymVt">
      <property role="TrG5h" value="ACTION_LINK" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFOWr" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFPga" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMFPgb" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgc" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFPgd" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPge" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFPgf" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="1adDum" id="6kis6yMFPgg" role="37wK5m">
          <property role="1adDun" value="7283007142388106565L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFPgh" role="37wK5m">
          <property role="Xl_RC" value="action" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFOW$" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFOW_" role="jymVt">
      <property role="TrG5h" value="TARGET_LINK" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFOWA" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFPgk" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFPgl" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgm" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFPgn" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgo" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFPgp" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="1adDum" id="6kis6yMFPgq" role="37wK5m">
          <property role="1adDun" value="7283007142388106563L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFPgr" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFOWJ" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFOWK" role="jymVt">
      <property role="TrG5h" value="RETURN_TYPE_LINK" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFOWL" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFPgu" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFPgv" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgw" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFPgx" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgy" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFPgz" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="1adDum" id="6kis6yMFPg$" role="37wK5m">
          <property role="1adDun" value="8900000000000000042L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFPg_" role="37wK5m">
          <property role="Xl_RC" value="returnType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFOWU" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFOWV" role="jymVt">
      <property role="TrG5h" value="ENTITY_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFOWW" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFPgC" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFPgD" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgE" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFPgF" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgG" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFPgH" role="37wK5m">
          <property role="1adDun" value="8900000000000000007L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFPgI" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.EntityType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFOX4" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFOX5" role="jymVt">
      <property role="TrG5h" value="VOID_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFOX6" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFPgL" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFPgM" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgN" role="2$L3a6">
            <property role="1adDun" value="936094784427099026L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFPgO" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFPgP" role="2$L3a6">
            <property role="1adDun" value="6608339596220749546L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFPgQ" role="37wK5m">
          <property role="1adDun" value="1068581517677L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFPgR" role="37wK5m">
          <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.VoidType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFOXe" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="6kis6yMFOXf" role="jymVt">
      <property role="TrG5h" value="resultType" />
      <node concept="37vLTG" id="6kis6yMFOXg" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMFOXh" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFOXi" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFOXk" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFOXj" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMFOXl" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFPhO" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFPgU" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFOXg" resolve="invocation" />
              </node>
              <node concept="liA8E" id="6kis6yMFPhP" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="6kis6yMFPhQ" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOWq" resolve="ACTION_LINK" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFOXo" role="3cqZAp">
          <node concept="3y3z36" id="6kis6yMFOXp" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFOXq" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFOXj" resolve="action" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFOXr" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFOXt" role="3clFbx">
            <node concept="1DcWWT" id="6kis6yMFOXu" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMFPi1" role="1DdaDG">
                <node concept="37vLTw" id="6kis6yMFPh1" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMFOXj" resolve="action" />
                </node>
                <node concept="liA8E" id="6kis6yMFPi2" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                  <node concept="37vLTw" id="6kis6yMFPi3" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFOWK" resolve="RETURN_TYPE_LINK" />
                  </node>
                </node>
              </node>
              <node concept="3cpWsn" id="6kis6yMFOXz" role="1Duv9x">
                <property role="TrG5h" value="returnType" />
                <node concept="3uibUv" id="6kis6yMFOX_" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMFOXw" role="2LFqv$">
                <node concept="3cpWs6" id="6kis6yMFOXx" role="3cqZAp">
                  <node concept="37vLTw" id="6kis6yMFOXy" role="3cqZAk">
                    <ref role="3cqZAo" node="6kis6yMFOXz" resolve="returnType" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFOXC" role="3cqZAp">
          <node concept="2YIFZM" id="6kis6yMFPh8" role="3cqZAk">
            <ref role="1Pybhc" to="zce0:~SNodeFactoryOperations" resolve="SNodeFactoryOperations" />
            <ref role="37wK5l" to="zce0:~SNodeFactoryOperations.createNewNode(org.jetbrains.mps.openapi.language.SAbstractConcept,org.jetbrains.mps.openapi.model.SNode)" resolve="createNewNode" />
            <node concept="37vLTw" id="6kis6yMFPh9" role="37wK5m">
              <ref role="3cqZAo" node="6kis6yMFOX5" resolve="VOID_TYPE" />
            </node>
            <node concept="37vLTw" id="6kis6yMFPhc" role="37wK5m">
              <ref role="3cqZAo" node="6kis6yMFOXg" resolve="invocation" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFOXG" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMFOXH" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="6kis6yMFOXI" role="jymVt">
      <property role="TrG5h" value="hasEntityTarget" />
      <node concept="37vLTG" id="6kis6yMFOXJ" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMFOXK" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFOXL" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFOXN" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFOXM" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="6kis6yMFOXO" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFOXP" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFOXQ" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFPid" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFPhf" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFOXJ" resolve="invocation" />
            </node>
            <node concept="liA8E" id="6kis6yMFPie" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFPif" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFOW_" resolve="TARGET_LINK" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFOXY" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <node concept="3uibUv" id="6kis6yMFOY0" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFOXS" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFOXT" role="3cqZAp">
              <node concept="37vLTI" id="6kis6yMFOXU" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFOXV" role="37vLTJ">
                  <ref role="3cqZAo" node="6kis6yMFOXM" resolve="target" />
                </node>
                <node concept="37vLTw" id="6kis6yMFOXW" role="37vLTx">
                  <ref role="3cqZAo" node="6kis6yMFOXY" resolve="child" />
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="6kis6yMFOXX" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFOY3" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFOY4" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFOY5" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFOXM" resolve="target" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFOY6" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFOY8" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFOY9" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMFOYa" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFOYc" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFOYb" role="3cpWs9">
            <property role="TrG5h" value="targetType" />
            <node concept="3uibUv" id="6kis6yMFOYd" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFPiu" role="33vP2m">
              <node concept="2YIFZM" id="6kis6yMFPhu" role="2Oq$k0">
                <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
              </node>
              <node concept="liA8E" id="6kis6yMFPiv" role="2OqNvi">
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getTypeOf(org.jetbrains.mps.openapi.model.SNode)" resolve="getTypeOf" />
                <node concept="37vLTw" id="6kis6yMFPiw" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOXM" resolve="target" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFOYh" role="3cqZAp">
          <node concept="1Wc70l" id="6kis6yMFOYi" role="3cqZAk">
            <node concept="3y3z36" id="6kis6yMFOYj" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFOYk" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFOYb" resolve="targetType" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFOYl" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFPjy" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMFPiN" role="2Oq$k0">
                <node concept="37vLTw" id="6kis6yMFPhD" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMFOYb" resolve="targetType" />
                </node>
                <node concept="liA8E" id="6kis6yMFPiO" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                </node>
              </node>
              <node concept="liA8E" id="6kis6yMFPjz" role="2OqNvi">
                <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                <node concept="37vLTw" id="6kis6yMFPj$" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFOYp" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMFOYq" role="3clF45" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFW5q" role="33b4aj">
      <property role="TrG5h" value="ARGUMENTS_LINK" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFW5r" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFW6i" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFW6j" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6k" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFW6l" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6m" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFW6n" role="37wK5m">
          <property role="1adDun" value="7283007142388106561L" />
        </node>
        <node concept="1adDum" id="6kis6yMFW6o" role="37wK5m">
          <property role="1adDun" value="7283007142388106564L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFW6p" role="37wK5m">
          <property role="Xl_RC" value="arguments" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFW5$" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFW5_" role="33b4aj">
      <property role="TrG5h" value="PARAMETERS_LINK" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFW5A" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFW6s" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFW6t" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6u" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFW6v" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6w" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFW6x" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="1adDum" id="6kis6yMFW6y" role="37wK5m">
          <property role="1adDun" value="8900000000000000025L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFW6z" role="37wK5m">
          <property role="Xl_RC" value="parameters" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFW5J" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFW5K" role="33b4aj">
      <property role="TrG5h" value="ENTITY_ACTIONS" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFW5L" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFW6A" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFW6B" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6C" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFW6D" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6E" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFW6F" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="1adDum" id="6kis6yMFW6G" role="37wK5m">
          <property role="1adDun" value="8900000000000000023L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFW6H" role="37wK5m">
          <property role="Xl_RC" value="actions" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFW5U" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFW5V" role="33b4aj">
      <property role="TrG5h" value="ACTION" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFW5W" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFW6K" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="6kis6yMFW6L" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6M" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFW6N" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6O" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFW6P" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFW6Q" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.Action" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFW64" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFW65" role="33b4aj">
      <property role="TrG5h" value="ACTION_TARGET" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFW66" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFW6T" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMFW6U" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6V" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFW6W" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFW6X" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFW6Y" role="37wK5m">
          <property role="1adDun" value="8900000000000000004L" />
        </node>
        <node concept="1adDum" id="6kis6yMFW6Z" role="37wK5m">
          <property role="1adDun" value="8900000000000000048L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFW70" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFW6f" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="6kis6yMFWL8" role="33b4aj">
      <property role="TrG5h" value="PARAMETER_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMFWL9" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMFWLl" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="6kis6yMFWLm" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFWLn" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMFWLo" role="37wK5m">
          <node concept="1adDum" id="6kis6yMFWLp" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMFWLq" role="37wK5m">
          <property role="1adDun" value="8900000000000000005L" />
        </node>
        <node concept="1adDum" id="6kis6yMFWLr" role="37wK5m">
          <property role="1adDun" value="8900000000000000026L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMFWLs" role="37wK5m">
          <property role="Xl_RC" value="type" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFWLi" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="6kis6yMFXtc" role="WxwA9">
      <property role="TrG5h" value="targetEntity" />
      <node concept="37vLTG" id="6kis6yMFXtd" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMFXte" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFXtf" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFXth" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXtg" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="6kis6yMFXti" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFXtj" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFXtk" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFX_5" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFXy7" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFXtd" resolve="invocation" />
            </node>
            <node concept="liA8E" id="6kis6yMFX_6" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFX_7" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFOW_" resolve="TARGET_LINK" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFXts" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <node concept="3uibUv" id="6kis6yMFXtu" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXtm" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFXtn" role="3cqZAp">
              <node concept="37vLTI" id="6kis6yMFXto" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFXtp" role="37vLTJ">
                  <ref role="3cqZAo" node="6kis6yMFXtg" resolve="target" />
                </node>
                <node concept="37vLTw" id="6kis6yMFXtq" role="37vLTx">
                  <ref role="3cqZAo" node="6kis6yMFXts" resolve="child" />
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="6kis6yMFXtr" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFXtx" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFXty" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFXtz" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFXtg" resolve="target" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFXt$" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFXtA" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFXtB" role="3cqZAp">
              <node concept="10Nm6u" id="6kis6yMFXtC" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXtE" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXtD" role="3cpWs9">
            <property role="TrG5h" value="targetType" />
            <node concept="3uibUv" id="6kis6yMFXtF" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFX_m" role="33vP2m">
              <node concept="2YIFZM" id="6kis6yMFXyk" role="2Oq$k0">
                <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
              </node>
              <node concept="liA8E" id="6kis6yMFX_n" role="2OqNvi">
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getTypeOf(org.jetbrains.mps.openapi.model.SNode)" resolve="getTypeOf" />
                <node concept="37vLTw" id="6kis6yMFX_o" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFXtg" resolve="target" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFXtJ" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMFXtK" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMFXtL" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFXtM" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFXtD" resolve="targetType" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFXtN" role="3uHU7w" />
            </node>
            <node concept="3fqX7Q" id="6kis6yMFXtO" role="3uHU7w">
              <node concept="2OqwBi" id="6kis6yMFXHv" role="3fr31v">
                <node concept="2OqwBi" id="6kis6yMFX_F" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMFXyv" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFXtD" resolve="targetType" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFX_G" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMFXHw" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMFXHx" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXtT" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFXtU" role="3cqZAp">
              <node concept="10Nm6u" id="6kis6yMFXtV" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFXtW" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMG7zo" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMG7zb" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFXtD" />
            </node>
            <node concept="liA8E" id="6kis6yMG7zp" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
              <node concept="37vLTw" id="6kis6yMG7zq" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMG4y3" resolve="ENTITY_TYPE_ENTITY" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMFXtZ" role="1B3o_S" />
      <node concept="3uibUv" id="6kis6yMFXu0" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="6kis6yMFXu1" role="WxwA9">
      <property role="TrG5h" value="hasCorrectArity" />
      <node concept="37vLTG" id="6kis6yMFXu2" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMFXu3" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFXu4" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFXu6" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXu5" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMFXu7" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFXA3" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFXyC" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFXu2" resolve="invocation" />
              </node>
              <node concept="liA8E" id="6kis6yMFXA4" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="6kis6yMFXA5" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOWq" resolve="ACTION_LINK" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFXua" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFXub" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMFXuc" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFXu5" resolve="action" />
            </node>
            <node concept="10Nm6u" id="6kis6yMFXud" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFXuf" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFXug" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMFXuh" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXuj" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXui" role="3cpWs9">
            <property role="TrG5h" value="argumentCount" />
            <node concept="10Oyi0" id="6kis6yMFXuk" role="1tU5fm" />
            <node concept="3cmrfG" id="6kis6yMFXul" role="33vP2m">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFXum" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFXAf" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFXyH" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFXu2" resolve="invocation" />
            </node>
            <node concept="liA8E" id="6kis6yMFXAg" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFXAh" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFW5q" resolve="ARGUMENTS_LINK" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFXus" role="1Duv9x">
            <property role="TrG5h" value="ignored" />
            <node concept="3uibUv" id="6kis6yMFXuu" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXuo" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFXup" role="3cqZAp">
              <node concept="3uNrnE" id="6kis6yMFXuq" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFXur" role="2$L3a6">
                  <ref role="3cqZAo" node="6kis6yMFXui" resolve="argumentCount" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXuy" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXux" role="3cpWs9">
            <property role="TrG5h" value="parameterCount" />
            <node concept="10Oyi0" id="6kis6yMFXuz" role="1tU5fm" />
            <node concept="3cmrfG" id="6kis6yMFXu$" role="33vP2m">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFXu_" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFXAs" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFXyM" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFXu5" resolve="action" />
            </node>
            <node concept="liA8E" id="6kis6yMFXAt" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFXAu" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFW5_" resolve="PARAMETERS_LINK" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFXuF" role="1Duv9x">
            <property role="TrG5h" value="ignored" />
            <node concept="3uibUv" id="6kis6yMFXuH" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXuB" role="2LFqv$">
            <node concept="3clFbF" id="6kis6yMFXuC" role="3cqZAp">
              <node concept="3uNrnE" id="6kis6yMFXuD" role="3clFbG">
                <node concept="37vLTw" id="6kis6yMFXuE" role="2$L3a6">
                  <ref role="3cqZAo" node="6kis6yMFXux" resolve="parameterCount" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFXuK" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMFXuL" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMFXuM" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFXui" resolve="argumentCount" />
            </node>
            <node concept="37vLTw" id="6kis6yMFXuN" role="3uHU7w">
              <ref role="3cqZAo" node="6kis6yMFXux" resolve="parameterCount" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFXuO" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMFXuP" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMKpAC" role="WxwA9">
      <property role="TrG5h" value="hasCompatibleArguments" />
      <node concept="37vLTG" id="6kis6yMKpAD" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMKpAE" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMKpAF" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMKpAH" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpAG" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMKpAI" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMKpIj" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMKpEO" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMKpAD" resolve="invocation" />
              </node>
              <node concept="liA8E" id="6kis6yMKpIk" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="6kis6yMKpIl" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOWq" resolve="ACTION_LINK" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMKpAL" role="3cqZAp">
          <node concept="3clFbC" id="6kis6yMKpAM" role="3clFbw">
            <node concept="37vLTw" id="6kis6yMKpAN" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMKpAG" resolve="action" />
            </node>
            <node concept="10Nm6u" id="6kis6yMKpAO" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMKpAQ" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMKpAR" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMKpAS" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpAU" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpAT" role="3cpWs9">
            <property role="TrG5h" value="actionVariableReference" />
            <node concept="3uibUv" id="6kis6yMKpAV" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
            </node>
            <node concept="2YIFZM" id="6kis6yMKpET" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
              <node concept="1ZRNhn" id="6kis6yMKpEU" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpEV" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="6kis6yMKpEW" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpEX" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="6kis6yMKpEY" role="37wK5m">
                <property role="1adDun" value="5455126814596559395L" />
              </node>
              <node concept="Xl_RD" id="6kis6yMKpEZ" role="37wK5m">
                <property role="Xl_RC" value="causeway.structure.ActionVariableReference" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpB4" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpB3" role="3cpWs9">
            <property role="TrG5h" value="actionVariable" />
            <node concept="3uibUv" id="6kis6yMKpB5" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
            </node>
            <node concept="2YIFZM" id="6kis6yMKpF2" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
              <node concept="1ZRNhn" id="6kis6yMKpF3" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpF4" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="6kis6yMKpF5" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpF6" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="6kis6yMKpF7" role="37wK5m">
                <property role="1adDun" value="5455126814596559395L" />
              </node>
              <node concept="1adDum" id="6kis6yMKpF8" role="37wK5m">
                <property role="1adDun" value="5455126814596559396L" />
              </node>
              <node concept="Xl_RD" id="6kis6yMKpF9" role="37wK5m">
                <property role="Xl_RC" value="variable" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpBf" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpBe" role="3cpWs9">
            <property role="TrG5h" value="javaTypeWrapper" />
            <node concept="3uibUv" id="6kis6yMKpBg" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
            </node>
            <node concept="2YIFZM" id="6kis6yMKpFc" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
              <node concept="1ZRNhn" id="6kis6yMKpFd" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpFe" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="6kis6yMKpFf" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpFg" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="6kis6yMKpFh" role="37wK5m">
                <property role="1adDun" value="8900000000000000008L" />
              </node>
              <node concept="Xl_RD" id="6kis6yMKpFi" role="37wK5m">
                <property role="Xl_RC" value="causeway.structure.JavaType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpBp" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpBo" role="3cpWs9">
            <property role="TrG5h" value="wrappedJavaType" />
            <node concept="3uibUv" id="6kis6yMKpBq" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="org.jetbrains.mps.openapi.language.SContainmentLink" />
            </node>
            <node concept="2YIFZM" id="6kis6yMKpFl" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
              <node concept="1ZRNhn" id="6kis6yMKpFm" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpFn" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="6kis6yMKpFo" role="37wK5m">
                <node concept="1adDum" id="6kis6yMKpFp" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="6kis6yMKpFq" role="37wK5m">
                <property role="1adDun" value="8900000000000000008L" />
              </node>
              <node concept="1adDum" id="6kis6yMKpFr" role="37wK5m">
                <property role="1adDun" value="8900000000000000032L" />
              </node>
              <node concept="Xl_RD" id="6kis6yMKpFs" role="37wK5m">
                <property role="Xl_RC" value="javaType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpB$" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpBz" role="3cpWs9">
            <property role="TrG5h" value="arguments" />
            <node concept="3uibUv" id="6kis6yMKpB_" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~Iterator" resolve="java.util.Iterator" />
              <node concept="3qUE_q" id="6kis6yMKpBB" role="11_B2D">
                <node concept="3uibUv" id="6kis6yMKpBA" role="3qUE_r">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="6kis6yMKpTB" role="33vP2m">
              <node concept="2OqwBi" id="6kis6yMKpIB" role="2Oq$k0">
                <node concept="37vLTw" id="6kis6yMKpFB" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMKpAD" resolve="invocation" />
                </node>
                <node concept="liA8E" id="6kis6yMKpIC" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                  <node concept="37vLTw" id="6kis6yMKpID" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFW5q" resolve="ARGUMENTS_LINK" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="6kis6yMKpTC" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~Iterable.iterator()" resolve="iterator" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMKpBG" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMKpBF" role="3cpWs9">
            <property role="TrG5h" value="parameters" />
            <node concept="3uibUv" id="6kis6yMKpBH" role="1tU5fm">
              <ref role="3uigEE" to="33ny:~Iterator" resolve="java.util.Iterator" />
              <node concept="3qUE_q" id="6kis6yMKpBJ" role="11_B2D">
                <node concept="3uibUv" id="6kis6yMKpBI" role="3qUE_r">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
              </node>
            </node>
            <node concept="2OqwBi" id="6kis6yMKpXu" role="33vP2m">
              <node concept="2OqwBi" id="6kis6yMKpIW" role="2Oq$k0">
                <node concept="37vLTw" id="6kis6yMKpFO" role="2Oq$k0">
                  <ref role="3cqZAo" node="6kis6yMKpAG" resolve="action" />
                </node>
                <node concept="liA8E" id="6kis6yMKpIX" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                  <node concept="37vLTw" id="6kis6yMKpIY" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFW5_" resolve="PARAMETERS_LINK" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="6kis6yMKpXv" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~Iterable.iterator()" resolve="iterator" />
              </node>
            </node>
          </node>
        </node>
        <node concept="2$JKZl" id="6kis6yMKpEj" role="3cqZAp">
          <node concept="1Wc70l" id="6kis6yMKpBN" role="2$JKZa">
            <node concept="2OqwBi" id="6kis6yMKpJZ" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMKpFT" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMKpBz" resolve="arguments" />
              </node>
              <node concept="liA8E" id="6kis6yMKpK0" role="2OqNvi">
                <ref role="37wK5l" to="33ny:~Iterator.hasNext()" resolve="hasNext" />
              </node>
            </node>
            <node concept="2OqwBi" id="6kis6yMKpL1" role="3uHU7w">
              <node concept="37vLTw" id="6kis6yMKpFX" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMKpBF" resolve="parameters" />
              </node>
              <node concept="liA8E" id="6kis6yMKpL2" role="2OqNvi">
                <ref role="37wK5l" to="33ny:~Iterator.hasNext()" resolve="hasNext" />
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMKpBR" role="2LFqv$">
            <node concept="3cpWs8" id="6kis6yMKpBT" role="3cqZAp">
              <node concept="3cpWsn" id="6kis6yMKpBS" role="3cpWs9">
                <property role="TrG5h" value="argument" />
                <node concept="3uibUv" id="6kis6yMKpBU" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="2OqwBi" id="6kis6yMKpM3" role="33vP2m">
                  <node concept="37vLTw" id="6kis6yMKpG1" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMKpBz" resolve="arguments" />
                  </node>
                  <node concept="liA8E" id="6kis6yMKpM4" role="2OqNvi">
                    <ref role="37wK5l" to="33ny:~Iterator.next()" resolve="next" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="6kis6yMKpBX" role="3cqZAp">
              <node concept="3cpWsn" id="6kis6yMKpBW" role="3cpWs9">
                <property role="TrG5h" value="argumentType" />
                <node concept="3uibUv" id="6kis6yMKpBY" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="2OqwBi" id="6kis6yMKpMj" role="33vP2m">
                  <node concept="2YIFZM" id="6kis6yMKpGd" role="2Oq$k0">
                    <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                    <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
                  </node>
                  <node concept="liA8E" id="6kis6yMKpMk" role="2OqNvi">
                    <ref role="37wK5l" to="1ka:~TypecheckingFacade.getTypeOf(org.jetbrains.mps.openapi.model.SNode)" resolve="getTypeOf" />
                    <node concept="37vLTw" id="6kis6yMKpMl" role="37wK5m">
                      <ref role="3cqZAo" node="6kis6yMKpBS" resolve="argument" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="6kis6yMKpC3" role="3cqZAp">
              <node concept="3cpWsn" id="6kis6yMKpC2" role="3cpWs9">
                <property role="TrG5h" value="declaredArgumentType" />
                <node concept="3uibUv" id="6kis6yMKpC4" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="10Nm6u" id="6kis6yMKpC5" role="33vP2m" />
              </node>
            </node>
            <node concept="3clFbJ" id="6kis6yMKpC6" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMKpYt" role="3clFbw">
                <node concept="2OqwBi" id="6kis6yMKpMC" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMKpGo" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMKpBS" resolve="argument" />
                  </node>
                  <node concept="liA8E" id="6kis6yMKpMD" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMKpYu" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                  <node concept="37vLTw" id="6kis6yMKpYv" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMKpAT" resolve="actionVariableReference" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMKpCb" role="3clFbx">
                <node concept="3cpWs8" id="6kis6yMKpCd" role="3cqZAp">
                  <node concept="3cpWsn" id="6kis6yMKpCc" role="3cpWs9">
                    <property role="TrG5h" value="variable" />
                    <node concept="3uibUv" id="6kis6yMKpCe" role="1tU5fm">
                      <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                    </node>
                    <node concept="2OqwBi" id="6kis6yMKpMO" role="33vP2m">
                      <node concept="37vLTw" id="6kis6yMKpGs" role="2Oq$k0">
                        <ref role="3cqZAo" node="6kis6yMKpBS" resolve="argument" />
                      </node>
                      <node concept="liA8E" id="6kis6yMKpMP" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                        <node concept="37vLTw" id="6kis6yMKpMQ" role="37wK5m">
                          <ref role="3cqZAo" node="6kis6yMKpB3" resolve="actionVariable" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbJ" id="6kis6yMKpCh" role="3cqZAp">
                  <node concept="3y3z36" id="6kis6yMKpCi" role="3clFbw">
                    <node concept="37vLTw" id="6kis6yMKpCj" role="3uHU7B">
                      <ref role="3cqZAo" node="6kis6yMKpCc" resolve="variable" />
                    </node>
                    <node concept="10Nm6u" id="6kis6yMKpCk" role="3uHU7w" />
                  </node>
                  <node concept="3clFbS" id="6kis6yMKpCm" role="3clFbx">
                    <node concept="1DcWWT" id="6kis6yMKpCn" role="3cqZAp">
                      <node concept="2OqwBi" id="6kis6yMKpN1" role="1DdaDG">
                        <node concept="37vLTw" id="6kis6yMKpGx" role="2Oq$k0">
                          <ref role="3cqZAo" node="6kis6yMKpCc" resolve="variable" />
                        </node>
                        <node concept="liA8E" id="6kis6yMKpN2" role="2OqNvi">
                          <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                          <node concept="37vLTw" id="6kis6yMKpN3" role="37wK5m">
                            <ref role="3cqZAo" node="6kis6yMFWL8" resolve="PARAMETER_TYPE" />
                          </node>
                        </node>
                      </node>
                      <node concept="3cpWsn" id="6kis6yMKpCv" role="1Duv9x">
                        <property role="TrG5h" value="child" />
                        <node concept="3uibUv" id="6kis6yMKpCx" role="1tU5fm">
                          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                        </node>
                      </node>
                      <node concept="3clFbS" id="6kis6yMKpCp" role="2LFqv$">
                        <node concept="3clFbF" id="6kis6yMKpCq" role="3cqZAp">
                          <node concept="37vLTI" id="6kis6yMKpCr" role="3clFbG">
                            <node concept="37vLTw" id="6kis6yMKpCs" role="37vLTJ">
                              <ref role="3cqZAo" node="6kis6yMKpC2" resolve="declaredArgumentType" />
                            </node>
                            <node concept="37vLTw" id="6kis6yMKpCt" role="37vLTx">
                              <ref role="3cqZAo" node="6kis6yMKpCv" resolve="child" />
                            </node>
                          </node>
                        </node>
                        <node concept="3zACq4" id="6kis6yMKpCu" role="3cqZAp" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="6kis6yMKpC_" role="3cqZAp">
              <node concept="3cpWsn" id="6kis6yMKpC$" role="3cpWs9">
                <property role="TrG5h" value="parameterType" />
                <node concept="3uibUv" id="6kis6yMKpCA" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="10Nm6u" id="6kis6yMKpCB" role="33vP2m" />
              </node>
            </node>
            <node concept="1DcWWT" id="6kis6yMKpCC" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMKpZx" role="1DdaDG">
                <node concept="2OqwBi" id="6kis6yMKpOc" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMKpGI" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMKpBF" resolve="parameters" />
                  </node>
                  <node concept="liA8E" id="6kis6yMKpOd" role="2OqNvi">
                    <ref role="37wK5l" to="33ny:~Iterator.next()" resolve="next" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMKpZy" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                  <node concept="37vLTw" id="6kis6yMKpZz" role="37wK5m">
                    <ref role="3cqZAo" node="6kis6yMFWL8" resolve="PARAMETER_TYPE" />
                  </node>
                </node>
              </node>
              <node concept="3cpWsn" id="6kis6yMKpCK" role="1Duv9x">
                <property role="TrG5h" value="child" />
                <node concept="3uibUv" id="6kis6yMKpCM" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMKpCE" role="2LFqv$">
                <node concept="3clFbF" id="6kis6yMKpCF" role="3cqZAp">
                  <node concept="37vLTI" id="6kis6yMKpCG" role="3clFbG">
                    <node concept="37vLTw" id="6kis6yMKpCH" role="37vLTJ">
                      <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                    </node>
                    <node concept="37vLTw" id="6kis6yMKpCI" role="37vLTx">
                      <ref role="3cqZAo" node="6kis6yMKpCK" resolve="child" />
                    </node>
                  </node>
                </node>
                <node concept="3zACq4" id="6kis6yMKpCJ" role="3cqZAp" />
              </node>
            </node>
            <node concept="3cpWs8" id="6kis6yMKpCR" role="3cqZAp">
              <node concept="3cpWsn" id="6kis6yMKpCQ" role="3cpWs9">
                <property role="TrG5h" value="effectiveParameterType" />
                <node concept="3uibUv" id="6kis6yMKpCS" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="37vLTw" id="6kis6yMKpCT" role="33vP2m">
                  <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="6kis6yMKpCU" role="3cqZAp">
              <node concept="1Wc70l" id="6kis6yMKpCV" role="3clFbw">
                <node concept="3y3z36" id="6kis6yMKpCW" role="3uHU7B">
                  <node concept="37vLTw" id="6kis6yMKpCX" role="3uHU7B">
                    <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                  </node>
                  <node concept="10Nm6u" id="6kis6yMKpCY" role="3uHU7w" />
                </node>
                <node concept="2OqwBi" id="6kis6yMKpZS" role="3uHU7w">
                  <node concept="2OqwBi" id="6kis6yMKpOw" role="2Oq$k0">
                    <node concept="37vLTw" id="6kis6yMKpGU" role="2Oq$k0">
                      <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                    </node>
                    <node concept="liA8E" id="6kis6yMKpOx" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                    </node>
                  </node>
                  <node concept="liA8E" id="6kis6yMKpZT" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                    <node concept="37vLTw" id="6kis6yMKpZU" role="37wK5m">
                      <ref role="3cqZAo" node="6kis6yMKpBe" resolve="javaTypeWrapper" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMKpD3" role="3clFbx">
                <node concept="1DcWWT" id="6kis6yMKpD4" role="3cqZAp">
                  <node concept="2OqwBi" id="6kis6yMKpOG" role="1DdaDG">
                    <node concept="37vLTw" id="6kis6yMKpGY" role="2Oq$k0">
                      <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                    </node>
                    <node concept="liA8E" id="6kis6yMKpOH" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
                      <node concept="37vLTw" id="6kis6yMKpOI" role="37wK5m">
                        <ref role="3cqZAo" node="6kis6yMKpBo" resolve="wrappedJavaType" />
                      </node>
                    </node>
                  </node>
                  <node concept="3cpWsn" id="6kis6yMKpDc" role="1Duv9x">
                    <property role="TrG5h" value="child" />
                    <node concept="3uibUv" id="6kis6yMKpDe" role="1tU5fm">
                      <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                    </node>
                  </node>
                  <node concept="3clFbS" id="6kis6yMKpD6" role="2LFqv$">
                    <node concept="3clFbF" id="6kis6yMKpD7" role="3cqZAp">
                      <node concept="37vLTI" id="6kis6yMKpD8" role="3clFbG">
                        <node concept="37vLTw" id="6kis6yMKpD9" role="37vLTJ">
                          <ref role="3cqZAo" node="6kis6yMKpCQ" resolve="effectiveParameterType" />
                        </node>
                        <node concept="37vLTw" id="6kis6yMKpDa" role="37vLTx">
                          <ref role="3cqZAo" node="6kis6yMKpDc" resolve="child" />
                        </node>
                      </node>
                    </node>
                    <node concept="3zACq4" id="6kis6yMKpDb" role="3cqZAp" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbJ" id="6kis6yMKpDh" role="3cqZAp">
              <node concept="1Wc70l" id="6kis6yMKpDi" role="3clFbw">
                <node concept="1Wc70l" id="6kis6yMKpDj" role="3uHU7B">
                  <node concept="3y3z36" id="6kis6yMKpDk" role="3uHU7B">
                    <node concept="37vLTw" id="6kis6yMKpDl" role="3uHU7B">
                      <ref role="3cqZAo" node="6kis6yMKpBW" resolve="argumentType" />
                    </node>
                    <node concept="10Nm6u" id="6kis6yMKpDm" role="3uHU7w" />
                  </node>
                  <node concept="3y3z36" id="6kis6yMKpDn" role="3uHU7w">
                    <node concept="37vLTw" id="6kis6yMKpDo" role="3uHU7B">
                      <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                    </node>
                    <node concept="10Nm6u" id="6kis6yMKpDp" role="3uHU7w" />
                  </node>
                </node>
                <node concept="3y3z36" id="6kis6yMKpDq" role="3uHU7w">
                  <node concept="37vLTw" id="6kis6yMKpDr" role="3uHU7B">
                    <ref role="3cqZAo" node="6kis6yMKpCQ" resolve="effectiveParameterType" />
                  </node>
                  <node concept="10Nm6u" id="6kis6yMKpDs" role="3uHU7w" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMKpDu" role="3clFbx">
                <node concept="3cpWs8" id="6kis6yMKpDw" role="3cqZAp">
                  <node concept="3cpWsn" id="6kis6yMKpDv" role="3cpWs9">
                    <property role="TrG5h" value="matchingEntityType" />
                    <node concept="10P_77" id="6kis6yMKpDx" role="1tU5fm" />
                    <node concept="1Wc70l" id="6kis6yMKpDy" role="33vP2m">
                      <node concept="1Wc70l" id="6kis6yMKpDz" role="3uHU7B">
                        <node concept="2OqwBi" id="6kis6yMKq1h" role="3uHU7B">
                          <node concept="2OqwBi" id="6kis6yMKpP1" role="2Oq$k0">
                            <node concept="37vLTw" id="6kis6yMKpHb" role="2Oq$k0">
                              <ref role="3cqZAo" node="6kis6yMKpBW" resolve="argumentType" />
                            </node>
                            <node concept="liA8E" id="6kis6yMKpP2" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                            </node>
                          </node>
                          <node concept="liA8E" id="6kis6yMKq1i" role="2OqNvi">
                            <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                            <node concept="37vLTw" id="6kis6yMKq1j" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                            </node>
                          </node>
                        </node>
                        <node concept="2OqwBi" id="6kis6yMKq1C" role="3uHU7w">
                          <node concept="2OqwBi" id="6kis6yMKpPl" role="2Oq$k0">
                            <node concept="37vLTw" id="6kis6yMKpHn" role="2Oq$k0">
                              <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                            </node>
                            <node concept="liA8E" id="6kis6yMKpPm" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                            </node>
                          </node>
                          <node concept="liA8E" id="6kis6yMKq1D" role="2OqNvi">
                            <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                            <node concept="37vLTw" id="6kis6yMKq1E" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="2YIFZM" id="6kis6yMKpHr" role="3uHU7w">
                        <ref role="1Pybhc" to="33ny:~Objects" resolve="Objects" />
                        <ref role="37wK5l" to="33ny:~Objects.equals(java.lang.Object,java.lang.Object)" resolve="equals" />
                        <node concept="2OqwBi" id="6kis6yMKq1P" role="37wK5m">
                          <node concept="37vLTw" id="6kis6yMKpPp" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMKpBW" resolve="argumentType" />
                          </node>
                          <node concept="liA8E" id="6kis6yMKq1Q" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                            <node concept="37vLTw" id="6kis6yMKq1R" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMG4y3" resolve="ENTITY_TYPE_ENTITY" />
                            </node>
                          </node>
                        </node>
                        <node concept="2OqwBi" id="6kis6yMKq22" role="37wK5m">
                          <node concept="37vLTw" id="6kis6yMKpPu" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                          </node>
                          <node concept="liA8E" id="6kis6yMKq23" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                            <node concept="37vLTw" id="6kis6yMKq24" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMG4y3" resolve="ENTITY_TYPE_ENTITY" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3cpWs8" id="6kis6yMKpDK" role="3cqZAp">
                  <node concept="3cpWsn" id="6kis6yMKpDJ" role="3cpWs9">
                    <property role="TrG5h" value="matchingDeclaredEntityType" />
                    <node concept="10P_77" id="6kis6yMKpDL" role="1tU5fm" />
                    <node concept="1Wc70l" id="6kis6yMKpDM" role="33vP2m">
                      <node concept="1Wc70l" id="6kis6yMKpDN" role="3uHU7B">
                        <node concept="1Wc70l" id="6kis6yMKpDO" role="3uHU7B">
                          <node concept="3y3z36" id="6kis6yMKpDP" role="3uHU7B">
                            <node concept="37vLTw" id="6kis6yMKpDQ" role="3uHU7B">
                              <ref role="3cqZAo" node="6kis6yMKpC2" resolve="declaredArgumentType" />
                            </node>
                            <node concept="10Nm6u" id="6kis6yMKpDR" role="3uHU7w" />
                          </node>
                          <node concept="2OqwBi" id="6kis6yMKq2p" role="3uHU7w">
                            <node concept="2OqwBi" id="6kis6yMKpPN" role="2Oq$k0">
                              <node concept="37vLTw" id="6kis6yMKpHE" role="2Oq$k0">
                                <ref role="3cqZAo" node="6kis6yMKpC2" resolve="declaredArgumentType" />
                              </node>
                              <node concept="liA8E" id="6kis6yMKpPO" role="2OqNvi">
                                <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                              </node>
                            </node>
                            <node concept="liA8E" id="6kis6yMKq2q" role="2OqNvi">
                              <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                              <node concept="37vLTw" id="6kis6yMKq2r" role="37wK5m">
                                <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="2OqwBi" id="6kis6yMKq2K" role="3uHU7w">
                          <node concept="2OqwBi" id="6kis6yMKpQ7" role="2Oq$k0">
                            <node concept="37vLTw" id="6kis6yMKpHQ" role="2Oq$k0">
                              <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                            </node>
                            <node concept="liA8E" id="6kis6yMKpQ8" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                            </node>
                          </node>
                          <node concept="liA8E" id="6kis6yMKq2L" role="2OqNvi">
                            <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                            <node concept="37vLTw" id="6kis6yMKq2M" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMFOWV" resolve="ENTITY_TYPE" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="2YIFZM" id="6kis6yMKpHU" role="3uHU7w">
                        <ref role="1Pybhc" to="33ny:~Objects" resolve="Objects" />
                        <ref role="37wK5l" to="33ny:~Objects.equals(java.lang.Object,java.lang.Object)" resolve="equals" />
                        <node concept="2OqwBi" id="6kis6yMKq2X" role="37wK5m">
                          <node concept="37vLTw" id="6kis6yMKpQb" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMKpC2" resolve="declaredArgumentType" />
                          </node>
                          <node concept="liA8E" id="6kis6yMKq2Y" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                            <node concept="37vLTw" id="6kis6yMKq2Z" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMG4y3" resolve="ENTITY_TYPE_ENTITY" />
                            </node>
                          </node>
                        </node>
                        <node concept="2OqwBi" id="6kis6yMKq3a" role="37wK5m">
                          <node concept="37vLTw" id="6kis6yMKpQg" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMKpC$" resolve="parameterType" />
                          </node>
                          <node concept="liA8E" id="6kis6yMKq3b" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                            <node concept="37vLTw" id="6kis6yMKq3c" role="37wK5m">
                              <ref role="3cqZAo" node="6kis6yMG4y3" resolve="ENTITY_TYPE_ENTITY" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3clFbJ" id="6kis6yMKpE3" role="3cqZAp">
                  <node concept="1Wc70l" id="6kis6yMKpE4" role="3clFbw">
                    <node concept="1Wc70l" id="6kis6yMKpE5" role="3uHU7B">
                      <node concept="3fqX7Q" id="6kis6yMKpE6" role="3uHU7B">
                        <node concept="37vLTw" id="6kis6yMKpE7" role="3fr31v">
                          <ref role="3cqZAo" node="6kis6yMKpDv" resolve="matchingEntityType" />
                        </node>
                      </node>
                      <node concept="3fqX7Q" id="6kis6yMKpE8" role="3uHU7w">
                        <node concept="37vLTw" id="6kis6yMKpE9" role="3fr31v">
                          <ref role="3cqZAo" node="6kis6yMKpDJ" resolve="matchingDeclaredEntityType" />
                        </node>
                      </node>
                    </node>
                    <node concept="3fqX7Q" id="6kis6yMKpEa" role="3uHU7w">
                      <node concept="2OqwBi" id="6kis6yMKpQx" role="3fr31v">
                        <node concept="2YIFZM" id="6kis6yMKpI9" role="2Oq$k0">
                          <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                          <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
                        </node>
                        <node concept="liA8E" id="6kis6yMKpQy" role="2OqNvi">
                          <ref role="37wK5l" to="1ka:~TypecheckingFacade.convertsTo(org.jetbrains.mps.openapi.model.SNode,org.jetbrains.mps.openapi.model.SNode)" resolve="convertsTo" />
                          <node concept="37vLTw" id="6kis6yMKpQz" role="37wK5m">
                            <ref role="3cqZAo" node="6kis6yMKpBW" resolve="argumentType" />
                          </node>
                          <node concept="37vLTw" id="6kis6yMKpQ$" role="37wK5m">
                            <ref role="3cqZAo" node="6kis6yMKpCQ" resolve="effectiveParameterType" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="6kis6yMKpEg" role="3clFbx">
                    <node concept="3cpWs6" id="6kis6yMKpEh" role="3cqZAp">
                      <node concept="3clFbT" id="6kis6yMKpEi" role="3cqZAk" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMKpEk" role="3cqZAp">
          <node concept="3clFbT" id="6kis6yMKpEl" role="3cqZAk">
            <property role="3clFbU" value="true" />
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMKpEm" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMKpEn" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="6kis6yMFXwb" role="WxwA9">
      <property role="TrG5h" value="hasAmbiguousAction" />
      <node concept="37vLTG" id="6kis6yMFXwc" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="6kis6yMFXwd" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="6kis6yMFXwe" role="3clF47">
        <node concept="3cpWs8" id="6kis6yMFXwg" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXwf" role="3cpWs9">
            <property role="TrG5h" value="selected" />
            <node concept="3uibUv" id="6kis6yMFXwh" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFXFf" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFX$4" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFXwc" resolve="invocation" />
              </node>
              <node concept="liA8E" id="6kis6yMFXFg" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="6kis6yMFXFh" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFOWq" resolve="ACTION_LINK" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXwl" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXwk" role="3cpWs9">
            <property role="TrG5h" value="entity" />
            <node concept="3uibUv" id="6kis6yMFXwm" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="1rXfSq" id="6kis6yMFXwn" role="33vP2m">
              <ref role="37wK5l" node="6kis6yMFXtc" resolve="targetEntity" />
              <node concept="37vLTw" id="6kis6yMFXwo" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFXwc" resolve="invocation" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFXwp" role="3cqZAp">
          <node concept="22lmx$" id="6kis6yMFXwq" role="3clFbw">
            <node concept="3clFbC" id="6kis6yMFXwr" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFXws" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFXwf" resolve="selected" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFXwt" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="6kis6yMFXwu" role="3uHU7w">
              <node concept="37vLTw" id="6kis6yMFXwv" role="3uHU7B">
                <ref role="3cqZAo" node="6kis6yMFXwk" resolve="entity" />
              </node>
              <node concept="10Nm6u" id="6kis6yMFXww" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXwy" role="3clFbx">
            <node concept="3cpWs6" id="6kis6yMFXwz" role="3cqZAp">
              <node concept="3clFbT" id="6kis6yMFXw$" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXwA" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXw_" role="3cpWs9">
            <property role="TrG5h" value="name" />
            <node concept="3uibUv" id="6kis6yMFXwB" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="2OqwBi" id="6kis6yMFXFs" role="33vP2m">
              <node concept="37vLTw" id="6kis6yMFX$9" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFXwf" resolve="selected" />
              </node>
              <node concept="liA8E" id="6kis6yMFXFt" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6kis6yMFXwE" role="3cqZAp">
          <node concept="3cpWsn" id="6kis6yMFXwD" role="3cpWs9">
            <property role="TrG5h" value="matching" />
            <node concept="10Oyi0" id="6kis6yMFXwF" role="1tU5fm" />
            <node concept="3cmrfG" id="6kis6yMFXwG" role="33vP2m">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="6kis6yMFXwH" role="3cqZAp">
          <node concept="2OqwBi" id="6kis6yMFXFC" role="1DdaDG">
            <node concept="37vLTw" id="6kis6yMFX$d" role="2Oq$k0">
              <ref role="3cqZAo" node="6kis6yMFXwk" resolve="entity" />
            </node>
            <node concept="liA8E" id="6kis6yMFXFD" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="6kis6yMFXFE" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFW5K" resolve="ENTITY_ACTIONS" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="6kis6yMFXwT" role="1Duv9x">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6kis6yMFXwV" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="6kis6yMFXwJ" role="2LFqv$">
            <node concept="3clFbJ" id="6kis6yMFXwK" role="3cqZAp">
              <node concept="2YIFZM" id="6kis6yMFX$i" role="3clFbw">
                <ref role="1Pybhc" to="33ny:~Objects" resolve="Objects" />
                <ref role="37wK5l" to="33ny:~Objects.equals(java.lang.Object,java.lang.Object)" resolve="equals" />
                <node concept="37vLTw" id="6kis6yMFX$j" role="37wK5m">
                  <ref role="3cqZAo" node="6kis6yMFXw_" resolve="name" />
                </node>
                <node concept="2OqwBi" id="6kis6yMFXQG" role="37wK5m">
                  <node concept="37vLTw" id="6kis6yMFXFH" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFXwT" resolve="action" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFXQH" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMFXwP" role="3clFbx">
                <node concept="3clFbF" id="6kis6yMFXwQ" role="3cqZAp">
                  <node concept="3uNrnE" id="6kis6yMFXwR" role="3clFbG">
                    <node concept="37vLTw" id="6kis6yMFXwS" role="2$L3a6">
                      <ref role="3cqZAo" node="6kis6yMFXwD" resolve="matching" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="6kis6yMFXwY" role="3cqZAp">
          <node concept="3y3z36" id="6kis6yMFXwZ" role="3clFbw">
            <node concept="2OqwBi" id="6kis6yMFXFS" role="3uHU7B">
              <node concept="37vLTw" id="6kis6yMFX$n" role="2Oq$k0">
                <ref role="3cqZAo" node="6kis6yMFXwc" resolve="invocation" />
              </node>
              <node concept="liA8E" id="6kis6yMFXFT" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
              </node>
            </node>
            <node concept="10Nm6u" id="6kis6yMFXx1" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="6kis6yMFXx3" role="3clFbx">
            <node concept="1DcWWT" id="6kis6yMFXx4" role="3cqZAp">
              <node concept="2OqwBi" id="6kis6yMFXQZ" role="1DdaDG">
                <node concept="2OqwBi" id="6kis6yMFXGb" role="2Oq$k0">
                  <node concept="37vLTw" id="6kis6yMFX$z" role="2Oq$k0">
                    <ref role="3cqZAo" node="6kis6yMFXwc" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="6kis6yMFXGc" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                  </node>
                </node>
                <node concept="liA8E" id="6kis6yMFXR0" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SModel.getRootNodes()" resolve="getRootNodes" />
                </node>
              </node>
              <node concept="3cpWsn" id="6kis6yMFXxo" role="1Duv9x">
                <property role="TrG5h" value="root" />
                <node concept="3uibUv" id="6kis6yMFXxq" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="6kis6yMFXx6" role="2LFqv$">
                <node concept="3clFbJ" id="6kis6yMFXx7" role="3cqZAp">
                  <node concept="1Wc70l" id="6kis6yMFXx8" role="3clFbw">
                    <node concept="1Wc70l" id="6kis6yMFXx9" role="3uHU7B">
                      <node concept="2OqwBi" id="6kis6yMFXRi" role="3uHU7B">
                        <node concept="2OqwBi" id="6kis6yMFXGu" role="2Oq$k0">
                          <node concept="37vLTw" id="6kis6yMFX$J" role="2Oq$k0">
                            <ref role="3cqZAo" node="6kis6yMFXxo" resolve="root" />
                          </node>
                          <node concept="liA8E" id="6kis6yMFXGv" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                          </node>
                        </node>
                        <node concept="liA8E" id="6kis6yMFXRj" role="2OqNvi">
                          <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                          <node concept="37vLTw" id="6kis6yMFXRk" role="37wK5m">
                            <ref role="3cqZAo" node="6kis6yMFW5V" resolve="ACTION" />
                          </node>
                        </node>
                      </node>
                      <node concept="2OqwBi" id="6kis6yMFXGE" role="3uHU7w">
                        <node concept="37vLTw" id="6kis6yMFX$N" role="2Oq$k0">
                          <ref role="3cqZAo" node="6kis6yMFXwk" resolve="entity" />
                        </node>
                        <node concept="liA8E" id="6kis6yMFXGF" role="2OqNvi">
                          <ref role="37wK5l" to="wyt6:~Object.equals(java.lang.Object)" resolve="equals" />
                          <node concept="2OqwBi" id="6kis6yMFXRI" role="37wK5m">
                            <node concept="37vLTw" id="6kis6yMFXRn" role="2Oq$k0">
                              <ref role="3cqZAo" node="6kis6yMFXxo" resolve="root" />
                            </node>
                            <node concept="liA8E" id="6kis6yMFXRJ" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                              <node concept="37vLTw" id="6kis6yMFXRK" role="37wK5m">
                                <ref role="3cqZAo" node="6kis6yMFW65" resolve="ACTION_TARGET" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="2YIFZM" id="6kis6yMFX$T" role="3uHU7w">
                      <ref role="1Pybhc" to="33ny:~Objects" resolve="Objects" />
                      <ref role="37wK5l" to="33ny:~Objects.equals(java.lang.Object,java.lang.Object)" resolve="equals" />
                      <node concept="37vLTw" id="6kis6yMFX$U" role="37wK5m">
                        <ref role="3cqZAo" node="6kis6yMFXw_" resolve="name" />
                      </node>
                      <node concept="2OqwBi" id="6kis6yMFXRz" role="37wK5m">
                        <node concept="37vLTw" id="6kis6yMFXGK" role="2Oq$k0">
                          <ref role="3cqZAo" node="6kis6yMFXxo" resolve="root" />
                        </node>
                        <node concept="liA8E" id="6kis6yMFXR$" role="2OqNvi">
                          <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="6kis6yMFXxk" role="3clFbx">
                    <node concept="3clFbF" id="6kis6yMFXxl" role="3cqZAp">
                      <node concept="3uNrnE" id="6kis6yMFXxm" role="3clFbG">
                        <node concept="37vLTw" id="6kis6yMFXxn" role="2$L3a6">
                          <ref role="3cqZAo" node="6kis6yMFXwD" resolve="matching" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="6kis6yMFXxt" role="3cqZAp">
          <node concept="3eOSWO" id="6kis6yMFXxu" role="3cqZAk">
            <node concept="37vLTw" id="6kis6yMFXxv" role="3uHU7B">
              <ref role="3cqZAo" node="6kis6yMFXwD" resolve="matching" />
            </node>
            <node concept="3cmrfG" id="6kis6yMFXxw" role="3uHU7w">
              <property role="3cmrfH" value="1" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="6kis6yMFXxx" role="1B3o_S" />
      <node concept="10P_77" id="6kis6yMFXxy" role="3clF45" />
    </node>
    <node concept="Wx3nA" id="6kis6yMG4y3" role="33b4aj">
      <property role="TrG5h" value="ENTITY_TYPE_ENTITY" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="6kis6yMG4y4" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="6kis6yMG4yg" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="6kis6yMG4yh" role="37wK5m">
          <node concept="1adDum" id="6kis6yMG4yi" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="6kis6yMG4yj" role="37wK5m">
          <node concept="1adDum" id="6kis6yMG4yk" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="6kis6yMG4yl" role="37wK5m">
          <property role="1adDun" value="8900000000000000007L" />
        </node>
        <node concept="1adDum" id="6kis6yMG4ym" role="37wK5m">
          <property role="1adDun" value="8900000000000000031L" />
        </node>
        <node concept="Xl_RD" id="6kis6yMG4yn" role="37wK5m">
          <property role="Xl_RC" value="entity" />
        </node>
      </node>
      <node concept="3Tm6S6" id="6kis6yMG4yd" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="4crIAbRzJJP" role="jymVt">
      <property role="TrG5h" value="classifierType" />
      <node concept="37vLTG" id="4crIAbRzJJQ" role="3clF46">
        <property role="TrG5h" value="context" />
        <node concept="3uibUv" id="4crIAbRzJJR" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="37vLTG" id="4crIAbRzJJS" role="3clF46">
        <property role="TrG5h" value="classifierReference" />
        <node concept="3uibUv" id="4crIAbRzJJT" role="1tU5fm">
          <ref role="3uigEE" to="wyt6:~String" resolve="String" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRzJJU" role="3clF47">
        <node concept="3cpWs8" id="4crIAbRzJJW" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzJJV" role="3cpWs9">
            <property role="TrG5h" value="classifierTypeConcept" />
            <node concept="3uibUv" id="4crIAbRzJJX" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SConcept" resolve="org.jetbrains.mps.openapi.language.SConcept" />
            </node>
            <node concept="2YIFZM" id="4crIAbRzK6k" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
              <node concept="1ZRNhn" id="4crIAbRzK6l" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzK6m" role="2$L3a6">
                  <property role="1adDun" value="936094784427099026L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbRzK6n" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzK6o" role="2$L3a6">
                  <property role="1adDun" value="6608339596220749546L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbRzK6p" role="37wK5m">
                <property role="1adDun" value="1107535904670L" />
              </node>
              <node concept="Xl_RD" id="4crIAbRzK6q" role="37wK5m">
                <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.ClassifierType" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzJK6" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzJK5" role="3cpWs9">
            <property role="TrG5h" value="classifierLink" />
            <node concept="3uibUv" id="4crIAbRzJK7" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="org.jetbrains.mps.openapi.language.SReferenceLink" />
            </node>
            <node concept="2YIFZM" id="4crIAbRzK6t" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
              <node concept="1ZRNhn" id="4crIAbRzK6u" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzK6v" role="2$L3a6">
                  <property role="1adDun" value="936094784427099026L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbRzK6w" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzK6x" role="2$L3a6">
                  <property role="1adDun" value="6608339596220749546L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbRzK6y" role="37wK5m">
                <property role="1adDun" value="1107535904670L" />
              </node>
              <node concept="1adDum" id="4crIAbRzK6z" role="37wK5m">
                <property role="1adDun" value="1107535924139L" />
              </node>
              <node concept="Xl_RD" id="4crIAbRzK6$" role="37wK5m">
                <property role="Xl_RC" value="classifier" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzJKh" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzJKg" role="3cpWs9">
            <property role="TrG5h" value="type" />
            <node concept="3uibUv" id="4crIAbRzJKi" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2YIFZM" id="4crIAbRzK6B" role="33vP2m">
              <ref role="1Pybhc" to="zce0:~SNodeFactoryOperations" resolve="SNodeFactoryOperations" />
              <ref role="37wK5l" to="zce0:~SNodeFactoryOperations.createNewNode(org.jetbrains.mps.openapi.language.SAbstractConcept,org.jetbrains.mps.openapi.model.SNode)" resolve="createNewNode" />
              <node concept="37vLTw" id="4crIAbRzK6C" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzJJV" resolve="classifierTypeConcept" />
              </node>
              <node concept="37vLTw" id="4crIAbRzK6D" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzJJQ" resolve="context" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzJKn" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzJKm" role="3cpWs9">
            <property role="TrG5h" value="classifier" />
            <node concept="3uibUv" id="4crIAbRzJKo" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4crIAbRzK8_" role="33vP2m">
              <node concept="2OqwBi" id="4crIAbRzK7z" role="2Oq$k0">
                <node concept="2YIFZM" id="4crIAbRzK6W" role="2Oq$k0">
                  <ref role="1Pybhc" to="dush:~PersistenceFacade" resolve="PersistenceFacade" />
                  <ref role="37wK5l" to="dush:~PersistenceFacade.getInstance()" resolve="getInstance" />
                </node>
                <node concept="liA8E" id="4crIAbRzK7$" role="2OqNvi">
                  <ref role="37wK5l" to="dush:~PersistenceFacade.createNodeReference(java.lang.String)" resolve="createNodeReference" />
                  <node concept="37vLTw" id="4crIAbRzK7_" role="37wK5m">
                    <ref role="3cqZAo" node="4crIAbRzJJS" resolve="classifierReference" />
                  </node>
                </node>
              </node>
              <node concept="liA8E" id="4crIAbRzK8A" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNodeReference.resolve(org.jetbrains.mps.openapi.module.SRepository)" resolve="resolve" />
                <node concept="2OqwBi" id="4crIAbRzK8W" role="37wK5m">
                  <node concept="2OqwBi" id="4crIAbRzK8C" role="2Oq$k0">
                    <node concept="37vLTw" id="4crIAbRzK8D" role="2Oq$k0">
                      <ref role="3cqZAo" node="4crIAbRzJJQ" resolve="context" />
                    </node>
                    <node concept="liA8E" id="4crIAbRzK8E" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4crIAbRzK8X" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SModel.getRepository()" resolve="getRepository" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4crIAbRzJKv" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRzK83" role="3clFbG">
            <node concept="37vLTw" id="4crIAbRzK7b" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRzJKg" resolve="type" />
            </node>
            <node concept="liA8E" id="4crIAbRzK84" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.setReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink,org.jetbrains.mps.openapi.model.SNode)" resolve="setReferenceTarget" />
              <node concept="37vLTw" id="4crIAbRzK85" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzJK5" resolve="classifierLink" />
              </node>
              <node concept="37vLTw" id="4crIAbRzK86" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzJKm" resolve="classifier" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRzJKz" role="3cqZAp">
          <node concept="37vLTw" id="4crIAbRzJK$" role="3cqZAk">
            <ref role="3cqZAo" node="4crIAbRzJKg" resolve="type" />
          </node>
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRzJK_" role="1B3o_S" />
      <node concept="3uibUv" id="4crIAbRzJKA" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="4crIAbRzS$i" role="jymVt">
      <property role="TrG5h" value="wrappedResultType" />
      <node concept="37vLTG" id="4crIAbRzS$j" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="4crIAbRzS$k" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRzS$l" role="3clF47">
        <node concept="3cpWs8" id="4crIAbRzS$n" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzS$m" role="3cpWs9">
            <property role="TrG5h" value="modeProperty" />
            <node concept="3uibUv" id="4crIAbRzS$o" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SProperty" resolve="org.jetbrains.mps.openapi.language.SProperty" />
            </node>
            <node concept="2YIFZM" id="4crIAbRzSA4" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getProperty(long,long,long,long,java.lang.String)" resolve="getProperty" />
              <node concept="1ZRNhn" id="4crIAbRzSA5" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzSA6" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbRzSA7" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzSA8" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbRzSA9" role="37wK5m">
                <property role="1adDun" value="4835663559135129055L" />
              </node>
              <node concept="1adDum" id="4crIAbRzSAa" role="37wK5m">
                <property role="1adDun" value="4835663559135129057L" />
              </node>
              <node concept="Xl_RD" id="4crIAbRzSAb" role="37wK5m">
                <property role="Xl_RC" value="mode" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRzS$x" role="3cqZAp">
          <node concept="3fqX7Q" id="4crIAbRzS$y" role="3clFbw">
            <node concept="2OqwBi" id="4crIAbRzSAq" role="3fr31v">
              <node concept="Xl_RD" id="4crIAbRzS$$" role="2Oq$k0">
                <property role="Xl_RC" value="hHTENELp74/ASYNC" />
              </node>
              <node concept="liA8E" id="4crIAbRzSAr" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                <node concept="2OqwBi" id="4crIAbRzSBI" role="37wK5m">
                  <node concept="37vLTw" id="4crIAbRzSB0" role="2Oq$k0">
                    <ref role="3cqZAo" node="4crIAbRzS$j" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="4crIAbRzSBJ" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                    <node concept="37vLTw" id="4crIAbRzSBK" role="37wK5m">
                      <ref role="3cqZAo" node="4crIAbRzS$m" resolve="modeProperty" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRzS$C" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRzS$D" role="3cqZAp">
              <node concept="1rXfSq" id="4crIAbRzS$E" role="3cqZAk">
                <ref role="37wK5l" node="6kis6yMFOXf" resolve="resultType" />
                <node concept="37vLTw" id="4crIAbRzS$F" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbRzS$j" resolve="invocation" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzS$H" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzS$G" role="3cpWs9">
            <property role="TrG5h" value="actionResult" />
            <node concept="3uibUv" id="4crIAbRzS$I" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="4crIAbRzS$J" role="33vP2m">
              <ref role="37wK5l" node="6kis6yMFOXf" resolve="resultType" />
              <node concept="37vLTw" id="4crIAbRzS$K" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzS$j" resolve="invocation" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzS$M" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzS$L" role="3cpWs9">
            <property role="TrG5h" value="typeArgument" />
            <node concept="3uibUv" id="4crIAbRzS$N" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRzS$O" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRzSCe" role="3clFbw">
            <node concept="2OqwBi" id="4crIAbRzSBl" role="2Oq$k0">
              <node concept="37vLTw" id="4crIAbRzSAC" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRzS$G" resolve="actionResult" />
              </node>
              <node concept="liA8E" id="4crIAbRzSBm" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
              </node>
            </node>
            <node concept="liA8E" id="4crIAbRzSCf" role="2OqNvi">
              <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
              <node concept="37vLTw" id="4crIAbRzSCg" role="37wK5m">
                <ref role="3cqZAo" node="6kis6yMFOX5" resolve="VOID_TYPE" />
              </node>
            </node>
          </node>
          <node concept="9aQIb" id="4crIAbRzS_0" role="9aQIa">
            <node concept="3clFbS" id="4crIAbRzS_1" role="9aQI4">
              <node concept="3clFbF" id="4crIAbRzS_2" role="3cqZAp">
                <node concept="37vLTI" id="4crIAbRzS_3" role="3clFbG">
                  <node concept="37vLTw" id="4crIAbRzS_4" role="37vLTJ">
                    <ref role="3cqZAo" node="4crIAbRzS$L" resolve="typeArgument" />
                  </node>
                  <node concept="2YIFZM" id="4crIAbRzSAG" role="37vLTx">
                    <ref role="1Pybhc" to="w1kc:~CopyUtil" resolve="CopyUtil" />
                    <ref role="37wK5l" to="w1kc:~CopyUtil.copy(org.jetbrains.mps.openapi.model.SNode)" resolve="copy" />
                    <node concept="37vLTw" id="4crIAbRzSAH" role="37wK5m">
                      <ref role="3cqZAo" node="4crIAbRzS$G" resolve="actionResult" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRzS$T" role="3clFbx">
            <node concept="3clFbF" id="4crIAbRzS$U" role="3cqZAp">
              <node concept="37vLTI" id="4crIAbRzS$V" role="3clFbG">
                <node concept="37vLTw" id="4crIAbRzS$W" role="37vLTJ">
                  <ref role="3cqZAo" node="4crIAbRzS$L" resolve="typeArgument" />
                </node>
                <node concept="1rXfSq" id="4crIAbRzS$X" role="37vLTx">
                  <ref role="37wK5l" node="4crIAbRzJJP" resolve="classifierType" />
                  <node concept="37vLTw" id="4crIAbRzS$Y" role="37wK5m">
                    <ref role="3cqZAo" node="4crIAbRzS$j" resolve="invocation" />
                  </node>
                  <node concept="Xl_RD" id="4crIAbRzS$Z" role="37wK5m">
                    <property role="Xl_RC" value="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)/~Void" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzS_8" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzS_7" role="3cpWs9">
            <property role="TrG5h" value="futureType" />
            <node concept="3uibUv" id="4crIAbRzS_9" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="4crIAbRzS_a" role="33vP2m">
              <ref role="37wK5l" node="4crIAbRzJJP" resolve="classifierType" />
              <node concept="37vLTw" id="4crIAbRzS_b" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzS$j" resolve="invocation" />
              </node>
              <node concept="Xl_RD" id="4crIAbRzS_c" role="37wK5m">
                <property role="Xl_RC" value="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.commons.functional(causeway.stubs/)/~TryFuture" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRzS_e" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRzS_d" role="3cpWs9">
            <property role="TrG5h" value="parameterLink" />
            <node concept="3uibUv" id="4crIAbRzS_f" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="org.jetbrains.mps.openapi.language.SContainmentLink" />
            </node>
            <node concept="2YIFZM" id="4crIAbRzSAK" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
              <node concept="1ZRNhn" id="4crIAbRzSAL" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzSAM" role="2$L3a6">
                  <property role="1adDun" value="936094784427099026L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbRzSAN" role="37wK5m">
                <node concept="1adDum" id="4crIAbRzSAO" role="2$L3a6">
                  <property role="1adDun" value="6608339596220749546L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbRzSAP" role="37wK5m">
                <property role="1adDun" value="1107535904670L" />
              </node>
              <node concept="1adDum" id="4crIAbRzSAQ" role="37wK5m">
                <property role="1adDun" value="1109201940907L" />
              </node>
              <node concept="Xl_RD" id="4crIAbRzSAR" role="37wK5m">
                <property role="Xl_RC" value="parameter" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="4crIAbRzS_o" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRzSBx" role="3clFbG">
            <node concept="37vLTw" id="4crIAbRzSAU" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRzS_7" resolve="futureType" />
            </node>
            <node concept="liA8E" id="4crIAbRzSBy" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.addChild(org.jetbrains.mps.openapi.language.SContainmentLink,org.jetbrains.mps.openapi.model.SNode)" resolve="addChild" />
              <node concept="37vLTw" id="4crIAbRzSBz" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzS_d" resolve="parameterLink" />
              </node>
              <node concept="37vLTw" id="4crIAbRzSB$" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRzS$L" resolve="typeArgument" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRzS_s" role="3cqZAp">
          <node concept="37vLTw" id="4crIAbRzS_t" role="3cqZAk">
            <ref role="3cqZAo" node="4crIAbRzS_7" resolve="futureType" />
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRzS_u" role="1B3o_S" />
      <node concept="3uibUv" id="4crIAbRzS_v" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="4crIAbREbma" role="jymVt">
      <property role="TrG5h" value="hasCompatibleControl" />
      <node concept="37vLTG" id="4crIAbREbmb" role="3clF46">
        <property role="TrG5h" value="invocation" />
        <node concept="3uibUv" id="4crIAbREbmc" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbREbmd" role="3clF47">
        <node concept="3cpWs8" id="4crIAbREbmf" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbme" role="3cpWs9">
            <property role="TrG5h" value="controlLink" />
            <node concept="3uibUv" id="4crIAbREbmg" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="org.jetbrains.mps.openapi.language.SContainmentLink" />
            </node>
            <node concept="2YIFZM" id="4crIAbREbp3" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
              <node concept="1ZRNhn" id="4crIAbREbp4" role="37wK5m">
                <node concept="1adDum" id="4crIAbREbp5" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbREbp6" role="37wK5m">
                <node concept="1adDum" id="4crIAbREbp7" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbREbp8" role="37wK5m">
                <property role="1adDun" value="4835663559135129055L" />
              </node>
              <node concept="1adDum" id="4crIAbREbp9" role="37wK5m">
                <property role="1adDun" value="4835663559135129058L" />
              </node>
              <node concept="Xl_RD" id="4crIAbREbpa" role="37wK5m">
                <property role="Xl_RC" value="control" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbmq" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbmp" role="3cpWs9">
            <property role="TrG5h" value="control" />
            <node concept="3uibUv" id="4crIAbREbmr" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="10Nm6u" id="4crIAbREbms" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbREbmt" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbREbqD" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbREbpd" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbREbmb" resolve="invocation" />
            </node>
            <node concept="liA8E" id="4crIAbREbqE" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="4crIAbREbqF" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbREbme" resolve="controlLink" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbREbm_" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <node concept="3uibUv" id="4crIAbREbmB" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbREbmv" role="2LFqv$">
            <node concept="3clFbF" id="4crIAbREbmw" role="3cqZAp">
              <node concept="37vLTI" id="4crIAbREbmx" role="3clFbG">
                <node concept="37vLTw" id="4crIAbREbmy" role="37vLTJ">
                  <ref role="3cqZAo" node="4crIAbREbmp" resolve="control" />
                </node>
                <node concept="37vLTw" id="4crIAbREbmz" role="37vLTx">
                  <ref role="3cqZAo" node="4crIAbREbm_" resolve="child" />
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="4crIAbREbm$" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbREbmE" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbREbmF" role="3clFbw">
            <node concept="37vLTw" id="4crIAbREbmG" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbREbmp" resolve="control" />
            </node>
            <node concept="10Nm6u" id="4crIAbREbmH" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbREbmK" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbREbmI" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbREbmJ" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbmM" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbmL" role="3cpWs9">
            <property role="TrG5h" value="modeProperty" />
            <node concept="3uibUv" id="4crIAbREbmN" role="1tU5fm">
              <ref role="3uigEE" to="c17a:~SProperty" resolve="org.jetbrains.mps.openapi.language.SProperty" />
            </node>
            <node concept="2YIFZM" id="4crIAbREbpi" role="33vP2m">
              <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
              <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getProperty(long,long,long,long,java.lang.String)" resolve="getProperty" />
              <node concept="1ZRNhn" id="4crIAbREbpj" role="37wK5m">
                <node concept="1adDum" id="4crIAbREbpk" role="2$L3a6">
                  <property role="1adDun" value="7368721030553710934L" />
                </node>
              </node>
              <node concept="1ZRNhn" id="4crIAbREbpl" role="37wK5m">
                <node concept="1adDum" id="4crIAbREbpm" role="2$L3a6">
                  <property role="1adDun" value="6140377635379736700L" />
                </node>
              </node>
              <node concept="1adDum" id="4crIAbREbpn" role="37wK5m">
                <property role="1adDun" value="4835663559135129055L" />
              </node>
              <node concept="1adDum" id="4crIAbREbpo" role="37wK5m">
                <property role="1adDun" value="4835663559135129057L" />
              </node>
              <node concept="Xl_RD" id="4crIAbREbpp" role="37wK5m">
                <property role="Xl_RC" value="mode" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbmX" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbmW" role="3cpWs9">
            <property role="TrG5h" value="async" />
            <node concept="10P_77" id="4crIAbREbmY" role="1tU5fm" />
            <node concept="2OqwBi" id="4crIAbREbpC" role="33vP2m">
              <node concept="Xl_RD" id="4crIAbREbn0" role="2Oq$k0">
                <property role="Xl_RC" value="hHTENELp74/ASYNC" />
              </node>
              <node concept="liA8E" id="4crIAbREbpD" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                <node concept="2OqwBi" id="4crIAbREbsP" role="37wK5m">
                  <node concept="37vLTw" id="4crIAbREbqI" role="2Oq$k0">
                    <ref role="3cqZAo" node="4crIAbREbmb" resolve="invocation" />
                  </node>
                  <node concept="liA8E" id="4crIAbREbsQ" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                    <node concept="37vLTw" id="4crIAbREbsR" role="37wK5m">
                      <ref role="3cqZAo" node="4crIAbREbmL" resolve="modeProperty" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbn4" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbn3" role="3cpWs9">
            <property role="TrG5h" value="expectedReference" />
            <node concept="3uibUv" id="4crIAbREbn5" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="3K4zz7" id="4crIAbREbn9" role="33vP2m">
              <node concept="37vLTw" id="4crIAbREbn6" role="3K4Cdx">
                <ref role="3cqZAo" node="4crIAbREbmW" resolve="async" />
              </node>
              <node concept="Xl_RD" id="4crIAbREbn7" role="3K4E3e">
                <property role="Xl_RC" value="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.applib.services.wrapper.control(causeway.stubs/)/~AsyncControl" />
              </node>
              <node concept="Xl_RD" id="4crIAbREbn8" role="3K4GZi">
                <property role="Xl_RC" value="c31c5f46-778f-4244-90d0-c92808fc2b16/java:org.apache.causeway.applib.services.wrapper.control(causeway.stubs/)/~SyncControl" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbnb" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbna" role="3cpWs9">
            <property role="TrG5h" value="variable" />
            <node concept="3uibUv" id="4crIAbREbnc" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="10Nm6u" id="4crIAbREbnd" role="33vP2m" />
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbREbne" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbREbqV" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbREbpI" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbREbmp" resolve="control" />
            </node>
            <node concept="liA8E" id="4crIAbREbqW" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getReferences()" resolve="getReferences" />
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbREbnm" role="1Duv9x">
            <property role="TrG5h" value="reference" />
            <node concept="3uibUv" id="4crIAbREbno" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SReference" resolve="org.jetbrains.mps.openapi.model.SReference" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbREbng" role="2LFqv$">
            <node concept="3clFbF" id="4crIAbREbnh" role="3cqZAp">
              <node concept="37vLTI" id="4crIAbREbni" role="3clFbG">
                <node concept="37vLTw" id="4crIAbREbnj" role="37vLTJ">
                  <ref role="3cqZAo" node="4crIAbREbna" resolve="variable" />
                </node>
                <node concept="2OqwBi" id="4crIAbREbr6" role="37vLTx">
                  <node concept="37vLTw" id="4crIAbREbpM" role="2Oq$k0">
                    <ref role="3cqZAo" node="4crIAbREbnm" resolve="reference" />
                  </node>
                  <node concept="liA8E" id="4crIAbREbr7" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SReference.getTargetNode()" resolve="getTargetNode" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="4crIAbREbnl" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbREbnq" role="3cqZAp">
          <node concept="3y3z36" id="4crIAbREbnr" role="3clFbw">
            <node concept="37vLTw" id="4crIAbREbns" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbREbna" resolve="variable" />
            </node>
            <node concept="10Nm6u" id="4crIAbREbnt" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbREbnv" role="3clFbx">
            <node concept="3cpWs8" id="4crIAbREbnx" role="3cqZAp">
              <node concept="3cpWsn" id="4crIAbREbnw" role="3cpWs9">
                <property role="TrG5h" value="typeWrapper" />
                <node concept="3uibUv" id="4crIAbREbny" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
                <node concept="10Nm6u" id="4crIAbREbnz" role="33vP2m" />
              </node>
            </node>
            <node concept="1DcWWT" id="4crIAbREbn$" role="3cqZAp">
              <node concept="2OqwBi" id="4crIAbREbri" role="1DdaDG">
                <node concept="37vLTw" id="4crIAbREbpQ" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbREbna" resolve="variable" />
                </node>
                <node concept="liA8E" id="4crIAbREbrj" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getChildren()" resolve="getChildren" />
                </node>
              </node>
              <node concept="3cpWsn" id="4crIAbREbnG" role="1Duv9x">
                <property role="TrG5h" value="child" />
                <node concept="3uibUv" id="4crIAbREbnI" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="4crIAbREbnA" role="2LFqv$">
                <node concept="3clFbF" id="4crIAbREbnB" role="3cqZAp">
                  <node concept="37vLTI" id="4crIAbREbnC" role="3clFbG">
                    <node concept="37vLTw" id="4crIAbREbnD" role="37vLTJ">
                      <ref role="3cqZAo" node="4crIAbREbnw" resolve="typeWrapper" />
                    </node>
                    <node concept="37vLTw" id="4crIAbREbnE" role="37vLTx">
                      <ref role="3cqZAo" node="4crIAbREbnG" resolve="child" />
                    </node>
                  </node>
                </node>
                <node concept="3zACq4" id="4crIAbREbnF" role="3cqZAp" />
              </node>
            </node>
            <node concept="3clFbJ" id="4crIAbREbnK" role="3cqZAp">
              <node concept="3y3z36" id="4crIAbREbnL" role="3clFbw">
                <node concept="37vLTw" id="4crIAbREbnM" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbREbnw" resolve="typeWrapper" />
                </node>
                <node concept="10Nm6u" id="4crIAbREbnN" role="3uHU7w" />
              </node>
              <node concept="3clFbS" id="4crIAbREbnP" role="3clFbx">
                <node concept="3cpWs8" id="4crIAbREbnR" role="3cqZAp">
                  <node concept="3cpWsn" id="4crIAbREbnQ" role="3cpWs9">
                    <property role="TrG5h" value="declaredType" />
                    <node concept="3uibUv" id="4crIAbREbnS" role="1tU5fm">
                      <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                    </node>
                    <node concept="10Nm6u" id="4crIAbREbnT" role="33vP2m" />
                  </node>
                </node>
                <node concept="1DcWWT" id="4crIAbREbnU" role="3cqZAp">
                  <node concept="2OqwBi" id="4crIAbREbru" role="1DdaDG">
                    <node concept="37vLTw" id="4crIAbREbpU" role="2Oq$k0">
                      <ref role="3cqZAo" node="4crIAbREbnw" resolve="typeWrapper" />
                    </node>
                    <node concept="liA8E" id="4crIAbREbrv" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getChildren()" resolve="getChildren" />
                    </node>
                  </node>
                  <node concept="3cpWsn" id="4crIAbREbo2" role="1Duv9x">
                    <property role="TrG5h" value="child" />
                    <node concept="3uibUv" id="4crIAbREbo4" role="1tU5fm">
                      <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
                    </node>
                  </node>
                  <node concept="3clFbS" id="4crIAbREbnW" role="2LFqv$">
                    <node concept="3clFbF" id="4crIAbREbnX" role="3cqZAp">
                      <node concept="37vLTI" id="4crIAbREbnY" role="3clFbG">
                        <node concept="37vLTw" id="4crIAbREbnZ" role="37vLTJ">
                          <ref role="3cqZAo" node="4crIAbREbnQ" resolve="declaredType" />
                        </node>
                        <node concept="37vLTw" id="4crIAbREbo0" role="37vLTx">
                          <ref role="3cqZAo" node="4crIAbREbo2" resolve="child" />
                        </node>
                      </node>
                    </node>
                    <node concept="3zACq4" id="4crIAbREbo1" role="3cqZAp" />
                  </node>
                </node>
                <node concept="3clFbJ" id="4crIAbREbo6" role="3cqZAp">
                  <node concept="3y3z36" id="4crIAbREbo7" role="3clFbw">
                    <node concept="37vLTw" id="4crIAbREbo8" role="3uHU7B">
                      <ref role="3cqZAo" node="4crIAbREbnQ" resolve="declaredType" />
                    </node>
                    <node concept="10Nm6u" id="4crIAbREbo9" role="3uHU7w" />
                  </node>
                  <node concept="3clFbS" id="4crIAbREbob" role="3clFbx">
                    <node concept="1DcWWT" id="4crIAbREboc" role="3cqZAp">
                      <node concept="2OqwBi" id="4crIAbREbrE" role="1DdaDG">
                        <node concept="37vLTw" id="4crIAbREbpY" role="2Oq$k0">
                          <ref role="3cqZAo" node="4crIAbREbnQ" resolve="declaredType" />
                        </node>
                        <node concept="liA8E" id="4crIAbREbrF" role="2OqNvi">
                          <ref role="37wK5l" to="mhbf:~SNode.getReferences()" resolve="getReferences" />
                        </node>
                      </node>
                      <node concept="3cpWsn" id="4crIAbREboq" role="1Duv9x">
                        <property role="TrG5h" value="reference" />
                        <node concept="3uibUv" id="4crIAbREbos" role="1tU5fm">
                          <ref role="3uigEE" to="mhbf:~SReference" resolve="org.jetbrains.mps.openapi.model.SReference" />
                        </node>
                      </node>
                      <node concept="3clFbS" id="4crIAbREboe" role="2LFqv$">
                        <node concept="3clFbJ" id="4crIAbREbof" role="3cqZAp">
                          <node concept="1Wc70l" id="4crIAbREbog" role="3clFbw">
                            <node concept="3y3z36" id="4crIAbREboh" role="3uHU7B">
                              <node concept="2OqwBi" id="4crIAbREbrP" role="3uHU7B">
                                <node concept="37vLTw" id="4crIAbREbq2" role="2Oq$k0">
                                  <ref role="3cqZAo" node="4crIAbREboq" resolve="reference" />
                                </node>
                                <node concept="liA8E" id="4crIAbREbrQ" role="2OqNvi">
                                  <ref role="37wK5l" to="mhbf:~SReference.getTargetNodeReference()" resolve="getTargetNodeReference" />
                                </node>
                              </node>
                              <node concept="10Nm6u" id="4crIAbREboj" role="3uHU7w" />
                            </node>
                            <node concept="2OqwBi" id="4crIAbREbs5" role="3uHU7w">
                              <node concept="37vLTw" id="4crIAbREbq6" role="2Oq$k0">
                                <ref role="3cqZAo" node="4crIAbREbn3" resolve="expectedReference" />
                              </node>
                              <node concept="liA8E" id="4crIAbREbs6" role="2OqNvi">
                                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                                <node concept="2OqwBi" id="4crIAbREbtD" role="37wK5m">
                                  <node concept="2OqwBi" id="4crIAbREbtl" role="2Oq$k0">
                                    <node concept="37vLTw" id="4crIAbREbt2" role="2Oq$k0">
                                      <ref role="3cqZAo" node="4crIAbREboq" resolve="reference" />
                                    </node>
                                    <node concept="liA8E" id="4crIAbREbtm" role="2OqNvi">
                                      <ref role="37wK5l" to="mhbf:~SReference.getTargetNodeReference()" resolve="getTargetNodeReference" />
                                    </node>
                                  </node>
                                  <node concept="liA8E" id="4crIAbREbtE" role="2OqNvi">
                                    <ref role="37wK5l" to="wyt6:~Object.toString()" resolve="toString" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node concept="3clFbS" id="4crIAbREbop" role="3clFbx">
                            <node concept="3cpWs6" id="4crIAbREbon" role="3cqZAp">
                              <node concept="3clFbT" id="4crIAbREboo" role="3cqZAk">
                                <property role="3clFbU" value="true" />
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
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbov" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbou" role="3cpWs9">
            <property role="TrG5h" value="actualType" />
            <node concept="3uibUv" id="4crIAbREbow" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="2OqwBi" id="4crIAbREbsn" role="33vP2m">
              <node concept="2YIFZM" id="4crIAbREbqk" role="2Oq$k0">
                <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
              </node>
              <node concept="liA8E" id="4crIAbREbso" role="2OqNvi">
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getTypeOf(org.jetbrains.mps.openapi.model.SNode)" resolve="getTypeOf" />
                <node concept="37vLTw" id="4crIAbREbsp" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbREbmp" resolve="control" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbREbo_" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbREbo$" role="3cpWs9">
            <property role="TrG5h" value="expectedType" />
            <node concept="3uibUv" id="4crIAbREboA" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
            </node>
            <node concept="1rXfSq" id="4crIAbREboB" role="33vP2m">
              <ref role="37wK5l" node="4crIAbRzJJP" resolve="classifierType" />
              <node concept="37vLTw" id="4crIAbREboC" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbREbmb" resolve="invocation" />
              </node>
              <node concept="37vLTw" id="4crIAbREboD" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbREbn3" resolve="expectedReference" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbREboE" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbREboF" role="3cqZAk">
            <node concept="1Wc70l" id="4crIAbREboG" role="3uHU7B">
              <node concept="3y3z36" id="4crIAbREboH" role="3uHU7B">
                <node concept="37vLTw" id="4crIAbREboI" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbREbou" resolve="actualType" />
                </node>
                <node concept="10Nm6u" id="4crIAbREboJ" role="3uHU7w" />
              </node>
              <node concept="3y3z36" id="4crIAbREboK" role="3uHU7w">
                <node concept="37vLTw" id="4crIAbREboL" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbREbo$" resolve="expectedType" />
                </node>
                <node concept="10Nm6u" id="4crIAbREboM" role="3uHU7w" />
              </node>
            </node>
            <node concept="2OqwBi" id="4crIAbREbsC" role="3uHU7w">
              <node concept="2YIFZM" id="4crIAbREbqv" role="2Oq$k0">
                <ref role="1Pybhc" to="1ka:~TypecheckingFacade" resolve="TypecheckingFacade" />
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.getFromContext()" resolve="getFromContext" />
              </node>
              <node concept="liA8E" id="4crIAbREbsD" role="2OqNvi">
                <ref role="37wK5l" to="1ka:~TypecheckingFacade.convertsTo(org.jetbrains.mps.openapi.model.SNode,org.jetbrains.mps.openapi.model.SNode)" resolve="convertsTo" />
                <node concept="37vLTw" id="4crIAbREbsE" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbREbou" resolve="actualType" />
                </node>
                <node concept="37vLTw" id="4crIAbREbsF" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbREbo$" resolve="expectedType" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbREboR" role="1B3o_S" />
      <node concept="10P_77" id="4crIAbREboS" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="4crIAbRB7wN" role="jymVt">
      <property role="TrG5h" value="hasAllowedGeneratedServiceName" />
      <node concept="37vLTG" id="4crIAbRB7wO" role="3clF46">
        <property role="TrG5h" value="injectedService" />
        <node concept="3uibUv" id="4crIAbRB7wP" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="org.jetbrains.mps.openapi.model.SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRB7wQ" role="3clF47">
        <node concept="3clFbJ" id="4crIAbRB7wR" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRB7wS" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRB7wT" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRB7wO" resolve="injectedService" />
            </node>
            <node concept="10Nm6u" id="4crIAbRB7wU" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRB7wX" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRB7wV" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRB7wW" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRB7wZ" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRB7wY" role="3cpWs9">
            <property role="TrG5h" value="name" />
            <node concept="3uibUv" id="4crIAbRB7x0" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="2OqwBi" id="4crIAbRB7xX" role="33vP2m">
              <node concept="37vLTw" id="4crIAbRB7xg" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRB7wO" resolve="injectedService" />
              </node>
              <node concept="liA8E" id="4crIAbRB7xY" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getName()" resolve="getName" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRB7x2" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRB7x3" role="3cqZAk">
            <node concept="3fqX7Q" id="4crIAbRB7x4" role="3uHU7B">
              <node concept="2OqwBi" id="4crIAbRB7xw" role="3fr31v">
                <node concept="Xl_RD" id="4crIAbRB7x6" role="2Oq$k0">
                  <property role="Xl_RC" value="__factoryService" />
                </node>
                <node concept="liA8E" id="4crIAbRB7xx" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="37vLTw" id="4crIAbRB7xy" role="37wK5m">
                    <ref role="3cqZAo" node="4crIAbRB7wY" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3fqX7Q" id="4crIAbRB7x8" role="3uHU7w">
              <node concept="2OqwBi" id="4crIAbRB7xL" role="3fr31v">
                <node concept="Xl_RD" id="4crIAbRB7xa" role="2Oq$k0">
                  <property role="Xl_RC" value="__wrapperFactory" />
                </node>
                <node concept="liA8E" id="4crIAbRB7xM" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="37vLTw" id="4crIAbRB7xN" role="37wK5m">
                    <ref role="3cqZAo" node="4crIAbRB7wY" resolve="name" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRB7xc" role="1B3o_S" />
      <node concept="10P_77" id="4crIAbRB7xd" role="3clF45" />
    </node>
  </node>
  <node concept="1YbPZF" id="6kis6yMFPV4">
    <property role="TrG5h" value="typeof_ActionInvocation" />
    <node concept="1YaCAy" id="6kis6yMFPV7" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:6kis6yMFgl1" resolve="ActionInvocation" />
    </node>
    <node concept="3clFbS" id="6kis6yMFPV8" role="18ibNy">
      <node concept="1Z5TYs" id="6kis6yMFPV9" role="3cqZAp">
        <node concept="mw_s8" id="6kis6yMFPVc" role="1ZfhK$">
          <node concept="1Z2H0r" id="6kis6yMFPVe" role="mwGJk">
            <node concept="1YBJjd" id="6kis6yMFPVg" role="1Z2MuG">
              <ref role="1YBMHb" node="6kis6yMFPV7" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="6kis6yMFPVh" role="1ZfhKB">
          <node concept="2YIFZM" id="6kis6yMFPVj" role="mwGJk">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="6kis6yMFOXf" resolve="resultType" />
            <node concept="1YBJjd" id="6kis6yMFPVk" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMFPV7" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="18kY7G" id="6kis6yMFPVU">
    <property role="TrG5h" value="action_invocation_requires_entity_target" />
    <node concept="1YaCAy" id="6kis6yMFPVX" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:6kis6yMFgl1" resolve="ActionInvocation" />
    </node>
    <node concept="3clFbS" id="6kis6yMFPVY" role="18ibNy">
      <node concept="3clFbJ" id="6kis6yMFPVZ" role="3cqZAp">
        <node concept="3fqX7Q" id="6kis6yMFPW2" role="3clFbw">
          <node concept="2YIFZM" id="6kis6yMFPW4" role="3fr31v">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="6kis6yMFOXI" resolve="hasEntityTarget" />
            <node concept="1YBJjd" id="6kis6yMFPW5" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMFPVX" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="6kis6yMFPW6" role="3clFbx">
          <node concept="2MkqsV" id="6kis6yMFPW7" role="3cqZAp">
            <node concept="Xl_RD" id="6kis6yMFPWa" role="2MkJ7o">
              <property role="Xl_RC" value="action invocation target must have an entity type" />
            </node>
            <node concept="1YBJjd" id="6kis6yMFPWb" role="1urrMF">
              <ref role="1YBMHb" node="6kis6yMFPVX" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="18kY7G" id="6kis6yMG1s1">
    <property role="TrG5h" value="action_invocation_requires_correct_arity" />
    <node concept="1YaCAy" id="6kis6yMG1s4" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:6kis6yMFgl1" resolve="ActionInvocation" />
    </node>
    <node concept="3clFbS" id="6kis6yMG1s5" role="18ibNy">
      <node concept="3clFbJ" id="6kis6yMG1s6" role="3cqZAp">
        <node concept="3fqX7Q" id="6kis6yMG1s9" role="3clFbw">
          <node concept="2YIFZM" id="6kis6yMG1sb" role="3fr31v">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="6kis6yMFXu1" resolve="hasCorrectArity" />
            <node concept="1YBJjd" id="6kis6yMG1sc" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMG1s4" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="6kis6yMG1sd" role="3clFbx">
          <node concept="2MkqsV" id="6kis6yMG1se" role="3cqZAp">
            <node concept="Xl_RD" id="6kis6yMG1sh" role="2MkJ7o">
              <property role="Xl_RC" value="action invocation argument count must match the referenced action" />
            </node>
            <node concept="1YBJjd" id="6kis6yMG1si" role="1urrMF">
              <ref role="1YBMHb" node="6kis6yMG1s4" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="18kY7G" id="6kis6yMG1sp">
    <property role="TrG5h" value="action_invocation_requires_compatible_arguments" />
    <node concept="1YaCAy" id="6kis6yMG1ss" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:6kis6yMFgl1" resolve="ActionInvocation" />
    </node>
    <node concept="3clFbS" id="6kis6yMG1st" role="18ibNy">
      <node concept="3clFbJ" id="6kis6yMG1su" role="3cqZAp">
        <node concept="3fqX7Q" id="6kis6yMG1sx" role="3clFbw">
          <node concept="2YIFZM" id="6kis6yMG1sz" role="3fr31v">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="6kis6yMKpAC" />
            <node concept="1YBJjd" id="6kis6yMG1s$" role="37wK5m">
              <ref role="1YBMHb" node="6kis6yMG1ss" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="6kis6yMG1s_" role="3clFbx">
          <node concept="2MkqsV" id="6kis6yMG1sA" role="3cqZAp">
            <node concept="Xl_RD" id="6kis6yMG1sD" role="2MkJ7o">
              <property role="Xl_RC" value="action invocation arguments must be compatible with the referenced action parameters" />
            </node>
            <node concept="1YBJjd" id="6kis6yMG1sE" role="1urrMF">
              <ref role="1YBMHb" node="6kis6yMG1ss" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="18kY7G" id="6kis6yMG1sL">
    <property role="TrG5h" value="action_invocation_rejects_ambiguous_identity" />
    <node concept="1YaCAy" id="6kis6yMG1sO" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:6kis6yMFgl1" resolve="ActionInvocation" />
    </node>
    <node concept="3clFbS" id="6kis6yMG1sP" role="18ibNy">
      <node concept="3clFbJ" id="6kis6yMG1sQ" role="3cqZAp">
        <node concept="2YIFZM" id="6kis6yMG1sT" role="3clFbw">
          <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
          <ref role="37wK5l" node="6kis6yMFXwb" resolve="hasAmbiguousAction" />
          <node concept="1YBJjd" id="6kis6yMG1sU" role="37wK5m">
            <ref role="1YBMHb" node="6kis6yMG1sO" resolve="actionInvocation" />
          </node>
        </node>
        <node concept="3clFbS" id="6kis6yMG1sV" role="3clFbx">
          <node concept="2MkqsV" id="6kis6yMG1sW" role="3cqZAp">
            <node concept="Xl_RD" id="6kis6yMG1sZ" role="2MkJ7o">
              <property role="Xl_RC" value="action invocation member identity is ambiguous for the target entity" />
            </node>
            <node concept="1YBJjd" id="6kis6yMG1t0" role="1urrMF">
              <ref role="1YBMHb" node="6kis6yMG1sO" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
  <node concept="1YbPZF" id="4crIAbR$1h2">
    <property role="TrG5h" value="typeof_WrappedActionInvocation" />
    <property role="18ip37" value="true" />
    <node concept="3clFbS" id="4crIAbR$1h5" role="18ibNy">
      <node concept="1Z5TYs" id="4crIAbR$1h6" role="3cqZAp">
        <node concept="mw_s8" id="4crIAbR$1h9" role="1ZfhK$">
          <node concept="1Z2H0r" id="4crIAbR$1hb" role="mwGJk">
            <node concept="1YBJjd" id="4crIAbR$1hd" role="1Z2MuG">
              <ref role="1YBMHb" node="4crIAbR$1hi" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="mw_s8" id="4crIAbR$1he" role="1ZfhKB">
          <node concept="2YIFZM" id="4crIAbR$1hg" role="mwGJk">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="4crIAbRzS$i" resolve="wrappedResultType" />
            <node concept="1YBJjd" id="4crIAbR$1hh" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbR$1hi" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbR$1hi" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:4crIAbRzeRv" resolve="WrappedActionInvocation" />
    </node>
  </node>
  <node concept="18kY7G" id="4crIAbR$1lK">
    <property role="TrG5h" value="wrapped_action_invocation_requires_matching_control" />
    <node concept="3clFbS" id="4crIAbR$1lN" role="18ibNy">
      <node concept="3clFbJ" id="4crIAbR$1lO" role="3cqZAp">
        <node concept="3fqX7Q" id="4crIAbR$1lR" role="3clFbw">
          <node concept="2YIFZM" id="4crIAbR$1lT" role="3fr31v">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="4crIAbREbma" />
            <node concept="1YBJjd" id="4crIAbR$1lU" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbR$1m1" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbR$1lV" role="3clFbx">
          <node concept="2MkqsV" id="4crIAbR$1lW" role="3cqZAp">
            <node concept="Xl_RD" id="4crIAbR$1lZ" role="2MkJ7o">
              <property role="Xl_RC" value="wrapped invocation control must match the selected synchronous or asynchronous mode" />
            </node>
            <node concept="1YBJjd" id="4crIAbR$1m0" role="1urrMF">
              <ref role="1YBMHb" node="4crIAbR$1m1" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbR$1m1" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:4crIAbRzeRv" resolve="WrappedActionInvocation" />
    </node>
  </node>
  <node concept="18kY7G" id="4crIAbRBc29">
    <property role="TrG5h" value="injected_service_rejects_reserved_generator_names" />
    <node concept="3clFbS" id="4crIAbRBc2c" role="18ibNy">
      <node concept="3clFbJ" id="4crIAbRBc2d" role="3cqZAp">
        <node concept="3fqX7Q" id="4crIAbRBc2g" role="3clFbw">
          <node concept="2YIFZM" id="4crIAbRBc2i" role="3fr31v">
            <ref role="1Pybhc" node="6kis6yMFOWo" resolve="ActionInvocationTypes" />
            <ref role="37wK5l" node="4crIAbRB7wN" resolve="hasAllowedGeneratedServiceName" />
            <node concept="1YBJjd" id="4crIAbRBc2j" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbRBc2q" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRBc2k" role="3clFbx">
          <node concept="2MkqsV" id="4crIAbRBc2l" role="3cqZAp">
            <node concept="Xl_RD" id="4crIAbRBc2o" role="2MkJ7o">
              <property role="Xl_RC" value="injected service name is reserved for generated Causeway service plumbing" />
            </node>
            <node concept="1YBJjd" id="4crIAbRBc2p" role="1urrMF">
              <ref role="1YBMHb" node="4crIAbRBc2q" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbRBc2q" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:10" resolve="InjectedService" />
    </node>
  </node>
  <node concept="1YbPZF" id="4crIAbRTTH_">
    <property role="TrG5h" value="typeOf_DerivedProperty" />
    <node concept="3clFbS" id="4crIAbRTTHC" role="18ibNy">
      <node concept="3cpWs8" id="4crIAbRTTHD" role="3cqZAp">
        <node concept="3cpWsn" id="4crIAbRTTHG" role="3cpWs9">
          <property role="TrG5h" value="expectedRetType" />
          <property role="3TUv4t" value="true" />
          <property role="OYnhT" value="local variable" />
          <property role="2Lvdk3" value="expectedRetType" />
          <node concept="2OqwBi" id="4crIAbRTTHI" role="33vP2m">
            <node concept="1YBJjd" id="4crIAbRTTHL" role="2Oq$k0">
              <ref role="1YBMHb" node="4crIAbRTTIH" resolve="lifecycleBlock" />
            </node>
            <node concept="3zqWPK" id="4crIAbRTTHM" role="2OqNvi">
              <ref role="37wK5l" to="tpek:i2fhBNC" resolve="getExpectedRetType" />
            </node>
          </node>
          <node concept="3Tqbb2" id="4crIAbRTTHN" role="1tU5fm" />
        </node>
      </node>
      <node concept="3cpWs8" id="4crIAbRTTHO" role="3cqZAp">
        <node concept="3cpWsn" id="4crIAbRTTHR" role="3cpWs9">
          <property role="TrG5h" value="returnStatements" />
          <property role="OYnhT" value="local variable" />
          <property role="2Lvdk3" value="returnStatements" />
          <node concept="2YIFZM" id="4crIAbRTTHT" role="33vP2m">
            <ref role="1Pybhc" to="tpeh:h84y26V" resolve="RulesFunctions_BaseLanguage" />
            <ref role="37wK5l" to="tpeh:h9DlRYQ" resolve="collectReturnStatements" />
            <node concept="2OqwBi" id="4crIAbRTTHU" role="37wK5m">
              <node concept="1YBJjd" id="4crIAbRTTHX" role="2Oq$k0">
                <ref role="1YBMHb" node="4crIAbRTTIH" resolve="lifecycleBlock" />
              </node>
              <node concept="3TrEf2" id="4crIAbRTTHY" role="2OqNvi">
                <ref role="3Tt5mk" to="k3bw:4crIAbRTcVJ" />
              </node>
            </node>
          </node>
          <node concept="A3Dl8" id="4crIAbRTTHZ" role="1tU5fm">
            <node concept="3Tqbb2" id="4crIAbRTTI1" role="A3Ik2">
              <ref role="ehGHo" to="tpee:fzcpWvY" resolve="ReturnStatement" />
            </node>
          </node>
        </node>
      </node>
      <node concept="2Gpval" id="4crIAbRTTI2" role="3cqZAp">
        <node concept="2GrKxI" id="4crIAbRTTI6" role="2Gsz3X">
          <property role="TrG5h" value="returnStatement" />
          <property role="2Lvdk3" value="returnStatement" />
        </node>
        <node concept="37vLTw" id="4crIAbRTTI7" role="2GsD0m">
          <ref role="3cqZAo" node="4crIAbRTTHR" resolve="returnStatements" />
        </node>
        <node concept="3clFbS" id="4crIAbRTTI8" role="2LFqv$">
          <node concept="3clFbJ" id="4crIAbRTTI9" role="3cqZAp">
            <node concept="2OqwBi" id="4crIAbRTTIc" role="3clFbw">
              <node concept="2OqwBi" id="4crIAbRTTIf" role="2Oq$k0">
                <node concept="2GrUjf" id="4crIAbRTTIi" role="2Oq$k0">
                  <ref role="2Gs0qQ" node="4crIAbRTTI6" resolve="returnStatement" />
                </node>
                <node concept="3TrEf2" id="4crIAbRTTIj" role="2OqNvi">
                  <ref role="3Tt5mk" to="tpee:fzcqZ_G" />
                </node>
              </node>
              <node concept="3w_OXm" id="4crIAbRTTIk" role="2OqNvi" />
            </node>
            <node concept="9aQIb" id="4crIAbRTTIl" role="9aQIa">
              <node concept="3clFbS" id="4crIAbRTTIn" role="9aQI4">
                <node concept="1ZobV4" id="4crIAbRTTIo" role="3cqZAp">
                  <node concept="mw_s8" id="4crIAbRTTIr" role="1ZfhK$">
                    <node concept="1Z2H0r" id="4crIAbRTTIt" role="mwGJk">
                      <node concept="2OqwBi" id="4crIAbRTTIv" role="1Z2MuG">
                        <node concept="2GrUjf" id="4crIAbRTTIy" role="2Oq$k0">
                          <ref role="2Gs0qQ" node="4crIAbRTTI6" resolve="returnStatement" />
                        </node>
                        <node concept="3TrEf2" id="4crIAbRTTIz" role="2OqNvi">
                          <ref role="3Tt5mk" to="tpee:fzcqZ_G" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="mw_s8" id="4crIAbRTTI$" role="1ZfhKB">
                    <node concept="37vLTw" id="4crIAbRTTIA" role="mwGJk">
                      <ref role="3cqZAo" node="4crIAbRTTHG" resolve="expectedRetType" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="4crIAbRTTIB" role="3clFbx">
              <node concept="2MkqsV" id="4crIAbRTTIC" role="3cqZAp">
                <node concept="Xl_RD" id="4crIAbRTTIF" role="2MkJ7o">
                  <property role="Xl_RC" value="should return value" />
                </node>
                <node concept="2GrUjf" id="4crIAbRTTIG" role="1urrMF">
                  <ref role="2Gs0qQ" node="4crIAbRTTI6" resolve="returnStatement" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbRTTIH" role="1YuTPh">
      <property role="TrG5h" value="lifecycleBlock" />
      <ref role="1YaFvo" to="k3bw:4crIAbRTcVH" resolve="DerivedProperty" />
    </node>
  </node>
  <node concept="312cEu" id="4crIAbRTUen">
    <property role="TrG5h" value="DerivedPropertyChecks" />
    <node concept="3Tm1VV" id="4crIAbRTUeo" role="1B3o_S" />
    <node concept="Wx3nA" id="4crIAbRTUep" role="jymVt">
      <property role="TrG5h" value="DERIVED_PROPERTY" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUeq" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUjH" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="4crIAbRTUjI" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUjJ" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUjK" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUjL" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUjM" role="37wK5m">
          <property role="1adDun" value="4835663559140888301L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUjN" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.DerivedProperty" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUey" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUez" role="jymVt">
      <property role="TrG5h" value="ENTITY" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUe$" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUjQ" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="4crIAbRTUjR" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUjS" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUjT" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUjU" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUjV" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUjW" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.Entity" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUeG" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUeH" role="jymVt">
      <property role="TrG5h" value="JAVA_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUeI" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUjZ" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="4crIAbRTUk0" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUk1" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUk2" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUk3" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUk4" role="37wK5m">
          <property role="1adDun" value="8900000000000000008L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUk5" role="37wK5m">
          <property role="Xl_RC" value="causeway.structure.JavaType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUeQ" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUeR" role="jymVt">
      <property role="TrG5h" value="VOID_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUeS" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SConcept" resolve="SConcept" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUk8" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getConcept(long,long,long,java.lang.String)" resolve="getConcept" />
        <node concept="1ZRNhn" id="4crIAbRTUk9" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUka" role="2$L3a6">
            <property role="1adDun" value="936094784427099026L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUkb" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkc" role="2$L3a6">
            <property role="1adDun" value="6608339596220749546L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkd" role="37wK5m">
          <property role="1adDun" value="1068581517677L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUke" role="37wK5m">
          <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.VoidType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUf0" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUf1" role="jymVt">
      <property role="TrG5h" value="NAME" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUf2" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SProperty" resolve="SProperty" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUkh" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getProperty(long,long,long,long,java.lang.String)" resolve="getProperty" />
        <node concept="1ZRNhn" id="4crIAbRTUki" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkj" role="2$L3a6">
            <property role="1adDun" value="3554657779850784990L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUkk" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkl" role="2$L3a6">
            <property role="1adDun" value="7236703803128771572L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkm" role="37wK5m">
          <property role="1adDun" value="1169194658468L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUkn" role="37wK5m">
          <property role="1adDun" value="1169194664001L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUko" role="37wK5m">
          <property role="Xl_RC" value="name" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUfb" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUfc" role="jymVt">
      <property role="TrG5h" value="ENTITY_PROPERTIES" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUfd" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUkr" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="4crIAbRTUks" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkt" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUku" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkv" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkw" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUkx" role="37wK5m">
          <property role="1adDun" value="8900000000000000022L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUky" role="37wK5m">
          <property role="Xl_RC" value="properties" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUfm" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUfn" role="jymVt">
      <property role="TrG5h" value="ENTITY_DERIVED_PROPERTIES" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUfo" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUk_" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="4crIAbRTUkA" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkB" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUkC" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkD" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkE" role="37wK5m">
          <property role="1adDun" value="8900000000000000002L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUkF" role="37wK5m">
          <property role="1adDun" value="4835663559140888326L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUkG" role="37wK5m">
          <property role="Xl_RC" value="derivedProperties" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUfx" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUfy" role="jymVt">
      <property role="TrG5h" value="RESULT_TYPE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUfz" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUkJ" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="4crIAbRTUkK" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkL" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUkM" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkN" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkO" role="37wK5m">
          <property role="1adDun" value="4835663559140888301L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUkP" role="37wK5m">
          <property role="1adDun" value="4835663559140888302L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUkQ" role="37wK5m">
          <property role="Xl_RC" value="resultType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUfG" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUfH" role="jymVt">
      <property role="TrG5h" value="JAVA_TYPE_VALUE" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUfI" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SContainmentLink" resolve="SContainmentLink" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUkT" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getContainmentLink(long,long,long,long,java.lang.String)" resolve="getContainmentLink" />
        <node concept="1ZRNhn" id="4crIAbRTUkU" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkV" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUkW" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUkX" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUkY" role="37wK5m">
          <property role="1adDun" value="8900000000000000008L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUkZ" role="37wK5m">
          <property role="1adDun" value="8900000000000000032L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUl0" role="37wK5m">
          <property role="Xl_RC" value="javaType" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUfR" role="1B3o_S" />
    </node>
    <node concept="Wx3nA" id="4crIAbRTUfS" role="jymVt">
      <property role="TrG5h" value="TARGET" />
      <property role="3TUv4t" value="true" />
      <node concept="3uibUv" id="4crIAbRTUfT" role="1tU5fm">
        <ref role="3uigEE" to="c17a:~SReferenceLink" resolve="SReferenceLink" />
      </node>
      <node concept="2YIFZM" id="4crIAbRTUl3" role="33vP2m">
        <ref role="1Pybhc" to="2k9e:~MetaAdapterFactory" resolve="MetaAdapterFactory" />
        <ref role="37wK5l" to="2k9e:~MetaAdapterFactory.getReferenceLink(long,long,long,long,java.lang.String)" resolve="getReferenceLink" />
        <node concept="1ZRNhn" id="4crIAbRTUl4" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUl5" role="2$L3a6">
            <property role="1adDun" value="7368721030553710934L" />
          </node>
        </node>
        <node concept="1ZRNhn" id="4crIAbRTUl6" role="37wK5m">
          <node concept="1adDum" id="4crIAbRTUl7" role="2$L3a6">
            <property role="1adDun" value="6140377635379736700L" />
          </node>
        </node>
        <node concept="1adDum" id="4crIAbRTUl8" role="37wK5m">
          <property role="1adDun" value="4835663559140888301L" />
        </node>
        <node concept="1adDum" id="4crIAbRTUl9" role="37wK5m">
          <property role="1adDun" value="4835663559140888305L" />
        </node>
        <node concept="Xl_RD" id="4crIAbRTUla" role="37wK5m">
          <property role="Xl_RC" value="target" />
        </node>
      </node>
      <node concept="3Tm6S6" id="4crIAbRTUg2" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="4crIAbRTUg3" role="jymVt">
      <property role="TrG5h" value="effectiveTarget" />
      <node concept="37vLTG" id="4crIAbRTUg4" role="3clF46">
        <property role="TrG5h" value="property" />
        <node concept="3uibUv" id="4crIAbRTUg5" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRTUg6" role="3clF47">
        <node concept="3clFbJ" id="4crIAbRTUg7" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRTUg8" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRTUg9" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRTUg4" resolve="property" />
            </node>
            <node concept="10Nm6u" id="4crIAbRTUga" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRTUgd" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRTUgb" role="3cqZAp">
              <node concept="10Nm6u" id="4crIAbRTUgc" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUgf" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUge" role="3cpWs9">
            <property role="TrG5h" value="parent" />
            <node concept="3uibUv" id="4crIAbRTUgg" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUnL" role="33vP2m">
              <node concept="37vLTw" id="4crIAbRTUld" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRTUg4" resolve="property" />
              </node>
              <node concept="liA8E" id="4crIAbRTUnM" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRTUgi" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRTUgj" role="3clFbw">
            <node concept="3y3z36" id="4crIAbRTUgk" role="3uHU7B">
              <node concept="37vLTw" id="4crIAbRTUgl" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUge" resolve="parent" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUgm" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUsI" role="3uHU7w">
              <node concept="2OqwBi" id="4crIAbRTUo5" role="2Oq$k0">
                <node concept="37vLTw" id="4crIAbRTUlp" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUge" resolve="parent" />
                </node>
                <node concept="liA8E" id="4crIAbRTUo6" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                </node>
              </node>
              <node concept="liA8E" id="4crIAbRTUsJ" role="2OqNvi">
                <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                <node concept="37vLTw" id="4crIAbRTUsK" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbRTUez" resolve="ENTITY" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRTUgs" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRTUgq" role="3cqZAp">
              <node concept="37vLTw" id="4crIAbRTUgr" role="3cqZAk">
                <ref role="3cqZAo" node="4crIAbRTUge" resolve="parent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRTUgt" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRTUog" role="3cqZAk">
            <node concept="37vLTw" id="4crIAbRTUlt" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRTUg4" resolve="property" />
            </node>
            <node concept="liA8E" id="4crIAbRTUoh" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
              <node concept="37vLTw" id="4crIAbRTUoi" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUfS" resolve="TARGET" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRTUgw" role="1B3o_S" />
      <node concept="3uibUv" id="4crIAbRTUgx" role="3clF45">
        <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
      </node>
    </node>
    <node concept="2YIFZL" id="4crIAbRTUgy" role="jymVt">
      <property role="TrG5h" value="hasValidPlacement" />
      <node concept="37vLTG" id="4crIAbRTUgz" role="3clF46">
        <property role="TrG5h" value="property" />
        <node concept="3uibUv" id="4crIAbRTUg$" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRTUg_" role="3clF47">
        <node concept="3clFbJ" id="4crIAbRTUgA" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRTUgB" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRTUgC" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRTUgz" resolve="property" />
            </node>
            <node concept="10Nm6u" id="4crIAbRTUgD" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRTUgG" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRTUgE" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRTUgF" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUgI" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUgH" role="3cpWs9">
            <property role="TrG5h" value="parent" />
            <node concept="3uibUv" id="4crIAbRTUgJ" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUos" role="33vP2m">
              <node concept="37vLTw" id="4crIAbRTUl$" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRTUgz" resolve="property" />
              </node>
              <node concept="liA8E" id="4crIAbRTUot" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUgM" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUgL" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="4crIAbRTUgN" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUoB" role="33vP2m">
              <node concept="37vLTw" id="4crIAbRTUlC" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRTUgz" resolve="property" />
              </node>
              <node concept="liA8E" id="4crIAbRTUoC" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                <node concept="37vLTw" id="4crIAbRTUoD" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbRTUfS" resolve="TARGET" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRTUgQ" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRTUgR" role="3clFbw">
            <node concept="3y3z36" id="4crIAbRTUgS" role="3uHU7B">
              <node concept="37vLTw" id="4crIAbRTUgT" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUgH" resolve="parent" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUgU" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUtf" role="3uHU7w">
              <node concept="2OqwBi" id="4crIAbRTUoW" role="2Oq$k0">
                <node concept="37vLTw" id="4crIAbRTUlR" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUgH" resolve="parent" />
                </node>
                <node concept="liA8E" id="4crIAbRTUoX" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                </node>
              </node>
              <node concept="liA8E" id="4crIAbRTUtg" role="2OqNvi">
                <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                <node concept="37vLTw" id="4crIAbRTUth" role="37wK5m">
                  <ref role="3cqZAo" node="4crIAbRTUez" resolve="ENTITY" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRTUh2" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRTUgY" role="3cqZAp">
              <node concept="3clFbC" id="4crIAbRTUgZ" role="3cqZAk">
                <node concept="37vLTw" id="4crIAbRTUh0" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbRTUgL" resolve="target" />
                </node>
                <node concept="10Nm6u" id="4crIAbRTUh1" role="3uHU7w" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRVUOc" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRVUOd" role="3clFbw">
            <node concept="3y3z36" id="4crIAbRVUOe" role="3uHU7B">
              <node concept="37vLTw" id="4crIAbRVUOf" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUgH" resolve="parent" />
              </node>
              <node concept="10Nm6u" id="4crIAbRVUOg" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="4crIAbRVUOC" role="3uHU7w">
              <node concept="Xl_RD" id="4crIAbRVUOi" role="2Oq$k0">
                <property role="Xl_RC" value="jetbrains.mps.lang.test.structure.TestNode" />
              </node>
              <node concept="liA8E" id="4crIAbRVUOD" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                <node concept="2OqwBi" id="4crIAbRVUPC" role="37wK5m">
                  <node concept="2OqwBi" id="4crIAbRVUPa" role="2Oq$k0">
                    <node concept="37vLTw" id="4crIAbRVUOQ" role="2Oq$k0">
                      <ref role="3cqZAo" node="4crIAbRTUgH" resolve="parent" />
                    </node>
                    <node concept="liA8E" id="4crIAbRVUPb" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4crIAbRVUPD" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVUOp" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRVUOl" role="3cqZAp">
              <node concept="3y3z36" id="4crIAbRVUOm" role="3cqZAk">
                <node concept="37vLTw" id="4crIAbRVUOn" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbRTUgL" resolve="target" />
                </node>
                <node concept="10Nm6u" id="4crIAbRVUOo" role="3uHU7w" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRTUh3" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRTUh4" role="3cqZAk">
            <node concept="3clFbC" id="4crIAbRTUh5" role="3uHU7B">
              <node concept="37vLTw" id="4crIAbRTUh6" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUgH" resolve="parent" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUh7" role="3uHU7w" />
            </node>
            <node concept="3y3z36" id="4crIAbRTUh8" role="3uHU7w">
              <node concept="37vLTw" id="4crIAbRTUh9" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUgL" resolve="target" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUha" role="3uHU7w" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRTUhb" role="1B3o_S" />
      <node concept="10P_77" id="4crIAbRTUhc" role="3clF45" />
    </node>
    <node concept="2YIFZL" id="4crIAbRWDsZ" role="jymVt">
      <property role="TrG5h" value="hasNonVoidResult" />
      <property role="2Lvdk3" value="hasNonVoidResult" />
      <node concept="10P_77" id="4crIAbRWDt3" role="3clF45" />
      <node concept="37vLTG" id="4crIAbRWDt4" role="3clF46">
        <property role="TrG5h" value="property" />
        <property role="2Lvdk3" value="property" />
        <node concept="3uibUv" id="4crIAbRWDt6" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRWDt7" role="3clF47">
        <node concept="3clFbJ" id="4crIAbRWDt8" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRWDtb" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRWDte" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRWDt4" />
            </node>
            <node concept="10Nm6u" id="4crIAbRWDtf" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRWDtg" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRWDth" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRWDti" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRWDtj" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRWDtm" role="3cpWs9">
            <property role="TrG5h" value="result" />
            <property role="OYnhT" value="local variable" />
            <property role="2Lvdk3" value="result" />
            <node concept="10Nm6u" id="4crIAbRWDto" role="33vP2m" />
            <node concept="3uibUv" id="4crIAbRWDtp" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbRWDtq" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRWDtu" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbRWDtx" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRWDt4" />
            </node>
            <node concept="liA8E" id="4crIAbRWDty" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="4crIAbRWDtz" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUfy" resolve="RESULT_TYPE" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbRWDt$" role="1Duv9x">
            <property role="TrG5h" value="child" />
            <property role="OYnhT" value="local variable" />
            <property role="2Lvdk3" value="child" />
            <node concept="3uibUv" id="4crIAbRWDtA" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRWDtB" role="2LFqv$">
            <node concept="3clFbF" id="4crIAbRWDtC" role="3cqZAp">
              <node concept="37vLTI" id="4crIAbRWDtE" role="3clFbG">
                <node concept="37vLTw" id="4crIAbRWDtH" role="37vLTJ">
                  <ref role="3cqZAo" node="4crIAbRWDtm" />
                </node>
                <node concept="37vLTw" id="4crIAbRWDtI" role="37vLTx">
                  <ref role="3cqZAo" node="4crIAbRWDt$" />
                </node>
              </node>
            </node>
            <node concept="3zACq4" id="4crIAbRWDtJ" role="3cqZAp" />
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRWDtK" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRWDtN" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRWDtQ" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRWDtm" />
            </node>
            <node concept="10Nm6u" id="4crIAbRWDtR" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRWDtS" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRWDtT" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRWDtU" role="3cqZAk" />
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRWDtV" role="3cqZAp">
          <node concept="3fqX7Q" id="4crIAbRWDtY" role="3clFbw">
            <node concept="2OqwBi" id="4crIAbRWDu0" role="3fr31v">
              <node concept="2OqwBi" id="4crIAbRX$kS" role="2Oq$k0">
                <node concept="2OqwBi" id="4crIAbRX$kV" role="2Oq$k0">
                  <node concept="37vLTw" id="4crIAbRX$kY" role="2Oq$k0">
                    <ref role="3cqZAo" node="4crIAbRWDtm" resolve="result" />
                  </node>
                  <node concept="liA8E" id="4crIAbRX$kZ" role="2OqNvi">
                    <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                  </node>
                </node>
                <node concept="liA8E" id="4crIAbRX$l0" role="2OqNvi">
                  <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                </node>
              </node>
              <node concept="liA8E" id="4crIAbRWDu8" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" />
                <node concept="Xl_RD" id="4crIAbRX$no" role="37wK5m">
                  <property role="Xl_RC" value="causeway.structure.JavaType" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRWDua" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRWDub" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRWDuc" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbRWDud" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRWDuh" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbRWDuk" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRWDtm" />
            </node>
            <node concept="liA8E" id="4crIAbRWDul" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="4crIAbRWDum" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUfH" resolve="JAVA_TYPE_VALUE" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbRWDun" role="1Duv9x">
            <property role="TrG5h" value="javaType" />
            <property role="OYnhT" value="local variable" />
            <property role="2Lvdk3" value="javaType" />
            <node concept="3uibUv" id="4crIAbRWDup" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRWDuq" role="2LFqv$">
            <node concept="3cpWs6" id="4crIAbRWDur" role="3cqZAp">
              <node concept="3fqX7Q" id="4crIAbRWDus" role="3cqZAk">
                <node concept="2OqwBi" id="4crIAbRWDuu" role="3fr31v">
                  <node concept="2OqwBi" id="4crIAbRX$mg" role="2Oq$k0">
                    <node concept="2OqwBi" id="4crIAbRX$mj" role="2Oq$k0">
                      <node concept="37vLTw" id="4crIAbRX$mm" role="2Oq$k0">
                        <ref role="3cqZAo" node="4crIAbRWDun" resolve="javaType" />
                      </node>
                      <node concept="liA8E" id="4crIAbRX$mn" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                      </node>
                    </node>
                    <node concept="liA8E" id="4crIAbRX$mo" role="2OqNvi">
                      <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4crIAbRWDuA" role="2OqNvi">
                    <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" />
                    <node concept="Xl_RD" id="4crIAbRX$o4" role="37wK5m">
                      <property role="Xl_RC" value="jetbrains.mps.baseLanguage.structure.VoidType" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRWDuC" role="3cqZAp">
          <node concept="3clFbT" id="4crIAbRWDuD" role="3cqZAk" />
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRWDuE" role="1B3o_S" />
    </node>
    <node concept="2YIFZL" id="4crIAbRTUi2" role="jymVt">
      <property role="TrG5h" value="hasUniqueIdentity" />
      <node concept="37vLTG" id="4crIAbRTUi3" role="3clF46">
        <property role="TrG5h" value="property" />
        <node concept="3uibUv" id="4crIAbRTUi4" role="1tU5fm">
          <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
        </node>
      </node>
      <node concept="3clFbS" id="4crIAbRTUi5" role="3clF47">
        <node concept="3clFbJ" id="4crIAbRU198" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRU199" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRU19a" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
            </node>
            <node concept="10Nm6u" id="4crIAbRU19b" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRU19e" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRU19c" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRU19d" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUi7" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUi6" role="3cpWs9">
            <property role="TrG5h" value="target" />
            <node concept="3uibUv" id="4crIAbRTUi8" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
            <node concept="1rXfSq" id="4crIAbRTUi9" role="33vP2m">
              <ref role="37wK5l" node="4crIAbRTUg3" resolve="effectiveTarget" />
              <node concept="37vLTw" id="4crIAbRTUia" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUic" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUib" role="3cpWs9">
            <property role="TrG5h" value="name" />
            <node concept="3uibUv" id="4crIAbRTUid" role="1tU5fm">
              <ref role="3uigEE" to="wyt6:~String" resolve="String" />
            </node>
            <node concept="3K4zz7" id="4crIAbRTUik" role="33vP2m">
              <node concept="3clFbC" id="4crIAbRTUie" role="3K4Cdx">
                <node concept="37vLTw" id="4crIAbRTUif" role="3uHU7B">
                  <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
                </node>
                <node concept="10Nm6u" id="4crIAbRTUig" role="3uHU7w" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUih" role="3K4E3e" />
              <node concept="2OqwBi" id="4crIAbRTUq7" role="3K4GZi">
                <node concept="37vLTw" id="4crIAbRTUmx" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
                </node>
                <node concept="liA8E" id="4crIAbRTUq8" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                  <node concept="37vLTw" id="4crIAbRTUq9" role="37wK5m">
                    <ref role="3cqZAo" node="4crIAbRTUf1" resolve="NAME" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRTUil" role="3cqZAp">
          <node concept="22lmx$" id="4crIAbRTUim" role="3clFbw">
            <node concept="3clFbC" id="4crIAbRTUin" role="3uHU7B">
              <node concept="37vLTw" id="4crIAbRTUio" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUi6" resolve="target" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUip" role="3uHU7w" />
            </node>
            <node concept="3clFbC" id="4crIAbRTUiq" role="3uHU7w">
              <node concept="37vLTw" id="4crIAbRTUir" role="3uHU7B">
                <ref role="3cqZAo" node="4crIAbRTUib" resolve="name" />
              </node>
              <node concept="10Nm6u" id="4crIAbRTUis" role="3uHU7w" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRTUiv" role="3clFbx">
            <node concept="3cpWs6" id="4crIAbRTUit" role="3cqZAp">
              <node concept="3clFbT" id="4crIAbRTUiu" role="3cqZAk">
                <property role="3clFbU" value="true" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUix" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUiw" role="3cpWs9">
            <property role="TrG5h" value="count" />
            <node concept="10Oyi0" id="4crIAbRTUiy" role="1tU5fm" />
            <node concept="3cmrfG" id="4crIAbRTUiz" role="33vP2m">
              <property role="3cmrfH" value="0" />
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbRTUi$" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRTUqk" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbRTUmC" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRTUi6" resolve="target" />
            </node>
            <node concept="liA8E" id="4crIAbRTUql" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="4crIAbRTUqm" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUfc" resolve="ENTITY_PROPERTIES" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbRTUiJ" role="1Duv9x">
            <property role="TrG5h" value="persisted" />
            <node concept="3uibUv" id="4crIAbRTUiL" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRTUiA" role="2LFqv$">
            <node concept="3clFbJ" id="4crIAbRTUiB" role="3cqZAp">
              <node concept="2OqwBi" id="4crIAbRTUq_" role="3clFbw">
                <node concept="37vLTw" id="4crIAbRTUmJ" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUib" resolve="name" />
                </node>
                <node concept="liA8E" id="4crIAbRTUqA" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="2OqwBi" id="4crIAbRTUuQ" role="37wK5m">
                    <node concept="37vLTw" id="4crIAbRTUu5" role="2Oq$k0">
                      <ref role="3cqZAo" node="4crIAbRTUiJ" resolve="persisted" />
                    </node>
                    <node concept="liA8E" id="4crIAbRTUuR" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                      <node concept="37vLTw" id="4crIAbRTUuS" role="37wK5m">
                        <ref role="3cqZAo" node="4crIAbRTUf1" resolve="NAME" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4crIAbRTUiI" role="3clFbx">
                <node concept="3clFbF" id="4crIAbRTUiF" role="3cqZAp">
                  <node concept="3uNrnE" id="4crIAbRTUiG" role="3clFbG">
                    <node concept="37vLTw" id="4crIAbRTUiH" role="2$L3a6">
                      <ref role="3cqZAo" node="4crIAbRTUiw" resolve="count" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1DcWWT" id="4crIAbRTUiO" role="3cqZAp">
          <node concept="2OqwBi" id="4crIAbRTUqN" role="1DdaDG">
            <node concept="37vLTw" id="4crIAbRTUmR" role="2Oq$k0">
              <ref role="3cqZAo" node="4crIAbRTUi6" resolve="target" />
            </node>
            <node concept="liA8E" id="4crIAbRTUqO" role="2OqNvi">
              <ref role="37wK5l" to="mhbf:~SNode.getChildren(org.jetbrains.mps.openapi.language.SContainmentLink)" resolve="getChildren" />
              <node concept="37vLTw" id="4crIAbRTUqP" role="37wK5m">
                <ref role="3cqZAo" node="4crIAbRTUfn" resolve="ENTITY_DERIVED_PROPERTIES" />
              </node>
            </node>
          </node>
          <node concept="3cpWsn" id="4crIAbRTUiZ" role="1Duv9x">
            <property role="TrG5h" value="derived" />
            <node concept="3uibUv" id="4crIAbRTUj1" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRTUiQ" role="2LFqv$">
            <node concept="3clFbJ" id="4crIAbRTUiR" role="3cqZAp">
              <node concept="2OqwBi" id="4crIAbRTUr4" role="3clFbw">
                <node concept="37vLTw" id="4crIAbRTUmY" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUib" resolve="name" />
                </node>
                <node concept="liA8E" id="4crIAbRTUr5" role="2OqNvi">
                  <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                  <node concept="2OqwBi" id="4crIAbRTUv2" role="37wK5m">
                    <node concept="37vLTw" id="4crIAbRTUua" role="2Oq$k0">
                      <ref role="3cqZAo" node="4crIAbRTUiZ" resolve="derived" />
                    </node>
                    <node concept="liA8E" id="4crIAbRTUv3" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                      <node concept="37vLTw" id="4crIAbRTUv4" role="37wK5m">
                        <ref role="3cqZAo" node="4crIAbRTUf1" resolve="NAME" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3clFbS" id="4crIAbRTUiY" role="3clFbx">
                <node concept="3clFbF" id="4crIAbRTUiV" role="3cqZAp">
                  <node concept="3uNrnE" id="4crIAbRTUiW" role="3clFbG">
                    <node concept="37vLTw" id="4crIAbRTUiX" role="2$L3a6">
                      <ref role="3cqZAo" node="4crIAbRTUiw" resolve="count" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="4crIAbRTUj5" role="3cqZAp">
          <node concept="3cpWsn" id="4crIAbRTUj4" role="3cpWs9">
            <property role="TrG5h" value="model" />
            <node concept="3uibUv" id="4crIAbRTUj6" role="1tU5fm">
              <ref role="3uigEE" to="mhbf:~SModel" resolve="SModel" />
            </node>
            <node concept="2OqwBi" id="4crIAbRTUrh" role="33vP2m">
              <node concept="37vLTw" id="4crIAbRTUn6" role="2Oq$k0">
                <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
              </node>
              <node concept="liA8E" id="4crIAbRTUri" role="2OqNvi">
                <ref role="37wK5l" to="mhbf:~SNode.getModel()" resolve="getModel" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRTUj8" role="3cqZAp">
          <node concept="3y3z36" id="4crIAbRTUj9" role="3clFbw">
            <node concept="37vLTw" id="4crIAbRTUja" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRTUj4" resolve="model" />
            </node>
            <node concept="10Nm6u" id="4crIAbRTUjb" role="3uHU7w" />
          </node>
          <node concept="3clFbS" id="4crIAbRTUjd" role="3clFbx">
            <node concept="1DcWWT" id="4crIAbRTUje" role="3cqZAp">
              <node concept="2OqwBi" id="4crIAbRTUrt" role="1DdaDG">
                <node concept="37vLTw" id="4crIAbRTUna" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUj4" resolve="model" />
                </node>
                <node concept="liA8E" id="4crIAbRTUru" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SModel.getRootNodes()" resolve="getRootNodes" />
                </node>
              </node>
              <node concept="3cpWsn" id="4crIAbRTUjx" role="1Duv9x">
                <property role="TrG5h" value="root" />
                <node concept="3uibUv" id="4crIAbRTUjz" role="1tU5fm">
                  <ref role="3uigEE" to="mhbf:~SNode" resolve="SNode" />
                </node>
              </node>
              <node concept="3clFbS" id="4crIAbRTUjg" role="2LFqv$">
                <node concept="3clFbJ" id="4crIAbRTUjh" role="3cqZAp">
                  <node concept="1Wc70l" id="4crIAbRTUji" role="3clFbw">
                    <node concept="1Wc70l" id="4crIAbRTUjj" role="3uHU7B">
                      <node concept="2OqwBi" id="4crIAbRTUuu" role="3uHU7B">
                        <node concept="2OqwBi" id="4crIAbRTUrK" role="2Oq$k0">
                          <node concept="37vLTw" id="4crIAbRTUnm" role="2Oq$k0">
                            <ref role="3cqZAo" node="4crIAbRTUjx" resolve="root" />
                          </node>
                          <node concept="liA8E" id="4crIAbRTUrL" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                          </node>
                        </node>
                        <node concept="liA8E" id="4crIAbRTUuv" role="2OqNvi">
                          <ref role="37wK5l" to="c17a:~SAbstractConcept.isSubConceptOf(org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="isSubConceptOf" />
                          <node concept="37vLTw" id="4crIAbRTUuw" role="37wK5m">
                            <ref role="3cqZAo" node="4crIAbRTUep" resolve="DERIVED_PROPERTY" />
                          </node>
                        </node>
                      </node>
                      <node concept="2OqwBi" id="4crIAbRTUrW" role="3uHU7w">
                        <node concept="37vLTw" id="4crIAbRTUnq" role="2Oq$k0">
                          <ref role="3cqZAo" node="4crIAbRTUi6" resolve="target" />
                        </node>
                        <node concept="liA8E" id="4crIAbRTUrX" role="2OqNvi">
                          <ref role="37wK5l" to="wyt6:~Object.equals(java.lang.Object)" resolve="equals" />
                          <node concept="2OqwBi" id="4crIAbRTUve" role="37wK5m">
                            <node concept="37vLTw" id="4crIAbRTUu_" role="2Oq$k0">
                              <ref role="3cqZAo" node="4crIAbRTUjx" resolve="root" />
                            </node>
                            <node concept="liA8E" id="4crIAbRTUvf" role="2OqNvi">
                              <ref role="37wK5l" to="mhbf:~SNode.getReferenceTarget(org.jetbrains.mps.openapi.language.SReferenceLink)" resolve="getReferenceTarget" />
                              <node concept="37vLTw" id="4crIAbRTUvg" role="37wK5m">
                                <ref role="3cqZAo" node="4crIAbRTUfS" resolve="TARGET" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="2OqwBi" id="4crIAbRTUse" role="3uHU7w">
                      <node concept="37vLTw" id="4crIAbRTUny" role="2Oq$k0">
                        <ref role="3cqZAo" node="4crIAbRTUib" resolve="name" />
                      </node>
                      <node concept="liA8E" id="4crIAbRTUsf" role="2OqNvi">
                        <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                        <node concept="2OqwBi" id="4crIAbRTUvq" role="37wK5m">
                          <node concept="37vLTw" id="4crIAbRTUuE" role="2Oq$k0">
                            <ref role="3cqZAo" node="4crIAbRTUjx" resolve="root" />
                          </node>
                          <node concept="liA8E" id="4crIAbRTUvr" role="2OqNvi">
                            <ref role="37wK5l" to="mhbf:~SNode.getProperty(org.jetbrains.mps.openapi.language.SProperty)" resolve="getProperty" />
                            <node concept="37vLTw" id="4crIAbRTUvs" role="37wK5m">
                              <ref role="3cqZAo" node="4crIAbRTUf1" resolve="NAME" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3clFbS" id="4crIAbRTUjw" role="3clFbx">
                    <node concept="3clFbF" id="4crIAbRTUjt" role="3cqZAp">
                      <node concept="3uNrnE" id="4crIAbRTUju" role="3clFbG">
                        <node concept="37vLTw" id="4crIAbRTUjv" role="2$L3a6">
                          <ref role="3cqZAo" node="4crIAbRTUiw" resolve="count" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbJ" id="4crIAbRVXo$" role="3cqZAp">
          <node concept="1Wc70l" id="4crIAbRVXo_" role="3clFbw">
            <node concept="3y3z36" id="4crIAbRVXoA" role="3uHU7B">
              <node concept="2OqwBi" id="4crIAbRVXpi" role="3uHU7B">
                <node concept="37vLTw" id="4crIAbRVXoO" role="2Oq$k0">
                  <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
                </node>
                <node concept="liA8E" id="4crIAbRVXpj" role="2OqNvi">
                  <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                </node>
              </node>
              <node concept="10Nm6u" id="4crIAbRVXoC" role="3uHU7w" />
            </node>
            <node concept="2OqwBi" id="4crIAbRVXp4" role="3uHU7w">
              <node concept="Xl_RD" id="4crIAbRVXoE" role="2Oq$k0">
                <property role="Xl_RC" value="jetbrains.mps.lang.test.structure.TestNode" />
              </node>
              <node concept="liA8E" id="4crIAbRVXp5" role="2OqNvi">
                <ref role="37wK5l" to="wyt6:~String.equals(java.lang.Object)" resolve="equals" />
                <node concept="2OqwBi" id="4crIAbRVXqS" role="37wK5m">
                  <node concept="2OqwBi" id="4crIAbRVXqs" role="2Oq$k0">
                    <node concept="2OqwBi" id="4crIAbRVXq1" role="2Oq$k0">
                      <node concept="37vLTw" id="4crIAbRVXpA" role="2Oq$k0">
                        <ref role="3cqZAo" node="4crIAbRTUi3" resolve="property" />
                      </node>
                      <node concept="liA8E" id="4crIAbRVXq2" role="2OqNvi">
                        <ref role="37wK5l" to="mhbf:~SNode.getParent()" resolve="getParent" />
                      </node>
                    </node>
                    <node concept="liA8E" id="4crIAbRVXqt" role="2OqNvi">
                      <ref role="37wK5l" to="mhbf:~SNode.getConcept()" resolve="getConcept" />
                    </node>
                  </node>
                  <node concept="liA8E" id="4crIAbRVXqT" role="2OqNvi">
                    <ref role="37wK5l" to="c17a:~SAbstractConcept.getQualifiedName()" resolve="getQualifiedName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3clFbS" id="4crIAbRVXoL" role="3clFbx">
            <node concept="3clFbF" id="4crIAbRVXoI" role="3cqZAp">
              <node concept="3uNrnE" id="4crIAbRVXoJ" role="3clFbG">
                <node concept="37vLTw" id="4crIAbRVXoK" role="2$L3a6">
                  <ref role="3cqZAo" node="4crIAbRTUiw" resolve="count" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs6" id="4crIAbRTUj_" role="3cqZAp">
          <node concept="3clFbC" id="4crIAbRTUjA" role="3cqZAk">
            <node concept="37vLTw" id="4crIAbRTUjB" role="3uHU7B">
              <ref role="3cqZAo" node="4crIAbRTUiw" resolve="count" />
            </node>
            <node concept="3cmrfG" id="4crIAbRTUjC" role="3uHU7w">
              <property role="3cmrfH" value="1" />
            </node>
          </node>
        </node>
      </node>
      <node concept="3Tm1VV" id="4crIAbRTUjD" role="1B3o_S" />
      <node concept="10P_77" id="4crIAbRTUjE" role="3clF45" />
    </node>
  </node>
  <node concept="18kY7G" id="4crIAbRTWP_">
    <property role="TrG5h" value="derived_property_requires_valid_placement" />
    <node concept="3clFbS" id="4crIAbRTWPC" role="18ibNy">
      <node concept="3clFbJ" id="4crIAbRTWPD" role="3cqZAp">
        <node concept="3fqX7Q" id="4crIAbRTWPG" role="3clFbw">
          <node concept="2YIFZM" id="4crIAbRTWPI" role="3fr31v">
            <ref role="1Pybhc" node="4crIAbRTUen" />
            <ref role="37wK5l" node="4crIAbRTUgy" resolve="hasValidPlacement" />
            <node concept="1YBJjd" id="4crIAbRTWPJ" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbRTWPQ" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRTWPK" role="3clFbx">
          <node concept="2MkqsV" id="4crIAbRTWPL" role="3cqZAp">
            <node concept="Xl_RD" id="4crIAbRTWPO" role="2MkJ7o">
              <property role="Xl_RC" value="derived property must be nested without an explicit target or be a root with an explicit target" />
            </node>
            <node concept="1YBJjd" id="4crIAbRTWPP" role="1urrMF">
              <ref role="1YBMHb" node="4crIAbRTWPQ" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbRTWPQ" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:4crIAbRTcVH" resolve="DerivedProperty" />
    </node>
  </node>
  <node concept="18kY7G" id="4crIAbRTWQd">
    <property role="TrG5h" value="derived_property_requires_non_void_result" />
    <node concept="3clFbS" id="4crIAbRTWQg" role="18ibNy">
      <node concept="3clFbJ" id="4crIAbRTWQh" role="3cqZAp">
        <node concept="3fqX7Q" id="4crIAbRTWQk" role="3clFbw">
          <node concept="2YIFZM" id="4crIAbRTWQm" role="3fr31v">
            <ref role="1Pybhc" node="4crIAbRTUen" />
            <ref role="37wK5l" node="4crIAbRWDsZ" />
            <node concept="1YBJjd" id="4crIAbRTWQn" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbRTWQu" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRTWQo" role="3clFbx">
          <node concept="2MkqsV" id="4crIAbRTWQp" role="3cqZAp">
            <node concept="Xl_RD" id="4crIAbRTWQs" role="2MkJ7o">
              <property role="Xl_RC" value="derived property requires a non-void result type" />
            </node>
            <node concept="1YBJjd" id="4crIAbRTWQt" role="1urrMF">
              <ref role="1YBMHb" node="4crIAbRTWQu" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbRTWQu" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:4crIAbRTcVH" resolve="DerivedProperty" />
    </node>
  </node>
  <node concept="18kY7G" id="4crIAbRTWQP">
    <property role="TrG5h" value="derived_property_requires_unique_identity" />
    <node concept="3clFbS" id="4crIAbRTWQS" role="18ibNy">
      <node concept="3clFbJ" id="4crIAbRTWQT" role="3cqZAp">
        <node concept="3fqX7Q" id="4crIAbRTWQW" role="3clFbw">
          <node concept="2YIFZM" id="4crIAbRTWQY" role="3fr31v">
            <ref role="1Pybhc" node="4crIAbRTUen" />
            <ref role="37wK5l" node="4crIAbRTUi2" resolve="hasUniqueIdentity" />
            <node concept="1YBJjd" id="4crIAbRTWQZ" role="37wK5m">
              <ref role="1YBMHb" node="4crIAbRTWR6" resolve="actionInvocation" />
            </node>
          </node>
        </node>
        <node concept="3clFbS" id="4crIAbRTWR0" role="3clFbx">
          <node concept="2MkqsV" id="4crIAbRTWR1" role="3cqZAp">
            <node concept="Xl_RD" id="4crIAbRTWR4" role="2MkJ7o">
              <property role="Xl_RC" value="duplicate property identity for exact target entity" />
            </node>
            <node concept="1YBJjd" id="4crIAbRTWR5" role="1urrMF">
              <ref role="1YBMHb" node="4crIAbRTWR6" resolve="actionInvocation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="4crIAbRTWR6" role="1YuTPh">
      <property role="TrG5h" value="actionInvocation" />
      <ref role="1YaFvo" to="k3bw:4crIAbRTcVH" resolve="DerivedProperty" />
    </node>
  </node>
</model>

