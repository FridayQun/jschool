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
          <li><a href="#">意见</a></li>
        </ol> 
       </div>  
      <div class="manage-inner">
      	 <div id="toolbar" class="filter-bar clearfix">
      	 	
      	 	  <div class="col" style="padding: 0 0 0 0.5em;">
	           <button id="button" 
			          	class="btn btn-default"  
			          	data-toggle="modal" 
			          	data-target="#myModal">回复
			   </button>
			   </div>
      	 
      	</div>
      	
		<table id="table" style="width:900px;" data-click-to-select="true" 
		data-toolbar="#toolbar" 
		data-search="true" 
		data-striped="true" 
		data-show-refresh="false" 
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
      
    </div>
  </div>
  <!-- 认证失败发消息的Modal -->
	<div class="modal fade" id="smModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="smModalLabel">回复内容：</h4>
	      </div>
	      <div class="modal-body">
	        <div><textarea style="height: 10em;" class="form-control" placeholder="回复内容"></textarea></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary">回复</button>
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
  function fotmatter(value, row, index) {
	  if(value==null) return "";
      var date = new Date(value);
      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
    }

  

  
 
  $(function() {
	
	  
	 
	  var $table = $('#table');
      var $button= $('#button')
	  
	  var grid_columns = [
		{
	 		 field: '',
   			 title: '',
         },
	  	
	     { field: 'id', 
	       title: 'id',
		  },{
		   field: 'content',
		   title: '内容',
		 },{
		   field: 'nickname',
		   title: '用户昵称',
		 },{
		   field: 'phone',
		   title: '用户手机',
		 },{
		   field: 'ctime',
		   title: '创建时间',
		   formatter:"fotmatter"
		 },
		  
		  ];
	     
	  
	  $("#table").bootstrapTable({  
		  columns:grid_columns,
          method: "post",  //使用get请求到服务器获取数据  
          url: "<c:url value='/advice/getadvicelist'/>", //获取数据的Servlet地址  
          striped: true,  //表格显示条纹  
          pagination: true, //启动分页  
          pageSize: 10,  //每页显示的记录数  
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
                ////orderNum:$("#orderNum").val()  
            };    
            return param;                   
          },  
          onLoadSuccess: function(){  //加载成功时执行  
          },  
          onLoadError: function(){  //加载失败时执行  
          }  
        }); 
	  $("#table").bootstrapTable("hideColumn", "id");
	  
	  
	 
	   
	//未通过认证的时候，弹出发送理由的窗口的回复按钮
	  $('#smModal .btn-primary').on('click',function(){
		  var temp=$table.bootstrapTable('getSelections')[0];
		  console.log($("#smModal textarea").val());
		  var message=$("#smModal textarea").val();
		    $.ajax({
		        type: "POST",
		        url: ctx+"/mesg/addtempmesg",
		        data: {
		        	fromId:1,
		        	toId:temp.uid,
		        	content:message,
		        	type:0
		        },
		        aysnc:true,
		        dataType: "json",
		        success: function(data){
		        	 $("#smModal textarea").val('');
		        	 $("#smModal").modal('hide');	
						 }

				});
		  
	  });
	  $button.click(function () {
		  data=$table.bootstrapTable('getSelections');
		  if(data.length==0){
			  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
			  return false;
		  }
		  $("#smModal").modal('show');	  
	  }); 

	      
	      
	     
	      
	     
	 
	      
	      

  });
  </script>

</body>

</html>
