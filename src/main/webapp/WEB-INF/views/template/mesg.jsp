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
          <li><a href="#">公告</a></li>
        </ol> 
       </div>  
      <div class="manage-inner">
      	 <div id="toolbar" class="filter-bar clearfix">
      	 			<div class="col">
					<button type="button" 
			      		class="btn btn-default dropdown-toggle" 
			      		data-toggle="dropdown" 
			      		aria-haspopup="true" 
			      		aria-expanded="false">消息类型 <span class="caret"></span>
			      	</button>
					<ul class="dropdown-menu state" id="typelist">
						<li ><a value="[1,2,3]" href="#">全部</a></li>
						<li ><a value="[1]" href="#">公告</a></li>	
						<li ><a value="[2]" href="#">底部第一条</a></li>	
						<li ><a value="[3]" href="#">底部第二条</a></li>	
					</ul>
	         </div>
	      		<div class="col" style="padding: 0 0 0 0.5em;">
		           <button   id="buttonadd" 
				          	class="btn btn-default optBtn"  
				          	data-toggle="modal" 
				          	data-target="#myModal">添加
				   </button>
		  	    </div>	
		  	    <div class="col" style="padding: 0 0 0 0.5em;">
		           <button  id="buttonmod" 
				          	class="btn btn-default optBtn"  
				          	data-toggle="modal" 
				          	data-target="#myModal">修改
				   </button>
		  	    </div>
		  	    
		  	      <div class="col" style="padding: 0 0 0 0.5em;">
		           <button  id="buttondel" 
				          	class="btn btn-default optBtn"  
				          	>删除
				   </button>
		  	    </div>	
		  	    <div class="col" style="padding: 0 0 0 0.5em;">
		           <button  id="buttontop" 
				          	class="btn btn-default optBtn"  
				          	>置顶公告
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
				<tr><th data-field="state" data-checkbox="true"></th></tr>
			</thead>
		</table>
      							
     </div>
      
    </div>
  </div>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog"  role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加公告</h4>
      </div>
      <div class="modal-body">
      	 <div class="form-group">
       			<label>标题</label>
      	  		<input type="text" id="title" class="form-control" placeholder="请输入标题"/>
       	</div>
       	<div class="form-group">
       			<label>内容</label>
      	  	<input type="text" id="content" class="form-control" placeholder="请输入内容"/>
       	</div>
      	<div class="form-group">
      		<label style="line-height: 32px;">位置</label>
      		<select name="mesgtype" id="mesgtype" style="height: 32px; padding:0 1em;">
							<option value="1">公告</option>
							<option value="2">底部第一条</option>
							<option value="3">底部第二条</option>
      	  </select>
      	</div>
      	
      	
      	
      </div>
      <div class="modal-footer">
        <button type="button" id="closebutton" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button"  id="savebutton"class="btn btn-primary">保存</button>
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
  function deltype(value, row, index){
	  if(value==1){
		  return "公告";
	  }else if(value==2){
		  return "底部第一条";
	  }else if(value==3){
		  return "底部第二条";
	  }
  }
  
  function delistop(value, row, index){
	  if(value==1){
		  return "被推荐";
	  } 
  }
  
 
  $(function() {
	
	  
	 
	  var $table = $('#table');
      $button = $('#button');
      $buttonmod=$('#buttonmod');
      $buttontop=$('#buttontop');
      $buttondel = $('#buttondel');
      $savebutton = $('#savebutton');
      var meagtype=[1,2,3]
      var state=1;
      
      $buttonmod.click(function(){
    	  if($table.bootstrapTable('getSelections').length==0){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
    		  return false;
    	  }
      });
      $buttontop.click(function(){
    	  if($table.bootstrapTable('getSelections').length==0){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
    		  return false;
    	  }
    	  if($table.bootstrapTable('getSelections')[0].istop!="0"){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '已经置顶', ConfirmFun: function(){} });
    		  return false;
    	  }
    	  if($table.bootstrapTable('getSelections')[0].type!="1"){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '不是公告，不能置顶', ConfirmFun: function(){} });
    		  return false;
    	  }
    	  $.ajax({
              type: "POST",
              url: ctx+"/template/usermanagement/addmesg",
              data: {
             	 id:$table.bootstrapTable('getSelections')[0].id,
             	 istop:1
              },
              aysnc:true,
              dataType: "json",
              success: function(data){
             	 $('#table').bootstrapTable('refresh');
              }
          }); 
    	  
      });
      
      
      $buttondel.click(function(){
    	  if($table.bootstrapTable('getSelections').length==0){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '请选择一条', ConfirmFun: function(){} });
    		  return false;
    	  }
    	  
    	  if(window.confirm('您确定要删除吗？')){
    		  $.ajax({
                  type: "POST",
                  url: ctx+"/template/usermanagement/delmesg",
                  data: {
                 
                 	 id:$table.bootstrapTable('getSelections')[0].id
                  },
                  aysnc:true,
                  dataType: "json",
                  success: function(data){
                 	 if(data==1){
               		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '删除成功', ConfirmFun: function(){} });("");
                 		 $('#table').bootstrapTable('refresh');
                 	 }
                  }
              });
    	  }
    	  
    	  
    		 
    	  
      });
      $savebutton.click(function () {
		
		 $.ajax({
             type: "POST",
             url: ctx+"/template/usermanagement/addmesg",
             data: {
            	 id:$('#id').val(),
            	 title:$('#title').val(),
            	 content:$('#content').val(),
            	 type:$('#mesgtype').val()
             },
             aysnc:true,
             dataType: "json",
             success: function(data){
            	 $('#table').bootstrapTable('refresh');
  	             $(".modal-header .close span").trigger('click');
             }
         }); 
		 
		 
		 
	  });
      
       
	  
	  
	
	  
	  
	  
	  
	 /*  $table.on('click-row.bs.table',function(e,row,el){
	        console.log(row.id);
	      }); */
	  
	  var grid_columns = [
	  	 {
	  	  field: '',
	      title: '',
	     },
	     { field: 'id', 
	       title: 'id',
		  }, { field: 'title', 
		       title: '标题',
			  },{
		   field: 'content',
		   title: '内容',
		 },{
		  field: 'sendTime',
		  title: '发送时间',
		  formatter:"fotmatter"
		  },{
		   field: 'type',
		   title: '类型',
		   formatter:"deltype"
		  },{
			   field: 'istop',
			   title: '是否被推荐',
			   formatter:"delistop"
			  }
		  
		  ];
	     
	  
	  $("#table").bootstrapTable({  
		  columns:grid_columns,
          method: "post",  //使用get请求到服务器获取数据  
          url: "<c:url value='/mesg/getmesglistbyex'/>", //获取数据的Servlet地址  
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
                type:meagtype
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
	  
	  
	   //下拉框切换
	   $('.dropdown-menu a').on('click', function () {
	      }); 
	   var buttontype;
	   	$(".optBtn").on('click',function(){
	   		buttontype=$(this).attr('id');
	   		console.log($(this).attr('id'));
	   	});
	      $('#myModal').on('shown.bs.modal', function() {
	    	  if(buttontype=="buttonmod"){
	    		 	
	    			 $('#id').val($table.bootstrapTable('getSelections')[0].id);
	    			// $('mesgtype').val($table.bootstrapTable('getSelections')[0].type);
	    			 $('#content').val($table.bootstrapTable('getSelections')[0].content);
	    			 //alert($('mesgtype').val());
	    			 $('#title').val($table.bootstrapTable('getSelections')[0].title);
	    			 $("#mesgtype option").eq($table.bootstrapTable('getSelections')[0].type -1 ).attr('selected','selected');
	    	  }
			  if(buttontype=="buttonadd"){
				 	 $('#phone').val("");
	    			 $('#content').val("");
	    			 $('#title').val("");
	    	  }
				
	      });
	      
	      $('.dropdown-menu').on('click','a', function () {
	    	  	try {meagtype=eval($(this).attr("value"));}
				catch(e) {
					meagtype=eval('('+$(this).attr("value")+')');
				}
		        console.log(meagtype);
		        $(this).parents('.dropdown-menu').prev('.btn').html($(this).text()+' <span class="caret"></span>');
		        $(this).parents('.dropdown-menu').dropdown('toggle');
		        $('#table').bootstrapTable('refresh');
		        return false;
		      }); 
	      
	      
	     
	      
	     
	      
	      
	      

  });
  </script>

</body>

</html>
