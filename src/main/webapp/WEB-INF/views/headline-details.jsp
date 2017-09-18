<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/headline.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
      <script>
    var ctx = '${ctx}';
    var login_userId = <%=session.getAttribute("login_userId") %>
  </script>
  <style>
  </style>
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <!-- 要用到的数据 -->
  <input type="hidden" id="currentNewsId" value="${jkNews.id}">
  <input type="hidden" id="hasCollect" value="${hasCollect}">
  <input type="hidden" id="hasAdmire" value="${hasAdmire}">
  
  <div class="headline-section">
    <div class="wrapper">
      <div class="headline-details">
        <div class="details-body">
          <div class="content">
            <div class="details-header">
              <h3>${jkNews.title}</h3>
              <p>来源：${jkNews.source }</p>
              <div class="header-share-box">
                <div class="bshare-custom icon-medium">
							    <div class="bsPromo bsPromo2"></div>
							    <a title="分享到微信" class="bshare-weixin" href="#"></a>
							    <a title="分享到QQ空间" class="bshare-qzone" href="#"></a>
							    <a title="分享到新浪微博" class="bshare-sinaminiblog" href="#"></a>
							    <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
							  </div>
                <p><small>发布时间：<fmt:formatDate value="${jkNews.createTime }" pattern="yyyy年MM月dd日"/></small></p>
              </div>
            </div>
            <div class="main-box">
              <p>
              	${jkNews.content }
              </p>
<!--               <p><img src="${ctx}/resources/artcle/images/headline-photo.png" alt=""></p> -->
            </div>
            <div class="details-footer">
              <a href="javascript:;" class="tools-btn like-icon"></a>
<!--               <a href="#" class="tools-btn comment-icon"></a> -->
              <a href="#" class="tools-btn favorites-icon"></a>
            </div>
            <div class="comment-box">
              <div class="input-comment-box">
                <div class="user-avatar"><img src="${ctx}/resources/artcle/images/guest-avatar.png" alt=""></div>
                <div class="input-box">
                    <div class="message-textarea">
                      <div class="textareaMessage" contenteditable="true" >我有话说.....</div>
                      <div class="message-tools-bar">
                        <div id="smilies-btn" class="smilies-btn"></div>
                      </div>
                    </div>
                    <div class="submit-message-bar"><button style="cursor: pointer;" type="button">发 布</button></div>
                </div>
              </div>
              <div class="comments-list-box">
                <div class="comments-title">最新评论</div>
                <c:if test="${commentList!=null}">
	                <ul id='comments-list' class="comments-list">
	                  <c:forEach var="comment" items="${commentList}" >
		                  <li>
		                    <div class="observer-avatar"><img src="${comment.head_pic_path}" alt=""></div>
		                    <div class="observer-info"><span>${comment.username }：</span><br><span><fmt:formatDate value="${comment.create_time }" pattern="yyyy-MM-dd"/></small></span></div>
		                    <div class="observer-message">${comment.comment }</div>
		                  </li>
	                  </c:forEach>
	                </ul>
	                <hr>
					<c:if test="${fn:length(commentList) < commentsCount}">
						<p style="
							display: block;
							text-align: center;
							margin-top: 50px;
							background: #f4f5f6;
							padding: 3px;
						"><a id="show-more" href="#" style="
							background: #f4f5f6;
							color: #406599;
							box-shadow: 0 0 6px #f4f5f6;
							padding: 0px 30px;
						">查看更多</a></p>
					</c:if>
                </c:if>
                <c:if test="${commentList==null}">
	                <!-- 如果没有评论，显示下面这个 -->
	                <div class="empty-comments">还未有评论！</div>
                </c:if>
              </div>
            </div>
          </div>
        </div>
        <div class="details-sidebar">
          <div class="author-info">
            <div class="author-il">
              <div class="author-avatar"><a href="javascript:;" onclick="checkLogin()"><img src="${(fn:startsWith(jkUser.headPicPath,NORMAL_HEAD_ICON_URL)||jkUser.headPicPath==null)?(jkUser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkUser.headPicPath}" alt=""></a></div>
            </div>
            <div class="author-ir">
              <h3 style="font-weight: normal;">${jkUser.nickname}<i class="icon ${jkUser.gender==2?'gender-girl':'gender-boy' }"></i><span style="margin-left: 10px;"><i class="icon influence"></i>${jkUser.influence }</span></h3>
              <div class="author-other-info">
                <div class="works-count">地区：${jkUser.location }</div>
                <c:if test="${jkUser.idType==0}"><div class="pviews">学校：${JkUserInfo.eduName }</div></c:if>
	            <c:if test="${jkUser.idType==1}"><div class="pviews">公司：${JkUserInfo.companyName }</div></c:if>
	            <c:if test="${user.id!=jkNews.uid }">
              	<div class="subscribe-btn" style="margin: 10px 0 0 0;display: inline-block;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;"><c:if test="${jkUserFansFollows==null }"><input type="hidden" id="author-id" value="${jkUser.id}">未关注</c:if><c:if test="${jkUserFansFollows!=null }"><input type="hidden" id="author-id" value="${jkUser.id}">已关注</c:if></div>
                </c:if>
                <div style="display: inline-block;width: 74px;line-height: 1.8em;border-radius: 0.2em;text-align: center;margin: 10px 20px 0 20px;cursor: pointer;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;" class="send-message">私信</div>
              </div>
            </div>
          </div>
          <c:forEach var="newsAd" items="${newsAds}" >  
	          <div class="details-sidebar-ad"><a href="${newsAd.url}"><img src="${newsAd.image}" alt=""></a></div>
      	  </c:forEach>
          <div class="details-hot-list">
            <div class="hot-title">热门资讯</div>
            <ul>
            	<c:forEach var="news" items="${newsList}"  varStatus="status" begin='0' end='10'>
		        	<li><a href="${ctx}/login/toNewsDetails?id=${news.id}"><i>${ status.index+1}</i>${news.title }</a></li>
            	</c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script><script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
    $(function() {
    	var $smsBox = $(".sms-box");
  	  var hasCollect = $("#hasCollect").val();
	  var hasAdmire = $("#hasAdmire").val();
	  var currentNewsId = $("#currentNewsId").val();
	  var login_userId = '<%=session.getAttribute("login_userId")%>';      
	  
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
	
      var $commentsList = $('.comments-list');
      var $messageArea = $('.message-textarea .textareaMessage');
      function insertFace(el, callback) {
        var $faceBox = el.find('.faceBox');
        if ($faceBox.length < 1) {
          var strFace = '<div class="faceBox"><table border="0" cellspacing="0" cellpadding="0"><tr>';
          var labFace = '';
          for (var i = 1; i <= 75; i++) {
            labFace = '[em_' + i + ']';
            strFace += '<td><img data-label="' + labFace + '" src="${ctx}/resources/artcle/js/face/' + i + '.gif"/></td>';
            if (i % 15 == 0) strFace += '</tr><tr>';
          }
          strFace += '</tr></table></div>';
          el.append(strFace);
          $faceBox = el.find('.faceBox');
          $faceBox.find('td img').on('click', function() {
            callback($(this).attr('data-label'));
            $faceBox.addClass('hide');
            return false;
          });
        } else {
          $faceBox.removeClass('hide');
        }
      }
      function getNow() {
        var date = new Date();
        return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate()) + ' ' + (date.getHours()) + ':' + (date.getMinutes());
      }
      function appendComments (data){
        $commentsList.prepend('<li><div class="observer-avatar"><img src="'+data.avatar+'" alt=""></div>\
        <div class="observer-info"><span>'+data.guest+'：</span><br><span>'+data.datetime+'</span></div>\
        <div class="observer-message">'+data.message+'</div></li>'
        );
      }
      //表情符号替换成图片
      function replaceEm(str) {
        str = str.replace(/\</g, '&lt;');
        str = str.replace(/\>/g, '&gt;');
        str = str.replace(/\n/g, '<br/>');
        str = str.replace(/\[em_([0-9]*)\]/g, '<img src="${ctx}/resources/artcle/js/face/$1.gif" border="0" />');
        return str;
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
      //初始化时，替换表情代码为图片
      $('.comments-list .observer-message').each(function(item,index){
    	  $(this).html(replaceEm($(this).text()));
      });
      //表情选择
      $('#smilies-btn').on('click', function() {
        insertFace($(this), function(faceCode) {
          $messageArea.append(faceCode);
        });
        return false;
      });
      //发布留言按钮
      $('.submit-message-bar button').on('click',function(){
    	  var login_userId = <%=session.getAttribute("login_userId") %>
    	  if(!login_userId) {
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后发布评论", ConfirmFun: function(){
				  window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			  } });
    		  return ;
    	  }
    	  var comment = escapeHtml($(".textareaMessage").text());
          $.ajax({
              type: "POST",
              url: ctx+"/operate/comment",
              data: {"fid":currentNewsId,"type":2,"comment":comment,"score":50},
              dataType: "json",
              success: function(data){     
            	  if(data.error=='0'){
                      var message = $messageArea.text();
                      appendComments({
                        avatar : data.user.headPicPath,
                        guest  : data.user.username,
                        datetime : getNow(),
                        message  : replaceEm(message)
                      });
                      $messageArea.text('');
            	  }else{
            		  window.location.href=ctx+"/login/toLogin";
            	  }
              }
          });  
      });
      //初始化收藏按钮的状态
	  if(hasCollect=='1'){
		  $('.details-footer .tools-btn.favorites-icon').addClass('active');
	  }
      //初始化点赞按钮的状态
	 if(hasAdmire=='1'){
		 $('.details-footer .tools-btn.like-icon').addClass('active');
	  }
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
      //点赞按钮
      $('.details-footer .tools-btn.like-icon').on('click',function(e){
    	  var login_userId = <%=session.getAttribute("login_userId") %>
    	  if(login_userId === null) {
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后点赞", ConfirmFun: function(){
				  window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			  } });
    		  return ;
    	  }
    	var self = $(this);
    	if(self.hasClass('active')) {
    		return;
    	}
        $.ajax({
            type: "POST",
            url: ctx+"/operate/admire",
            data: {"fid":currentNewsId,"type":2},
            dataType: "json",
            success: function(data){      
            	self.toggleClass('active');
            }
        });
        var str = '+1';
		if ($(this).hasClass('active')) {
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
        return false;
      });
      //收藏按钮
      $('.details-footer .tools-btn.favorites-icon').on('click',function(e) {
    	  var login_userId = <%=session.getAttribute("login_userId") %>
    	  if(login_userId === null) {
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后收藏", ConfirmFun: function(){
				  window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			  } });
    		  return ;
    	  }
    	var self = $(this);
        if(!$(this).hasClass('active')){
    	  $.ajax({
              type: "POST",
              url: ctx+"/operate/collect",
              data: {"fid":currentNewsId,"type":2},
              dataType: "json",
              success: function(data){     	  
            	  self.addClass('active');
              }
          }); 
        }
        var str = '+1';
		if ($(this).hasClass('active')) {
			str = '';
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
        return false;
      });
    	//关注按钮
      $('.subscribe-btn').on('click',function(){
    	  return false;
    	if(login_userId=='null'){
    		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后关注", ConfirmFun: function(){
				window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			} });
    		return;
    	}
        var thisText = $(this).text();
        var $this = $(this);
        if(thisText=='+关注'){
        	$.ajax({
                type: "POST",
                url: ctx+"/fansfollows/addfanfollow",
                data: {"fanid":login_userId,"followid":$("#author-id").val()},
                dataType: "json",
                success: function(data){     	  
			        thisText = (thisText ==='+关注') ? '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">-取消关注' : '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">+关注';
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
			        thisText = (thisText ==='+关注') ? '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">-取消关注' : '<input type="hidden" id="author-id" value="'+$("#author-id").val()+'">+关注';
			        $this.html(thisText);
                }
            }); 
        }
        return false;
      });
    });

$(document).ready(function() {
	var login_userId = '<%=session.getAttribute("login_userId")%>';

	var fid = location.search.substr(1).split('&');
	for(var i=0; i<fid.length; i++) {
		if(fid[i].split('=')[0] == 'id') {
			fid = fid[i].split('=')[1];
			break;
		}
	}
	var currentCommentsCount = ${fn:length(commentList)};
	var page = 1;
	var pageSize = 10;
	var commentsCount = ${commentsCount};
	$('#show-more').on('click', function() {
		var data = {
			"fid": fid,
			"pageNum": ++page,
			"pageSize": pageSize
		};
		$.ajax({
			type: "POST",
			url: ctx+"/operate/getCommentList",
			data: data,
			dataType: "json",
			success: function(data) {
				currentCommentsCount += data.list.length;
				if(currentCommentsCount >= commentsCount) {
					$('#show-more').hide();
				}
				for(var i=0; i<data.list.length; i++) {
					$('#comments-list').append(format.call('<li><div class="observer-avatar"><img src="{head_pic_path}" alt=""></div><div class="observer-info"><span>{username}：</span><br><span>{create_time}</small></span></div><div class="observer-message">{comment}</div></li>', {
						'head_pic_path': data.list[i].head_pic_path,
						'username': data.list[i].username,
						'create_time': data.list[i].create_time,
						'comment': data.list[i].comment
					}));
				}
			}
		});
	});
});

function checkLogin() {
	var login_userId = <%=session.getAttribute("login_userId") %>
	if(login_userId === null) {
		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后查看", ConfirmFun: function(){
			window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
		} });
		return ;
	} else {
		window.open("${ctx}/login/toOtherUser?userid=${jkUser.id}", "_self");
	}
}

function format(args) {
	var res = this;
	if(arguments.length == 1 && typeof(args) != 'string') {
		for(var key in args) {
			// if(args[key] == undefined) continue;
			var reg = new RegExp("({)"+key+"(})", "g");
			if(args[key]!=undefined && args[key]!=null)
				res = res.replace(reg, args[key]);
			else
				res = res.replace(reg, '');
		}
	} else {
		for(var i=0; i<arguments.length; i++) {
			// if(arguments[i] == undefined) continue;
			var reg = new RegExp("({)"+i+"(})", "g");
			if(arguments[key]!=undefined && arguments[key]!=null)
				res = res.replace(reg, arguments[i]);
			else
				res = res.replace(reg, '');
		}
	}
	return res;
}
function getDate(time) {
	var date = new Date(time);
	var year = date.getFullYear();
	var month = '0'+(date.getMonth()+1);
	month = month.substr(-2);
	var day = '0'+date.getDate();
	day = day.substr(-2);
	return year+month+day;
}
  </script>
  <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
  <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
</body>

</html>
