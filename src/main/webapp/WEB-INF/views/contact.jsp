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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/help.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
</head>

<body>
  <jsp:include page="head.jsp" flush="true"/>
 
  <div class="help-section">
    <div class="wrapper">
      <div class="help-box">
        <div class="help-sidebar">
          <div class="sidebar-header">
            <div class="sidebar-logo"><img src="${ctx}/resources/artcle/images/logo.png" alt=""></div>
            <p class="subtitle">一站式校园活动解决专家</p>
          </div>
          <ul class="help-nav">
            <li class="${pageName=='about'?'active':''}"><a href="${ctx}/login/toHelp?pageName=about" data-uri="about">关于鲸客</a></li>
            <li class="${pageName=='invite'?'active':''}"><a href="${ctx}/login/toHelp?pageName=invite" data-uri="invite">招聘英才</a></li>
            <li class="${pageName=='contact'?'active':''}"><a href="${ctx}/login/toHelp?pageName=contact" data-uri="contact">联系我们</a></li>
            <li class="${pageName=='qa'?'active':''}"><a href="${ctx}/login/toHelp?pageName=qa" data-uri="qa">常见问题</a></li>
            <li class="${pageName=='guidance'?'active':''}"><a href="${ctx}/login/toHelp?pageName=guidance" data-uri="guidance">新手指导</a></li>
            <li class="${pageName=='rules'?'active':''}"><a href="${ctx}/login/toHelp?pageName=rules" data-uri="rules">平台规则</a></li>
          </ul>
        </div>
        <div class="help-main">
			<div class="main-title">联系我们</div>
			<div class="details-body">
			  <p>联系电话：</p>
			  <p>邮箱：</p>
			  <p>联系 QQ：</p>
			  <p>公司网址：</p>
			  <p>公司地址：</p>
			</div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="foot.jsp" flush="true"/>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>

</body>

</html>

