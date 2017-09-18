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
          <li><a href="#">广告</a></li>
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
    <div class="modal-content" style="width:650px;margin: 0 auto;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑标签</h4>
      </div>
      <div class="user-details">
        <div class="user-base-info">
        <form class="form-horizontal"  id="form" action="${ctx}/template/advertisement/saveOrUpdate" method="post"  style="width:600px;margin: 0 auto;">
          <p>
          	<input type="hidden" name="id"  id="id" value="">
          	<input type="hidden" name="image"  id="image" value="">
          	<input type="hidden"  name="createTime" id="createTime"  value="" >
          </p>
          	  
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">广告标题</label>
		    <div class="col-sm-10">
		      <input type="text"  name="title" class="form-control"  id="title" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">广告图片</label>
		    <div class="col-sm-10">
		      <div class="form-group-content upload-photo-group">
	             <div class="upload-preview empty"><input type="file" name="upload" id="zhutiPic" value=""></div>
	          </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">广告链接</label>
		    <div class="col-sm-10">
		      <input type="text"  name="url" class="form-control"  id="url" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">广告类型</label>
		    <div class="col-sm-10">
		      <select id="type" name="type" style="height: 34px;padding: 0 1em;">
		      	<option value="0">pc首页轮播图</option>
		      	<option value="5">微信首页轮播图</option>
		      	<option value="6">创意大赛页展示图</option>
		      	<option value="1">首页广告位</option>
		      	<option value="2">项目筛选页广告位</option>
		      	<option value="3">红人馆页广告位</option>
		      	<option value="4">头条详情页广告位</option>
				<option value="7">项目详情页广告位</option>
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">广告等级</label>
		    <div class="col-sm-10">
		      <input type="number"  name="level" class="form-control"  id="level" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">开始时间</label>
		    <div class="col-sm-10">
		      <input type="date"  name="startTime" class="form-control"  id="startTime"  value="" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">结束时间</label>
		    <div class="col-sm-10">
		      <input type="date"  name="endTime" class="form-control"  id="endTime"  value="" placeholder="">
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
	  
	  var storeUrl = ctx+'/template/advertisement/getAdListPage';
	  var pageSize = 10;
	  var operateEvents = {
	      'click .editor-btn': function (e, value, row, index) {
	          $("#id").val(row.id);
	          $("#title").val(row.title);
	          $("#image").val(row.image);
	          $("#url").val(row.url);
	          $("#type").val(row.type);
	          $("#level").val(row.level);
	          $("#createTime").val(new Date(row.createTime).Format("yyyy-MM-dd hh:mm:ss"));
	          $("#startTime").val(new Date(row.startTime).Format("yyyy-MM-dd"));
	          $("#endTime").val(new Date(row.endTime).Format("yyyy-MM-dd"));
	      },
	      'click .del-btn': function (e, value, row, index) {
	    	  if(window.confirm("您确定要删除吗？")){
			   	  $.ajax({
			          type: "POST",
			          url: ctx+"/template/advertisement/deleteById",
			          data: {"id":row.id},
			          dataType: "json",
			          success: function(obj){
			        	  window.location.href= ctx+'/template/login/toGrid?gridName=AdGrid';
			          }
			      }); 	    		  
	    	  }
	      }
	  };
	  var grid_columns = [{
          field: 'title',
          title: '广告标题',
          width:200
      }, {
          field: 'image',
          title: '广告图片',
          formatter:image
      },{
          field: 'url',
          title: '广告链接',
          width:200
      },{
          field: 'type',
          title: '广告类型',
          formatter:type
      },{
          field: 'level',
          title: '广告等级'
      },{
          field: 'startTime',
          title: '开始时间',
          width:130,
          formatter:startTime
      },{
          field: 'endTime',
          title: '结束时间',
          width:130,
          formatter:endTime
      },{
          field: 'createTime',
          title: '创建时间',
          width:130,
          formatter:fotmatter
      },{
          field: 'operate',
          title: '操作',
          width:200,
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
      }];
	  
	  function fotmatter(value, row, index) {
		  if(value==null) return "";
	      var date = new Date(value);
	      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	  }
	  function startTime(value, row, index) {
		  if(value==null) return "";
	      var date = new Date(value);
	      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	  }
	  function endTime(value, row, index) {
		  if(value==null) return "";
	      var date = new Date(value);
	      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	  }	  
	  function type(val){
		  if(val==0) return "pc首页轮播图";
		  else if(val==1) return "首页广告位";
		  else if(val==2) return "项目筛选页广告位";
		  else if(val==3) return "红人馆页广告位";
		  else if(val==4) return "头条详情页广告位";
		  else if(val==5) return "微信首页轮播图";
		  else if(val==6) return "创意大赛页展示图";
		  else if(val==7) return "项目详情页广告位";
	  }
	  function image(val,row){
		  return "<ul style='height:70px;list-style-type:none;' id='"+row.id+"img'><li><img style='height:70px;width:100px;' src='"+val+"'></li></ul>";
	  }
	  $("#table").on('click-cell.bs.table',function(e,field, value, row){
		  if(field=='image'){
			  new Viewer(document.getElementById(row.id+"img")).show();	//图片预览
		  }
	  });

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
           	   $("#image").val(result.urlList[0]);
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
