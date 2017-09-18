<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>账户安全-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
</head>

<body class="grey-bg">
  <div class="user-security-nav">
    <ul class="security-nav-list">
      <li class="separator">
        <a href="${ctx}/mobileuserino/tomodpassword">
          <div class="nav-title">修改密码</div>
          <div class="nav-desc"><i class="icon left-arrows"></i></div>
        </a>
      </li>
      <li>
        <a href="${ctx}/mobileuserino/tomodphone">
          <div class="nav-title">绑定手机号</div>
          <c:if test="${empty jkuser.phone}">
          		<div class="nav-desc">未填写<i class="icon left-arrows"></i></div>
          </c:if>
          <c:if test="${not empty jkuser.phone}">
          		<div class="nav-desc">${jkuser.phone}<i class="icon left-arrows"></i></div>
          </c:if>
        </a>
      </li>
      <li>
        <a href="${ctx}/mobileuserino/toModUserInfo">
        
          <div class="nav-title">绑定邮箱</div>
            <c:if test="${empty jkuserinfo.contractMail}">
         		 <div class="nav-desc">未填写<i class="icon left-arrows"></i></div>
            </c:if>
             <c:if test="${not empty jkuserinfo.contractMail}">
         		 <div class="nav-desc">${jkuserinfo.contractMail}<i class="icon left-arrows"></i></div>
           </c:if>
        </a>
      </li>
    </ul>
  </div>
 <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
