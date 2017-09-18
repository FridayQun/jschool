<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<!-- 这个东西应当被单独放在一个地方 -->
<%-- 需要的变量如下： --%>
<%-- jkuser --%>
<%-- jkuserinfo --%>
<%-- taglist --%>
<div class="sidebar">
	<div class="user-tags">
	<div class="tags-bar">
		<div class="col" style='width: 114px; text-align: center;'><span>影响力</span><span class="weight">${jkuser.influence}</span></div><hr style="float: left;height: 30px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
		<div class="col" style='width: 160px; text-align: center;'><span>连续登录天数 <span class="weight">${jkuser.loginTimes}</span></span></div>
	</div>
	<hr style='margin: 0 15px;'>
	<div class="tags-bar">
		<a id='my-follows' href='${ctx }/login/toUser?item=follows' class="grey-font"><div class="col" style='width: 114px; text-align: center;'><span>我的关注</span><br>${jkuser.follows}</div></a>
		<hr style="float: left;height: 40px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
		<a id='my-fans' href='${ctx }/login/toUser?item=fans' class="grey-font"><div class="col" style='width: 160px; text-align: center;'><span>我的粉丝</span><br>${jkuser.fans}</div></a>
	</div>
	</div>

	<div class="user-intro">

		<div class="tags-bar" style="margin: 0; padding: 0; font-size: 18px;">
			<div class="col" style='width: 126px; text-align: center;'><a href="${ctx}/login/toUser?item=authentication">申请认证</a></div><hr style="float: left;height: 30px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
			<div class="col" style='width: 160px; text-align: center;'><a href="${ctx}/login/toUser?item=security">账号管理</a></div>
		</div>
		<hr style="margin: 10px 0 20px 0;">

		<p><span class='label'><i class="icon ta-name"></i>姓名：</span>${jkuser.nickname }</p>
		<p><span class='label'><i class="icon ta-contact"></i>联系方式：</span>${jkuser.phone	}</p>
		<p><span class='label'><i class="icon ta-area-icon"></i>地区：</span>${jkuser.location	}</p>
		<p><span class='label'><i class="icon ta-school"></i>学校/公司：</span><c:if test="${jkuser.idType==0}">${jkuserinfo.eduName}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.companyName}</c:if></p>
		<p><span class='label'><i class="icon ta-profession"></i>专业/职位：</span><c:if test="${jkuser.idType==0}">${jkuserinfo.eduMajor}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.departName}</c:if></p>
		<c:if test="${jkuser.idType!=1}"><p><span class='label'><i class="icon ta-corporation"></i>社团：</span>${jkuserinfo.eduClub}</p></c:if>
		<p><span class='label'><i class="icon ta-self-intro-icon"></i>个人介绍：</span>${jkuser.slogan}</p>
		<p style="
			overflow: hidden;
			height: 30px;
		"><span class='label'><i class="icon ta-label-icon"></i>标签：</span><c:forEach var="item" items="${taglist}"
			varStatus="status"><span style="
				border-radius: 0.2em;
				padding: 0.3em 0.7em;
				margin: 0 0.2em 0.5em 0.2em;
				border: 1px solid #fe9a6e;
				color: #fe9a6e;
				line-height: 30px;
			">${item.tagName}</span></c:forEach></p>
		<hr>
		<div class='user-item' style='border: 0; width:auto; height:auto; margin: 0; padding: 0;'><div class='nav-col' style='border: 0; width:auto; height:auto; margin: 0; padding: 0;'><a data-api="5" style="
			text-align: center;
			font-weight: normal;
			font-size: 20px;
			margin: 0;
			color: #767d89;
			display: block;
			" href="${ctx}/login/toUser?item=moduserinfo">编辑个人信息<span style="
			margin-left: 40px;
			color: #ccc;
		">&gt;</span></a></div></div>
	</div>


	<div class="user-item" id="user-nav">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=item" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="0"><i class="icon ta-s-project-icon"></i>我的项目</a>
		</div>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=top" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="1"><i class="icon ta-top-icon"></i>我的头条</a>
		</div>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=collectionItem" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="2"><i class="icon ta-collection"></i>我的收藏</a>
		</div>
	</div>

	<div class="user-item">
		<p style=" font-weight: normal; font-size: 20px; margin: 0; color: #767d89; display: block; height: 60px; line-height: 60px; margin-left: 0; text-align: center; " data-api="0">积分中心</p>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=integral" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="1"><i class="icon ta-score"></i>我的积分</a>
		</div>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=integralDetails" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="2"><i class="icon ta-detail"></i>积分明细</a>
		</div>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a href="${ctx}/login/toUser?item=exchange" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="2"><i class="icon ta-exchange"></i>兑换记录</a>
		</div>
		<hr style="margin: 0 15px;">
		<div class="tags-bar nav-col" style="padding-bottom: 10px;
			padding-top: 10px;">
			<a target="_blank" href="${ctx}/login/toScoreMall" style="
				font-weight: normal;
				font-size: 20px;
				margin: 0;
				color: #767d89;
				display: block;
				height: 40px;
				line-height: 40px;
			" data-api="2"><i class="icon ta-mall"></i>积分商城</a>
		</div>
	</div>
</div>
