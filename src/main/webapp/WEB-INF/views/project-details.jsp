<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/publish-preview.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/luara.left.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
	<script>
		var ctx = '${ctx}';
	</script>
	<style>
	.advice {
		height: 180px;
		border: 1px solid #f4f4f4;
		margin: 4px 0;
	}
	.with-left-supply {
		position: absolute;
		left: 0px;
		top: 0px;
		padding: 40px;
		box-sizing: border-box;
	}
	.with-left-supply:before {
		position: absolute;
		top: 0;
		left: 0px;
		border-left: 70px solid orange;
		border-bottom: 70px solid transparent;
		content: '';
	}
	.with-left-supply:after {
		position: absolute;
		content: '供给';
		top: 10px;
		left: 10px;
		color: white;
	}
	.with-left-demand {
		position: absolute;
		left: 0px;
		top: 0px;
		padding: 40px;
		box-sizing: border-box;
	}
	.with-left-demand:before {
		position: absolute;
		top: 0;
		left: 0px;
		border-left: 70px solid orange;
		border-bottom: 70px solid transparent;
		content: '';
	}
	.with-left-demand:after {
		position: absolute;
		content: '赞助';
		top: 10px;
		left: 10px;
		color: white;
	}
	</style>
</head>

<body>
  <!--动态包含-->
	<jsp:include page="head.jsp" flush="true"/>

	<div class="publish-section">
    <div class="wrapper">
		<div class="docs" style="display: flex; border: 0; background: #f4f4f4;">
		<c:if test="${JkProject.projType==0}"><span class="tags with-left-demand"></span></c:if><c:if test="${JkProject.projType==1}"><span class="tags with-left-supply"></span></c:if>
			<div style="width: 80%;display: inline-block;padding: 0;box-sizing: border-box;background: white;">
			<div class="publish-preview-box" style="padding: 50px 40px 50px 124px;">
				<div class="publish-preview-title">
					<h2 style="text-align: center;">
						<span style="
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
">
							${JkProject.projName}
							<input type="hidden" id="currentProjId" value="${JkProject.id}">
							<input type="hidden" id="hasCollect" value="${hasCollect}">
							<input type="hidden" id="hasAdmire" value="${hasAdmire}">
							<input type="hidden" id="hasAdmires" value="${hasAdmires}">
							<input type="hidden" id="applyStatus" value="${applyStatus }"/>
						</span>
<%-- 						<c:if test="${JkProject.istop!=0 }"> --%>
<!-- 						<span class="tags">置顶</span> -->
<%-- 						</c:if> --%>
			<!--               <a class="refresh" href="#"><i class="icon refresh-icon"></i>刷新</a> -->
					</h2>
					<div class="status-bar">
						<div class="right-part">
							<div class="share-tools" style="
/*		 						display: none; */
								top: 2.8em;
								right: 14.6em;
							">
							<div class="bshare-custom icon-medium">
									<div class="bsPromo bsPromo2"></div>
<!-- 									<a title="分享到微信" class="bshare-weixin" href="#"></a> -->
<!-- 									<a title="分享到QQ空间" class="bshare-qzone" href="#"></a> -->
<!-- 									<a title="分享到新浪微博" class="bshare-sinaminiblog" href="#"></a> -->
									<a title="更多平台" class="bshare-more bshare-more-icon" style="width: 22px;height: 22px;margin: 4px 0;padding-left: 0 !important;
										background: url(${ctx}/resources/artcle/images/share-link.png) no-repeat 50% 50% / cover;"></a><span class="BSHARE_COUNT bshare-share-count">0</span>
							</div>
							</div>
							<span style=" line-height: 30px; vertical-align: top;">申请：${JkProject.applycount }</span>
							<a href="#"  class="favorite-btn"><i class="icon favorite-icon"></i>收藏</a>
<%-- 							<a href="#"><i class="icon eye-blue-icon"></i>${JkProject.browsevolume}</a> --%>
							<a href="#" class="like-btn"><i class="icon good-blue-icon"></i><span>${hasAdmires}</span></a>
			<!--                 <a href="#"><i class="icon share-blue-icon"></i>123</a> -->
						</div>
					</div>
				</div>
				<div class="preview-body">
					<div class="preview-details">
						<p><strong>项目类型：</strong>${JkProject.cateName}</p>
						<p><strong>分类详情：</strong>${JkProject.cateName}</p>
						<p>地域：
							<c:if test="${JkProject.projLocation!=null&&JkProject.projLocation!=''}">${JkProject.projLocation }</c:if>
							<c:if test="${JkProject.projLocation==null||JkProject.projLocation==''}">不限地区</c:if>
						</p>
						<p>明确预算：${JkProject.moneyNeeds}</p>
						<p>场次／数量：${JkProject.timesNumber}次</p>
						<p>设置申请截止日期：<fmt:formatDate value="${JkProject.applyTime }" pattern="yyyy-MM-dd"/></p>
						<p>活动的起止日期：<fmt:formatDate value="${JkProject.startTime }" pattern="yyyy-MM-dd"/> ——<fmt:formatDate value="${JkProject.endTime }" pattern="yyyy-MM-dd"/></p>
						<p>
							${JkProject.projDesc }
						</p>
		<%--           <p><img src="${ctx}/resources/artcle/images/pro-details.jpg" alt=""></p> --%>
						<p><strong>标签：</strong>
						<c:forEach var="jkTag" items="${jkTags}" >
							<span class="tag">${jkTag.tagName}</span>
						</c:forEach>
						</p>
						<p>
						<c:if test="${fileList!=null }">
							<strong>附件：</strong><c:forEach var="afile" items="${fileList}"><c:if test="${afile != null }"><a target="_blank" style="cursor:pointer;background: skyblue;border: 4px solid skyblue;border-radius: 4px;color: white; margin-right: 10px;" data-filepath="${afile.filePath}">${afile.fileName }</a></c:if></c:forEach>
						</c:if>
						</p>
					</div>
				</div>
				<p>
					<c:if test="${user_level==null||user_level==1}">
						<a class="cooperate-link"  href="javascript:;" onclick="showInfo4(${user_level})">与TA合作</a>
					</c:if>
					<c:if test="${user_level!=null&&user_level>1 }">
						<a class="cooperate-link"  onclick="joinHands()"style="cursor:pointer">与TA合作</a>
					</c:if>
				</p>
			</div>
			</div>

			<div class="preview-sidebar" style="padding: 0px 10px 10px 10px;display: inline-block;margin: 0;">
			<div class="author-info" style="width: 272px; background: white;">
				<div class="author-ir" style="float: right; width: 190px; text-align: left;">
					<h3 style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;font-weight: normal;margin: 0.2em 0;font-size: 14px;">姓名：${projUser.nickname}<c:if test="${projUser.gender==2 }"><i class="icon gender-girl"></i></c:if><c:if test="${projUser.gender!=2 }"><i class="icon gender-boy"></i></c:if><span style=" font-weight: normal; background: gainsboro; padding: 0 6px; border-radius: 5px; line-height: 23px; margin: 0; ">${projUser.influence }</span></h3>
					<div class="author-other-info">
						<c:if test="${projUser.idType==0}"><div class="pviews" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">学校/公司：${JkUserInfo.eduName }</div></c:if>
						<c:if test="${projUser.idType==1}"><div class="pviews" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">学校/公司：${JkUserInfo.companyName }</div></c:if>
						<div class="works-count" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">地区：${projUser.location}</div>
					</div>
				</div>
				<div class="author-il" style="width: 62px; margin-left: 10px;">
					<div class="author-avatar"><a href="${ctx}/login/toOtherUser?userid=${projUser.id}"><c:if test="${projUser.headPicPath != null && fn:startsWith(projUser.headPicPath, NORMAL_HEAD_ICON_URL)==false }"><img src="${projUser.headPicPath}" alt=""></c:if><c:if test="${projUser.headPicPath == null || fn:startsWith(projUser.headPicPath, NORMAL_HEAD_ICON_URL)==true }"><c:if test="${projUser.gender==2 }"><img src="${GIRL_HEAD_ICON_URL}" alt=""></c:if><c:if test="${projUser.gender!=2 }"><img src="${BOY_HEAD_ICON_URL}" alt=""></c:if></c:if></a></div>
				</div>
				<div class="author-tools-bar">
				<c:if test="${user.id!=JkProject.uid }">
				<c:if test="${jkUserFansFollows==null }">
				<div style="margin: 0 1em 0 3.5em;font-size: 90%;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;"><input type="hidden" id="author-id" value="${projUser.id}">未关注</div>
				</c:if>
				<c:if test="${jkUserFansFollows!=null }">
				<div style="margin: 0 1em 0 3.5em;font-size: 90%;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;" class="subscribe-btn"><input type="hidden" id="author-id" value="${projUser.id}">已关注</div>
				</c:if>
				</c:if>
				<c:if test="${user.id!=JkProject.uid }">
					<div style="margin: 0 1em 0 1em;font-size: 90%;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;" class="send-message">私信</div>
				</c:if>
				</div>
			</div>
			<div class="advertising" style="margin-top: 15px;">
				<!-- <a href="${projectAd.url}"><img src="${projectAd.image}" alt=""></a> -->
				<ul>
				<c:if test="${projectAds != null}">
				<c:forEach var="projectAd" items="${projectAds }">
					<li><a href="${projectAd.url}"><img style="width: 254px;height: 162px;padding: 9px;background: white;" src="${projectAd.image}" alt="1"/></a></li>
				</c:forEach>
				</c:if>
				<c:if test="${projectAds == null}">
					<li><a href="#"><img src="" alt="1" /></a></li>
				</c:if>
				</ul>
				<ol>
				<c:if test="${projectAds != null}">
				<c:forEach var="projectAd" items="${projectAds }">
					<li></li>
				</c:forEach>
				</c:if>
				<c:if test="${projectAds == null}">
					<li></li>
				</c:if>
				</ol>
			</div>
			<!-- 项目推荐 -->
			<div class="project-recomment" style="margin: 16px 0 0 0; background-color: #fff; width: 272px;">
				<div style="
					height: 45px;
					padding: 0 6px;
					line-height: 44px;
					border: 1px solid #f4f4f4;">
					<a style="
						vertical-align: middle;
						color: black; font-weight: bold;" href="#" >项目推荐</a>
				</div>
			<c:forEach var="recomment" items="${recomments}" >
				<div class='advice'>
					<div class="col c1">
						<a href="${ctx}/login/toProjectDetail?id=${recomment.t}"><img style="
							width: 96%;
							height: 100px;
							margin: 5px 2%;
						" src="${recomment.projPicPath }" alt=""></a>
					</div>
					<div class="col c2">
						<h3 style="margin: 0;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;"><a style="
							margin: 0 4%;
							" href="${ctx}/login/toProjectDetail?id=${recomment.t}"><span style="font-size: 12px;float:right;font-weight: normal;color: gainsboro;margin-right: 14px;">浏览量${recomment.browsevolume }</span><span style="width: 60%;display: inline-block;overflow: hidden;text-overflow: ellipsis;" class="blue-font">${recomment.projName }</span></a></h3>
						<p style="margin: 0;
							padding: 0 4%;
							"><span>${recomment.username }<i style="margin-left: 10px;" class="icon ${recomment.gender==2?'gender-girl':'gender-boy' }"></i><span style="margin-left: 10px"><i class="icon influence"></i>${recomment.influence }</span></span>
							<span style="text-align: right; float: right;width: 40%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><c:if test="${recomment.companyName!=null }">${recomment.companyName }</c:if>
							<c:if test="${recomment.eduName!=null }">${recomment.eduName }</c:if></span></p>
						<p style="margin: 0;
							padding: 0 4%;
						"><span style="color: #00acec;">￥${recomment.moneyNeeds }</span><i style="margin-left: 10px;" class="icon ${recomment.t==1?'self-support':'' }"></i><span style="font-size: 12px;float:right;font-weight: normal;color: gainsboro;margin-right: 14px;">${recomment.t==1?'自营':'' }</span>
							<span style="float: right; color: gainsboro;"><fmt:formatDate value="${recomment.createTime }" pattern="yyyy-MM-dd"/></span>
						</p>
					</div>
				</div>
			</c:forEach>
			</div>
			<!-- 项目推荐 END -->
			</div>
		</div>
		<c:if test="${JkProject.uid==login_userId}">
		<div class="docs gap">
			<div class="applicant-box">
				<div class="applicant-list-title"><strong>申请此项目的用户</strong></div>
				<ul class="applicant-list">
				<c:forEach var="jkProjectApply" items="${jkProjectApplyList}" >
					<li>
						<div class="col-1">
						<div class="col-inner">
							<div class="applicant-avatar"><a href="${ctx}/login/toOtherUser?userid=${jkProjectApply.uid}"><img src="${jkProjectApply.userPicPath }" alt=""></a></div>
						</div>
						</div>
						<div class="col-2">
							<div class="col-inner">${jkProjectApply.userName }<i style="margin-left: 15px;" class="icon ${jkProjectApply.gender==2?'gender-girl':'gender-boy' }"></i><br><i class="icon influence"></i>${jkProjectApply.influence }<br><c:if test="${login_userId==JkProject.uid }">${jkProjectApply.phone}<br>${jkProjectApply.companyName==null?jkProjectApply.eduName:jkProjectApply.companyName}<br></c:if><fmt:formatDate value="${jkProjectApply.createTime }" pattern="yyyy-MM-dd"/></div>
						</div>
						<div class="col-3">
							<div class="col-inner">${jkProjectApply.words}</div>
						</div>
						<div class="col-4">
						<div class="col-inner">
							<p><a href="${ctx}/mobileuserino/toUserChet?userid=${jkProjectApply.uid}" class="contact-link"><input type="hidden"  id="toId" value="${jkProjectApply.uid}"/>联系TA</a></p>
							<p>
								<c:if test="${jkProjectApply.status==0&&JkProject.uid==login_userId }"><a style="cursor:pointer; display: none;" onclick="agreeApply(${jkProjectApply.id},this);" id="agreetext">达成合作</a></c:if>
								<c:if test="${jkProjectApply.status==1&&JkProject.uid==login_userId }"><a style="cursor:pointer;" onclick="agreeApply(${jkProjectApply.id},this);" id="agreetext">撤销合作</a></c:if>
							</p>
						</div>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
		</c:if>
		<div class="recommend-box" style=" background: transparent; border: 0; ">
			<div class="recommend-title" style=" text-align: center; background: transparent; border: 0; font-weight: bold; ">猜你喜欢</div>
			<div id="recomment-box" style="overflow: hidden;height: 279px; position: relative;">
				<div class="icon left-arrow prev-btn" style="
				    position: absolute;
				    top: 110px;
				    width: 30px;
				    height: 60px;
				    left: 0;
				    cursor: pointer;
				"></div>
				<div id="recomment-box-wrapper" style="overflow-x: hidden;width: auto;height: 100%;margin: 15px;padding: 0;overflow-y: hidden;">
					<ul class="recommend-list" style="height: 215px;box-sizing: content-box;white-space: nowrap;padding: 0;margin: 32px; overflow: visible;">
					<c:forEach var="recommProj" items="${recommProjList}" >
						<li style="padding: 10px;background: white;box-sizing: border-box;width: 234px;height: 215px;margin: 0 29.5px;">
							<a href="${ctx}/login/toProjectDetail?id=${recommProj.id}">
								<div class="project-photo"><img style="height: 100%;" src="${recommProj.projPicPath}" alt=""></div>
								<div class="project-intro">
									<h3 style="text-overflow: ellipsis; overflow: hidden;">${recommProj.projName }</h3>
									<p style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden; "><span>${recommProj.username }</span><span class="orange-font" style="margin-left: 10px;">￥${recommProj.moneyNeeds }</span></p>
								</div>
							</a>
						</li>
					</c:forEach>
					</ul>
				</div>
				<div class="icon right-arrow next-btn" style="
				    position: absolute;
				    top: 110px;
				    height: 60px;
				    width: 30px;
				    right: 0px;
				    cursor: pointer;
				"></div>
			</div>
		</div>
	</div>
	</div>
	<form id="downloadform" action="${ctx}/artcle/download" method="post">
		<input type="hidden" name="url" value="1"/>
		<input type="hidden" name="fileName" value="2"/>
	</form>
   <!--动态包含-->
	<jsp:include page="foot.jsp" flush="true"/>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/jquery.luara.0.0.1.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
	function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
	var alert = window.new_alert || alert;
$(function() { // < !--调用Luara示例-->
	// 轮播
	$(".advertising").luara({
		width: "272",
		height: "180",
		interval: 4500,
		selected: "seleted",
		deriction: "left"
	});

	// 滚动展示建议
	var scrollApp = {
		init : function() {
			//校园达人切换
			this.carousel({
				el: $('#recomment-box-wrapper'),
				next: $('#recomment-box .next-btn'),
				prev: $('#recomment-box .prev-btn')
			});
		},
		carousel : function (args) {
			var $container = args.el;
			var $next = args.next;
			var $prev = args.prev;
			var $ul = $container.find('ul');
			var $li = $container.find('li');
			var liSize = $li.length;
			var liWidth = $li.outerWidth(true);
			var flag = true;
			$ul.width(liSize * liWidth);
			$next.on("click", function() {
				$ul.stop(true).animate({
					marginLeft: '-' + (liWidth) + 'px'
				}, function() {
					$ul.append($container.find('li:first-child'));
					$(this).css('margin-left', 0);
				});
			});
			$prev.on("click", function() {
				if(flag) {
					flag = false;
					$ul.css('margin-left', '-' + liWidth + 'px').prepend($container.find('li:last-child'));
					$ul.stop().animate({
						marginLeft: '0px'
					},function(){
						flag = true;
					});
				}
			});
		}
	};
	scrollApp.init();
});

$(function() {
	var hasCollect = $("#hasCollect").val();
	var hasAdmire = $("#hasAdmire").val();
	var hasAdmires = $("#hasAdmires").val();
	var currentProjId = $("#currentProjId").val();
	var login_userId = '<%=session.getAttribute("login_userId")%>';
	if (hasCollect == '1') {
		$('.status-bar a.favorite-btn').addClass('bright');
	}
	if (hasAdmire == '1') {
		$('.status-bar a.like-btn').addClass('bright');
	}

	//联系Ta
	var $smsBox = $(".sms-box");
	var toId = null;
	$('body').on('click', '.contact-link',
	function() {
		if (login_userId == 'null') {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后私信", ConfirmFun: function(){
				window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			} });
			return false;
		} else if (login_userId == $(this).find("input").val()) {
			alert('这是您自己的项目！');
			return false;
		}
		toId = $(this).find("input").val();
		$smsBox.removeClass('hide');
		return false;
	});
	$smsBox.on('click',
	function(e) {
		if (e.target === $smsBox[0]) {
			$smsBox.addClass('hide');
		}
	});
	$(".form-submit input[name=submit]").on('click',
	function() {
		var message = $("#message-input").val();
		$.ajax({
			type: "POST",
			url: ctx + "/mesg/addmesg",
			data: {
				toId: toId,
				content: message,
				type: 0
			},
			aysnc: true,
			dataType: "json",
			success: function(data) {
				alert("发送成功！");
				$smsBox.addClass('hide');
			}
		});
		return false;
	});
	//关注按钮
	$('.subscribe-btn').on('click',
	function() {
		return;
		if (login_userId == 'null') {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后关注", ConfirmFun: function(){
				window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			} });
			return;
		}
		var thisText = $(this).text();
		var $this = $(this);
		if (thisText == '+关注') {
			$.ajax({
				type: "POST",
				url: ctx + "/fansfollows/addfanfollow",
				data: {
					"fanid": login_userId,
					"followid": $("#author-id").val()
				},
				dataType: "json",
				success: function(data) {
					thisText = (thisText === '+关注') ? '<input type="hidden" id="author-id" value="' + $("#author-id").val() + '">-取消关注': '<input type="hidden" id="author-id" value="' + $("#author-id").val() + '">+关注';
					$this.html(thisText);
				}
			});
		} else if (thisText == '-取消关注') {
			$.ajax({
				type: "POST",
				url: ctx + "/fansfollows/delfanfollow",
				data: {
					"fanid": login_userId,
					"followid": $("#author-id").val()
				},
				dataType: "json",
				success: function(data) {
					thisText = (thisText === '+关注') ? '<input type="hidden" id="author-id" value="' + $("#author-id").val() + '">-取消关注': '<input type="hidden" id="author-id" value="' + $("#author-id").val() + '">+关注';
					$this.html(thisText);
				}
			});
		}
		return false;
	});

	function createOnce(str) {
		var span = document.createElement('span');
		span.style.opacity = 1;
		span.style.display = 'inline-block';
		span.style.width = '5px';
		span.style.left = '-2px';
		span.style.backgroundImage = 'url()';
		span.innerHTML = str;
		span.style.position = 'absolute';
		span.style.top = '-10px';
		span.style.transitionDuration = '2s';
		return span;
	}

	$('.status-bar a').on('click',
	function(e) {
		if(login_userId == null || login_userId=='null') {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后点赞/收藏/分享", ConfirmFun: function(){
				window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			} });
			return;
		}

		//点赞
		if ($(this).hasClass('like-btn')) {
			if($(this).hasClass('bright') ) {
				return;
			}
			$.ajax({
				type: "POST",
				url: ctx + "/operate/admire",
				data: {
					"fid": currentProjId,
					"type": 1
				},
				dataType: "json",
				success: function(data) {
					if ($(".like-btn>span").text() == hasAdmires && hasAdmire == '1') {
						$(".like-btn>span").text(parseInt(hasAdmires) - 1);
					} else if ($(".like-btn>span").text() == hasAdmires && hasAdmire == '0') {
						$(".like-btn>span").text(parseInt(hasAdmires) + 1);
					} else {
						$(".like-btn>span").text(hasAdmires);
					}
				}
			});
			var str = '+1';
			if ($(this).hasClass('bright')) {
				str = '-1';
			}
			var once = createOnce(str);
			e.target.appendChild(once);
			e.target.style.position = 'relative';
			setTimeout(function() {
				once.style.opacity = '0';
				once.style.top = '-30px';
			},
			0);
			setTimeout(function() {
				e.target.removeChild(once);
			},
			2000);

			$(this).toggleClass('bright');
			//收藏
		} else if ($(this).hasClass('favorite-btn')) {
			if (!$(this).hasClass('bright')) {
				$.ajax({
					type: "POST",
					url: ctx + "/operate/collect",
					data: {
						"fid": currentProjId,
						"type": 1
					},
					dataType: "json",
					success: function(data) {}
				});
				$(this).addClass('bright');
				var once = createOnce('+1');
				e.target.appendChild(once);
				e.target.style.position = 'relative';
				setTimeout(function() {
					once.style.opacity = '0';
					once.style.top = '-30px';
				},
				0);
				setTimeout(function() {
					e.target.removeChild(once);
				},
				2000);
			}
		}
		return false;
	});

	var applyStatus = $("#applyStatus").val();
	if (applyStatus != null && applyStatus != '') {
		alert(applyStatus);
	}

	//发私信按钮
	$('.author-info .send-message').on('click',
	function() {
		if(login_userId == null || login_userId=='null') {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后私信", ConfirmFun: function(){
				window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			} });
			return;
		}
		$smsBox.removeClass('hide');
		toId = '${JkProject.uid}';
		return false;
	});
	//下载附件
	$("a[data-filepath]").on("click",
	function() {
		// <input type="hidden" name="url" value="${fileList[0].filePath}"/>
		// <input type="hidden" name="fileName" value="${fileList[0].fileName}"/>
		$('#downloadform').find('input[name=fileName]').val($(this).html());
		$('#downloadform').find('input[name=url]').val($(this).data('filepath'));
		$("#downloadform").submit();
		return false;
	})
});

function joinHands() {
	var id = '${JkProject.id}';
	var projName = '${JkProject.projName}';
	$.ajax({
		type: "POST",
		url: ctx + "/project/canApplier",
		data: {
			"pid": id
		},
		dataType: "json",
		success: function(data) {
			if (data.error == '1') {
				alert(data.error_mesg);
			} else {
				window.location.href = ctx + "/login/toProjectApply?projId=" + id + "&projName=" + projName;
			}
		}
	});
}

function agreeApply(id, obj) {
	$.ajax({
		type: "POST",
		url: ctx + "/project/agreeApply",
		data: {
			"id": id
		},
		dataType: "json",
		success: function(data) {
			var $text = $(obj).text();
			if (data.error != "1" && $text == "达成合作") {
				alert("已达成合作！");
				$(obj).text("撤销合作");
			} else if (data.error != "1" && $text == "撤销合作") {
				alert("已撤销合作！");
				$(obj).text("达成合作");
			} else if (data.error == "1") {
				alert(data.error_mesg);
			}
		}
	});
	return false;
}

function showInfo4() {
	var userLevel = '${userLevel}';
	if(!userLevel)
		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后合作", ConfirmFun: function(){
			window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
		} });
	else if(userLevel <= 1) {
		$.DialogBySHF.Confirm({ Width: 350, Height: 200, Title: "提示", Content: "请您完成实名认证申请该项目", ConfirmFun: function(){
			window.open("${ctx}/login/toUser?item=authentication", "_self");
		} , CancelFun: function(){}});
	}
}

  </script>
  <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
  <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
</body>

</html>
