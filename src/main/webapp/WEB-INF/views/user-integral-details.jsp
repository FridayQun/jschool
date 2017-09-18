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
		<div class="overview-col c3"><span><a href="${ctx }/login/toUser?item=exchange">兑换记录<br><strong>${countofexchang}</strong></a></span></div>
	</div>
	<h3 class="integral-block-title">积分明细</h3>
	<div class="integral-details">
		<ul class="integral-details-list">
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
	var $loadMore = $('.load-more');
	function autoMore() {
		if($('integral-details-list li').length > 10){
			$loadMore.removeClass('hide');
		}else{
			$loadMore.addClass('hide');
		}
	}
	function fotmatter(data) {
		var date = new Date(data);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	}

	$.ajax({
		type: "POST",
		url: ctx+"/exchange/getlist",
		data: {
			uid:$('#infoid').val(),
			ispid:0,
			Page:page,
			pageSize:pageSize
		},
		aysnc:true,
		dataType: "json",
		success: function(data) {
			loadMore(data);
			autoMore();
		}
	});

	var $detailsList = $('.integral-details-list');
	function loadMore(data) {
		var nodeList = data.map(function(item,index) {
			return('<li><div class="details-item-col">'+item.operateName+'<br>'+fotmatter(item.createTime)+'</div>\
				<div class="details-item-col '+(Number(item.needScore) >= 0 ? 'red-font' :'blue-font')+'"><strong>'+item.needScore+'</strong></div></li>');
		});
		$detailsList.append(nodeList.join(''));
	}

	//修复没数据时，显示问题
	function fixedEmpty(idx) {
		var $paging = $('.paging');
		var $toggleHint = $(".toggle-hint");
		//修复粉丝关注 更多按钮问题
		if($('.content-group').eq(idx).find('li').length <= 6) {
			$toggleHint.addClass('hide');
		} else {
			$toggleHint.removeClass('hide');
		}
	}
	fixedEmpty(0);
	//载入更多
	$('.load-more a').on('click',function(){
		page=page+1;
		$.ajax({
			type: "POST",
			url: ctx+"/exchange/getlist",
			data: {
				uid:$('#infoid').val(),
				ispid:0,
				Page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				if(data.length>0) {
					loadMore(data);
				} else {
					page=page-1;
					$loadMore.addClass('hide');
					//alert("没有更多数据");
				}
			}
		});
		return false;
	});

	//修复没数据时，显示问题
	function fixedEmpty() {
		var $paging = $('.paging');
		var $toggleHint = $(".toggle-hint");
		//修复粉丝关注 更多按钮问题
		if($('.content-group li').length <= 6) {
			$toggleHint.addClass('hide');
		} else {
			$toggleHint.removeClass('hide');
		}
		//修复分页
		if($('.paging a').length <3){
			$paging.addClass('hide');
		}else{
			$paging.removeClass('hide');
		}
	}
	fixedEmpty();
});

	</script>
</body>

</html>
