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
          <li><a href="#">积分商城/商品管理</a></li>
        </ol>
      </div>
      <div class="manage-inner">
      <div id="toolbar" class="filter-bar clearfix">
      	<div class="col"><button id="buttondetail" data-toggle="modal" data-target="#myModal" class="btn yellow-btn" type="button">新增</button></div>
      	<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">商品名：</label>
				<div class="col">
			      <input type="text"  style="max-width:inherit;" id="productName" name="productName" class="form-control" placeholder="按标题查询"/>
			    </div>
			</div>
		</div>
		<div class="col" style="padding: 0 0 0 0.5em;"><button id="buttonsear" class="btn yellow-btn" type="button">搜索</button></div>
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
        <div class="user-base-infoeee">
        <form class="form-horizontal"  id="form" action="${ctx}/template/product/saveOrUpdate" method="post"  style="width:600px;margin: 0 auto;">
          <p>
          	<input type="hidden" name="id"  id="id" value="">
          	<input type="hidden" name="headPic"  id="headPic" value="">
          	<input type="hidden" name="startTime"  id="startTime" value="">
          	<input type="hidden" name="endTime"  id="endTime" value="">
          </p>
		    
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">商品名</label>
		    <div class="col-sm-10">
		      <input type="text"  name="productName" class="form-control"  id="productName" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">商品图片</label>
		    <div class="col-sm-10">
			    <div class="form-group-content upload-photo-group">
	                <div class="upload-preview empty"><input type="file" name="upload" id="zhutiPic" value=""></div>
	             </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">标题</label>
		    <div class="col-sm-10">
		      <input type="text"  name="title" class="form-control"  id="title" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">简介</label>
		    <div class="col-sm-10">
		      <textarea type="number"  name="introduction" class="form-control"  id="introduction" placeholder=""></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">市场价格</label>
		    <div class="col-sm-10">
		      <input type="text"  name="price" class="form-control"  id="price" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">描述</label>
		    <div class="col-sm-10">
		      <textarea type="text"  name="productDesc" class="form-control"  id="productDesc" placeholder=""></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">所需积分</label>
		    <div class="col-sm-10">
		      <input type="text"  name="needScore" class="form-control"  id="needScore" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">当前库存</label>
		    <div class="col-sm-10">
		      <input type="text"  name="num" class="form-control"  id="num" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">热度</label>
		    <div class="col-sm-10">
		      <input type="text"  name="hot" class="form-control"  id="hot" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型</label>
		    <div class="col-sm-10">
		      <select name="type" id="type" style="height: 34px;padding: 0 1em;">
		      	<option value="1">普通商品</option>
		      	<option value="2">广告位</option>
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">注意事项</label>
		    <div class="col-sm-10">
		      <textarea type="text"  name="notice" class="form-control"  id="notice" placeholder=""></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">开始时间</label>
		    <div class="col-sm-10">
		      <input type="date"  name="startTime1" class="form-control"  id="startTime1"  value="" placeholder="">
		    </div>
		  </div><div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">结束时间</label>
		    <div class="col-sm-10">
		      <input type="date"  name="endTime1" class="form-control"  id="endTime1"  value="" placeholder="">
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
  $(function() {
	  //配置信息
	  
	  var storeUrl = ctx+'/template/product/getProductList';
	  var pageSize = 10;
	  var operateEvents = {
			  'click .editor-btn': function (e, value, row, index) {
    	          $("#id").val(row.id);
    	          $("#headPic").val(row.headPic);
    	          $("#productName").val(row.productName);
    	          $("#title").val(row.title);
    	          $("#introduction").val(row.introduction);
    	          $("#price").val(row.price);
    	          $("#productDesc").val(row.productDesc);
    	          $("#needScore").val(row.needScore);
    	          $("#num").val(row.num);
    	          $("#hot").val(row.hot);
    	          $("#type").val(row.type);
    	          $("#notice").val(row.notice);
    	          $("#startTime").val(new Date(row.startTime).Format("yyyy-MM-dd hh:mm:ss"));
    	          $("#endTime").val(new Date(row.endTime).Format("yyyy-MM-dd hh:mm:ss"));
    	          $("#startTime1").val(new Date(row.startTime).Format("yyyy-MM-dd"));
    	          $("#endTime1").val(new Date(row.endTime).Format("yyyy-MM-dd"));
		      },  
			  'click .del-btn': function (e, value, row, index) {
				  if(window.confirm("您确定要删除吗？")){
					  $.ajax({
				          type: "POST",
				          url: ctx+"/template/product/deleteById",
				          data: {"id":row.id},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=ProductGrid';
				          }
				      }); 
				  }
	      }
	  };
	  var grid_columns = [{
          checkbox:true
      },{
          field: 'productName',
          title: '商品名'
      }, {
          field: 'title',
          title: '标题'
      },{
          field: 'headPic',
          title: '图片',
          width:100,
          height:85,
          formatter:headPic
      },{
          field: 'introduction',
          title: '介绍'
      },{
          field: 'price',
          title: '市场价格'
      },{
          field: 'needScore',
          title: '所需积分',
          formatter:status
      },{
          field: 'num',
          title: '当前库存'
      },{
          field: 'hot',
          title: '热度'
      },{
          field: 'type',
          title: '类型',
          formatter:productType
      },{
          field: 'startTime',
          title: '兑换开始时间',
          formatter:startTime
      },{
          field: 'endTime',
          title: '兑换结束时间',
          formatter:endTime
      },{
          field: '',
          title: '操作',
          width:80,
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
      }];
	  
	  function startTime(val){  
		  return new Date(val).Format("yyyy-MM-dd");
	  }
	  function endTime(val){  
		  return new Date(val).Format("yyyy-MM-dd");
	  }
	  function productType(val){  
		  if(val==1) return "普通商品";
		  else if(val==2) return "广告位";
		  else return "";
	  }
	  function headPic(val,row){
		  return "<ul style='height:70px;list-style-type:none;' id='"+row.id+"img'><li><img style='height:70px;width:100px;' src='"+val+"'></li></ul>";
	  }
	  $("#table").on('click-cell.bs.table',function(e,field, value, row){
		  if(field=='headPic'){
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
           	   $("#headPic").val(result.urlList[0]);
           }); 			  
      });
    	$("#form").on('submit',function(){
    		$("#startTime").val(new Date($("#startTime1").val()).Format("yyyy-MM-dd 00:mm:ss"));
    		$("#endTime").val(new Date($("#endTime1").val()).Format("yyyy-MM-dd 00:mm:ss"));
      	});
	  
    	
      $('#buttonsear').click(function () {
  		  $('#table').bootstrapTable('refresh');
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
                productName:$("#productName").val()
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
