<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">

<%-- jkuser --%>

<head>
	<meta charset='utf-8'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>JingKe</title>
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css">
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/integral.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
	<script>
var url='${ctx}';
var ctx = '${ctx}';
	</script>
</head>

<body>
	<%Integer id = (Integer)session.getAttribute("login_userId");%>
	<input hidden="true" type="text" id="uid"  value="<%=id%>"/>
	<input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
	<!-- 无用 -->
	<!-- <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/>  -->

    <!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
	<div class="user-section">
		<div class="wrapper">
<jsp:include page="user-header.jsp" flush="true"/>

			<div class="user-body">
<jsp:include page="user-slider-left.jsp" flush="true"/>

				<div class="main-box">

<div class="integral-main">
	<h3 class="integral-block-title">积分任务<span style="float: right; font-weight: normal;">总积分：<span style="color: RED; font-weight: bold;">${jkuser.point }</span></span></h3>
	<div class="integral-tab-box">
		<div class="label">
			<a href="#" class="active">新手任务</a>
			<a href="#">每日任务</a>
		</div>
		<div class="content">
			<div class="content-item">
				<p>1. 实名认证<c:if test="${not empty jkUserCeritifired.id}"><span style="margin-left: 10px;">&#10003</span></c:if></p>
				<p>2. 完善资料<c:if test="${not empty jkUserCeritifired.id}"><span style="margin-left: 10px;">&#10003</span></c:if></p>
			</div>
			<div class="content-item hide">
				<p>点赞<span style="margin-left: 10px;">(${admireCount }/5)</span></p>
				<p>收藏<span style="margin-left: 10px;">(${collectionCount }/5)</span></p>
				<p>评论<span style="margin-left: 10px;">(${createNewsNum }/5)</span></p>
				<p>项目申请<span style="margin-left: 10px;">(${applyProjectNum }/5)</span></p>
				<p>项目发布<span style="margin-left: 10px;">(${createProjectNum }/5)</span></p>
				<p>头条发布<span style="margin-left: 10px;">(${commentProjectNum }/5)</span></p>
			</div>
		</div>
	</div>
	<h3 class="integral-block-title">积分特权</h3>
	<div class="integral-privilege">
		<div class="privilege-img"><img src="${ctx}/resources/artcle/images/privilege-img.png" alt=""></div>
		<div class="privilege-desc">
			<div class="desc-col c1">1000以下积分用户每日可使用1次置顶，2次一键刷新功能。超限后每使用一次置顶扣除20积分，每使用一次一键刷新扣除5积分。</div>
			<div class="desc-col c2">第二阶段用户每日可使用2次置顶，4次一键刷新功能。超限后每使用一次置顶扣除20积分，每使用一次一键刷新扣除5积分。</div>
			<div class="desc-col c3">第三阶段积分用户每日可使用3次置顶，10次一键刷新功能。超限后每使用一次置顶扣除20积分。</div>
			<div class="desc-col c4">皇冠积分用户每日可使用5次置顶，无限次数一键刷新功能。</div>
		</div>
	</div>
	<h3 class="integral-block-title">积分规则</h3>
	<div class="integral-rules">
		<div class="integral-rules-title"><img src="${ctx}/resources/artcle/images/integral-rules-title.png" alt=""></div>
		<div class="integral-rules-desc">
			<p>1、 每位用户，每个任务只可以完成一次；</p>
			<p>2、 如果您已完成任务，请耐心等待，积分将会在　　一个工作日内增加到个人账户上；</p>
			<p>3、 如果您在完成任务3个工作日内尚未获得积分,　　请再次尝试关注和分享，或者联系我们；</p>
			<p>4、 如发现有任何恶意刷分，以及违反本活动规定的行为，花蜜街保留不另行通知而直接取消该用户参与资格或采取其他相应法律措施的权利。</p>
			<p>5、 在法律范围允许内，花蜜街拥有本活动的最终解释权，并有权限据需要取消活动或增删、修订本活动规则。</p>
		</div>
		<div class="exchange-process"><img src="${ctx}/resources/artcle/images/exchange-process.png" alt=""></div>
	</div>
</div>


				</div>
			</div>
		</div>
	</div>
	<!--动态包含-->
	<jsp:include page="foot.jsp" flush="true"/>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/jQuery.page.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
$(document).ready(function() {
	$('.integral-tab-box .label a').on('click',function(){
		var index = $(this).index();
		$(this).addClass('active').siblings().removeClass('active');
		$('.integral-tab-box .content .content-item').eq(index).removeClass('hide').siblings().addClass('hide');
		return false;
	});
});
	</script>
</body>

</html>
