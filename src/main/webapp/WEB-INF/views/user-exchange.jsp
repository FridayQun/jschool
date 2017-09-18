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
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/integral.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
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

<div class="integral-main">
	<div class="integral-banner"><img src="${ctx}/resources/artcle/images/integral-banner.jpg" alt=""></div>
	<div class="integral-overview">
		<div class="overview-col c1"><span>全部积分</span><br><strong>${jkuser.point}</strong></div>
		<div class="overview-col c2"><a href="${ctx}/login/toScoreMall">积分商城</a></div>
		<div class="overview-col c3"><span><a href="${ctx}/login/toUser?item=integralDetails">积分明细<br><strong>${countofexchang}</strong></a></span></div>
	</div>
	<h3 class="integral-block-title">兑换明细</h3>
	<div class="integral-details">
		<ul class="exchange-record-list">
		</ul>
		<div class="load-more"><a href="#">更 多</a></div>
	</div>
</div>

				</div>
			</div>
		</div>
	</div>
	<!--动态包含-->
	<jsp:include page="foot.jsp" flush="true"/>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
	function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
	var alert = window.new_alert || alert;
var page=1;
var pageSize=10;
$(function() {
	function fotmatter(data) {
		var date = new Date(data);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	}
	$.ajax({
		type: "POST",
		url: ctx+"/exchange/getexchangemalllist",
		data: {
			uid:$('#infoid').val(),
			page:page,
			pageSize:pageSize
		},
		aysnc:true,
		dataType: "json",
		success: function(data) {
			loadMore(data);
		}
	});
	var $detailsList = $('.exchange-record-list');
	function loadMore(data) {
		var nodeList = data.map(function(item,index) {
			return (
				'<li><div class="record-item-col c1">\
				<div class="exchange-photo"><img src="'+item.head_pic+'" alt=""></div></div>\
				<div class="record-item-col c2">\
				<p>'+item.product_name+'    '+item.title +'</p><p>'+item.introduction+'</p>\
				<div class="exchange-datetiem">兑换时间：'+fotmatter(item.create_time)+'</div>\
				</div><div class="record-item-col c3"><div class="col-inner">'+item.need_score+'积分</div></div>\
				</li>'
			);
		});
		$detailsList.append(nodeList.join(''));
	}

	//载入更多
	$('.load-more a').on('click',function(){
		page=page+1;
		$.ajax({
			type: "POST",
			url: ctx+"/exchange/getexchangemalllist",
			data: {
				uid:$('#infoid').val(),
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				if(data.length>0){
					loadMore(data);
				} else {
					alert("没有更多数据");
				}
			}
		});
		return false;
	});
});

	</script>
</body>

</html>
