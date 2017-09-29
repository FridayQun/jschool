<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/left-slider.css">
  <script>
  var url='${ctx}';
  var ctx = '${ctx}/resources/artcle';
  </script>  
</head>

<body>
    <!--动态包含-->
 <%Integer id = (Integer)session.getAttribute("login_userId");%>
 <input hidden="true" type="text" id="uid"  value="<%=id%>"/>
 <input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
 <input hidden="true" type="text" id="type"  value="${type}"/>
 <%Integer  totalofproject = (Integer)request.getAttribute("totalofproject");%>
 <input hidden="true"  type="text" id=totalofproject  value="<%=totalofproject%>"/>
 <%Integer  totalofnews = (Integer)request.getAttribute("totalofnews");%>
 <input hidden="true"  type="text" id=totalofnews  value="<%=totalofnews%>"/>
 <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/> 
 
  <jsp:include page="head.jsp" flush="true"/>
  <div class="user-section">
    <div class="wrapper">
    <c:choose>
       <c:when test="${not empty jkuser.backgroundPicture}">
    	  <div class="user-base-info" style="background-image:url(${jkuser.backgroundPicture})">
        </c:when>
         <c:otherwise>
      	   <div class="user-base-info" style="background-image:url(${ctx}/resources/artcle/images/user-bg.jpg)">
       </c:otherwise>
      </c:choose>
           
        <div class="info-inner">
          <c:if test="${empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${ctx}/resources/artcle/images/default.png" alt=""></div>
         </c:if>
         <c:if test="${not empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${jkuser.headPicPath}" alt=""></div>
         </c:if>
           <p style="margin-left: 60px;" class="user-name">${jkuser.nickname}
		<c:if test="${ empty jkUserCeritifired.id}">
	    	<c:if test="${jkuser.gender==1}">
		        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${jkuser.gender==2}">
		        <c:out value="<i class='icon gender-n-real-girl'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${empty jkuser.gender}">
		        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
	    </c:if>
	    <c:if test="${ not empty jkUserCeritifired.id}">
	    	<c:if test="${jkuser.gender==1}">
		        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${jkuser.gender==2}">
		        <c:out value="<i class='icon gender-real-girl'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${empty jkuser.gender}">
		        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
	    </c:if>
          <p class="user-addr"><c:if test="${jkuser.idType==0}">${jkuserinfo.eduName}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.companyName}</c:if></p>
        </div>
         <div class="shortcut-opts">
         <c:if test="${type==0}">
         	<c:choose>
         		<c:when test="${jkUserFansFollows.id>0}">
         			 <a class="follow-btn" id="add" style="display:none;" href="#">+关注</a>
         			 <a class="follow-btn" id="cancle"  href="#">取消关注  </a>
         		 </c:when>
         		 <c:otherwise >
         			 <a class="follow-btn" id="add"  href="#">+关注</a>
         			 <a class="follow-btn" id="cancle" style="display:none;" href="#">取消关注  </a>
         		 </c:otherwise>
         	</c:choose>
         	 <a class="send-btn" href="#">发私信</a>
          </c:if>
        </div>
      </div>
      
      <div class="user-body">
        <div class="sidebar">
          <div class="user-tags">
            <div class="tags-bar">
              <div class="col" style='width: 104px; text-align: center;'><span>影响力</span><span class="weight">${jkuser.influence}</span></div><hr style="float: left;height: 30px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
               <div class="col" style='width: 160px; text-align: center;'><span>连续登录天数 <span class="weight">${jkuser.loginTimes}</span></span></div>
            </div>
            <hr style='margin: 0 15px;'>
            <div class="tags-bar">
            	<a href="${ctx }/login/toOtherUser?item=follows&userid=${jkuser.id}"><div class="col" style='width: 104px; text-align: center;'><span>TA的关注</span><br><span class="grey-font">${jkuser.follows}</span></div></a>
            	<hr style="float: left;height: 40px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
				<a href="${ctx }/login/toOtherUser?item=fans&userid=${jkuser.id}"><div class="col" style='width: 160px; text-align: center;'><span>TA的粉丝</span><br><span class="grey-font">${jkuser.fans}</span></div></a>
            </div>
            <c:if test="${type==1}">
            <div class="modify-link"><a href="<%=request.getContextPath()%>/user/moduserinfo">编辑个人信息</a></div>
            </c:if>
          </div>
          <c:if test="${type==0}">
          <div class="user-intro">
          	<c:set var="pm2" ><fmt:parseNumber value="${(jkuserinfo.permissions % 100)/10}" integerOnly="true"/></c:set>
          	<c:set var="pm3" ><fmt:parseNumber value="${(jkuserinfo.permissions / 100)%10}" integerOnly="true"/></c:set>
          	<c:set var="pm4" ><fmt:parseNumber value="${jkuserinfo.permissions/1000 }" integerOnly="true"/></c:set>

			  <table style="border: 0px; table-layout: fixed">
				  <tbody style="font-size: 16px;width: 100%;table-layout: fixed;">
				  <tr class="tt">
					  <td style="width: 140px;"><span><i class="icon ta-name"></i></span><span>姓名：</span></td>
					  <td><span class="ss">${jkuser.nickname}</span></td>
				  </tr>
				  <c:if test="${jkuserinfo.permissions%100 < 20}">
					  <tr class="tt">
						  <td><span><i class="icon ta-contact"></i></span><span>联系方式：</span></td>
						  <td><span class="ss">${jkuser.phone}</span></td>
					  </tr>
				  </c:if>
				  <c:if test="${jkuserinfo.permissions%100 >= 20}">
					  <td><span><i class="icon ta-contact"></i></span><span>联系方式：</span></td>
					  <td><span class="ss">***********</span></td>
				  </c:if>

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
				    " href="${ctx }/login/toOtherUser?item=normal&userid=${jkuser.id}&nav=0">点击查看个人资料<span style="
				    margin-left: 40px;
				    color: #ccc;
				">&gt;</span></a></div></div>
          	</div>
          	</c:if>
			<div class="user-item">
				<div class="tags-bar nav-col">
					<a href="${ctx }/login/toOtherUser?item=normal&userid=${jkuser.id}&nav=1" style="
						font-weight: normal;
						font-size: 20px;
						margin: 0;
						color: #767d89;
						display: block;
						height: 40px;
						line-height: 40px;
					" data-api="0"><i class="icon ta-s-project-icon"></i>TA的项目</a>
				</div>
				<hr style="margin: 0 15px;">
				<div class="tags-bar nav-col">
					<a href="${ctx }/login/toOtherUser?item=normal&userid=${jkuser.id}&nav=2" style="
						font-weight: normal;
						font-size: 20px;
						margin: 0;
						color: #767d89;
						display: block;
						height: 40px;
						line-height: 40px;
					" data-api="1"><i class="icon ta-top-icon"></i>TA的头条</a>
				</div>
			</div>
        </div>
        <div class="main-box">
        <div class="list-tool-bar" style="
    position: relative;
">
		
		<div class="search-block">
			<input type="search" class='search-block-value' name="keywords" value="" placeholder="输入用户名进行搜索" style="
    float: right;
">
			<input type="submit" class='search-block-submit' name="submint" value="">
		</div>
	</div>
          <ul class="user-fans-list" style="padding: 40px 0 50px 0;height: 880px;">
<c:set var="listLength" value="${fn:length(list)>0?fn:length(list)-1:0}" />
<c:forEach var="i" begin="0" end="${listLength>=9?9:listLength}" varStatus="status">

	<li style="float: left;width: 33.33%;padding: 0px 30px;box-sizing: border-box;height: 300px;">
		<div style="
    width: 100%;
    height: 94%;
    margin: 3% 0;
    padding: 0;
    border: none;
    box-shadow: 0 0 5px;
">
			<div class="user-avatar" style="height: 65%; overflow: hidden;">
			<a href="${ctx}/login/toOtherUser?userid=${list[i]['id']}">

	<c:if test="${not empty list[i]['head_pic_path'] && fn:startsWith(list[i]['head_pic_path'], NORMAL_HEAD_ICON_URL)==false}">
				<img style="height: 90%;width: 80%;border-radius: 50%;margin: 5% 10%;" src="${list[i]['head_pic_path']}"  alt="">
	</c:if>
	<c:if test="${empty list[i]['head_pic_path'] || fn:startsWith(list[i]['head_pic_path'], NORMAL_HEAD_ICON_URL) == true}">
	<c:if test="${list[i]['gender'] == 2 }">
				<img style="height: 90%;width: 80%;border-radius: 50%;margin: 5% 10%;" src="${GIRL_HEAD_ICON_URL }"  alt="">
	</c:if>
	<c:if test="${list[i]['gender'] != 2 }">
				<img style="height: 90%;width: 80%;border-radius: 50%;margin: 5% 10%;" src="${BOY_HEAD_ICON_URL }"  alt="">
	</c:if>
	</c:if>
			</a>
		</div>
		<p style="margin: 0 15px;"><span style="width: 60%;display: inline-block;">${list[i]['nickname']}<span style="margin-left: 15px;display: inline-block;"><c:if test="${list[i]['gender'] == 2}"><i class="icon gender-girl"></i></c:if><c:if test="${list[i]['gender'] != 2}"><i class="icon gender-boy"></i></c:if></span></span><span style="float: right;"><i class="icon influence"></i><span style=" background: gainsboro; padding: 0 3px; border-radius: 3px; "><c:if test="${list[i]['influence'] != null}">${list[i]['influence']}</c:if><c:if test="${list[i]['influence'] == null}">0</c:if></span></span></p>
		<p style="margin: 0 15px;"><c:if test="${list[i]['edu_name'] != null}">${list[i]['edu_name']}</c:if><c:if test="${list[i]['edu_name'] == null}">${list[i]['company_name']}</c:if>&nbsp;</p>
		<p style="margin: 0 15px;">${list[i]['location']}&nbsp;</p>
		<p style="margin: 5px 15px 0 15px;text-align: right;"><span class="add-or-remove-fans-or-follows" data-id="${list[i]['id']}" style="background: darkorange;margin: 0;padding: 1px 20px;border-radius: 3px;box-shadow: 0 0 5px darkorange; cursor: pointer; "><c:if test="${list[i]['followed'] == true}">已关注</c:if><c:if test="${list[i]['followed'] == false}">未关注</c:if></span></p>

	</div>
	</li>

</c:forEach>
</ul>
          <div class="paging"></div>
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
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
var type=$('#type').val();
var projstatus;
var newstatus;
if(type==0) {
	projstatus="1,3,4";
	newstatus='1';
}else if(type==1) {
	projstatus="-1,0,1,2,3,4";
	newstatus=null;
}

var pagesize=10;
var current=1;
var newscurrent=1;
var appcurrent=1;
var urllist=[url+"/project/getProjectListMap",url+"/artcle/getNewsListallstauts",url+"/project/getProjectByApUid", "", "", url+"/user/getUserInfo"];
var currentlist=[current,newscurrent,appcurrent, 1, 1, 0];
var maxlist=[Math.ceil($('#totalofproject').val()/pagesize),Math.ceil($('#totalofnews').val()/pagesize),Math.ceil($('#totalofapp').val()/pagesize), 1, 1, 1];
var postlist=["POST","GET","POST","POST","POST","POST"];

$(function() {
	function fotmatter(data) {
		var date = new Date(data);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	}
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]);
		return null;
	}

	$('.search-block-submit').on('click', function() {
		var value = $('.search-block-value').val();
		var searchItem = [];
		var search = location.search.substring(1).split('&');
		for(var i=0; i<search.length; i++) {
			var x = search[i].split('=');
			if(x[0] == 'username') {
				continue;
			}
			searchItem.push(search[i]);
		}
		if(value)
			searchItem.push('username='+value)
		window.open('${ctx}/login/toOtherUser?'+searchItem.join('&'), '_self');
	});
	
	<!--获取项目列表信息-->
	$(".paging").createPage({
		pageCount: Math.ceil(${fn:length(list) }/pagesize),
		current: current,
		backFn: function(curr) {
			current = curr;
			$.ajax({
				type: "POST",
				<c:if test="${fansFollows == 'fans'}">url: url+"/user/getFansList",</c:if>
				<c:if test="${fansFollows == 'follows'}">url: url+"/user/getFollowsList",</c:if>
				data: {
					page: current,
					pageSize: pagesize,
					id: $('#infoid').val(),
					username: $('.search-block-value').val()
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					var rows = data.rows;
					render(rows, 1);
					window.location.href='#userBody';
				}
			});
		}
	});

	function render(data, empty) {
		var $list = $('.user-fans-list');
		console.log(data);
		var nodeList = data.map( function ( item, index ) {
			var headPicPath = '';
			var node = '<li style="float: left;width: 33.33%;padding: 0px 20px;box-sizing: border-box;height: 300px;">';
			node += '<div style="width: 100%;height: 94%;margin: 3% 0;padding: 0;border: none;box-shadow: 0 0 5px;">';
			node += '<div class="user-avatar" style="height: 65%; overflow: hidden;">';
			node += '<a href="${ctx}/login/toOtherUser?userid={userId}>';
			if(item['head_pic_path']!=null && item['head_pic_path'].startsWith('${NORMAL_HEAD_ICON_URL}')==false) {
				headPicPath = item['head_pic_path'];
			} else if(item.gender == 2) {
				headPicPath = '${GIRL_HEAD_ICON_URL }';
			} else {
				headPicPath = '${BOY_HEAD_ICON_URL }';
			}
			node += '<img style="height: 90%;width: 80%;border-radius: 50%;margin: 5% 10%;" src="{headPicPath}"  alt="">';
			node += '</a>';
			node += '</div>';
			node += '<p style="margin: auto 15px 0 15px;"><span style="width: 60%;display: inline-block;">{nickname}<span style="margin-left: 15px;;display: inline-block;"><i class="icon {genderClass}"></i></span></span><span style="float: right;"><i class="icon influence"></i><span style=" background: gainsboro; padding: 0 3px; border-radius: 3px; ">{influence}</span></span></p>';
			node += '<p style="margin: 0 15px;">{companyOrEduName}&nbsp;</p>';
			node += '<p style="margin: 0 15px;">{location}&nbsp;</p>';
			node += '<p style="margin: 5px 15px 0 15px;text-align: right;"><span class="add-or-remove-fans-or-follows" data-id="{id}" style="background: darkorange;margin: 0;padding: 1px 20px;border-radius: 3px;box-shadow: 0 0 5px darkorange; cursor: pointer; ">{followedText}</span></p>';
			node += '</li>';
			format.call(node, {
				'userId': item.id,
				'headPicPath': headPicPath,
				'nickname': item.nickname,
				'genderClass': (item.gender==2?'gender-girl':'gender-boy'),
				'influence': item.influence,
				'companyOrEduName': (item.companyName==null?item.eduName:item.companyName),
				'location': item.location,
				'id': item.id,
				'followedText': (item.followed?'已关注':'未关注')
			})
			return (node);
		});
		empty && $list.empty();
		$list.append(nodeList.join(''));
	}
    
	//联系TA
	var $smsBox = $('.sms-box');
	$('.send-btn').on('click',function(){
		var userName = $('.user-base-info .user-name').text();
		$('.sms-box .to-user').text('发送给 ：'+userName);
		$smsBox.removeClass('hide');
		return false;
	});
	  
	$('.sms-box .sendForm').on('submit',function(){
		var message = $(this).find('textarea').val();
		var $textarea=$(this).find('textarea');
		console.log(message);

		$.ajax({
			type: "POST",
			url: url+"/mesg/addmesg",
			data: {
				toId:$('#infoid').val(),
				content:message,
				type:0
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				$textarea.val("");
				$smsBox.trigger('click');
			}

		});

		return false;
	});
	  
	$smsBox.on('click',function(e){
		if(e.target === $smsBox[0]){
			$smsBox.addClass('hide');
		}
	});
	getQueryString('nav') && $('.user-item .nav-col').eq(Number(getQueryString('nav'))).find('a').trigger('click');
});

  </script>
</body>

</html>