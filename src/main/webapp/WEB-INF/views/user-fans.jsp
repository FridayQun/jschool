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

    <!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
	<div class="user-section">
		<div class="wrapper">
<jsp:include page="user-header.jsp" flush="true"/>

			<div class="user-body">
<jsp:include page="user-slider-left.jsp" flush="true"/>

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

<ul class="user-fans-list" style="padding: 40px 30px 50px 30px;height: 880px;">
<c:if test="${not empty list }">
<c:set var="listLength" value="${fn:length(list)>0?fn:length(list)-1:0}" />
<c:forEach var="i" begin="0" end="${listLength>=9?9:listLength}" varStatus="status">

	<li style="float: left;width: 33.33%;padding: 0px 20px;box-sizing: border-box;height: 300px;">
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
</c:if>

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
var pagesize=10;
var current=1;

$(function() {
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
		window.open('${ctx}/login/toUser?'+searchItem.join('&'), '_self');
	});

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

	$(document).on('click', '.add-or-remove-fans-or-follows', function() {
		return false;
		var $this = $(this);
		if($this.text() == '未关注') {
			$.ajax({
				type: "POST",
				url: url+"/fansfollows/addfanfollow",
				data: {
					followid: <c:if test="${fansFollows == 'follows'}">${jkuser.id}</c:if><c:if test="${fansFollows == 'fans'}">$this.data('id')</c:if>,
					fanid: <c:if test="${fansFollows == 'fans'}">${jkuser.id}</c:if><c:if test="${fansFollows == 'follows'}">$this.data('id')</c:if>
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					$this.text('已关注');
					var num = parseInt($('#my-follows').children()[0].childNodes[2].textContent);
					$('#my-follows').children()[0].childNodes[2].textContent = (num+1);
				}
			});
		} else {
			$.ajax({
				type: "POST",
				url: url+"/fansfollows/delfanfollow",
				data: {
					followid: <c:if test="${fansFollows == 'follows'}">${jkuser.id}</c:if><c:if test="${fansFollows == 'fans'}">$this.data('id')</c:if>,
					fanid: <c:if test="${fansFollows == 'fans'}">${jkuser.id}</c:if><c:if test="${fansFollows == 'follows'}">$this.data('id')</c:if>
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					$this.text('未关注');
					var num = parseInt($('#my-follows').children()[0].childNodes[2].textContent);
					$('#my-follows').children()[0].childNodes[2].textContent = (num-1);
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
			if(item['head_pic_path']!=null && item['head_pic_path'].indexOf('${NORMAL_HEAD_ICON_URL}')!=0) {
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

});

	</script>
</body>

</html>
