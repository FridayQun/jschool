<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/template/css/bootstrap.min.css">
  <link rel="stylesheet" href="${ctx}/resources/template/css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="${ctx}/resources/template/css/bootstrap-table.min.css">
  <link rel="stylesheet" href="${ctx}/resources/template/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/template/css/manage.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/resources/viewerjs/css/viewer.min.css">
  <script type="text/javascript" src="${ctx}/resources/viewerjs/js/viewer.min.js"></script>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>var ctx = '${ctx}';</script>
</head>

<body class="manage-box">
	<div class="manage-header clearfix">
		<div class="m-header-left">
			<div class="logo">
				<a href="#"><img src="${ctx}/resources/template/images/small-logo.png" alt=""></a>
			</div>
			<h4>后台管理系统</h4>
		</div>
		<div class="m-header-right">
			<a href="index.html">退出登录</a>
		</div>
	</div>
	<div class="manage-main clearfix">
	<jsp:include page="left.jsp" flush="true"/>
	<div class="manage-body">
		<div class="manage-heading">
			<ol class="breadcrumb">
				<li><a href="#">用户中心</a></li>
			</ol>
		</div>
	<div class="manage-inner">
		<div class="row">
			<div class="col-md-3">
				<span>起始时间</span><input value="2017-01-01" type="date" class="form-control" id="logintime" placeholder="">
			</div>
			<div class="col-md-3">
				<span>结束时间</span><input value="2017-01-01" type="date" class="form-control" id="logintime2" placeholder="">
			</div>
		</div>
		<div id="toolbar" class="filter-bar clearfix">
			<div class="col">
				<button type="button" 
					class="btn btn-default dropdown-toggle" 
					data-toggle="dropdown" 
					aria-haspopup="true" 
					aria-expanded="false">用户类型 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu temp">
					<li><a value="2" href="#">所有用户</a></li>
					<li><a value="1">认证用户</a></li>
					<li><a value="0">非认证用户</a></li>
					<li><a value="3">待认证用户</a></li>
				</ul>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button type="button" 
					class="btn btn-default dropdown-toggle" 
					data-toggle="dropdown" 
					aria-haspopup="true" 
					aria-expanded="false">用户身份 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu idtype">
					<li><a value=null href="#">全部</a></li>
					<li><a value=1>公司</a></li>
					<li><a value=0>学生</a></li>
				</ul>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button type="button" 
			    	class="btn btn-default dropdown-toggle" 
			    	data-toggle="dropdown" 
			    	aria-haspopup="true" 
			    	aria-expanded="false">标签类型 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu tag" id="taglist">
					<li><a value="0" href="#">全部</a></li>
				</ul>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button id="buttondetail" 
					class="btn btn-default"  
					data-toggle="modal" 
					data-target="#myModal">查看详情
				</button>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button id="buttontop" 
					class="btn btn-default">达人推荐
				</button>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button id="buttoncancletop" 
					class="btn btn-default">取消达人推荐
				</button>
			</div>
			<div class="col" style="padding: 0 0 0 0.5em;">
				<button id="buttonsendmesg" 
					class="btn btn-default">提醒用户登录
				</button>
			</div>
			<div class="col form-horizontal" style="padding: 0 0 0 0.5em;">
				<div class="input-group">
					<input type="text" style="max-width:12em;margin: 0 0.5em 0 0;border-top-right-radius:4px;border-bottom-right-radius:4px;" id="phonetext" class="form-control" placeholder="按手机号码查询"/>
					<button id="buttonsear" class="btn yellow-btn" type="button">搜索</button>
				</div>
			</div> 		
		</div>

		<table id="table"  data-click-to-select="true" 
			data-toolbar="#toolbar" 
			data-search="true" 
			data-striped="true" 
			data-show-refresh="false" 
			data-show-pagination-switch = "true" 
			data-pagination="true" 
			data-search="true">
			<thead>
				<tr><th data-field="state" data-checkbox="true"></th></tr>
			</thead>
		</table>

	</div>

	</div>
	</div>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog "  role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
      	<div class="userBaseInfo"></div>
      	  <div id="autoolbar">
      	   	<div class="col">
            	 <div class="btn-group" role="group">
          			 <button id="button" class="btn btn-default">通过认证</button>
          			 <button id="nobutton" class="btn btn-default">不通过认证</button>
          		 </div>
          	 </div>
      	  </div>
			<table style="width:1800px;" id="autable" data-click-to-select="true" 
				data-toolbar="#autoolbar"
				data-search="true" 
				data-striped="true" 
				data-show-refresh="true" 
				data-show-pagination-switch = "true" 
				data-pagination="true" 
				data-single-select="true" 
				data-search="true">
				<thead>
					<tr>
						<th data-field="state" data-checkbox="true"></th>
					</tr>
				</thead>
			</table>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


  <script src="${ctx}/resources/template/js/jquery.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-paginator.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-table.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-table-zh-CN.min.js"></script>
  <script src="${ctx}/resources/template/js/common.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
function projPicPath1(val, row) {
	return "<ul style='height:70px;list-style-type:none;' id='" + row.id + "img1'><li><img style='height:70px;width:100px;' src='" + val + "'></li></ul>";
}
function projPicPath2(val, row) {
	return "<ul style='height:70px;list-style-type:none;' id='" + row.id + "img2'><li><img style='height:70px;width:100px;' src='" + val + "'></li></ul>";
}
function projPicPath3(val, row) {
	return "<ul style='height:70px;list-style-type:none;' id='" + row.id + "img3'><li><img style='height:70px;width:100px;' src='" + val + "'></li></ul>";
}
function projPicPath4(val, row) {
	return "<ul style='height:70px;list-style-type:none;' id='" + row.id + "img4'><li><img style='height:70px;width:100px;' src='" + val + "'></li></ul>";
}
function delidtype(value) {
	if (value == null) {
		return value;
	} else {
		return Number(value);
	}
}
function delusertype(value, row, index) {
	if (value == 1) {
		return "公司";
	} else if (value == 0) {
		return "个人";
	}
}

function delistoptype(value, row, index) {
	if (value == 1) {
		return "是";
	} else {
		return "否";
	}
}

function disableUserAction(id, row) {
	var item = $('#table').bootstrapTable('getRowByUniqueId', id);
	$.ajax({
		type: "POST",
		url: ctx + "/template/usermanagement/disableuser",
		data: {
			id: item.id,
			extraInt: item.extra_int
		},
		aysnc: true,
		dataType: "json",
		success: function(obj) {
			item.extra_int = obj.extra_int;
			if(item.extra_int == 0) {
				row.innerHTML = "禁言";
			} else {
				row.innerHTML = "取消禁言";
			}
		}
	});
}

function disableUser(value, row, index) {
	if(!value) {
		return "<a href='#' onclick='disableUserAction("+row.id+", this)'>禁言</a>";
	} else {
		return "<a href='#' onclick='disableUserAction("+row.id+", this)'>取消禁言</a>";
	}
}

function delimage(value, row, index) {
	/* alert(value);  */
	return '<img  src="' + value + '" style="width:100px; height:80px"></img>';
}

function delaustate(value, row, index) {
	if (value == 0) {
		return "未审核";
	} else if (value == 1) {
		return "已认证";
	} else if (value == 2) {
		return "未通过";
	}
}

function delautype(value, row, index) {
	if (value >= 2) {
		return "已认证";
	} else {
		return "未认证";
	}
}

function fotmatterString(value) {
	if (value == null) {
		return '';
	} else {
		return value;
	}
}

function fotmatter(value, row, index) {
	if (value == null) return "";
	var date = new Date(value);
	return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
}
// 认证
$(function() {

	function getnow() {
		var nowDate = new Date();
		return nowDate.getFullYear() + '-' + pad(nowDate.getMonth() + 1) + '-' + pad(nowDate.getDate());
	}

	function pad(num) {
		return num < 10 ? '0' + num: num
	}

	$('#logintime2').val(getnow());

	var temptype = 2;
	var tag = "";
	var idtype = null;
	var $table = $('#table');
	var $autable = $('#autable');
	$button = $('#button');
	$tagbutton = $('#tagbutton');
	$nobutton = $('#nobutton');
	$buttondetail = $('#buttondetail');
	$buttonsear = $('#buttonsear');
	$buttontop = $('#buttontop');
	$buttoncancletop = $('#buttoncancletop');
	$buttonsendmesg = $('#buttonsendmesg');

	// 查询
	$buttonsear.click(function() {
		$('#table').bootstrapTable('refresh');
	});
	// 给用户发送短信
	$buttonsendmesg.click(function() {
		data = $table.bootstrapTable('getSelections');
		if (data.length == 0) {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
			return false;
		}

		var count = 0;
		for(var i=0; i<data.length; i++) {
		$.ajax({
			type: "POST",
			url: ctx + "/template/usermanagement/send",
			data: {
				phone: data[i].phone
			},
			aysnc: true,
			dataType: "json",
			success: function(obj) {
				if (obj == 1) {
					count++;
				}
				if(count == data.length) {
					$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
				}
			}
		});
		}
	})

	// 置顶
	$buttontop.click(function() {
		data = $table.bootstrapTable('getSelections');
		if (data.length == 0) {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
			return false;
		}
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		for(var i=0; i<data.length; i++) {
			if (data[i].user_level < 2) {
				count1++;
				count2++;
				count3++;
				continue;
			}
			if (data[i].istop == 1) {
				count2++;
				count3++;
				continue;
			}
			var toptime = new Date();
			toptime = toptime.getFullYear() + "-" + toptime.getMonth() + "-" + toptime.getDate() + " " + toptime.getHours() + ":" + "00" + ":" + "00";
			$.ajax({
				type: "POST",
				url: ctx + "/user/modUser",
				data: {
					uid: data[i].id,
					toptime: toptime,
					istop: 1
				},
				aysnc: true,
				dataType: "json",
				success: function(obj) {
					count3++;
					if (obj.error == 0) {
						count2++;
					}
					if(count2 == data.length) {
						$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "置顶成功，其中"+count1+"个未认证", ConfirmFun: function(){} });
						$('#table').bootstrapTable('refresh');
					} else if(count3 == data.length) {
						$('#table').bootstrapTable('refresh');
					}
				}
			});
		}
	});

	// 取消置顶
	$buttoncancletop.click(function() {
		data = $table.bootstrapTable('getSelections');
		if (data.length == 0) {
			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请选择一条", ConfirmFun: function(){} });
			return false;
		}
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		for(var i=0; i<data.length; i++) {
			if (data[i].user_level < 2) {
				count1++;
				count2++;
				count3++;
				continue;
			}
			if (data[i].istop != 1) {
				count2++;
				count3++;
				continue;
			}
			$.ajax({
				type: "POST",
				url: ctx + "/user/modUser",
				data: {
					uid: data[i].id,
					istop: 0
				},
				aysnc: true,
				dataType: "json",
				success: function(obj) {
					count3++;
					if (obj.error == 0) {
						count2++;
					}
					if(count2 == data.length) {
						$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "取消成功，其中"+count1+"个未认证", ConfirmFun: function(){} });
						$('#table').bootstrapTable('refresh');
					} else if(count3 == data.length) {
						$('#table').bootstrapTable('refresh');
					}
				}
			});
		}
	});

	// 查看详情
	$buttondetail.click(function() {
		data = $table.bootstrapTable('getSelections');
		if (data.length == 0) {

			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请选择一条", ConfirmFun: function(){} });
			return false;
		}
		if(data.length > 1) {

			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请选择一条", ConfirmFun: function(){} });
		}
		$('#autable').bootstrapTable('refresh');
	});

	// 认证按钮
	$button.click(function() {
		data = $autable.bootstrapTable('getSelections');

		if (data.length == 0) {

			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请选择一条", ConfirmFun: function(){} });
			return false;
		}

		if (data[0].state == 2) {

			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "该条认证已审核过", ConfirmFun: function(){} });
			return false;
		}
		if (data.length < 0) {

			$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请选择一条", ConfirmFun: function(){} });
			return false;
		}
		if ($table.bootstrapTable('getSelections')[0].user_level >= 2) {

			alert("已认证");
			return false;
		}
		$.ajax({
			type: "POST",
			url: ctx + "/template/usermanagement/authuser",
			data: {
				uid: $table.bootstrapTable('getSelections')[0].id,
				userLevel: 2,
				state: 1,
				cid: data[0].id,
				type: data[0].type

			},
			aysnc: true,
			dataType: "json",
			success: function(obj) {

				$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "认证成功", ConfirmFun: function(){} });
				$('#table').bootstrapTable('refresh');
				$(".modal-header .close span").trigger('click');

			},
			error: function(obj) {

				$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "认证失败", ConfirmFun: function(){} });
			}
		});
	});
	// 不通过认证按钮
	$nobutton.click(function() {
		data = $autable.bootstrapTable('getSelections');

		if (data.length == 0) {

			alert("请选择一条");
			return false;
		}

		if (data[0].state == 2) {

			alert("该条认证已审核过");
			return false;
		}
		if (data.length < 0) {

			alert("请选择一条");
			return false;
		}
		if ($table.bootstrapTable('getSelections')[0].user_level >= 2) {

			alert("已认证");
			return false;
		}
		$.ajax({
			type: "POST",
			url: ctx + "/template/usermanagement/authuser",
			data: {
				state: 2,
				cid: data[0].id,
				uid: $table.bootstrapTable('getSelections')[0].id,
			},
			aysnc: true,
			dataType: "json",
			success: function(obj) {

				$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "操作成功", ConfirmFun: function(){} });
				$('#table').bootstrapTable('refresh');
				$(".modal-header .close span").trigger('click');

			},
			error: function(obj) {

				$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "认证失败", ConfirmFun: function(){} });
			}
		});
	});

	/*
	$table.on('click-row.bs.table',function(e,row,el){
		console.log(row.id);
	});
	*/

	var grid_columns = [{
		field: '',
		title: '',
		formatter: function (){return '';}
	},
	{
		field: 'id',
		title: 'id',
	},
	{
		field: 'nickname',
		title: '昵称',
	},
	{
		field: 'phone',
		title: '手机',
	},
	{
		field: 'username',
		title: '用户名',
	},
	{
		field: 'id_type',
		title: '用户类型',
		formatter: "delusertype"
	},
	{
		field: 'create_time',
		title: '创建时间',
		formatter: "fotmatter"
	},
	{
		field: 'login_time',
		title: '登陆时间',
		formatter: "fotmatter"
	},
	{
		field: 'slogan',
		title: '个人宣言',
	},
	{
		field: 'tag',
		title: '主标签',
	},
	{
		field: 'fans',
		title: '粉丝数',
	},
	{
		field: 'follows',
		title: '关注数',
	},
	{
		field: 'influence',
		title: '影响力'
	},
	{
		field: 'point',
		title: '积分'
	},
	{
		field: 'user_level',
		title: '用户等级'
	},
	{
		field: 'user_level',
		title: '是否通过认证',
		formatter: "delautype"
	},
	{
		field: 'istop',
		title: '是否被置顶',
		formatter: "delistoptype"
	},
	{
		field: 'count',
		title: '未处理的提交数'
	}, {
		field: 'extra_int',
		title: '禁言操作',
		formatter: 'disableUser'
	}];
	var au_columns = [{
		field: '',
		title: ''
	},
	{
		field: 'id',
		title: 'id',
		visible: "false"
	},
	{
		field: 'realname',
		title: '真实名字',
	},
	{
		field: 'school',
		title: '学校',
	},
	{
		field: 'idcardOpposite',
		title: '身份证正面',
		formatter: "projPicPath1"
	},
	{
		field: 'idcardPositive',
		title: '身份证反面',
		formatter: "projPicPath2"
	},
	{
		field: 'idcardHold',
		title: '手持身份证',
		formatter: "projPicPath3"
	},
	{
		field: 'document',
		title: '证件照',
		formatter: "projPicPath4"
	},
	{
		field: 'eduStarttime',
		title: '入学时间',
	},
	{
		field: 'branch',
		title: '分院名',
	},
	{
		field: 'club',
		title: '社团',

	},
	{
		field: 'major',
		title: '专业',
	},
	{
		field: 'profile',
		title: '简介',
	},
	{
		field: 'userno',
		title: '学号',
	},
	{
		field: 'location',
		title: '地址',
	},
	{
		field: 'address',
		title: '详细地址',
	},
	{
		field: 'idno',
		title: '身份证号',
	},
	{
		field: 'company',
		title: '公司',
	},
	{
		field: 'position',
		title: '职位',
	},
	{
		field: "state",
		title: "状态",
		formatter: "delaustate"
	}];

	gCouldCheck = true;
	$("#table").bootstrapTable({
		columns: grid_columns,
		method: "post",
		uniqueId: 'id',
		//使用get请求到服务器获取数据  
		url: "<c:url value='/template/usermanagement/getusertemplist'/>",
		//获取数据的Servlet地址  
		striped: true,
		//表格显示条纹  
		pagination: true,
		//启动分页  
		pageSize: 10,
		//每页显示的记录数  
		pageNumber: 1,
		//当前第几页  
		pageList: [5, 10, 15, 20, 25],
		//记录数可选列表  
		search: false,
		//是否启用查询  
		showColumns: true,
		//显示下拉框勾选要显示的列  
		showRefresh: true,
		//显示刷新按钮  
		sidePagination: "server",
		onCheck: function(row, $dom) {			// 一个无聊至极的功能。。在允许全选的情况下不允许复选。。
			if(!gCouldCheck) {
				return;
			}
			gCouldCheck = false;
			var index = $dom.data('index');
			$('#table').bootstrapTable('uncheckAll');
			$('#table').bootstrapTable('check', index);
			gCouldCheck = true;
		},
		//表示服务端请求  
		//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
		//设置为limit可以获取limit, offset, search, sort, order  
		queryParamsType: "undefined",
		queryParams: function queryParams(params) { //设置查询参数  
			var param = {
				pageNumber: params.pageNumber,
				pageSize: params.pageSize,
				isauthen: Number(temptype),
				tag: Number(tag),
				phone: $('#phonetext').val() * 1,
				idtype: delidtype(idtype),
				logintime: $("#logintime").val() + " 00:00:00",
				logintime2: $("#logintime2").val() + " 23:59:59"
				////orderNum:$("#orderNum").val()  
			};
			return param;
		},
		onLoadSuccess: function() { //加载成功时执行  
		},
		onLoadError: function() { //加载失败时执行  
		}
	});
	$("#table").bootstrapTable("hideColumn", "id");

	//下拉框切换
	$('.dropdown-menu.temp a').on('click',
	function() {
		temptype = $(this).attr("value");
		console.log($(this).attr("value"));
		$(this).parents('.dropdown-menu').prev('.btn').html($(this).text() + ' <span class="caret"></span>');
		$(this).parents('.dropdown-menu').dropdown('toggle');
		$('#table').bootstrapTable('refresh');
		return false;
	});

	$("#autable").on('click-cell.bs.table',
	function(e, field, value, row) {
		if (field == 'idcardOpposite') {
			new Viewer(document.getElementById(row.id + "img1")).show(); //图片预览
		}
		if (field == 'idcardPositive') {
			new Viewer(document.getElementById(row.id + "img2")).show(); //图片预览
		}
		if (field == 'idcardHold') {
			new Viewer(document.getElementById(row.id + "img3")).show(); //图片预览
		}
		if (field == 'document') {
			new Viewer(document.getElementById(row.id + "img4")).show(); //图片预览
		}
	});

	function renderInfo(data) {
		$('.userBaseInfo').empty().append('<table class="table no-border"><tbody><tr><td>用户名：</td><td>' + fotmatterString(data.jkUser.usernmae) + '</td></tr>\
	        <tr><td>真实姓名：</td><td>' + fotmatterString(data.jkUserUserInfo.realname) + '</td></tr>\
	        <tr><td>绑定手机号：</td><td>' + fotmatterString(data.jkUser.phone) + '</td></tr>\
	        <tr><td>学校/公司：</td><td>' + fotmatterString(data.jkUserUserInfo.eduName) + '</td></tr>\
	        <tr><td>地区：</td><td>' + fotmatterString(data.jkUserUserInfo.location) + '</td></tr>\
	        <tr><td>学院：</td><td>' + fotmatterString(data.jkUserUserInfo.eduCollage) + '</td></tr>\
	        <tr><td>专业：</td><td>' + fotmatterString(data.jkUserUserInfo.eduMajor) + '</td></tr>\
	        <tr><td>社团：</td><td>' + fotmatterString(data.jkUserUserInfo.eduClub) + '</td></tr>\
	        <tr><td>入学时间：</td><td>' + fotmatter(data.jkUserUserInfo.eduTime) + '</td></tr>\
	        <tr><td>个人介绍：</td><td>' + fotmatterString(data.jkUser.slogan) + '</td></tr>\
	        <tr><td>注册日期：</td><td>' + fotmatter(data.jkUser.createTime) + '</td></tr>\
	        <tr><td>是否认证：</td><td>' + delautype(data.jkUser.userLevel) + '</td></tr>');
	}
	$('#myModal').on('shown.bs.modal',
	function() {
		$.ajax({
			type: "POST",
			url: ctx + "/template/usermanagement/getuserinfo",
			data: {
				uid: $table.bootstrapTable('getSelections')[0].id,

			},
			aysnc: true,
			dataType: "json",
			success: function(data) {
				renderInfo(data);
			}
		});

		$("#autable").bootstrapTable({
			columns: au_columns,
			method: "post",
			//使用get请求到服务器获取数据  
			url: "<c:url value='/template/usermanagement/authlist'/>",
			//获取数据的Servlet地址  
			striped: true,
			//表格显示条纹  
			pagination: true,
			//启动分页  
			pageSize: 10,
			//每页显示的记录数  
			pageNumber: 1,
			//当前第几页  
			pageList: [5, 10, 15, 20, 25],
			//记录数可选列表  
			search: false,
			//是否启用查询  
			showColumns: true,
			//显示下拉框勾选要显示的列  
			showRefresh: true,
			//显示刷新按钮  
			sidePagination: "server",
			//表示服务端请求  
			//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
			//设置为limit可以获取limit, offset, search, sort, order  
			queryParamsType: "undefined",
			queryParams: function queryParams(params) { //设置查询参数  
				var param = {
					pageNumber: params.pageNumber,
					pageSize: params.pageSize,
					uid: $table.bootstrapTable('getSelections')[0].id
					////orderNum:$("#orderNum").val()  
				};
				return param;
			},
			onLoadSuccess: function() { //加载成功时执行  
			},
			onLoadError: function() { //加载失败时执行  
			}
		});
		//$('#autable').bootstrapTable('refresh');  
	});
	//加载标签
	$.ajax({
		type: "get",
		url: ctx + "/tag/getAllTagList",
		data: {
			tagType: 0

		},
		aysnc: true,
		dataType: "json",
		success: function(obj) {
			for (var i = 0; i < obj.tagsList.length; i++) {
				temp = obj.tagsList[i];
				$('#taglist').append('<li><a value="' + temp.id + '" href="#">' + temp.tagName + '</a></li>');
			}
		},
		error: function(obj) {}
	});
	//选择标签
	$('.dropdown-menu.tag').on('click', 'a',
	function() {
		tag = $(this).attr("value");
		console.log($(this).attr("value"));
		$(this).parents('.dropdown-menu').prev('.btn').html($(this).text() + ' <span class="caret"></span>');
		$(this).parents('.dropdown-menu').dropdown('toggle');
		$('#table').bootstrapTable('refresh');
		return false;
	});
	$('.dropdown-menu.idtype').on('click', 'a',
	function() {
		idtype = $(this).attr("value");
		console.log($(this).attr("value"));
		$(this).parents('.dropdown-menu').prev('.btn').html($(this).text() + ' <span class="caret"></span>');
		$(this).parents('.dropdown-menu').dropdown('toggle');
		$('#table').bootstrapTable('refresh');
		return false;
	});

});
  </script>

</body>

</html>
