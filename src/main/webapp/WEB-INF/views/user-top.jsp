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
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
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

<div class="user-publish-box">
	<h3 class="user-publish-title">我的头条</h3>
	<div class="list-tool-bar">
		<div class="filter-block">
			<select id="status-filter" class="status"  name="">
				<option value="">全部分类</option>
				<c:forEach var="item" items="${catelist }">
				<option value="${item.id }">${item.cateName }</option>
				</c:forEach>
			</select>
			<select id="date-filter" class="status" name="">
				<option value="">全部</option>
				<option value="3">最近三天</option>
				<option value="14">最近两周</option>
				<option value="30">近一个月</option>
				<option value="90">近三个月</option>
			</select>
		</div>
		<div class="search-block">
			<form action="#" method="get">
				<input type="search" name="keywords" value="" placeholder="输入项目关键词进行搜索">
				<input type="submit" name="submint" value="">
			</form>
		</div>
	</div>
	<div class="released-list-box">
		<ul>
		</ul>
		<div class="load-more"><a href="#">查看更多</a></div>
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
var pageSize=10;
var page=1;

$(function() {
	function fotmatter(data) {
		var date = new Date(data);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	}

	function deltype(status) {
		var options = $('#status-filter')[0].options;
		for(var i=0; i<options.length; i++) {
			if(options[i].value == status) {
				return options[i].innerHTML;
			}
		}
		return '';
	}

	// 就像这个一样
	function foo(status) {
		if(status == 1) {
            return '<span class="a-class">审核通过</span>';
        }
        if(status == 2){
		    return '<span class="a-class">审核不通过</span>';
		} else {
		    return '<span class="another-class">未审核</span>';
		}
    }
	function delstatus(status) {
		if(status==1){
			return "原创";
		}
		if(status==0){
			return "转载";
		}
	}

	var uid=$('#uid').val();
	//加载表格
	$.ajax({
		type: "GET",
		url: url+"/artcle/getNewsListallstauts",
		data: {
			uid:uid,
			page:page,
			pageSize:pageSize
		},
		aysnc:true,
		dataType: "json",
		success: function(data){
			renderList(data.newsList, 1);
			fixedEmpty();
		}
	});

	//渲染列表
	function renderList(data,mode) {
	var $releasedList = $('.released-list-box ul');
		var nodes = data.map(function(item,index) {
			console.log(item);
			// 就是这个东西， 怎么显示
			// return这里
		return ('<li><div class="released-datetime">'+fotmatter(item.createTime).substr(5)+'</div>\
				<div class="cf"><div class="col c1"><div class="col-inner">\
				<div class="project-photo"><img src="'+item.picPath+'" alt=""></div>\
				</div></div><div class="col c2"><div class="col-inner">\
				<h3><span>'+item.title+'</span></h3>\
				<p><span><i class="icon figure"></i>'+item.username+'</span><span><i class="icon eye"></i>'+item.browsevolume+'人浏览</span>\
				<span><i class="icon clock"></i>'+fotmatter(item.createTime)+'</span></p><p><span>'+item.source+'</span><span>'+deltype(item.type)+'</span>'+foo(item.status)+'<span class="orange-font"></span></p>\
				</div></div><div class="col c3"><div class="col-inner"><p><a class="browse-link" href="${ctx}/login/toNewsDetails?id='+item.id+'">查看</a><br><a class="delete-news browse-link" data-id="'+item.id+'" href="javascript:;">删除</a></p>\
				</div></div></div>'+(data[index+1] ? ((fotmatter(item.createTime).split('-')[1] != fotmatter(data[index+1].createTime).split('-')[1]) ?
				'<div class="datetime-separate"><span>'+fotmatter(item.createTime).split('-')[0]+'</span> <span class="dsdot"></span> <span>'+fotmatter(item.createTime).split('-')[1]+'月</span></div>' : ''
				) :'')+'</li>'
			);
		});
		mode && $releasedList.empty();
		$releasedList.append(nodes.join(''));
	}

	//过滤选项
	$('.filter-block select').on('change',function() {
		console.log($(this).val());
	});

	$('#date-filter').on('change', function() {
		$('.search-block form').submit();
	});
	$('#status-filter').on('change', function() {
		$('.search-block form').submit();
	});

	//搜索按钮
	$('.search-block form').on('submit',function(){
		page=1;
		pageSize=10;
		var keywords = $(this).find('input[name="keywords"]').val();
		console.log(keywords);
		var typestatus=$('#status-filter').val();
		var dateFrom=$('#date-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/artcle/getNewsList",
			data: {
				uid:uid,
				type:typestatus,
				title:keywords,
				dateFrom: dateFrom,
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				renderList(data.newsList, 1);
				fixedEmpty();
			}
		});

		return false;
	});

	//加载更多
	$('.load-more a').on('click',function(){
		page++;
		pageSize=10;
		var keywords = $(this).find('input[name="keywords"]').val();
		var typestatus=$('#status-filter').val();
		var dateFrom=$('#date-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/artcle/getNewsList",
			data: {
				uid:uid,
				type:typestatus,
				title:keywords,
				dateFrom: dateFrom,
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				if(data.newsList.length>0){
					renderList(data.newsList, 0);
				}else{
					alert("没有更过数据");
				}
			}
		});
		return false;
	});

	$(document).on('click', '.delete-news', function() {
		var id = $(this).data('id');
		$.DialogBySHF.Confirm({
			Width: 350,
			Height: 200,
			Title: "提示信息",
			Content: '确认删除吗？',
			ConfirmFun: function() {
				$.ajax({
					type: "GET",
					url: url+"/artcle/deleteNewsById",
					data: {
						id: id
					},
					aysnc:true,
					dataType: "json",
					success: function(data){
						$('.search-block form').submit();
						alert("删除成功");
					}
				});
			},
			CancelFun: function() {}
		});
	});

	//修复没数据时，显示问题
	function fixedEmpty() {
		var $loadMore = $('.load-more');
		if($('.released-list-box li').length >=10){
			$loadMore.removeClass('hide');
		} else {
			$loadMore.addClass('hide');
		}
	}
});

	</script>
</body>

</html>
