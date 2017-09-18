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
          <li><a href="#">资讯分类</a></li>
        </ol>
      </div>
      <div class="manage-inner">
      <div id="toolbar" class="filter-bar clearfix">
      	<div class="col"><button id="buttondetail" data-toggle="modal" data-target="#myModal" class="btn yellow-btn" type="button">新增</button></div>
      </div>
      <table id="table" data-toolbar="#toolbar" data-search="true" data-striped="true" data-show-refresh="true" data-show-pagination-switch = "true" data-pagination="true">
      
      </table>
      </div>
      </div>
    </div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
	<div class="modal-content" style="width:650px; margin: 0 auto;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">编辑类目</h4>
		</div>
		<div class="user-details">
			<div class="user-base-infoee">

	<form class="form-horizontal"  id="form" action="${ctx}/template/news/saveOrUpdate" method="post"  style="width:600px;margin: 0 auto;">
		<p><input type="hidden" name="id"  id="id" value=""></p>

		<div class="form-group">
			<label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">名字</label>
			<div class="col-sm-10">
				<input type="text" name="cateName" class="form-control"  id="cate-name" placeholder="类目名字" />
			</div>
		</div>
		<div class="form-group">
			<label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">类目描述</label>
			<div class="col-sm-10">
				<input type="text"  name="cateDesc" class="form-control"  id="cate-desc" placeholder="类目描述" />
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
			<button type="submit" class="btn btn-primary">确定</button>
		</div>
	</form>

			</div>
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
$('#buttondetail').on('click', function() {
	$("#id").val('');
	$("#cate-name").val('');
	$("#cate-desc").val('');
});

$(function() {
	//配置信息

	var storeUrl = ctx+'/template/news/getCateListPage';
	var pageSize = 10;
	var operateEvents = {
		'click .editor-btn': function (e, value, row, index) {
			$("#id").val(row.id);
			$("#cate-name").val(row.cateName);
			$("#cate-desc").val(row.cateDesc);
		},
		'click .comment-btn': function (e, value, row, index) {
			var text = '';
			if(row.isRecomment) {
				text += '您确定要取消推荐吗？';
			} else {
				text += '您确定要推荐吗？';
			}
			if(window.confirm(text)) {
				$.ajax({
					type: "POST",
					url: ctx+"/template/news/changeCateState",
					data: {"id": row.id},
					dataType: "json",
					success: function(obj){
						window.location.href= ctx+'/template/login/toGrid?gridName=NewsCate';
					}
				});
			}
		},
		'click .del-btn': function (e, value, row, index) {
			if(window.confirm("您确定要删除吗？")) {
				$.ajax({
					type: "POST",
					url: ctx+"/template/news/deleteCateById",
					data: {"id":row.id},
					dataType: "json",
					success: function(obj){
						window.location.href= ctx+'/template/login/toGrid?gridName=NewsCate';
					}
				});
			}
		}
	};
	var grid_columns = [{
		field: 'cateName',
		title: '类名',
		width: 200
	}, {
		field: 'cateDesc',
		title: '标签描述'
	}, {
		field: 'operate',
		title: '操作',
		width: 200,
		align: 'center',
		events: operateEvents,
		formatter: operateFormatter
	}];

	function operateFormatter(value, row, index) {
		if(row.isRecomment) {
			return [
				'<a data-toggle="modal" data-target="#myModal" class="btn-link editor-btn" href="#"><i class="icon editor"></i><span>编辑</span></a>',
				'<a class="btn-link comment-btn" href="#"><i class="icon editor"></i><span>取消推荐</span></a>',
				'<a class="btn-link del-btn" href="#"><i class="icon del"></i><span>删除</span></a>'
			].join('');
		} else {
			return [
				'<a data-toggle="modal" data-target="#myModal" class="btn-link editor-btn" href="#"><i class="icon editor"></i><span>编辑</span></a>',
				'<a class="btn-link comment-btn" href="#"><i class="icon editor"></i><span>推荐</span></a>',
				'<a class="btn-link del-btn" href="#"><i class="icon del"></i><span>删除</span></a>'
			].join('');
		}
	}
	$("#table").bootstrapTable({
		columns: grid_columns,
		method: "GET",  //使用get请求到服务器获取数据
		url: "<c:url value='"+storeUrl+"'/>", //获取数据的Servlet地址
		striped: true,  //表格显示条纹
		pagination: true, //启动分页
		pageSize: pageSize,  //每页显示的记录数
		pageNumber:1, //当前第几页
		pageList: [5, 10, 15, 20, 25],  //记录数可选列表
		search: false,  //是否启用查询
		showColumns: true,  //显示下拉框勾选要显示的列
		showRefresh: true,  //显示刷新按钮
		sidePagination: "server", //表示服务端请求
		//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder
		//设置为limit可以获取limit, offset, search, sort, order
		queryParamsType : "undefined",
		queryParams: function queryParams(params) {   //设置查询参数
		var param = {
			pageNumber: params.pageNumber,
			pageSize: params.pageSize,
			//orderNum:$("#orderNum").val()
		};
		return param;
		},  
		onLoadSuccess: function(){  //加载成功时执行
		},
		onLoadError: function(){  //加载失败时执行
		}
	});
});

	</script>
</body>

</html>
