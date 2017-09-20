<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
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
  var url='${ctx}';
  var ctx = '${ctx}/resources/artcle';
  </script>      

	<style>
i.display-bar {
	width: 0.7rem;
	margin: 0 0.2rem;
}
i.display-bar:before {
    content: '=';
}
.detail-area {
	margin-left: 10px;
}
.detail-item {
	padding-left: 20px;
}
.horizontal-parting-line {
	border-top: 1px solid grey;
	padding-top: 10px;
}
.horizontal-parting-line:first-child {
	border-top: none;
	padding-top: 0;
}
	</style>
</head>

<body>
 <%Integer id = (Integer)session.getAttribute("login_userId");%>
 <input type="hidden" id="uid"  value="<%=id%>"/>
 <input type="hidden" id="infoid"  value="${jkuser.id}"/>
 <input type="hidden" id="type"  value="${type}"/>
  <div class="user-home-box">
        <c:choose>
       <c:when test="${not empty jkuser.backgroundPicture}">
    	  <div class="user-info" style="background-image:url(${jkuser.backgroundPicture})">
        </c:when>
         <c:otherwise>
      	   <div class="user-info" style="background-image:url(${ctx}/resources/artcle/images/user-bg.jpg)">
       </c:otherwise>
      </c:choose>
      <c:if test="${empty jkuser.headPicPath}">
    	  <div class="user-avatar"><img src="${jkuser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL }" alt=""></div>
      </c:if>
      <c:if test="${not empty jkuser.headPicPath}">
    	  <div class="user-avatar"><img src="${fn:startsWith(jkuser.headPicPath, NORMAL_HEAD_ICON_URL)?(jkuser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkuser.headPicPath}" alt="456"></div>
      </c:if>
      <p><strong class="user-name">${jkuser.nickname}</strong><c:if test="${jkuser.userLevel == 2}"><c:if test="${jkuser.gender==2 }"><i class="icon gender-real-girl"></i></c:if><c:if test="${jkuser.gender!=2 }"><i class="icon gender-real-boy"></i></c:if></c:if><c:if test="${jkuser.userLevel != 2}"><c:if test="${jkuser.gender==2 }"><i class="icon gender-n-real-girl"></i></c:if><c:if test="${jkuser.gender!=2 }"><i class="icon gender-n-real-boy"></i></c:if></c:if></p>
      <c:if test="${jkuser.idType==0}">
       		<p style="visibility: hidden;">${jkuserinfo.eduName}</p>
      </c:if>
      <c:if test="${jkuser.idType==1}">
       		<p style="visibility: hidden;">${jkuserinfo.companyName}</p>
      </c:if>
      <p style="visibility: hidden;">
                 <c:forEach var="item" items="${taglist}" begin="0" end="3" varStatus="status">
              		<span class="tags"> 
              		${item.tagName}
              		</span>
                 </c:forEach>
      </p>

<!--       <div class="charm-info"> -->
<%--         <p><i class="icon charm"></i>影响力：${jkuser.influence}</p> --%>
<%--         <div class="bubble message"><a href="#"><img src="${ctx}/resources/mobile/images/bubble-s1-icon.png" alt=""></a></div> --%>
<%--      	<c:if test="${type==0}"> --%>
<%--      		<c:choose> --%>
<%--          		<c:when test="${jkUserFansFollows.id>0}"> --%>
<!--      				<div  class="guanzhu attention-btn">取消关注</div> -->
<%--      			</c:when> --%>
<%--      			<c:otherwise > --%>
<!--      				<div  class="guanzhu attention-btn">关注</div> -->
<%--      			</c:otherwise> --%>
<%--      		</c:choose> --%>
<%--      		<div class="attention-btn"><a href="${ctx}/mobileuserino/toUserChet?userid=${jkuser.id}">私 聊</a></div> --%>
<%--         </c:if> --%>
<!--       </div> -->
		<c:if test="${empty type || type!=0 }">
			<div style="top: 0.5em;" class="charm-info">
				<p><i class="icon charm"></i>影响力：${jkuser.influence}</p>
			</div>
		</c:if>
		<c:if test="${type==0}">
      <div class="charm-info" style="position: fixed; bottom: 0; right: 0;font-size: 90%;text-align: right;left: 0;display: flex;background: #efeeee;z-index: 99;color: #939393;height: 3rem;font-family: inherit;">
      	<c:choose>
         		<c:when test="${jkUserFansFollows.id>0}"><div class="guanzhu attention-btn active" style="background: #efeeee; color: #939393; box-sizing: border-box; margin: 0.75rem auto 0.75em auto; line-height: 1.3rem;height: 1.5rem; font-size: .9375rem;"><i class="display-bar"></i>已关注</div></c:when>
         		<c:otherwise ><div class="guanzhu attention-btn" style="background: #efeeee; color: #939393; box-sizing: border-box; margin: 0.75rem auto 0.75em auto; line-height: 1.3rem;height: 1.5rem; font-size: .9375rem;"><i class="display-bar"></i>关注</div></c:otherwise></c:choose>
		<p style="margin: 0.75rem auto; box-sizing: border-box; height: 1.5rem;color: #939393;line-height: 1.3rem;padding: 0.2rem 0;font-size: .9375rem;">影响力：${jkuser.influence}</p>
		<div class="attention-btn" style="background: #efeeee; color: #939393; box-sizing: border-box; margin: 0.75rem auto 0.75em auto; line-height: 1.3rem;height: 1.5rem; font-size: .9375rem;"><a style="color: #939393;" href="${ctx}/mobileuserino/toUserChet?userid=${jkuser.id}"><i class="display-bar"></i>私聊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></div>
      </div>
		</c:if>
    </div>
    
     <c:choose>
   		 <c:when test="${type==1}">
    		<div class="user-home-nav">
				<a href="#" class="active" data-api="0" >我的发布</a>
				<a href="#" data-api="1" >我的头条</a>
				<a href="#" data-api="2" >我的申请</a>
   			</div>
    	</c:when>
    	<c:when test="${type==0}">
    		<div class="user-home-nav ta">
				<a href="#" data-api="6" class="active">TA的资料</a>
				<a href="#" data-api="0">TA的发布</a>
				<a href="#" data-api="1">TA的头条</a>
   			</div>
    	</c:when>
    </c:choose>


    <ul class="user-home-list">
    <c:if test="${type==0 }">
	    <li class="detail-item"><i class="icon ta-name"></i><span class="detail-area">姓名：${jkuser.username }</span></li>
	    <li class="detail-item"><i class="icon ta-contact"></i><span class="detail-area">联系方式：${jkuser.phone }</span></li>
	    <li class="detail-item"><i class="icon ta-area-icon"></i><span class="detail-area">地区：${jkuser.location }</span></li>
	    <li class="detail-item"><i class="icon ta-school"></i><c:if test="${jkuser.idType==0}"><span class="detail-area">学校/公司：${jkuserinfo.eduName}</span></c:if><c:if test="${jkuser.idType==1}"><span class="detail-area">${jkuserinfo.companyName}</span></c:if></li>
		<li class="detail-item"><i class="icon ta-profession"></i><c:if test="${jkuser.idType==0}"><span class="detail-area">专业/职位：${jkuserinfo.eduMajor}</span></c:if><c:if test="${jkuser.idType==1}"><span class="detail-area">${jkuserinfo.departName}</span></c:if></li>
	    <li class="detail-item"><i class="icon ta-corporation"></i><span class="detail-area">社团：${jkuserinfo.eduClub}</span></li>
	    <li class="detail-item"><i class="icon ta-self-intro-icon"></i><span class="detail-area">个人介绍：${jkuser.slogan}</span></li>
		<li class="detail-item"><i class="icon ta-label-icon"></i><span class="detail-area">标签：<c:forEach var="item" items="${taglist}"
			varStatus="status"><span style="
				border-radius: 0.2em;
				padding: 0.3em 0.7em;
				margin: 0 0.2em 0.5em 0.2em;
				border: 1px solid #fe9a6e;
				color: #fe9a6e;
				line-height: 30px;
			">${item.tagName}</span></c:forEach></span></li>
	</c:if>
    </ul>
     <div class="load-more hide" style="margin: -4em 0 4em 0;">点击查看更多</div>
     </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
var urllist=[url+"/project/getProjectListMap",
			url+"/artcle/getNewsListallstauts",
			url+"/project/getProjectByApUid"];
var postlist=["POST","POST","POST"];
var pagesize=10;
var current=1;
var newscurrent=1;
var appcurrent=1;
var currentlist=[current,newscurrent,appcurrent];
var type='${type}';
if(type==0) {
	projstatus="1,3,4";
	newstatus='1';
} else if(type==1) {
	projstatus="-1,0,1,2,3,4";
	newstatus=null;
}

//第一次加载项目
$(function() {
	var $loadMore = $('.load-more');
	function showMore (list) {
		if(list.length >=pagesize) {
			$loadMore.removeClass('hide');
		} else {
			$loadMore.addClass('hide');
		}
	}
	/*
	$.ajax({
		type: "POST",
		url: url+"/project/getProjectListMap",
		data: {
			uid:$("#infoid").val(),
			page:current,
			status:projstatus,
			pageSize:pagesize,
			orderFieldStr:"create_time"
		},
		aysnc:true,
		dataType: "json",
		success: function(data) {
			var newsList = data.newsList;
			showMore(data.newsList);
			if(newsList.length>0) {
				render(newsList,0);
			}
			if(newsList.length<=0) {
				$loadMore.addClass('hide');
				//JKApp.dialog({message:"没有更多数据"});
			}
		}
	});
	*/
	//加载更多
	$('.load-more').on('tap',function() {
		var api = $(".user-home-nav .active").attr('data-api');
		console.log(api);
		currentlist[api]=currentlist[api]+1;
		var parmlist=[{
			uid:$("#infoid").val(),
			page:currentlist[api],
			status:projstatus,
			pageSize:pagesize,
		},{
			uid:$("#infoid").val(),
			status:newstatus,
			page:currentlist[api],
			pageSize:pagesize
		},{
			uid:$("#infoid").val(),
			page:currentlist[api],
			pageSize:pagesize
		}];
		$.ajax({
			type: postlist[api],
			url: urllist[api],
			data: parmlist[api],
			aysnc:true,
			dataType: "json",
			success: function(data) {
				var newsList = data.newsList;
				if(newsList.length>0) {
					if(api==0 || api==2) {
						render(newsList,0);
						showMore(newsList);
					}
					if(api==1) {
						rendernews(newsList,0);
						showMore(newsList);
					}
				}
			}
		});
	});

	function calculateLeftDay(endTime) {
		var leftTime = endTime - (new Date().getTime());
		if(leftTime < 0) {
			return 0;
		}
		return Math.ceil(leftTime/1000/3600/24);
	}

	var $list = $('.user-home-list');
	function render(data,empty) {
		if(data) {
			var nodeList = data.map(function(item,index) {
				console.log(item);
				return(
					format.call('<li style="height: 100px;" class="horizontal-parting-line"><a href="{projectLink}"><div class="item-photo" style="width: 30%;float: left;height: 100%;"><img src="{imageUrl}" alt="" style="width: 100%;height: 100%;"></div><div class="item-desc" style="float: left;height: 100%;width: 70%; box-sizing: border-box; padding-left: 10px;"><p style="font-size: 15px;font-weight: bold;"><span style="    width: 70%;    display: inline-block;    overflow: hidden;    text-overflow: ellipsis;">{projectName}</span><span style="color:orange;float: right;width: 25%;    display: inline-block;    overflow: hidden;    text-overflow: ellipsis;">￥{moneyNeeds}</span>&nbsp;</p><p style="font-size: 15px;color: #b7b7b7; margin-top:1em"><span style="margin-right: 10px;">{username}</span><i class="icon eye"></i><span style="margin-right: 5px;">{view}人浏览/{apply}人申请</span>&nbsp;</p><p><small>{location}</small>&nbsp;</p><p><small><span><i class="icon clock"></i><span style="">{createDate}</span></span></small>&nbsp;&nbsp;&nbsp;&nbsp;<small><i class="icon clock"></i>{left}天后截止</small><span style="display:{selfSell} color: white;background: orange;float: right;padding: 0 10px;border-radius: 2px;">自营</span>&nbsp;</p></div></a></li>', {
						'projectLink': '/mobile/login/toProjectDetail?id='+item.id,
						'imageUrl': item.projPicPath,
						'projectName': item.projName,
						'moneyNeeds': item.moneyNeeds,
						'username': item.username,
						'view': item.browsevolume,
						'apply': item.applycount,
						'createDate': getDate(item.createTime),
						'location': item.location,
						'left': calculateLeftDay(item.endTime),
						'selfSell': item.uid == 1 ? ';' : 'none;'
					})
					//'<li class="horizontal-parting-line"><a href='+url+'/mobile/login/toProjectDetail?id='+item.id+'><div style="width: 40%;float: left;" class="item-photo"><img src="'+item.projPicPath+'" alt=""></div><div style="width: 60%;float: left;" class="item-desc"><p>'+item.projName+'</p><p><small><i class="icon eye"></i>'+item.browsevolume+'人浏览</small></p></div></a></li>'
				);
			});
			empty && $list.empty()
			$list.append(nodeList.join(''));
		}
	}
	function rendernews(data,empty) {
		if(data) {
			var nodeList = data.map(function(item,index) {
				console.log(item);
				return(
					format.call('<li style="height: 117px;" class="horizontal-parting-line"><a href="{newsLink}"><div class="item-photo" style="width: 30%;float: left;height: 100%;"><img src="{imageUrl}" alt="" style="width: 100%;height: 100%;"></div><div class="item-desc" style="float: left;height: 100%;width: 70%;box-sizing: border-box;padding-left: 10px;"><p style="font-size: 15px;font-weight: bold;"><span style="    width: 70%;    display: inline-block;    overflow: hidden;    text-overflow: ellipsis;">{title}</span><span style="float: right;background: gainsboro;border-radius: 3px;padding: 0 10px;">{tagName}</span></p><div style="font-size: 0.7em;color: #b7b7b7;height: 4rem;padding: 3px;box-sizing: border-box;border-radius: 3px;">{content}</div><p><i class="icon clock"></i>{startTime}</p></div></a></li>', {
						'newsLink': '/mobile/login/toNewsDetails?id='+item.id,
						'imageUrl': item.picPath,
						'title': item.title,
						'tagName': item.cateName,
						'content': getContentAbstract(item.content),
						'startTime': getDate(item.createTime)
					})
					// '<li class="horizontal-parting-line"><a href='+url+'/mobile/login/toNewsDetails?id='+item.id+'><div class="item-photo"><img src="'+item.picPath+'" alt=""></div><div class="item-desc"><p>'+item.title+'</p><p><small><i class="icon eye"></i>'+item.browsevolume+'人浏览</small></p></div></a></li>'
				);
			});
			empty && $list.empty()
			$list.append(nodeList.join(''));
		}

		function getContentAbstract(content) {
			var ps = [$('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>'), $('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>'), $('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>')];
			var p = $(content);
			var index = 0;
			fixIntoPs(p);
			if(index < 3) {
				for(; index<3; index++) {
					ps[index] = '&nbsp;';		// 占空间
				}
			}

			return $('<a></a>').append(ps).html();
			
			function includes(con) {
				for(var i=0; i<this.length; i++) {
					if(this[i] == con) {
						return true;
					}
				}
				return false;
			}
			function trim(con) {
				return con.replace(/[\n, \s]/g, '');
			}
			// 返回值表示index现在是否处于新的一行
			function fixIntoPs(con) {
				if(index >= 3) {
					return true;
				}
				var nextLine = ['p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'div'];
				var newLine = ['br', 'hr'];
				var noLine = ['span', 'a'];
				var ignore = ['img'];
				var lastTagName = '';
				nextLine.includes = nextLine.includes || includes;
				newLine.includes = newLine.includes || includes;
				noLine.includes = noLine.includes || includes;
				for(var i=0; index<3 && i<con.length; i++) {
					lastTagName = con[i].nodeName.toLowerCase();
					if(nextLine.includes(con[i].nodeName.toLowerCase())) {
						if(fixIntoPs(con[i].childNodes) == false) {
							index++;
						}
					} else if(newLine.includes(con[i].nodeName.toLowerCase())) {
						// ps[index++] = '&nbsp;<br>';
					} else if('#text' == con[i].nodeName.toLowerCase()) {
						var str = trim(con[i].textContent);
						if(str.length != 0) {
							ps[index].html(ps[index].html()+con[i].textContent.replace(/\n/g, ''));
						}
					} else if(noLine.includes(con[i].nodeName.toLowerCase())) {
						fixIntoPs(con[i].childNodes);
					} else {
						// ignore;
					}
				}

				return nextLine.includes(lastTagName);
			}
		}
	}
	//标签切换
	$('.user-home-nav a').on('tap',function() {
		for(var i=0;i<4;i++){
			currentlist[i]=1;
		}
		$(this).addClass('active').siblings().removeClass('active');
		var api = $(this).attr('data-api');
		var parmlist = [{
			uid:$("#infoid").val(),
			page:currentlist[api],
			status:projstatus,
			pageSize:pagesize
		}, {
			uid:$("#infoid").val(),
			status:newstatus,
			page:currentlist[api],
			pageSize:pagesize
		},{
			uid:$("#infoid").val(),
			page:currentlist[api],
			pageSize:pagesize
		}];
		if(api != 6) {
			$.ajax({
				type: postlist[api],
				url: urllist[api],
				data: parmlist[api],
				aysnc:true,
				dataType: "json",
				success: function(data) {
					var newsList = data.newsList;
					if(newsList.length>=0) {
						if(api==0 || api==2) {
							render(newsList,1);
							showMore(newsList);
						}
						if(api==1) {
							rendernews(newsList,1);
							showMore(newsList);
						}
					}
				}
			});
		} else {
			$list.empty();
			$list.append('<li class="detail-item"><i class="icon ta-name"></i><span class="detail-area">姓名：${jkuser.username }</span></li>');
			$list.append('<li class="detail-item"><i class="icon ta-contact"></i><span class="detail-area">联系方式：${jkuser.phone }</span></li>');
			$list.append('<li class="detail-item"><i class="icon ta-area-icon"></i><span class="detail-area">地区：${jkuser.location }</span></li>');
			$list.append('<li class="detail-item"><i class="icon ta-school"></i><c:if test="${jkuser.idType==0}"><span class="detail-area">学校/公司：${jkuserinfo.eduName}</span></c:if><c:if test="${jkuser.idType==1}"><span class="detail-area">学校/公司：${jkuserinfo.companyName}</span></c:if></li>');
			$list.append('<li class="detail-item"><i class="icon ta-profession"></i><c:if test="${jkuser.idType==0}"><span class="detail-area">专业：${jkuserinfo.eduMajor}</span></c:if><c:if test="${jkuser.idType==1}"><span class="detail-area">职位：${jkuserinfo.departName}</span></c:if></li>');
            <c:if test="${jkuser.idType==0}">$list.append('<li class="detail-item"><i class="icon ta-corporation"></i><span class="detail-area">社团：${jkuserinfo.eduClub}</span></li>');</c:if>
			$list.append('<li class="detail-item"><i class="icon ta-self-intro-icon"></i><span class="detail-area">个人介绍：${jkuser.slogan}</span></li>');
			$list.append('<li class="detail-item"><i class="icon ta-label-icon"></i><span class="detail-area">标签：<c:forEach var="item" items="${taglist}" varStatus="status"><span style="border-radius: 0.2em;padding: 0.3em 0.7em;margin: 0 0.2em 0.5em 0.2em;border: 1px solid #fe9a6e;color: #fe9a6e;line-height: 30px;">${item.tagName}</span></c:forEach></span></li>');
			$loadMore.addClass('hide');
		}

		return false;
	});
	$('.guanzhu').on('tap',function() {
		$(this).toggleClass('active');
		var $button=$(this);
		if($(this).hasClass('active')) {
			$.ajax({
				type: "POST",
				url: url+"/fansfollows/addfanfollow",
				data: {
					fanid:$("#uid").val(),
					followid:$("#infoid").val()
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					if(data==1) {
						$button.html('<i class="display-bar"></i>已关注');
					}
				}
			}); 
		} else {
			$.ajax({
				type: "POST",
				url: url+"/fansfollows/delfanfollow",
				data: {
					fanid:$("#uid").val(),
					followid:$("#infoid").val()
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					if(data==1) {
						$button.html('<i class="display-bar"></i>关注');
					}
				}
			});
		}
		return false;
	});
})

$(document).ready(function() {
	$('.user-home-nav a:eq(0)').tap();
});

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
function getDate(time, split) {
	split = split||'-';
	var date = new Date(time);
	var year = date.getFullYear();
	var month = '0'+(date.getMonth()+1);
	month = month.substr(-2);
	var day = '0'+date.getDate();
	day = day.substr(-2);
	return year+split+month+split+day;
}
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
