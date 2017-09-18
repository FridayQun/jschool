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
          <li><a href="#">积分记录</a></li>
        </ol>
      </div>
      <div class="manage-inner">
      <div id="toolbar" class="filter-bar clearfix">
        <div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">用户：</label>
				<div class="col">
			      <input type="text" id="username" name="username" class="form-control" placeholder="按用户名查询"/>
			    </div>
			</div>
		</div>
		
		<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">商品名：</label>
				<div class="col">
			      <input type="text" id="productname" name="productname" class="form-control" placeholder="按商品名查询"/>
			    </div>
			</div>
		</div>
		 
		<div class="col form-horizontal">
			<div class="input-group">
				<label class="col control-label">类型：</label>
				<div class="col">
<!-- 			      <input type="text" id="phonetext" class="form-control" placeholder="按类型查询"/> -->
			      <select name="type"  id="type" class="form-control">
			        <option value="2">全部</option>
			      	<option value="0">获取积分记录</option>
			      	<option value="1">用户兑换记录</option>
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
 
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="width:650px; margin: 0 auto;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">详细信息</h4>
				</div>
				<div class="user-details">
					<div class="user-base-infoee">
						<form class="form-horizontal" id="form" action="" method="" style="width:600px;margin: 0 auto;">
							<p><input type="hidden" name="id"  id="id" value=""></p>

							<div class="form-group">
								<label for="tagName" class="col-sm-2 control-label" style="line-height: 34px;">名字</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control"  id="tagName" placeholder="">
								</div>
							</div>

							<div class="form-group">
								<label for="tagPhone" class="col-sm-2 control-label" style="line-height: 34px;">手机</label>
								<div class="col-sm-10">
									<input type="text" readonly class="form-control"  id="tagPhone" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="tagCode" class="col-sm-2 control-label" style="line-height: 34px;">邮编</label>
								<div class="col-sm-10">
									<input type="number" readonly class="form-control"  id="tagCode" placeholder="">
								</div>
							</div>
							<div class="form-group">
								<label for="tagProvince" class="col-sm-2 control-label" style="line-height: 34px;">用户地址</label>
								<div class="col-sm-10">
									<input readonly class="form-control" id="tagProvince" placeholder="" style="display: inline-block;width: 44%;">&nbsp;省&nbsp;
									<input readonly class="form-control" id="tagCity" style="display: inline-block;width: 45%;" placeholder="">&nbsp;市&nbsp;
									<input readonly class="form-control" id="tagCounty" placeholder="" style="display: inline-block;width: 90%;">&nbsp;区/县<textarea readonly class="form-control" id="tagDetail" placeholder="" style="resize: none;"></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
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
  function fotmatter(value, row, index) {
	  if(value==null) return "";
      var date = new Date(value);
      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
    }
	function fotmatter_add_on(value, row, index) {
		if(!value) {
			return '';
		}
		var object = eval('('+value+')');
		//<div class="col form-horizontal"><button id="buttondetail" data-toggle="modal" data-target="#myModal" class="btn yellow-btn" type="button">新增</button></div>
		return '<a href="#" class="editor-btn" data-toggle="modal" data-target="#myModal">'+object.province+'-'+object.city+'</a>'
	}

	var operateEvents = {
		'click .editor-btn': function (e, value, row, index) {
			try {
			var object = eval('('+row.add_on+')');
			$('#tagName').val(object.name);
			$('#tagPhone').val(object.phone);
			$('#tagCode').val(object.code);
			$('#tagProvince').val(object.province);
			$('#tagCity').val(object.city);
			$('#tagCounty').val(object.county);
			$('#tagDetail').val(object.detail);
			} catch(e) {}
		}
	};

  function deltype(value, row, index) {
	  if(value==0) {
		  return "产生积分";
	  }
	  if(value==1) {
		  return "兑换商品";
	  }
  }

  $(function() {
	  //配置信息

	  var grid_columns = [
	  {
          field: 'username',
          title: '用户'
      },
      {
          field: 'operate_name',
          title: '操作名'
      }, {
          field: 'product_name',
          title: '商品名'
      },{
          field: 'need_score',
          title: '所需积分'
      },{
          field: 'edu_name',
          title: '学校名'
      },{
          field: 'edu_collage',
          title: '分院'
      },{
          field: 'type',
          title: '操作类型',
          formatter:"deltype",
      },{
          field: 'create_time',
          title: '创建时间',
          formatter:"fotmatter"
      },{
          field: 'add_on',
          title: '地址',
          formatter:"fotmatter_add_on",
		  events: operateEvents
      }];
	  
	  
	 
	  $('#buttonsear').click(function () {
		  console.log($("#type option:selected").val());
		  $('#table').bootstrapTable('refresh');
	  });
	  $("#table").bootstrapTable({  
		  columns:grid_columns,
          method: "post",  //使用get请求到服务器获取数据  
          url: "<c:url value='/template/score/selectlisthavausermall'/>", //获取数据的Servlet地址  
          striped: true,  //表格显示条纹  
          pagination: true, //启动分页  
          pageSize:10,  //每页显示的记录数  
          pageNumber:1, //当前第几页  
          pageList: [5, , 15, 20, 2510],  //记录数可选列表  
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
                type:Number($("#type option:selected").val()),
                username:$("#username").val(),
                productname:$("#productname").val(),
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
