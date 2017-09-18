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
	<input hidden="true" type="text" id="type"  value="1"/>
	<%Integer  totalofproject = (Integer)request.getAttribute("totalofproject");%>
	<input hidden="true"  type="text" id=totalofproject  value="<%=totalofproject%>"/>
	<%Integer  totalofnews = (Integer)request.getAttribute("totalofnews");%>
	<input hidden="true"  type="text" id=totalofnews  value="<%=totalofnews%>"/>
	<!-- 无用 -->
	<!-- <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/>  -->

    <!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
	<div class="user-section">
		<div class="wrapper">
<jsp:include page="user-header.jsp" flush="true"/>

			<div class="user-body">
<jsp:include page="user-slider-left.jsp" flush="true"/>

				<div class="main-box">
					<div class="user-nav" id="userBody">
						<div class="nav-col">
							<div class="col-inner"><a class="active" href="#"><span>收藏的项目</span><br><span class="grey-font"><c:if test="${totalofproject != null}">${totalofproject}</c:if><c:if test="${totalofproject == null}">0</c:if></span></a></div>
						</div>
						<div class="nav-col">
							<div class="col-inner"><a class="" href="${ctx}/login/toUser?item=collectionTop"><span>收藏的头条</span><br><span class="grey-font"><c:if test="${totalofnews != null}">${totalofnews}</c:if><c:if test="${totalofnews == null}">0</c:if></span></a></div>
						</div>
					</div>
					<ul class="user-publish-list"></ul>
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
	function new_confirm (message, func) {$.DialogBySHF.Confirm({Width: 350,Height: 200,Title: "提示信息",Content: message,ConfirmFun: func,CancelFun: function() {}});}

var pagesize=10;
var current=1;

$(function() {
	$.ajax({
		type: "POST",
		url: url+"/usercollection/getcollectionlist",
		data: {
			page: current,
			pageSize: pagesize,
			type: 1
		},
		aysnc:true,
		dataType: "json",
		success: function(data){

			$(".paging").createPage({
				pageCount: Math.ceil($('#totalofproject').val()/pagesize),
				current: current,
				backFn: function(curr) {
					current = curr;
					$.ajax({
						type: "POST",
						url: url+"/usercollection/getcollectionlist",
						data: {
							page: current,
							pageSize: pagesize,
							type: 1
						},
						aysnc:true,
						dataType: "json",
						success: function(data) {
							var rows = data.rows;
							render(rows,1);
							window.location.href='#userBody';
						}
					});
				}
			});
			var rows = data.rows;
			render(rows,1);
		}
	});

	// 代理删除
	$('body').on('click','.del-link',function(e) {
		e.preventDefault();
		var id=$(this).data('id');
		var type=$(this).data('type');
		new_confirm("删除？", function() {
			$.ajax({
				type: "post",
				url: ctx+"/operate/collect",
				data: {
					"fid": id,
					"type": type
				},
				dataType: "json",
				success: function(data) {
					location.reload();
				}
			});
		});
	});

	function render(data, empty) {
		var $list = $('.user-publish-list');
		if($list.length < 1 ){
			$('.main-box .user-headline-list').attr('class','user-publish-list');
			$list = $('.user-publish-list');
		}

		var nodeList = data.map( function ( item, index ) {
			return('<li><div class="list-col c1"><div class="col-inner"><div class="project-photo '+(item.proj_type ? 'capital' :'service')+'"">\
				  <img style="height: 100%;" src="'+item.proj_pic_path+'" alt=""></div></div></div><div class="list-col c2"><div class="col-inner">\
				  <p class="title"><span class="orange-font">￥'+item.money_needs+'</span><span class="blue-font">'+item.proj_name+'</span></p>\
				  <p class="base-info">\
				  <span><i class="icon figure"></i>'+item.username+'</span>\
				  <span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span>\
				  <span><i class="icon clock"></i>'+beforeT(item.create_time)+'天前</span></p>\
				  <p>'+item.phone+'</p>\
				  <p class="tags"><span>'+item.cate_name+'</span><span>'+dellocation(item.proj_location)+'</span></p></div></div><div class="list-col c3">\
				  '+dellprojecturl(item.id)+'</div></li>'
			)
		});
		empty && $list.empty();
		$list.append(nodeList.join(''));

		function beforeT(cTime) {
			return Math.floor((new Date().getTime()-cTime)/1000/3600/24)
		}
	}

	function dellprojecturl(id){
		// data-type = 1 项目
		// 			 = 2 头条
		return '<div class="col-inner"><a href="${ctx}/login/toProjectDetail?id='+id+'">查看</a><a style="margin-top: 15px;" data-id='+id+' data-type="1" class="del-link" href="#">删除</a></div>';
	}

	function dellocation(value) {
		if(value==null||value=='') {
			return "不限";
		}else {
			return value;
		}
	}

});

	</script>
</body>

</html>
