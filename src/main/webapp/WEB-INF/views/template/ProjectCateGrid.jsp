<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
  
  <!-- viewerJs图片预览插件 -->
  <link rel="stylesheet" type="text/css" href="${ctx}/resources/viewerjs/css/viewer.min.css">
  <script type="text/javascript" src="${ctx}/resources/viewerjs/js/viewer.min.js"></script> 
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
          <li><a href="#">项目类型管理</a></li>
        </ol>
      </div>
      <div class="manage-inner">
      <div id="toolbar" class="filter-bar clearfix">
      	<div class="col"><button id="buttondetail" data-toggle="modal" data-target="#myModal" class="btn yellow-btn" type="button">新增</button></div>
      </div>
      <table id="table" data-toolbar="#toolbar" data-search="true" data-striped="true" data-show-refresh="true" data-show-pagination-switch = "true" data-pagination="true"></table>
      </div>
      </div>
    </div>
  </div>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:650px;margin: 0 auto;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑标签</h4>
      </div>
      <div class="user-details">
        <div class="user-base-infoeee">
        <form class="form-horizontal"  id="form" action="${ctx}/template/projectcate/saveOrUpdate" method="post"  style="width:600px;margin: 0 auto;">
          <input type="hidden" name="id" id="id" value=""/>
          <input type="hidden"  name="headPicPath"  id="headPicPath" value=""/>
		  <div class="form-group" style="margin: 1em 0 15px 0;">
		    <label for="tagName" class="col-sm-2 control-label">父类型</label>
		    <div class="col-sm-10">
		      <select name="parentId" id="parentCate" style="height: 34px; padding: 0 1em;">
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型名称</label>
		    <div class="col-sm-10">
		      <input type="text"  name="cateName" class="form-control"  id="cateName" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型分</label>
		    <div class="col-sm-10">
		      <input type="number"  name="cateScore" class="form-control"  id="cateScore" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型描述</label>
		    <div class="col-sm-10">
		      <input type="text"  name="cateDesc" class="form-control"  id="cateDesc" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型图片</label>
		    <div class="col-sm-10">
			    <div class="form-group-content upload-photo-group">
	                <div class="upload-preview empty"><input type="file" name="upload" id="zhutiPic" value=""></div>
	             </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
	          <button type="submit" class="btn btn-primary">确定</button>
	        </div>
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
  $(function() {
	  //配置信息	  
	  var storeUrl = ctx+'/template/projectcate/getCateList';
	  var pageSize = 10;
	  var operateEvents = {
		  'click .editor-btn': function (e, value, row, index) {
	    	  $.ajax({
	              type: "GET",
	              url: ctx+"/projectcate/getFirstCateList",
	              data: {},
	              aysnc:true,
	              dataType: "json",
	              success: function(data){
	            	  $("#parentCate").empty();
	            	  $("#parentCate").append('<option value="">无(即一级类型)</option>');
	            	  for(var i=0;i<data.length;i++){
	            		  $("#parentCate").append('<option value="'+data[i].id+'">'+data[i].cateName+'</option>');
	            	  }
	    	          $("#id").val(row.id);
	    	          $("#cateName").val(row.cateName);
	    	          $("#cateScore").val(row.cateScore);
	    	          $("#cateDesc").val(row.cateDesc);
	    	          $("#headPicPath").val(row.headPicPath);
	    	          $("#parentCate").val(row.parentId);
	              }
	          }); 
	      },  
		'click .del-btn': function (e, value, row, index) {
			if(window.confirm("您确定要删除吗？")){
		   	  $.ajax({
		          type: "POST",
		          url: ctx+"/template/projectcate/deleteById",
		          data: {"id":row.id},
		          dataType: "json",
		          success: function(obj){
		        	  window.location.href= ctx+'/template/login/toGrid?gridName=ProjectCateGrid';
		          }
		      }); 				
			}
	      }
	  };
	  var grid_columns = [{
          field: 'cateName',
          title: '类型名',
          formatter:cateName,
          width:200
      },{
          field: 'headPicPath',
          title: '类型图片',
          width:100,
          height:85,
          formatter:headPicPath
      }, {
          field: 'cateDesc',
          title: '类型描述',
      },{
          field: 'cateScore',
          title: '类型值',
      },{
          field: 'cateLevel',
          title: '级别',
          formatter:cateLevel
      },{
          field: '',
          title: '操作',
          width:150,
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
      }];
	  
	  function cateLevel(val){
		  if(val==0) return "一级";
		  if(val==1) return "二级";
	  }
	  function cateName(val,row){
		  if(row.cateLevel==1){
			  return '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;----- '+val+'</label>';
		  }else{
			  return '<label><strong>' +val +'</strong></label>';
		  }
	  }
	  function headPicPath(val,row){
		  return "<ul style='height:70px;list-style-type:none;' id='"+row.id+"img'><li><img style='height:70px;width:100px;' src='"+val+"'></li></ul>";
	  }
	  //上传主题图片
      $('.upload-preview').find('input').on('change', function() {
         		var file = $(this)[0].files[0];
         		var fd = new FormData();
         		fd.append("file", file);
           $.ajax({
               url: ctx+"/artcle/upload",
               type: "POST",
               data: fd,
               processData: false,
               contentType: false
           }).done(function (result) {     
           	   $("#headPicPath").val(result.urlList[0]);
           }); 			  
      });
	  //图片预览
	  $("#table").on('click-cell.bs.table',function(e,field, value, row){
		  if(field=='headPicPath'){
			  new Viewer(document.getElementById(row.id+"img")).show();	
		  }
	  });
	  $("#buttondetail").on('click',function(){
    	  $.ajax({
              type: "GET",
              url: ctx+"/projectcate/getFirstCateList",
              data: {},
              aysnc:true,
              dataType: "json",
              success: function(data){
            	  $("#parentCate").empty();
            	  $("#parentCate").append('<option value="">无(即一级类型)</option>');
            	  for(var i=0;i<data.length;i++){
            		  $("#parentCate").append('<option value="'+data[i].id+'">'+data[i].cateName+'</option>');
            	  }
              }
          }); 
	  });
	  
	  
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
  	Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth() + 1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth() + 3) / 3), 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	  
  });
  
  </script>
</body>

</html>
