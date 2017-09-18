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
          <div class="main-title">关于鲸客</div>
          <div class="details-body">
            <p>鲸客网服务于校园社团，致力于为高校外联人打造专业校园服务平台的，以为校园活动提供从资金到执行的一站式解决方案为己任，整合校园市场的上下游资源，为品牌方、代理公司、学生社团以及第三方服务商，提供一个自由、安全的交易、交流渠道，实现校园活动与赞助商和服务商的一站式对接。</p>
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
