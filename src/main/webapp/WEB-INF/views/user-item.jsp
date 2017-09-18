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
	<h3 class="user-publish-title">我发布的项目</h3>
	<div class="list-tool-bar">
		<div class="filter-block">
			<select id="status-filter"  class="status"       name="">
				<option value="-2">全部状态</option>
				<option value="-3">草稿箱</option>
				<option value="0">未审核</option>
				<option value="3">申请中</option>
				<option value="2">审核不通过</option>
				<option value="-1">关闭</option>
<!-- 				<option value="2">审核不通过</option> -->
<!-- 				<option value="4">达成合作</option> -->
			</select>
			<select id="mode-filter" class="status" name="">
				<option value="">全部</option>
<%-- 			<c:forEach var="item" items="${catelist}" varStatus="status"> --%>
				<option value="0">赞助</option>
				<option value="1">供给</option>
<%-- 			</c:forEach> --%>
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

	function delstatus(status) {
		if(status==-3) {
			return "草稿箱";
		}
		if(status==-2) {
			return "全部";
		}
		if(status==-1) {
			return "关闭";
		}
		if(status==0) {
			return "未审核";
		}
		if(status==1) {
			return "审核通过";
		}
		if(status==2) {
			return "审核不通过";
		}
		if(status==3) {
			return "申请中";
		}
		if(status==4) {
			return "达成合作";
		}
	}

	var uid=$('#uid').val();
	//加载表格
	$.ajax({
		type: "GET",
		url: url+"/project/getProjectList",
		data: {
			uid:uid,
			status:-2,
			page:page,
			pageSize:pageSize
		},
		aysnc:true,
		dataType: "json",
		success: function(data) {
			console.log(data);
			renderList(data.newsList, 1);
			autoShow();
		}
	});

	function istop(istop,id,status) {
		if(status==-3){
			return "";
		}
		if(istop==0&&(status==1||status==3||status==4)) {
			return  '<a class="set-top" data-id="'+id+'" href="#" style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; ">置顶</a>';
		} else {
			return ""
		}
	}

	function isShutDown(s,id) {
		var ret = '';
		ret += '<a href="${ctx}/login/toPublish?pid='+id+'"  data-id="'+id+'" style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; " class="mod">编辑</a>';
		if(s==-1) {
			ret += '<a href="#" data-status="'+s+'" data-id="'+id+'" class="shutDown off" style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; ">取消关闭</a>';
		} else if (s==1||s==3||s==4) {
			ret +=  '<a href="#" data-status="'+s+'" data-id="'+id+'" class="shutDown " style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; ">关闭</a>';
		}
		return ret;
	}

	function isrefresh(id, status) {
		if(status==-3) {
			return " ";
		}
		if(status==1||status==3||status==4) {
			return '<a style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; " class="refresh" id="refresh" data-s="'+status+'" data-id="'+id+'" href="#">刷新</a>';
		}
		return "";
	}

	function delprojtype(value) {
		if(value==1) {
			return "供给";
		} else if(value==0) {
			return "赞助";
		} else if(value==''||value==null) {
			return "";
		}
	}

	//渲染列表
	function renderList(data, mode) {
		var $releasedList = $('.released-list-box ul');
		var nodes = data.map(function(item,index) {
			var t1 = new Date(item.createTime).Format("yyyy-MM-dd hh:mm:ss");
			var t2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
			var moneyNeeds = '';
			if(item.moneyNeeds!=undefined) moneyNeeds = item.moneyNeeds;
			return ('<li><div class="released-datetime">'+fotmatter(item.createTime).substr(5)+'</div>\
				<div class="cf"><div class="col c1"><div class="col-inner">\
				<div class="project-photo"><img src="'+item.projPicPath+'" alt=""></div>\
				</div></div><div class="col c2"><div class="col-inner">\
				<h3><span>'+item.cateName+'</span><span>'+item.projName+'</span><span class="mark-label">'+delprojtype(item.projType)+'</span></h3>\
				<p><span><i class="icon figure"></i>'+item.username+'</span><span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span>\
				<span><i class="icon clock"></i>'+getDays(t1,t2)+'天前'+'</span><span>'+delstatus(item.status)+'</span></p><p><span class="orange-font">￥'+moneyNeeds+'</span></p>\
				</div></div><div class="col c3"><div class="col-inner">'+isShutDown(item.status,item.id)+'<a style=" background: skyblue; border: skyblue; border-radius: 3px; color: white; " class="browse-link" href="${ctx}/login/toProjectDetail?id='+item.id+'">查看</a>'+isrefresh(item.id,item.status)+'\
				'+istop(item.istop,item.id,item.status)+'</div></div></div>'+(data[index+1] ? ((fotmatter(item.createTime).split('-')[1] != fotmatter(data[index+1].createTime).split('-')[1]) ?
				'<div class="datetime-separate"><span>'+fotmatter(item.createTime).split('-')[0]+'</span> <span class="dsdot"></span> <span>'+fotmatter(item.createTime).split('-')[1]+'月</span></div>' : ''
				) :'')+'</li>'
			);
		});
		mode && $releasedList.empty();
		$releasedList.append(nodes.join('')); 
	}

	$('.released-list-box ul').on('click','.set-top',function() {
	    var domThis = this;
		$.DialogBySHF.Confirm({Width: 350,Height: 200,Title: "提示信息",Content: "置顶需要500积分，置顶天数为1天，确定吗？",ConfirmFun: function() {
			// 这下面的三个this改成domThis
		    var id = $(domThis).data('id');
			var $self = $(domThis);
			var stauts=$(domThis).parents('li').find('.col-inner p span').eq(3).text();
			if(stauts=="未审核") {
				alert("未审核");
				return false;
			}
			if(stauts=="审核不通过") {
				alert("审核不通过");
				return false;
			}
			$self.addClass('hide');
			$.ajax({
				type: "GET",
				url: url+"/project/topProject",
				data: {
					id:id
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					if(data==1){
						$self.addClass('hide');
						autoShow();
					}
					else if(data==0){
						alert("置顶失败")
					}else if(data==3){
						alert("积分不够500")
					}
				}
			});
			return false;
		},CancelFun: function() {}});

		return false;
	});

	//过滤选项
	$('.filter-block select').on('change',function(){
		console.log($(this).val());
	});

	//搜索按钮
	$('.search-block form').on('submit',function(){
		page=1;
		pageSize=10;
		var keywords = $(this).find('input[name="keywords"]').val();
		console.log(keywords);
		var typestatus=$('#status-filter').val();
		var projType=$('#mode-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/project/getProjectList",
			data: {
				uid:uid,
				status:typestatus,
				projType:projType,
				projName:keywords,
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				console.log(data.newsList);
				renderList(data.newsList, 1);
				autoShow();
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
		var projType=$('#mode-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/project/getProjectList",
			data: {
				uid:uid,
				status:typestatus,
				projType:projType,
				projName:keywords,
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

	//修复没数据时，显示问题
	function autoShow(){
		var $loadMore = $('.load-more');
		if($('.released-list-box li').length >=10) {
			$loadMore.removeClass('hide');
		} else {
			$loadMore.addClass('hide');
		}
	}

	$('.released-list-box ul').on('click','.shutDown',function() {
		var id = $(this).data('id');
		var status=$(this).data('status');
		if($(this).hasClass('off')) {
			$(this).removeClass('off').text('关闭');

			//未关闭
			var stauts=1;
		} else {
			if(status==0||status==2) {
				alert("项目要先通过审核");
				return false;
			}
			$(this).addClass('off').text('取消关闭');
			//关闭中
			var stauts=-1;
		}

		$.ajax({
			type: "POST",
			url: url+"/project/check",
			data: {
				id:id,
				status:stauts
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
			}
		});
		return false;
	});

	$('.released-list-box ul').on('click','.refresh',function() {
		var id = $(this).data('id');
		$.ajax({
			type: "GET",
			url: url+"/project/RefreshCreatTime",
			data: {
				id: id
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				if(data.error==0){
					alert("刷新时间成功");
				}
			}
		});
		return false;
	});

	//计算天数差的函数，通用  
	function getDays(sDate1, sDate2){	//sDate1和sDate2是2006-12-18格式
		var aDate, oDate1, oDate2, iDays;  
		aDate = sDate1.split("-");  
		oDate1 = new Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);	//转换为12-18-2006格式  
		aDate = sDate2.split("-");  
		oDate2 = new Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);  
		iDays = parseInt(Math.abs(oDate1 - oDate2)/3600000/24);
		if(iDays==NaN){
			return 0;
		}
		return iDays;
	}

	//格式化时间
	Date.prototype.Format = function (fmt) { //author: meizz 
		var o = {
			"M+": this.getMonth()+1, //月份 
			"d+": this.getDate(), //日 
			"h+": this.getHours(), //小时 
			"m+": this.getMinutes(), //分 
			"s+": this.getSeconds(), //秒 
			"q+": Math.floor((this.getMonth()+3)/3), //季度 
			"S": this.getMilliseconds() //毫秒 
		};
		if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o)
			if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};

	$('#status-filter').on('change',function(){
		var uid=$('#uid').val();
		var typestatus=$(this).val();
		var page=1;
		var pageSize=10;
		var keywords = $(this).find('input[name="keywords"]').val();
		console.log(keywords);
		var projType=$('#mode-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/project/getProjectList",
			data: {
				uid:uid,
				status:typestatus,
				projType:projType,
				projName:keywords,
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				console.log(data.newsList);
				renderList(data.newsList, 1);
				autoShow();
			}
		});
	});

	$('#mode-filter').on('change',function() {
		var uid=$('#uid').val();
		var parentCid=$(this).val();
		var typestatus=$('#status-filter').val();
		var  page=1;
		var pageSize=10;
		var keywords = $(this).find('input[name="keywords"]').val();
		console.log(keywords);
		var projType=$('#mode-filter').val();
		$.ajax({
			type: "GET",
			url: url+"/project/getProjectList",
			data: {
				uid:uid,
				status:typestatus,
				projType:projType,
				projName:keywords,
				page:page,
				pageSize:pageSize
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				console.log(data.newsList);
				renderList(data.newsList, 1);
				autoShow();
			}
		});
	});
});

	</script>
</body>

</html>
