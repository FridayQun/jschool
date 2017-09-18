<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="<%=request.getContextPath()%>" />
<c:set var="mesctx" value="<%=request.getContextPath()%>" />
<c:set var="pageSize" value="5" />
<style>
.slider-bar {
	position: fixed;
	right: 20px;
	bottom: 20%;
	height: 120px;
	width: 30px;
	z-index: 9999;
	display: none;
	box-shadow: 0px 0px 6px grey;
	background: white;
	transition: height 0.5s;
}

.detial-container {
	width: 200px;
	height: 200px;
	position: absolute;
	left: -210px;
	top: 0;
	display: none;
	box-shadow: 0px 0px 6px grey;
}
</style>
<script type="text/javascript">
	var mesgurl='${ctx}';
	function scrollTopTopButton() {
		$('html,body').animate({scrollTop: $('#go-to-top').offset().top}, 100);
	}
</script>
	<div id="slider-bar" class="slider-bar" style="display: none; background: rgb(130,200,206);">
		<a href="#" class="detail" style="position: relative;" data-index="0"><i class="icon slider-wechat" style="width: 30px;height: 30px;margin: 0;"></i></a>
		<a href="#" class="detail" style="position: relative;" data-index="1"><i class="icon slider-weibo" style="width: 30px;height: 30px;margin: 0;"></i></a>
		<a href="#" onclick="scrollTopTopButton()"><i class="icon go-to-top" style="width: 30px;height: 30px;margin: 0;"></i></a>
		<a class="feedback-link" style="position: absolute; bottom: 0; left: 0;" href="#"><span style="
			background-color: rgb(130,200,206);
			width: 30px;
			height: 30px;
			display: inline-block;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 10px;
			">反馈</span></a>
		<div class="detial-container" style="display: none;"><img src="${ctx }/resources/artcle/images/weibo-qrcode.png" alt="微博" title="微博"></div>
		<div class="detial-container" style="display: none;"><img src="${ctx }/resources/artcle/images/wechat-qrcode.png" alt="微博" title="微博"></div>
	</div>

	<div class="top-bar" id="go-to-top">
		<div class="wrapper" id="wrapper">
			<div class="welcome-hint">鲸客网，一站式校园活动解决专家</div>
			<div class="right-block">
				<div class="login-block">
					<a href="${ctx}/login/toLogin">登录</a> <span class="separate">|</span>
					<a href="${ctx}/login/toRegister">免费注册</a>
				</div>
				<div class="share-block">
					<a href="" class="wq"><i class="icon wechat"></i>微信</a>
					<a href="#" class="wb"><i class="icon weibo"></i>微博</a>
				</div>
			</div>
		</div>

		<div class="wrapper" id="wrapper_hasLogin" hidden>
			<div class="welcome-hint">鲸客网，一站式校园活动解决专家</div>
			<div class="right-block">
				<div class="login-block logon">
					<a href="${ctx}/">首页</a> <span id="login_phone"><a
						href="${ctx}/login/toUser"></a></span> <span class="separate">|</span> 
						 <a href=""
						class="sms-hint">消息<span id="dot" class="dot"></span></a>
				</div>
				<div class="share-block">
					<a href="" class="wq"><i class="icon wechat"></i>微信</a>
					<a href="" class="wb"><i class="icon weibo"></i>微博</a> <a href="${ctx}/login/loginOut">退出</a>
				</div>
			</div>
		</div>
		<div class="wrapper">
			<!--  消息弹窗 -->
			<div class="message-board hide">
				<div class="sidebar">
					<div class="sidebar-title">消息列表</div>
					<ul class="message-list">

					</ul>
				</div>
				<div class="message-body">
					<div class="body-title">
						<span></span><span class="close-btn"></span>
					</div>
					<div class="message-details">
						<ul class="details-list">

						</ul>
						<div class="mark"></div>
					</div>
					<div class="message-input-bar">
						<form class="inputForm cf" action="#" method="post">
							<div class="input-col input-box">
								<textarea name="message"></textarea>
							</div>
							<div class="input-col submit-box">
								<input type="submit" name="submit" value="发 送">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--  消息弹窗结束 -->
		</div>
	</div>
<%
	try {
		String tStr1 = (String) request.getAttribute("javax.servlet.forward.request_uri");
		String tStr2 = request.getQueryString();
		String m = tStr1;
		if (tStr2 != null) {
			m += "?" + tStr2;
		}
		m = URLDecoder.decode(m, "UTF-8");
		request.setAttribute("m", m);
	} catch(Exception e) {
	    out.print(e.getMessage());
	}
%>
	<div class="header">
		<div class="wrapper">
			<div class="logo">
				<a href="${ctx}/"><img
					src="${ctx}/resources/artcle/images/logo.png" alt=""></a>
			</div>
			<div class="search-bar">
				<form action="${ctx}/login/toProjectList" method="get">
					<input type="search" name="keywords" value="${keywords }"
						placeholder="请输入赞助、活动、学校等关键字"><input type="submit"
						name="submit" value="搜索">
				</form>
				<c:if test="${user_level==null||user_level==1 }">
					<a href="#" onclick="showInfo(${user_level})">发布信息</a>
				</c:if>
				<c:if test="${user_level!=null&&user_level>1 }">
					<a href="${ctx}/login/toPublish">发布需求</a>
				</c:if>
			</div>
		</div>
	</div>
	<div class="nav-bar">
		<div class="wrapper">
			<ul class="nav-main-bar">
<%-- 				<li><a href="${ctx}/">首页</a></li> --%>
				<c:set var="sysModuleListLength" value="${fn:length(sysModuleList)-9 }" />
				<c:if test="${sysModuleListLength < 0 }">
					<c:set var="sysModuleListLength" value="6" /> 
				</c:if>
				<c:forEach var="sysModule" begin="0" end="${sysModuleListLength }" items="${sysModuleList}" step="1" >
					<c:if test="${sysModule.isShow == 0 }">

						<%-- <c:if test="${sysModule.moduleUrl!=null&&sysModule.moduleUrl!=''}"><li><a class="${tagName==sysModule.moduleName?'active':'' }" href="${ctx}/login/${sysModule.moduleUrl}">${sysModule.moduleName}</a></li></c:if> --%>
						<c:if test="${sysModule.moduleUrl!=null&&sysModule.moduleUrl!=''}">
							<li>
								<a class="${fn:contains(m, sysModule.moduleUrl)?"active":""}" href="${ctx}/login/${sysModule.moduleUrl}">${sysModule.moduleName}</a>
							</li>
						</c:if>

						<c:if test="${sysModule.moduleUrl==null||sysModule.moduleUrl==''}">
							<li>
								<a class="" href="${ctx}/login/${sysModule.moduleUrl}">${sysModule.moduleName}</a>
							</li>
						</c:if>
					</c:if>
				</c:forEach>
				<%--<li><a class="${tagName=='红人馆'?'active':'' }" href="${ctx}/login/toCelebrity">红人馆</a></li>
				<li><a class="${tagName=='校园头条'?'active':'' }" href="${ctx}/login/toHeadline?tagName=校园头条">校园头条</a></li>--%>
			</ul>
			<div class="service-list">
				<ul></ul>
			</div>
			<div class="service-list-details hide">
				<ul class="more-list"></ul>
				<div class="recommend-nav">
					<ul class="recommend-list"></ul>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/slick.min.js"></script>
	<script>
	function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
	  var alert = window.new_alert || alert;
	  $(function() {
		  $(document).ready(function() {
			  var showSlideBar = false;

// 			  $('#slider-bar').on('mouseenter', function() {
// 				  $(this).css('height', '120px');
// 				  setTimeout(function() {
// 					  $('#slider-bar').children('a').css('display', 'inline');
// 				  }, 500);
// 			  });
// 			  $('#slider-bar').on('mouseleave', function() {
// 				  $(this).css('height', '30px');
// 				  $('#slider-bar').children('a:eq(3)').siblings('a').css('display', 'none');
// 			  });

			  $(window).on('scroll', function() {
				  var t = document.documentElement.scrollTop || document.body.scrollTop;
				  if(t < 20 && showSlideBar) {
					  $('#slider-bar').hide();
				  }
				  if(t > 20 && !showSlideBar) {
					  $('#slider-bar').show();
				  }
				  if(t < 20) {
					  showSlideBar = false;
				  } else {
					  showSlideBar = true;
				  }
			  });
			  
			  $('#slider-bar > .detail').on('mouseenter', function() {
				  var index = $(this).data('index');
				  console.log($(this));
				  $('#slider-bar>div:eq('+index+')').show();
			  });
			  $('#slider-bar > .detail').on('mouseleave', function() {
				  var index = $(this).data('index');
				  $('#slider-bar>div:eq('+index+')').hide();
			  });
		  });

		  function delnull(value) {
			  if(value==null){
				  return '';
			  }else{
				  return value;
			  }

		}

		function delurl(item) {
			return item.content.indexOf("<a href=")==-1?item.content:item.content.replace("<a href=\"","<a href=\""+mesgurl+"");
			
		}
		  console.log(delurl({content:'<a href="/login/torecomlist?cid=6&projLocation=北京市:北京市市辖区&projType=0">项目推荐链接</a>'}));
		  
	  	  var login_userId = '<%=session.getAttribute("login_userId")%>';
	  	  var login_phone = '<%=session.getAttribute("login_phone")%>';
	  	  var uid=" ";
		  if(login_userId=='null'||login_phone=='null'){
			  $("#wrapper_hasLogin").hide();
			  $("#wrapper").show();
		  }else{
			  $("#wrapper").hide();
			  $("#wrapper_hasLogin").show();
			  $("#login_phone a").text("个人中心");
		  }
		  //消息面板
		  (function(){
			  var $messageBoard = $('.message-board');
			  var $sidebar = $('.sidebar');
			  var $detailsList = $('.message-board .details-list');
			  var $UserList = $('.message-list');
			  var userlist;
			  userId = 0;
			  //渲染聊天列表
			  function renderDetailList(msgArr,empty){
				  empty && $detailsList.empty();
				  $detailsList.append($.map(msgArr,function(item){
					  console.log(item);
					  return('<li class="'+(login_userId!=item.from_id ? 'left' : 'right')+'"><div class="message-time">'+fotmattertime(item.send_time)+'</div>\
		                <div class="pos-box"><div class="message-text">'+delurl(item)+'</div></div></li>');
		          }).join(''));
				  	$('.message-details').scrollTop($('.details-list').height());
				 }

			  function renderUserList(msgArr,empty){
				  empty && $UserList.empty();
				  $UserList.append($.map(msgArr,function(item){
					  return('<li>\
							    <a href="${ctx}/login/toOtherUser?userid='+item.uid+'">\
								<div class="user-avatar">\
									<img src="'+item.head_pic_path+'" alt="">\
								</div></a>\
								<div class="user-info">\
									<div class="user-name">\
										<span>'+item.nickname+'</span><span class="send-time">'+fotmatter(item.send_time)+'</span>\
									</div>\
									<div class="last-message">'+item.content+'<span class="unread">'+delnull(item.count)+'</span></div>\
								</div>\
							</li>');
		          }).join(''));
				 }
			  //选择联系人
			  function liActive(index){
				  var $targetLi = $('.message-list li').eq(Number(index));
				  $targetLi.trigger('click');
				  $sidebar.scrollTop($targetLi.position().top);
				  userId = index;
				}
			  //获取时间
		    function getNow() {
		    	var date = new Date();
		    	return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate()) + ' ' + (date.getHours()) + ':' + (date.getMinutes());
			  }
			  
		    function escapeHtml(string) {
		        var entityMap = {
		            "&": "&amp;",
		            "<": "&lt;",
		            ">": "&gt;",
		            '"': '&quot;',
		            "'": '&#39;',
		            "/": '&#x2F;'
		        };
		        return String(string).replace(/[&<>"'\/]/g, function (s) {
		            return entityMap[s];
		        });
		    }
			  //联系人切换
			  $('.message-board .message-list ').on('click','li',function(){
				  var userName = $(this).find('.user-name span:not(".send-time")').text();
				  $(this).addClass('active').siblings().removeClass('active');
				  $('.body-title span:not(".close-btn")').text(userName);
				  userId = $(this).index();
				   uid=userlist[userId].uid;
				  console.log(uid);
				  $.ajax({
				        type: "POST",
				        url: mesgurl+"/mesg/getmesglistuserone",
				        data: {
				        	userid:uid
				        },
				        aysnc:true,
				        dataType: "json",
				        success: function(data){
				        	renderDetailList(data,1);
			   			 }

			  		});
				  //加载数据
		      //刷新列表 renderDetailList(data,true);
		     });
			  //消息输入
			  $('.message-board .inputForm').on('submit',function(){
				  if(uid==" "){
					  var alert = window.new_alert || alert;
					  alert("请选择一条");
					  return false;
				  }
				  var message = escapeHtml($(this).find('textarea').val());
				  var $listInfo = $('.message-list li').eq(userId);
				  var $input=$(this);
				  //更新左侧列表信息
				  $listInfo.find('.last-message').text(message);
				  $listInfo.find('.send-time').text(getNow());
				  //更新聊天信息列表

				    $.ajax({
				        type: "POST",
				        url: mesgurl+"/mesg/addmesg",
				        data: {
				        	toId:uid,
				        	content:message,
				        	type:0
				        },
				        aysnc:true,
				        dataType: "json",
				        success: function(data){
				        	console.log(message,getNow());

				        	  		$input.find('textarea').val('');
   							 }

  					});

				    renderDetailList([{
				 		 send_time : getNow(),
				 		 content  : message,
				 		 from_id:login_userId,
       	  		}]);

				  //保存消息
				  return false;
		   	});
			  //打开消息面板
			  $('.login-block .sms-hint').on('click',function(){
				   $messageBoard.toggleClass('hide');
				  //liActive(2);
				 	$.ajax({
				         type: "POST",
				         url: mesgurl+"/mesg/getmesglistuser",
				         data: {
				        	// pageNumber:pageNumber,
				       		// pageSize:pageSize,
				         },
				         aysnc:true,
				         dataType: "json",
				         success: function(data){
				        	 userlist=data.rows;
				        	 renderUserList(data.rows,1);
				        	 uid=data.rows[0].uid
				        	 $('.body-title span:not(".close-btn")').text(data.rows[0].nickname);
				        	  $.ajax({
							        type: "POST",
							        url: mesgurl+"/mesg/getmesglistuserone",
							        data: {
							        	userid:data.rows[0].uid
							        },
							        aysnc:true,
							        dataType: "json",
							        success: function(data){
							        	renderDetailList(data,1);
						   			 }

						  		});

				         }

			 	  });

				  return false;
			  });
				//关闭消息面板
			  $('body').on('click',function(e){
				  if($('.message-board ').find(e.target).length < 1){
					  $messageBoard.addClass('hide');
					}
				 });
		})()

		$.ajax({
	        type: "POST",
	        url: mesgurl+"/mesg/getcountbyuidnotread",
	        data: {
	        	toId:uid,
	        },
	        aysnc:true,
	        dataType: "json",
	        success: function(data){
	        	if(data>0){
	        		$("#dot").show();
	        		$('#dot').text(data);
	        	}else{
	        		$("#dot").hide();
	        	}
   			 }

  		});
		$("title").text("鲸客校园");  
	 });

	  function fotmatter(data) {
          var date = new Date(data);
          return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
        }
	  function fotmattertime(data) {
          var date = new Date(data);
          return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate())+' '+(date.getHours()+':'+date.getMinutes());
        }
	  function showInfo(userLevel){
		  var alert = window.new_alert || alert;
		  if(userLevel==null)
			  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后发布需求", ConfirmFun: function(){
				  window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			  } });
		  else if(userLevel<=1) {
			  $.DialogBySHF.Confirm({ Width: 350, Height: 200, Title: "提示", Content: "请您完成实名认证后发布项目", ConfirmFun: function(){
				  window.open("${ctx}/login/toUser?item=authentication", "_self");
			  } , CancelFun: function(){}});
		  }
	  }

	  $(document).ready(function() {
		  var msgTip = '${param.msgTip}';
		  if(msgTip) {
			  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: decodeURIComponent(msgTip), ConfirmFun: function(){}});
		  }
	  });
  </script>
