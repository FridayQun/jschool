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
          <li><a href="#">标签</a></li>
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
  </div>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:650px; margin: 0 auto;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑标签</h4>
      </div>
      <div class="user-details">
        <div class="user-base-infoee">
        <form class="form-horizontal"  id="form" action="${ctx}/template/tag/saveOrUpdate" method="post"  style="width:600px;margin: 0 auto;">
          <p><input type="hidden" name="id"  id="id" value=""></p>
		  
      <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签级别</label>
		    <div class="col-sm-10">
		      <select name="parentId" class="form-control"  id="tagLevel" placeholder=""></select>
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签名</label>
		    <div class="col-sm-10">
		      <input type="text"  name="tagName" class="form-control"  id="tagName" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签分数</label>
		    <div class="col-sm-10">
		      <input type="number"  name="tagScore" class="form-control"  id="tagScore" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签维度</label>
		    <div class="col-sm-10">
		      <input type="number"  name="tagDimension" class="form-control"  id="tagDimension" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签描述</label>
		    <div class="col-sm-10">
		      <input type="text"  name="tagDesc" class="form-control"  id="tagDesc" placeholder="">
		    </div>
		  </div>
		  
		 	<div class="form-group">
		 	<label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">标签类别</label>
		 	<div class=" col-sm-10">
		 	<select name="tagType"  id="tagType" style="height: 34px;padding:0 1em; border-box;">
			      	<option value="0">个人标签</option>
			      	<option value="1">项目标签</option>
			      </select>
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
  <script src="${ctx}/resources/template/js/jquery.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-paginator.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-table.min.js"></script>
  <script src="${ctx}/resources/template/js/bootstrap-table-zh-CN.min.js"></script>
  <script src="${ctx}/resources/template/js/common.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function deltype(value, row, index){
	  if(value==1){
		  return "项目标签";
	  }
	  if(value==0){
		  return "个人标签";
	  }
  }
  
  $('#buttondetail').on('click', function() {
    $.ajax({
        type: "GET",
        url: ctx+"/tag/getFirstTagList",
        data: {},
        aysnc:true,
        dataType: "json",
        success: function(data){
          data = data.tagsList;
          $("#tagLevel").empty();
          $("#tagLevel").append('<option value="0">无(即一级类型)</option>');
          for(var i=0;i<data.length;i++){
            $("#tagLevel").append('<option value="'+data[i].id+'">'+data[i].tagName+'</option>');
          }
        }
    });
  });

  $(function() {
	  //配置信息
	  
	  var storeUrl = ctx+'/template/tag/getTagListPage';
	  var pageSize = 10;
	  var operateEvents = {
	      'click .editor-btn': function (e, value, row, index) {
	          $("#id").val(row.id);
	          $("#tagName").val(row.tagName);
	          $("#tagScore").val(row.tagScore);
	          $("#tagDimension").val(row.tagDimension);
	          $("#tagDesc").val(row.tagDesc);
	          $("#tagType").val(row.tagType);
            $("#tagLevel").val(row.parentId);
	      },
	      'click .del-btn': function (e, value, row, index) {
	    	  if(window.confirm("您确定要删除吗？")){
			   	  $.ajax({
			          type: "POST",
			          url: ctx+"/template/tag/deleteById",
			          data: {"id":row.id},
			          dataType: "json",
			          success: function(obj){
			        	  window.location.href= ctx+'/template/login/toGrid?gridName=TagGrid';
			          }
			      }); 	    		  
	    	  }
	      }
	  };
	  var grid_columns = [{
          field: 'tagName',
          title: '标签名',
          width:200,
          formatter: formatName
      }, {
          field: 'tagScore',
          title: '标签积分'
      },{
          field: 'tagDimension',
          title: '标签维度'
      },
      {
          field: 'tagType',
          title: '标签类型',
          formatter:deltype
          
      },{
          field: 'tagDesc',
          title: '标签描述'
      },{
          field: 'parentId',
          title: '级别',
          formatter: formatLevel
      },{
          field: 'operate',
          title: '操作',
          width:200,
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
      }];
	  
    function formatName(value, row, index) {
      if(row.parentId == 0) {
        return '<label><strong>' +value +'</strong></label>';
      } else {
        return '<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----- '+value+'</label>';
      }
    }

    function formatLevel(value, row, index) {
      if(value==0) return "一级";
		  if(value!=0) return "二级";
    }

	  function operateFormatter(value, row, index) {
	        return [
	            '<a data-toggle="modal" data-target="#myModal" class="btn-link editor-btn" href="#"><i class="icon editor"></i><span>编辑</span></a>',
	            '<a class="btn-link del-btn" href="#"><i class="icon del"></i><span>删除</span></a>'
	        ].join('');
	  }
	  $("#table").bootstrapTable({  
		  columns:grid_columns,
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
                pageNumber:params.pageNumber,    
                pageSize:params.pageSize,  
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
