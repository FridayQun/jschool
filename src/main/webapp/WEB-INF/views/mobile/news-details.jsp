<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset='utf-8'>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telphone=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<title>鲸客校园</title>
<link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
<link rel="stylesheet" href="${ctx}/resources/mobile/css/news.css">
<script>
	var ctx = '${ctx}';
</script>
</head>

<body>
	<!-- 要用到的数据 -->
	<input type="hidden" id="currentNewsId" value="${jkNews.id}">
	<input type="hidden" id="hasCollect" value="${hasCollect}">
	<input type="hidden" id="hasAdmire" value="${hasAdmire}">

	<div class="news-details-box">
		<div class="details-title">${jkNews.title}</div>
		<div class="details-status">
			<div class="author-avatar">
				<a
					href="${ctx}/mobileuserino/toMobileOtherUserInfo/?userid=${jkUser.id}">
					<img src="${fn:startsWith(jkUser.headPicPath, NORMAL_HEAD_ICON_URL)?(jkUser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkUser.headPicPath}" alt="">
				</a>
			</div>

			<div class="author-info">
				<a
					href="${ctx}/mobileuserino/toMobileOtherUserInfo/?userid=${jkUser.id}">
					<span>${jkUser.username }</span><br> <span class="news-date"><fmt:formatDate
							value="${jkNews.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</a>
			</div>
			<div class="subscribe-btn">
				<c:if test="${jkUserFansFollows==null }"><input type="hidden" id="author-id" value="${jkUser.id}"><a style="visibility: hidden;">+关注</a></c:if><c:if test="${jkUserFansFollows!=null }"><input type="hidden" id="author-id" value="${jkUser.id}"><a>已关注</a></c:if>
			</div>
		</div>
		<div class="details-body">
			<p>${jkNews.content }</p>
			<div class="views-info">
				<i class="icon red-eye"></i>${jkNews.browsevolume }人浏览</div>
		</div>
	</div>
	<div class="comments-box">
		<ul class="comments-list">
		<c:if test="${commentList!=null}">
				<c:forEach var="comment" items="${commentList}">
					<li>
						<div class="guest-avatar">
							<img src="${comment.head_pic_path}" alt="">
						</div>
						<div class="message-box">
							<div class="guest-name">${comment.username }</div>
							<div class="guest-message">${comment.comment }</div>
							<div class="create-time">
								<fmt:formatDate value="${comment.create_time }"
									pattern="yyyy-MM-dd" />
							</div>
						</div> <!-- 		        <div class="like-btn active"></div> -->
					</li>
				</c:forEach>
		</c:if>
		</ul>
	</div>
	<div class="input-bar">
		<div class="input-box">
			<form class="sendMessage" action="##" method="post" id="sendMessage">
				<input type="text" name="message" value="" placeholder="写点评论...">
			</form>
		</div>
		<div class="message-remind-btn">
			<span class="sup">2</span>
		</div>
		<div class="favourite-btn"></div>
		<div class="like-btn"></div>
	</div>
	<script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
	<script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
	<script src="${ctx}/resources/mobile/js/common.js"></script>
	<script>
		$(function() {
			var currentNewsId = $("#currentNewsId").val();
			var hasCollect = $("#hasCollect").val();
			var hasAdmire = $("#hasAdmire").val();
			var login_userId = '<%=session.getAttribute("login_userId")%>';      

			//初始化收藏按钮的状态
			if (hasCollect == '1') {
				$('.input-bar .favourite-btn').toggleClass('active');
			}
			//初始化点赞按钮的状态
			if (hasAdmire == '1') {
				$('.input-bar .like-btn').toggleClass('active');
			}

			//留言,提示信息
			$('.input-bar .message-remind-btn').on('tap', function() {
				$(this).toggleClass('active');
			});
			//关注按钮
			$('.subscribe-btn a').on('tap',function(){
				return;
				if(login_userId=='null'){
		    		alert('未登录！');
		    		return;
		    	}
				var $this = $(this);
				var thisText = $(this).text();
		        if(thisText=='+关注'){
		        	$.ajax({
		                type: "POST",
		                url: ctx+"/fansfollows/addfanfollow",
		                data: {"fanid":login_userId,"followid":$("#author-id").val()},
		                dataType: "json",
		                success: function(data){     	  
					        thisText = (thisText =='+关注') ? '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">-取消关注' : '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">+关注';
					        $this.html(thisText);
		                }
		            }); 
		        }else if(thisText=='-取消关注'){
		        	$.ajax({
		                type: "POST",
		                url: ctx+"/fansfollows/delfanfollow",
		                data: {"fanid":login_userId,"followid":$("#author-id").val()},
		                dataType: "json",
		                success: function(data){     	  
					        thisText = (thisText =='+关注') ? '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">-取消关注' : '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">+关注';
					        $this.html(thisText);
		                }
		            }); 
		        }
				return false;
			});
			//收藏
			$('.input-bar .favourite-btn').on('tap', function() {
				if(!login_userId) {
					alert("请您登录后收藏");
					return false;
				}
				var self = $(this);
				if (!self.hasClass('active')) {
					$.ajax({
						type : "POST",
						url : ctx + "/operate/collect",
						data : {
							"fid" : currentNewsId,
							"type" : 2
						},
						dataType : "json",
						success : function(data) {
							self.addClass('active');
						}
					});

				}
			});
			//点赞
			$('.input-bar .like-btn').on('tap', function() {
				if(!login_userId) {
					alert("请您登录后点赞");
					return false;
				}
				var self = $(this);
				if(self.hasClass('active')) {
					return;
				}
				$.ajax({
					type : "POST",
					url : ctx + "/operate/admire",
					data : {
						"fid" : currentNewsId,
						"type" : 2
					},
					dataType : "json",
					success : function(data) {
						self.toggleClass('active');
					}
				});
			});

			//发布留言按钮
			$('#sendMessage')
					.on(
							'submit',
							function() {
								var $this = $(this).find("input");
								var comment = $(this).find("input").val();
								$
										.ajax({
											type : "POST",
											url : ctx + "/operate/comment",
											data : {
												"fid" : currentNewsId,
												"type" : 2,
												"comment" : comment,
												"score" : 50
											},
											dataType : "json",
											success : function(data) {
												if (data.error == '0') {
													$('.comments-list')
															.append(
																	'<li><div class="guest-avatar"><img src="'+data.user.headPicPath+'" alt=""></div><div class="message-box">\
                          <div class="guest-name">'
																			+ data.user.nickname
																			+ '</div><div class="guest-message">'
																			+ comment
																			+ '</div><div\ class="create-time">'
																			+ (new Date()
																					.toLocaleString())
																			+ '</div></div>\
                      </li>');
													if($('.comments-list li').last().length > 0){
														$('body').scrollTop($('.comments-list li').last().position().top);
													}
													$this.val('');
												} else {
													window.location.href = ctx
															+ "/mobile/login/toLogin";
												}
											}
										});
								return false;
							});

		})
	</script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
