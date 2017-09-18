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
  <title>实名认证-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
</head>

<body>
  <div class="auth-nav">
  	<c:choose>
  	<c:when test="${not empty jkUserCeritifiredwait.id}">
  		<div class="main-box">
      		<h2 style="text-align: center;margin: 4em auto;">审核已提交，请等待</h2>
      	</div>
  	</c:when>
  	<c:otherwise>
  	<c:if test="${empty jkUserCeritifired.id}">	
    	<div><a href="${ctx}/mobileuserino/touserauth?type=0">学生认证</a></div>
   		<div><a href="${ctx}/mobileuserino/touserauthcomp?type=1">企业认证</a></div>
    </c:if>
    <c:if test="${not empty jkUserCeritifired.id}">
   			 <div class="main-box">
      			 <h2 style="text-align: center;margin: 4em auto;">已通过审核</h2>
      		 </div>
    </c:if>
    </c:otherwise>
   </c:choose>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
