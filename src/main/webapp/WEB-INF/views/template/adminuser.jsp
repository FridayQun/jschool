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
          <li><a href="#">管理人员</a></li>
        </ol> 
       </div>  
      <div class="manage-inner">
      	 <div id="toolbar" class="filter-bar clearfix">
	      		<div class="col" style="padding:0 0 0 0.5em;">
		           <button   id="buttonadd" 
				          	class="btn btn-default optBtn"  
				          	data-toggle="modal" 
				          	data-target="#myModal">添加
				   </button>
		  	    </div>	
		  	    <div class="col" style="padding:0 0 0 0.5em;">
		           <button  id="buttonmod" 
				          	class="btn btn-default optBtn"  
				          	data-toggle="modal" 
				          	data-target="#myModal">修改
				   </button>
		  	    </div>
		  	      <div class="col" style="padding:0 0 0 0.5em;">
		           <button  id="buttondel" 
				          	class="btn btn-default optBtn"  
				          	>删除
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
        <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
      </div>
      <div class="modal-body">
      		<input hidden="true" type="number" id="id" class="form-control" />
            <div class="form-group">
            	<label>真实名字（必填)</label>
      	  		<input type="text" id="realname" class="form-control" placeholder="请输入真实名字"/>
            </div>
      			<div class="form-group">
      				<label>登陆账号（必填)</label>
      				<input type="text" id="loginname" class="form-control" placeholder="请输入账号"/>
      			</div>
      	    <div class="form-group">
      	    	<label>登陆密码（必填)</label>
      	  		<input type="text" id="password" class="form-control" placeholder="请输入密码"/>
      	    </div>
      	    <div class="form-group">
      	    	<label>手机</label>
      	    	<input type="number" id="phone" class="form-control" placeholder="请输入手机号"/>
      	  	</div>
      	  	<div class="form-group">
      	  		<label>昵称</label>
      	  		<input type="text" id="nickname" class="form-control" placeholder="请输入昵称"/>
      	  	</div>
      	  	<div class="form-group">
      	  		<label>资源权限</label>
      	  		<select name="role" id="role" style="height: 34px; padding: 0 1em;">
	      	  		<option value="0">所有</option>
								<option value="1">用户中心/管理员中心</option>
								<option value="2">项目管理/项目类型</option>
								<option value="3">资讯管理</option>
								<option value="4">标签管理/积分商城/积分记录/广告管理/公告维护</option>      	  	
	      	  	</select>
	      	  	</div>
			  			<div class="dropdown">
			  				<div class="col">
			  					<button type="button" 
						      	class="btn btn-default dropdown-toggle" 
						      	data-toggle="dropdown" 
						      	aria-haspopup="true" 
						      	aria-expanded="false">人员类型 <span class="caret"></span>
						      	</button>
								<ul class="dropdown-menu state" id="typelist">
									<li ><a value="0" href="#">离职</a></li>
									<li data-selected="1"><a value="1" href="#">在职</a></li>	
								</ul>
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
  
  function delstate(value, row, index){
	  if(value==0){
		  return "离职";
		  
	  }if(value==1){
		  return "在职";
		  
	  }
  }
  
  function delrole(value, row, index){
	  if(value==0){
		  return "全部"
	  }
	  if(value==1){
		  return "用户中心";
	  }
	  if(value==2){
		  return "项目管理/项目类型"
		  
	  }
	  if(value==3){
		  return "资讯管理";
	  }
	  if(value==3){
		  return "公告维护/广告管理/积分记录 /积分商城";
	  }
  }
 
  $(function() {
	
	  
	 
	  var $table = $('#table');
      $button = $('#button');
      $buttonmod=$('#buttonmod');
      $buttondel = $('#buttondel');
      $savebutton = $('#savebutton');
      var state=1;
      
      $buttonmod.click(function(){
    	  if($table.bootstrapTable('getSelections').length==0){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
    		  return false;
    	  }
      });
      $buttondel.click(function(){
    	  if($table.bootstrapTable('getSelections').length==0){
    		  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '你好，请选择一条', ConfirmFun: function(){} });
    		  return false;
    	  }
    	  
    	  if(window.confirm('您确定要删除吗？')){
    		  $.ajax({
                  type: "POST",
                  url: ctx+"/tempadminuser/deladminuser",
                  data: {
                 
                 	 id:$table.bootstrapTable('getSelections')[0].id
                  },
                  aysnc:true,
                  dataType: "json",
                  success: function(data){
                 	 if(data==1){
                 		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '删除成功', ConfirmFun: function(){} });
                 		 $('#table').bootstrapTable('refresh');
                 	 }
                  }
              });
    	  }
    	  
    	  
    		 
    	  
      });
      $savebutton.click(function () {
		 var phone=$('#phone').val();
		 var realname=$('#realname').val();
		 var password=$('#password').val();
		 var loginname=$('#loginname').val();
		 var nickname=$('#nickname').val();
		 var role=$('#role').val();
		 var id=$('#id').val();
		 if(loginname==""||password==""){
      		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '请输入必填信息', ConfirmFun: function(){} });
			return false;
		 }
		 $.ajax({
             type: "POST",
             url: ctx+"/tempadminuser/isrepeatloginname",
             data: {
            	 loginname:loginname*1,
            	 id:id,
             },
             aysnc:true,
             dataType: "json",
             success: function(data){
            	 if(data==0){
            		 $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '登陆名重复', ConfirmFun: function(){} });
            		 $('#loginname').val("");
            		 return false;
            	 }else{
            		 $.ajax({
                         type: "POST",
                         url: ctx+"/tempadminuser/addAdminUser",
                         data: {
                        	 role:role,
                        	 phone:phone,
                        	 realname:realname,
                        	 password:password,
                        	 loginname:loginname,
                        	 nickname:nickname,
                        	 state:state,
                        	 id:id
                         },
                         aysnc:true,
                         dataType: "json",
                         success: function(data){
                        	 $('#table').bootstrapTable('refresh');
        	  	             $(".modal-header .close span").trigger('click');
                        	 
                         }
                     });
            	 }
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
		  },{
		   field: 'realname',
		   title: '真实名字',
		   },{
		  field: 'nickname',
		  title: '昵称',
		  },{
		  field: 'loginname',
		  title: '登陆账号',
		  },{
		   field: 'password',
		   title: '登陆密码',
		   },{
		  field: 'creattime',
		  title: '创建时间',
		  formatter:"fotmatter"
		  },{
		  field: 'phone',
		  title: '手机',
		  },{
		  field: 'role',
		  title: '可用资源',
		  formatter:'delrole'
		  },{
		  field: 'state',
		  title: '状态',
		  formatter:"delstate",
		  }
		  
		  ];
	     
	  
	  $("#table").bootstrapTable({  
		  columns:grid_columns,
          method: "post",  //使用get请求到服务器获取数据  
          url: "<c:url value='/tempadminuser/getAdminUserList'/>", //获取数据的Servlet地址  
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
	  
	  
	   //下拉框切换
	   $('.dropdown-menu a').on('click', function () {
		    state=$(this).attr("value");
		    $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: state, ConfirmFun: function(){} });
	        console.log($(this).attr("value"));
	        $(this).parents('.dropdown-menu').prev('.btn').html($(this).text()+' <span class="caret"></span>');
	        $(this).parents('.dropdown-menu').dropdown('toggle');
	        return false;
	      }); 
	   var buttontype;
	   	$(".optBtn").on('click',function(){
	   		buttontype=$(this).attr('id');
	   		console.log($(this).attr('id'));
	   	});
	      $('#myModal').on('shown.bs.modal', function() {
	    	  if(buttontype=="buttonmod"){
	    		 	 $('#phone').val($table.bootstrapTable('getSelections')[0].phone);
	    			 $('#realname').val($table.bootstrapTable('getSelections')[0].realname);
	    			 $('#password').val($table.bootstrapTable('getSelections')[0].password);
	    			 $('#loginname').val($table.bootstrapTable('getSelections')[0].loginname);
	    			 $('#nickname').val($table.bootstrapTable('getSelections')[0].nickname);
	    			 $('#id').val($table.bootstrapTable('getSelections')[0].id);
	    	  }
			  if(buttontype=="buttonadd"){
				  $('#phone').val("");
	    			 $('#realname').val("");
	    			 $('#password').val("");
	    			 $('#loginname').val("");
	    			 $('#nickname').val("");
	    			 $('#id').val("");
	    	  }
				
	      });
	      
	      $(".dropdown-menu.state").each(function(index,item){
	    	  var selectedText = $(this).find("li[data-selected] a").text();
	    	  $(this).prev('.btn').text(selectedText);
	    	  state = $(this).find("li[data-selected] a").attr('value');
	      })
	     
	      
	     
	      
	      
	      

  });
  </script>

</body>

</html>
