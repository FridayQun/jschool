<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<head>
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/left-slider.css">
</head>
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
		<table style="border: 0px; table-layout: fixed">
			<tbody style="font-size: 16px;width: 100%;table-layout: fixed;">
			<tr class="tt">
				<td style="width: 140px;"><span><i class="icon ta-name"></i></span><span>姓名：</span></td>
				<td><span class="ss">${jkuser.nickname}</span></td>
			</tr>
			<tr class="tt">
				<td><span><i class="icon ta-contact"></i></span><span>联系方式：</span></td>
				<td><span class="ss">${jkuser.phone}</span></td>
			</tr>
			<tr class="tt">
				<td><span><i class="icon ta-area-icon"></i></span><span>地区：</span></td>
				<td><span class="ss">${jkuser.location}</span></td>
			</tr>
			<tr class="tt">
				<td><span><i class="icon ta-school"></i></span><span>学校/公司：</span></td>
				<td><span class="ss"><c:if test="${jkuser.idType==0}">${jkuserinfo.eduName}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.companyName}</c:if></span></td>
			</tr>
			<tr class="tt">
				<td><span><i class="icon ta-profession"></i></span><span>专业/职位：</span></td>
				<c:if test="${jkuser.idType==0}"><td><span>${jkuserinfo.eduMajor}</span></td></c:if>
				<c:if test="${jkuser.idType==1}"><td><span class="ss">${jkuserinfo.departName}</span></td></c:if>
			</tr>
			<c:if test="${jkuser.idType!=1}">
				<tr class="tt">
					<td><span><i class="icon ta-corporation"></i></span></i><span>社团：</span></td>
					<td><span class="ss">${jkuserinfo.eduClub}</span></td>
				</tr>
			</c:if>
			<tr class="tt">
				<td><span><i class="icon ta-self-intro-icon"></i></span><span>个人介绍：</span></td>
				<td>
					<div style="width: 100%;
    							padding: 0;
    							margin: 0;
    							overflow: hidden;
    							text-overflow: ellipsis;
								">
					<span class="ss">${jkuser.slogan}
					</span></div></td>
			</tr>
			<tr class="tt">
				<td><span><i class="icon ta-label-icon"></i></span><span>标签：</span></td>
				<td><c:forEach var="item" items="${taglist}"
						varStatus="status"><span  class="ss" style="
						border-radius: 0.2em;
						padding: 0.1em 0.1em;
						margin: 0 0.2em 0.5em 0.2em;
						border: 1px solid #fe9a6e;
						color: #fe9a6e;
						font-size: 3px;
			">${item.tagName}</span></c:forEach></td>
			</tr>

			</tbody>
		</table>
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
