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
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
          <li><a href="#">资讯头条</a></li>
        </ol>
      </div>
      <div class="manage-inner">
      <div id="toolbar" class="filter-bar clearfix">
        <div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">标题：</label>
				<div class="col">
			      <input type="text" style="max-width:inherit" id="title" name="title" class="form-control" placeholder="按标题查询"/>
			    </div>
			</div>
		</div>
		<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">手机号：</label>
				<div class="col">
			      <input type="text" style="max-width:inherit" id="phone" name="phone" class="form-control" placeholder="按手机号查询"/>
			    </div>
			</div>
		</div>
		<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">类型：</label>
				<div class="col">
<!-- 			      <input type="text" id="phonetext" class="form-control" placeholder="按类型查询"/> -->
			      <select name="type"  id="type" class="form-control">
			        <option value="">全部</option>
			      	<option value="0">资讯</option>
			      	<option value="1">攻略</option>
			      </select>
			    </div>
			</div>
		</div>
		<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">状态：</label>
				<div class="col">
<!-- 			      <input type="text" id="phonetext" class="form-control" placeholder="按状态查询"/> -->
			      <select name="status" id="status" class="form-control">
			        <option value="">全部</option>
			      	<option value="0" selected = "selected">待审核</option>
			      	<option value="1"> 审核成功</option>
			      	<option value="2"> 审核失败</option>
			      </select>
			    </div>
			</div>
		</div>
		<div class="col" style="padding:0 0 0 1em;"><button id="buttonsear" class="btn yellow-btn" type="button">搜索</button></div>
      </div>
      <table id="table" data-toolbar="#toolbar" data-search="true" data-striped="true" data-show-refresh="true" data-show-pagination-switch = "true" data-pagination="true">
      
      </table>
      </div>
      </div>
    </div>
  </div>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:850px;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">编辑标签</h4>
      </div>
      <div class="user-details">
        <div class="user-base-info">
        <form class="form-horizontal"  id="form" action="${ctx}/template/tag/saveOrUpdate" method="post"  style="width:800px">
          <p>
          	<input type="hidden" name="id"  id="id" value="">
          	<input type="hidden" name="uid"  id="uid" value="">
          	<input type="hidden" name="username"  id="username" value="">
          </p>
		  
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">标题</label>
		    <div class="col-sm-10">
		      <input type="text"  name="title1" class="form-control"  id="title1" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">公司名</label>
		    <div class="col-sm-10">
		      <input type="number"  name="companyName" class="form-control"  id="companyName" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">学校名</label>
		    <div class="col-sm-10">
		      <input type="number"  name="eduName" class="form-control"  id="eduName" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">类型</label>
		    <div class="col-sm-10">
		      <select id="type1">
		      	<option value="0">咨询</option>
		      	<option value="1">攻略</option>
		      </select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">内容</label>
		    <div class="col-sm-10">
		      <textarea type="text" style="height:200px;" name="content" class="form-control"  id="content" placeholder=""></textarea>
		      <script type="text/javascript">var ckObj = CKEDITOR.replace('content')</script>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">创建时间</label>
		    <div class="col-sm-10">
		      <input type="text"  name="createTime" class="form-control"  id="createTime" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">来源</label>
		    <div class="col-sm-10">
		      <input type="text"  name="source" class="form-control"  id="source" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="tagName" class="col-sm-2 control-label">浏览数</label>
		    <div class="col-sm-10">
		      <input type="text"  name="browsevolume" class="form-control"  id="browsevolume" placeholder="">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
	        </div>
		  </div>
		</form>
      </div>
    </div>
    </div>
  </div>
  </div>
  <!-- 认证失败发消息的Modal -->
	<div class="modal fade" id="smModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="smModalLabel">回复未通过的理由：</h4>
	      </div>
	      <div class="modal-body">
	        <div><textarea style="height: 10em;" class="form-control" placeholder="输入未通过认证的理由"></textarea></div>
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
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  $(function() {
	  var cateList = undefined;
	  $(document).ready(function() {
			$.ajax({
				type: "GET",
				url: ctx+"/template/news/getCateListPage",
				data: {},
				dataType: "json",
				async: false,
				success: function(res) {
					cateList = res.cateList;
					$('#type').html('<option value=""></option>');
					$('#type1').empty();
					for(var i=0; i<cateList.length; i++) {
						$('#type').append(format.call('<option value={value}>{name}</option>', {
							'value': cateList[i].id,
							'name': cateList[i].cateName
						}));
						$('#type1').append(format.call('<option value={value}>{name}</option>', {
							'value': cateList[i].id,
							'name': cateList[i].cateName
						}));
					}
				}
			});
	  });

	  //配置信息
	  var temp;
	  var storeUrl = ctx+'/template/news/getNewsList';
	  var pageSize = 10;
	  var operateEvents = {
			  'click .editor-btn': function (e, value, row, index) {
	  	          $("#title1").val(row.title);
	  	          $("#companyName").val(row.companyName);
	  	          $("#eduName").val(row.eduName);
	  	          $("#type1").val(row.type);
	  	          $("#content").val(row.content);
	  	          if(ckObj!=null) ckObj.setData(row.content);
	  	          $("#source").val(row.source);
	  	          $("#browsevolume").val(row.browsevolume);
	  	          $("#createTime").val(new Date(row.createTime).Format("yyyy-MM-dd hh:mm:ss"));
	      },      
		'click .del-btn': function (e, value, row, index) {
	    	  if(window.confirm("您确定要删除吗？")){
			   	  $.ajax({
			          type: "POST",
			          url: ctx+"/template/news/deleteById",
			          data: {"id":row.id},
			          dataType: "json",
			          success: function(obj){
			        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
			          }
			      }); 
		      }	    		  
	       },
		      'click .editor1-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定审核通过吗？")){
				   	  $.ajax({
				          type: "POST",
				          url: ctx+"/template/news/check",
				          data: {"id":row.id,"status":1},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				          }
				      }); 	    		  
		    	  }
		      },
		      'click .editor2-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定审核不通过？")){	    		  
				   	  $.ajax({
				          type: "POST",
				          url: ctx+"/template/news/check",
				          data: {"id":row.id,"status":2},
				          dataType: "json",
				          success: function(obj){
				        	  //window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				        	//未通过认证的时候，弹出发送理由的窗口
				        	  temp=row;
				        	  $("#smModal textarea").val(row.title+"不能通过审核");
				        	  $('#table').bootstrapTable('refresh');
				              $("#smModal").modal('show');
				          
				          }
				      }); 
		    	  }
		      },
		      'click .editor3-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定置顶该头条吗？")){	    		  
				   	  $.ajax({
				          type: "GET",
				          url: ctx+"/template/news/topNews",
				          data: {"id":row.id},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				          }
				      }); 
		    	  }
		      },
		      'click .editor4-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定取消置顶该头条吗？")){	    		  
				   	  $.ajax({
				          type: "GET",
				          url: ctx+"/template/news/topNews",
				          data: {"id":row.id},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				          }
				      }); 
		    	  }
		      },
		      'click .editor5-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定推荐该项目吗？")){	    		  
				   	  $.ajax({
				          type: "GET",
				          url: ctx+"/template/news/commentProject",
				          data: {"id":row.id},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				          }
				      }); 
		    	  }
		      },
		      'click .editor6-btn': function (e, value, row, index) {
		    	  if(window.confirm("您确定取消推荐该项目吗？")){	    		  
				   	  $.ajax({
				          type: "GET",
				          url: ctx+"/template/news/commentProject",
				          data: {"id":row.id},
				          dataType: "json",
				          success: function(obj){
				        	  window.location.href= ctx+'/template/login/toGrid?gridName=NewsGrid';
				          }
				      }); 
		    	  }
		      }
	  };
	  var grid_columns = [{
          checkbox:true
      },{
          field: 'title',
          title: '标题',
		  formatter: toComment
      }, {
          field: 'phone',
          title: '手机号'
      },{
          field: 'username',
          title: '用户名'
      },{
          field: 'companyName',
          title: '公司名'
      },{
          field: 'eduName',
          title: '学校名'
      },{
          field: 'type',
          title: '类型',
          formatter:type
      },{
          field: 'source',
          title: '来源'
      },{
          field: 'browsevolume',
          title: '浏览数'
      },{
          field: 'istop',
          title: '置顶',
          formatter:istop
      },{
          field: 'isrecomment',
          title: '推荐',
          formatter:isrecomment
      },{
          field: 'status',
          title: '状态',
          formatter:status
      },{
          field: 'createTime',
          title: '创建时间',
          formatter:createTime
      },{
          field: 'operate',
          title: '操作',
          width:130,
          align: 'center',
          events: operateEvents,
          formatter: operateFormatter
      }];
	  
		function toComment(value, row, index) {
			return format.call('<a target="_self" href="{link}">{text}</a>', {
				'link': ctx+'/template/login/toGrid?gridName=NewsCommentGrid&cid='+row.id,
				'text': value
			});
		}
	  function type(val){
		  for(var i=0; i<cateList.length; i++) {
			  if(cateList[i].id == val) {
				  return cateList[i].cateName;
			  }
		  }
		  return '';
	  }
	  function status(val){
		  if(val==0) return "未审核";
		  if(val==1) return "<label style='color:orange'>审核通过</label>";
		  if(val==2) return "<label style='color:red'>审核不通过</label>";
	  }
	  function istop(val){
		  if(val==0) return "未置顶";
		  if(val==1) return "<label style='color:red'>已置顶</label>";
	  }
	  function isrecomment(val){
		  if(val==0) return "未推荐";
		  if(val==1) return "<label style='color:red'>已推荐</label>";
	  }
	  function createTime(val){  
		  return new Date(val).Format("yyyy-MM-dd");
	  }
	  
	  function operateFormatter(value, row, index) {
		   var str = [];
		   if(row.status==0){
		    	str.push('<a class="btn-link editor1-btn" href="#"><i class="icon editor"></i><span>审核通过</span></a>');
		    	str.push('<a class="btn-link editor2-btn" href="#"><i class="icon editor"></i><span>审核不通过</span></a>');
		    }
		    if(row.istop==0){
		    	str.push('<a class="btn-link editor3-btn" href="#"><i class="icon editor"></i><span>置顶</span></a>');
		    }else if(row.istop==1){
		    	str.push('<a class="btn-link editor4-btn" href="#"><i class="icon editor"></i><span>取消置顶</span></a>');
		    }
		    if(row.isrecomment==0){
		    	str.push('<a class="btn-link editor5-btn" href="#"><i class="icon editor"></i><span>推荐</span></a>');
		    }else if(row.isrecomment!=0){
		    	str.push('<a class="btn-link editor6-btn" href="#"><i class="icon editor"></i><span>取消推荐</span></a>');
		    }
		    str.push('<a data-toggle="modal" data-target="#myModal" class="btn-link editor-btn" href="#"><i class="icon editor"></i><span>查看</span></a>');
		    str.push('<a class="btn-link del-btn" href="#"><i class="icon del"></i><span>删除</span></a>');
	        return str;
	  }
	  $('#buttonsear').click(function () {
		  $('#table').bootstrapTable('refresh');
	  });
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
                title:$("#title").val(),
                type:$("#type").val(),
                status:$("#status").val(),
                phone:$("#phone").val()
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

  	 //未通过认证的时候，弹出发送理由的窗口的回复按钮
	  $('#smModal .btn-primary').on('click',function(){
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
	
  });

function format(args) {
	var res = this;
	if(arguments.length == 1 && typeof(args) != 'string') {
		for(var key in args) {
			// if(args[key] == undefined) continue;
			var reg = new RegExp("({)"+key+"(})", "g");
			if(args[key]!=undefined && args[key]!=null)
				res = res.replace(reg, args[key]);
			else
				res = res.replace(reg, '');
		}
	} else {
		for(var i=0; i<arguments.length; i++) {
			// if(arguments[i] == undefined) continue;
			var reg = new RegExp("({)"+i+"(})", "g");
			if(arguments[key]!=undefined && arguments[key]!=null)
				res = res.replace(reg, arguments[i]);
			else
				res = res.replace(reg, '');
		}
	}
	return res;
}  
  </script>
</body>

</html>
