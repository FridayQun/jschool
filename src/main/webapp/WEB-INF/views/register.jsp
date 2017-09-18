<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>JingKe</title>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/jquery.validator.css">
<link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>
</head>

<body class="login-bg">
  <div class="login-box">
    <div class="login-logo"><img src="${ctx}/resources/artcle/images/logo-white.png" alt=""></div>
    <div class="login-block">
      <div class="login-tab-label">
        <div class="label"><a href="#">登录</a></div><div class="label">
          <a class="active" href="#">注册</a></div>
      </div>
      <div class="login-tab-content ">
        <div class="tab-content hide">
          <form class="loginForm" id="loginForm" action="${ctx}/login/login" method="post">
            <div class="form-group"><label for="user"><i class="icon form-user"></i></label><input type="text" name="phone"  id="phone_login" value="" placeholder="手机号"></div>
            <div class="form-group"><label for="password"><i class="icon form-pd"></i></label><input type="password" name="password" id="password_login" value="" placeholder="密码"></div>
            <div class="form-notice"><a href="passwd-find.html">忘记密码</a></div>
            <div class="form-submit"><input type="submit" id="loginsubmit" name="submit" value="登 录"></div>
          </form>
        </div>
        <div class="tab-content register ">
          <form class="registerForm" id="registerForm" action="${ctx}/login/register" method="post" autocomplete="off" data-validator-option="{stopOnError:false, timely:true,theme:'simple_bottom'}">
            <input type="hidden"  name="sid" id="sid" value="">
            <div class="form-group"><label for="userId"><i class="icon form-user"></i></label><input type="text" name="phone" id="phone" value="" placeholder="手机号" data-rule="手机号:required;mobile"></div>
            <div class="form-group"><label for="captcha"><i class="icon form-captcha"></i></label><input type="text" name="yzcode" id="yzcode" data-rule="验证码:required;"><button type="button" name="getCaptcha">获取验证码</button></div>
            <div class="form-group"><label for="userPd"><i class="icon form-pd"></i></label><input type="password" name="password" id="userPd1" value="" placeholder="密码" data-rule="密码:required;password"></div>
            <div class="form-group"><label for="confirmPassword"><i class="icon form-pd2"></i></label><input type="password" name="confirmPassword1" id="confirmPassword1" value="" placeholder="确认密码" data-rule="确认密码:required;match(password);"></div>
            <div class="form-submit"><input type="submit" id="registersubmit" name="submit" value="同意协议并注册"></div>
            <div class="register-form-notice"><a href="">《鲸客网服务协议》</a></div>
          </form>
        </div>
      	<div class="reset-succeed hide">
	        <div class="inner-box">
	          <p><i class="icon correct-icon"></i></p>
	          <h3>注册成功!</h3>
	          <p><small><span class="second">5</span>秒后自动跳转</small></p>
	          <div class="close-btn"><a onclick="qued()">确 定</a></div>
	        </div>
	      </div>
      </div>
    </div>
    <div class="login-footer">鲸客网，一站式校园活动解决专家</div>
  </div>
  <div class="overlay agreement hide">
    <div class="agreement-box">
      <h1 class="agreement-title">鲸客网服务协议</h1>
      <div class="agreement-details">
        <p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:9.0pt;
font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>欢迎您使用鲸客网。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:9.0pt;
font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>鲸客网依据《鲸客网务协议》（以下简称</span><span
lang=EN-US style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>本协议</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>）的规定提供服务。请您仔细阅读以下条款，当您（即用户）依据《鲸客网服服务协议》使用鲸客网时，视为您完全知悉、接受并遵守本协议项下的全部条款及鲸客网发布的各类规则。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
mso-outline-level:2;layout-grid-mode:both;mso-layout-grid-align:auto'><span
style='font-size:12.5pt;font-family:黑体;mso-bidi-font-family:宋体;color:#333333'>使用规则</span><b><span
lang=EN-US style='font-size:18.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>1</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户有权根据本协议及鲸客网发布的相关规则，享受鲸客网提供的服务。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>2</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户须对在鲸客网的注册信息的真实性、合法性、有效性承担全部责任，用户不得冒充他人；不得利用他人的名义发布任何信息；不得恶意使用注册帐号导致其他用户误认；否则鲸客网有权立即停止提供服务，收回其帐号并由用户独自承担由此而产生的一切法律责任。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>3</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、只有符合下列条件之一的自然人或法人才能申请成为鲸客网用户，可以使用鲸客网的服务：</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>年满十八岁，并具有民事权利能力和民事行为能力的自然人；</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>无民事行为能力人或限制民事行为能力人应经过其监护人的同意；</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>根据中国法律、法规、行政规章成立并合法存在的机关、企事业单位、社团组织和其他组织。</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:9.0pt;
font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>否则鲸客网有权停止对不符合要求用户的服务，并由其承担因此产生的法律责任。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>4</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户须自行负责自己的用户账号和密码，且须对在用户账号密码下发生的所有活动（包括但不限于发布信息、网上点击同意各类协议、规则、参与申请、评价等）承担责任。用户有权根据需要更改登录和账户提现密码。因用户的过错导致的任何损失由用户自行承担，该过错包括但不限于：不当或遗漏操作、遗忘或泄漏密码，密码被他人破解，用户使用的计算机被他人侵入等。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>5</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户应当向鲸客网提供真实准确的注册信息，包括但不限于真实姓名、身份证号、联系电话、地址等。保证鲸客网可以通过上述联系方式与自己进行联系。同时，用户也应当在相关资料实际变更时及时更新有关注册资料。不得以虚假信息骗取账号名称注册，或其账号头像、简介等注册信息存在违法和不良信息。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>6</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网有权对用户的注册资料进行审查，对存在任何问题或怀疑的注册资料，鲸客网有权发出通知询问用户并要求用户做出解释、改正。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>7</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户制作、上载、复制、发布或者传播如下内容：</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>反对宪法所确定的基本原则的；</span><span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>损害国家荣誉和利益的；</span><span lang=EN-US style='font-size:12.0pt;
line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>煽动民族仇恨、民族歧视，破坏民族团结的；</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>破坏国家宗教政策，宣扬邪教和封建迷信的；</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>散布谣言，扰乱社会秩序，破坏社会稳定的；</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>侮辱或者诽谤他人，侵害他人合法权益的；</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>含有法律、行政法规禁止的其他内容的信息。</span><span lang=EN-US style='font-size:
12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>8</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户不得以任何形式擅自转让或授权他人使用自己在鲸客网的用户帐号。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>9</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户有义务确保在鲸客网上发布信息的真实、准确，无误导性。　</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>10</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户在鲸客网发布信息应当遵守诚实信用原则，不得以干预或操纵信息发布、申请等不正当竞争方式扰乱；平台秩序，不得从事与平台服务无关的不当行为。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>11</span><span style='font-size:9.0pt;font-family:宋体;
mso-ascii-font-family:Arial;mso-hansi-font-family:Arial;mso-bidi-font-family:
Arial;color:#666666'>、</span><b><span style='font-size:9.0pt;mso-bidi-font-size:
11.0pt;font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>鲸客网仅对用户提供的个人信息及实名认证材料进行形式核查，仅保证实名认证材料形式符合鲸客网的要求。用户在使用鲸客网时，需对信息、用户身份具备判断能力，自行承担因此产生的责任和后果。</span></b><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>12</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户不应采取不正当手段（包括但不限于虚假合作、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>13</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户承诺自己在使用鲸客网实施的所有行为遵守法律、法规、行政规章和鲸客网的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，用户将以自己的名义独立承担相应的法律责任。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>14</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、未经鲸客网书面允许，用户不得将鲸客网的任何资料以及在网站平台上所展示的任何信息作商业性利用（包括但不限于以复制、修改、翻译等形式制作衍生作品、分发或公开展示）。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>15</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户不得使用以下方式登录网站或破坏网站所提供的服务：</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>以任何机器人软件、蜘蛛软件、爬虫软件、刷屏软件或其它自动方式访问或登录鲸客网；</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>通过任何方式对本公司内部结构造成或可能造成不合理或不合比例的重大负荷的行为；</span><span
lang=EN-US style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0cm;margin-right:0cm;margin-bottom:0cm;
margin-left:18.15pt;margin-bottom:.0001pt;line-height:150%;layout-grid-mode:
both;background:white;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;line-height:150%;font-family:Wingdings;mso-fareast-font-family:
宋体;mso-bidi-font-family:宋体;color:#666666'>§</span><span lang=EN-US
style='font-size:6.0pt;line-height:150%;font-family:"Times New Roman",serif;
mso-fareast-font-family:宋体;color:#666666'>&nbsp;&nbsp; </span><span
style='font-size:9.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>通过任何方式干扰或试图干扰网站的正常工作或网站上进行的任何活动。</span><span lang=EN-US
style='font-size:12.0pt;line-height:150%;font-family:宋体;mso-bidi-font-family:
宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>16</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户同意接收来自鲸客网的所有信息，包括但不限于站内通知、邮件通知、短信通知等。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>17</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网可有权以正当理由（包括但不限于鲸客网认为用户已违反本协议及相关规则）终止对用户的服务，并有权在两年内保存用户在鲸客网的全部资料（包括但不限于用户信息、发布的所有信息等）。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:12.5pt;
font-family:黑体;mso-bidi-font-family:宋体;color:#666666'>知识产权</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:9.0pt;
font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>鲸客网致力于为多方提供信息发布、对接服务。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>1</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网及鲸客网所使用的任何相关软件、程序、内容，包括但不限于作品、图片、档案、资料、网站构架、网站版面的安排、网页设计、经由鲸客网或广告商向用户呈现的广告或资讯，均由鲸客网或其它权利人依法享有相应的知识产权，包括但不限于著作权、商标权、专利权或其它专属权利等，受到相关法律的保护。未经本网站或权利人明示授权，用户保证不修改、出租、出借、出售、散布鲸客网及鲸客网所使用的上述任何资料和资源，或根据上述资料和资源制作成任何种类产品。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>2</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网授予用户不可转移及非专属的使用权，使用户可以通过单机计算机使用鲸客网的目标代码（以下简称</span><span
lang=EN-US style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>），但用户不得且不得允许任何第三方复制、修改、创作衍生作品、进行还原工程、反向组译，或以其它方式破译或试图破译源代码，或出售、转让</span><span
lang=EN-US style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>或对</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>进行再授权，或以其它方式移转</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>之任何权利。用户同意不以任何方式修改</span><span
lang=EN-US style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>，或使用修改后的</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>“</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>软件</span><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>”</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>。</span><span lang=EN-US
style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>3</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户不得经由非鲸客网所提供的界面使用鲸客网。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>4</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户在鲸客网上发表的全部原创内容，著作权均归用户本人所有。用户可授权第三方以任何方式使用，不需要得到鲸客网的同意。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>5</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、用户将其在鲸客网上发表的全部内容，授予鲸客网免费的、不可撤销的、非独家使用许可，鲸客网有权将该内容用于鲸客网各种形态的产品和服务上，包括但不限于网站以及发表的应用或其他互联网产品。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>6</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、在鲸客网上传或发表的内容，用户应保证其为著作权人或已取得合法授权，并且该内容不会侵犯任何第三方的合法权益。如果第三方提出关于著作权的异议，鲸客网有权根据实际情况删除相关的内容，且有权追究用户的法律责任。给鲸客网或任何第三方造成损失的，用户应负责全额赔偿。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span style='font-size:12.5pt;
font-family:黑体;mso-bidi-font-family:宋体;color:#666666'>个人隐私</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>1</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网尊重用户个人信息的隐私，鲸客网将通过技术手段、强化内部管理等办法充分保护用户的个人隐私信息，除法律或有法律赋予权限的政府部门要求或事先得到用户明确授权等原因外，鲸客网保证不对外公开或向第三方透露用户个人隐私信息，或用户在使用服务时存储的非公开内容。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><b><span lang=EN-US
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>2</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>、第三方平台记录信息。用户通过新浪微博账号、</span></b><b><span lang=EN-US
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>QQ</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>账号等第三方平台账号（下称“第三方平台”）注册、登陆、使用鲸客网服务的，将被视为用户完全了解、同意并接受鲸客网已包括但不限于收集、统计、分析等方式使用其在新浪微博、</span></b><b><span
lang=EN-US style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>QQ</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>等第三方平台上填写、登记、公布、记录的全部信息（下称“第三方平台记录信息”）。用户一旦使用第三方平台账号注册、登陆、使用鲸客网服务，鲸客网对该等第三方平台记录的信息的任何使用，均将被视为已经获得了用户本人的完全同意并接受。</span></b><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><b><span lang=EN-US
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>3</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>、为向客户提供鲸客网服务，鲸客网将可能合理使用用户个人信息、非用户个人信息及第三方平台记录信息（以下合称“用户信息”）。用户一旦注册、登陆、使用鲸客网服务，将视为用户完全了解、同意并接受鲸客网通过包括但不限于收集、统计、分析、使用等方式合理使用用户信息。</span></b><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
mso-outline-level:2;layout-grid-mode:both;mso-layout-grid-align:auto'><span
style='font-size:12.5pt;font-family:黑体;mso-bidi-font-family:宋体;color:#333333'>免责申明</span><b><span
lang=EN-US style='font-size:18.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><b><span lang=EN-US
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>1</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>、鲸客网不能对用户发表的信息的真实性、准确性进行保证。</span></b><span lang=EN-US
style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><b><span lang=EN-US
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:"Arial",sans-serif;
mso-fareast-font-family:宋体;color:#666666'>2</span></b><b><span
style='font-size:9.0pt;mso-bidi-font-size:11.0pt;font-family:宋体;mso-bidi-font-family:
宋体;color:#666666'>、用户在鲸客网任何操作仅代表其个人行为，鲸客网不对此做任何形式的担保。用户作为网站的使用者，需自行对其操作负责，因其操作引发的一切纠纷，由该用户承担全部法律及连带责任。</span></b><span
style='font-size:9.0pt;font-family:宋体;mso-bidi-font-family:宋体;color:#666666'>鲸客网不承担任何法律及连带责任。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>3</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、鲸客网不保证网络服务一定能满足用户的要求，也不保证网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作保证。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>4</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、对于因不可抗力或鲸客网不能控制的原因造成的网络服务中断或其它缺陷，鲸客网不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
mso-outline-level:2;layout-grid-mode:both;mso-layout-grid-align:auto'><span
style='font-size:12.5pt;font-family:黑体;mso-bidi-font-family:宋体;color:#333333'>协议修改</span><b><span
lang=EN-US style='font-size:18.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>1</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、根据互联网的发展和有关法律、法规及规范性文件的变化，或者因业务发展需要，鲸客网有权对本协议的条款作出修改或变更，一旦本协议的内容发生变动，鲸客网将会直接在鲸客网网站上公布修改之后的协议内容，该公布行为视为鲸客网已经通知用户修改内容。鲸客网也可采用电子邮件或私信的传送方式，提示用户协议条款的修改、服务变更、或其它重要事项。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>

<p class=MsoNormal style='mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;
layout-grid-mode:both;mso-layout-grid-align:auto'><span lang=EN-US
style='font-size:9.0pt;font-family:"Arial",sans-serif;mso-fareast-font-family:
宋体;color:#666666'>2</span><span style='font-size:9.0pt;font-family:宋体;
mso-bidi-font-family:宋体;color:#666666'>、如果不同意鲸客网对本协议相关条款所做的修改，用户有权并应当停止使用鲸客网。如果用户继续使用鲸客网，则视为用户接受鲸客网对本协议相关条款所做的修改。</span><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体'><o:p></o:p></span></p>
</div>
      <div class="agreement-footer"><button type="button" name="button">我已阅读</button></div>
    </div>
  </div>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jquery.validator.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
  function qued(){
	  var phone=$("#phone").val();
	  var password=$("#userPd1").val();
		$.post(ctx+"/login/login",{"phone":phone,"password":password},function(){
			  window.location.href=ctx+"/";
		});
	}
  
    $(function() {
    		var $agreementBox = $('.agreement');
        //重置成功
        function resetSucceed(cb) {
          var $second = $('.second');
          var secs = 5;
          $('.reset-succeed').removeClass('hide');
          var timer = setInterval(function(){
            secs--;
            if(secs === 0 ){
              clearInterval(timer);
              cb && cb();
            }else{
              $second.text(secs);
            }
          },1000);
        }
        
      var $getCaptcha = $('.registerForm button[name="getCaptcha"]');
      var timeout = true;
      function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]);
        return null;
      }

      function countDown(sec,cb){
        var sec = sec || 60;
        $getCaptcha.addClass('grey').text('60s');
        var timer = setInterval(function(){
          sec--;
          if(sec === 0){
            $getCaptcha.text('60s');
            clearInterval(timer);
            cb && cb();
          }else{
            $getCaptcha.text(sec+'s');
          }
        },1000);
      }

      $('.login-tab-label a').on('click', function() {
        var thisIndex = $(this).parents('.label').index();
        $(this).addClass('active').parents('.label').siblings('.label').find('a').removeClass('active');
        $('.login-tab-content .tab-content').eq(thisIndex).removeClass('hide').siblings().addClass('hide');
        return false;
      });
      
      
		  //注册ajax提交
		  $('#registerForm').on('valid.form',function(){	  
			  var phone=$("#phone").val();
			  var yzcode=$("#yzcode").val();
			  var password=$("#userPd1").val();
			  var confirmPassword1 = $("#confirmPassword1").val();
			  var sid=$("#sid").val();
			  $.ajax({
				  type: "POST",
				  url: ctx+"/login/register",
				  data: {"phone":phone,"yzcode":yzcode,"password":password,"sid":sid},
				  aysnc:false,
				  dataType: "json",
				  success: function(obj){
					  if(obj.error=="1"){
						  alert(obj.error_mesg);						  
					  }  
					  else if(obj.error=="0"){
						  resetSucceed(function(){
							  $.post(ctx+"/login/login",{"phone":phone,"password":password},function(){
								  window.location.href=ctx+"/";
							  });
						  });						  
					  }
					}
				});
			  return false;
		  });
	  
      //获取验证码
      $('.registerForm button[name="getCaptcha"]').on('click',function(){
    	  var phone = $('#phone').val();
    	  var telReg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9]|17[0-9])[0-9]{8}$/;
    	  if(timeout && telReg.test(phone)){
    		  timeout = false;
    		  $.ajax({
    			  type: "GET",
    			  url: ctx+"/sms/gethash",
    			  data: {"phone":phone},
    			  dataType: "json",
    			  success: function(data){
    				  $.ajax({
    					  type: "POST",
    					  url: ctx+"/sms/getsms",
    					  data: {"phone":phone,"vcode":data.vcode,"type":0},
    					  aysnc:true,
    					  dataType: "json",
    					  success: function(obj){
    						  countDown(60,function(){
    							  timeout = true;
    							});
    						  $("#sid").val(obj.sid);
    						}
    					});
    				}
          });
    	  }else{
    		  alert('请输入正确的手机号码！');
	  		}
      });
      
    //打开鲸客网服务协议
      $('.register-form-notice a').on('click',function(){
    	  $agreementBox.removeClass('hide');
    	  return false;
      });
      //关闭鲸客网服务协议
      $('.agreement-footer button').on('click',function(){
    	  $agreementBox.addClass('hide');
    	  return false;
      });
      
      (getQueryString('register')) && $('.login-tab-label .label').eq(1).find('a').trigger('click');

    });
  </script>
</body>

</html>
