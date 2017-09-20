<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
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
  <title>我的-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>   
</head>

<body>
 <%Integer id = (Integer)session.getAttribute("login_userId");%>
  <div class="main-box no-top-bar">
    <div class="user-box">
      	 <div class="user-base-info" style="padding-bottom: 4em;position: relative;">      
        <c:if test="${empty jkuser.headPicPath || fn:startsWith(jkuser.headPicPath, NORMAL_HEAD_ICON_URL)}">
        <div class="user-avatar" style="width: 70px; height: 70px; background: url(${jkuser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL}) no-repeat 50% 50%/ cover;">
        	<img style="opacity: 0" src="${ctx}/resources/mobile/images/default.png" alt=""></div>
        </c:if>
        <c:if test="${not empty jkuser.headPicPath && fn:startsWith(jkuser.headPicPath, NORMAL_HEAD_ICON_URL)==false}">
        <div class="user-avatar" style="width: 70px; height: 70px; background: url(${jkuser.headPicPath}) no-repeat 50% 50%/ cover;">
        	<img style="opacity: 0" src="${ctx}/resources/mobile/images/default.png" alt=""></div>
        </c:if>
        <div class="user-desc">
          <p><span class="user-name" style="display: inline-block; max-width: 60%;">${jkuser.nickname}</span><span><c:if test="${jkuser.userLevel == 2}"><c:if test="${jkuser.gender==2 }"><i class="icon gender-real-girl"></i></c:if><c:if test="${jkuser.gender!=2 }"><i class="icon gender-real-boy"></i></c:if></c:if><c:if test="${jkuser.userLevel != 2}"><c:if test="${jkuser.gender==2 }"><i class="icon gender-n-real-girl"></i></c:if><c:if test="${jkuser.gender!=2 }"><i class="icon gender-n-real-boy"></i></c:if></c:if></p><span><!--<c:forEach var="item" items="${taglist}" begin="0" end="4"><span class="tags">${item.tagName}</span>
           	</c:forEach>--></p>
          <p><span>${jkuserinfo.eduName}</span><span class="charm">影响力 ${jkuser.influence}</span></p>
          <p style=" position: absolute; bottom: 0; height: 2.5em; text-align: center; width: 100%; left: 0; border-top: 1px solid #e1e1e1; padding-top: 0.5em; "><span style="display: inline-block;margin: 0 0.5rem 0 0;width: 45%;border-right: 1px solid #e1e1e1;"><a href="${ctx}/mobileuserino/tomyfolloeslist">${jkuser.follows }<br>我的关注</a></span>
			<span style="display: inline-block;margin: 0 0.5rem 0 0;width: 45%;"><a href="${ctx}/mobileuserino/tomyfanslist">${jkuser.fans }<br>我的粉丝</a></span></p>
        </div>
      </div>
      <div class="user-nav">
        <ul class="nav-list">
          <li><a href="${ctx}/mobileuserino/toModUserInfo"><i class="icon pencil"></i>个人资料</a></li>
          <li><a href="${ctx}/mobileuserino/toMobileUserInfo"><i class="icon meun"></i>项目头条</a></li>
          <li><a href="${ctx}/mobileuserino/toMobileUserMesg"><i class="icon email"></i>我的消息<span>${count}</span></a></li>
          <li><a href="${ctx}/mobileuserino/toauhome"><i class="icon laptop"></i>认证管理</a></li>
          <li><a href="${ctx}/mobileuserino/tousersecurity"><i class="icon key"></i>账户安全</a></li>
          <li><a href="${ctx}/integral/tointegralindex"><i class="icon diamond"></i>积分中心</a></li>
          <li><a href="${ctx}/mobileuserino/touserfavorite"><i class="icon star-blue"></i>我的收藏</a></li>
          <li><a href="${ctx}/mobile/login/tofeedback"><i class="icon feedback"></i>意见反馈</a></li>
        </ul>
        <div class="logout-btn hide">退出登录</div>
      </div>
    </div>
  </div>
  <div class="tab-bar">
    <div class="tab-item"><a href="${ctx}/mobile/login/toHome"><i class="tab-icon home-icon"></i><span>首页</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toProjectList"><i class="tab-icon project-icon"></i><span>项目</span></a></div>
    <div class="tab-item "><a href="${ctx}/mobile/login/toHeadline"><i class="tab-icon rss-icon"></i><span>资讯</span></a></div>
    <div class="tab-item active"><a href="${ctx}/mobileuserino/toUserIndex"><i class="tab-icon user-icon"></i><span>我的</span></a></div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
