<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>积分兑换记录-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/integral.css">
  <script>
    var ctx = '${ctx}';
  </script>  
</head>

<body class="grey-bg">
 <input hidden="true" type="text" id="userid"  value="${jkuser.id}"/>
  <div class="filter-tools">
    <div class="record-filter-bar">
      <div class="filter-opts">时间排序<i class="icon down"></i></div>
      <div class="filter-opts">兑换分类<i class="arrows"></i></div>
      <div class="filter-opts">搜索<i class="icon search"></i></div>
    </div>
    <ul class="filter-select-list closed"></ul>
    <div class="search-bar">
      <form class="searchForm" action="#" method="post">
        <input type="search" name="keywords" value="" autocomplete="off" placeholder="">
        <span>取消</span>
      </form>
    </div>
  </div>
  <ul class="record-list">
    
  </ul>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
  	var page=1;
  	var pageSize=10;
  	
  	var a="";
  	
  	 function fotmatter(data) {
         var date = new Date(data);
         return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
       }
    $(function(){
    	  $.ajax({
	            type: "POST",
	            url: ctx+"/exchange/getexchangemalllist",
	            data: {
	          	  uid:$('#userid').val(),
	          	  type:1,
	          	  Page:page,
	          	  pageSize:pageSize
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	            	renderList(data);
	           		
	            }
	        });
    	
    	
    	
      var $filterList = $('.filter-select-list');
      var $searchBar  = $('.search-bar');
      var $recordList = $('.record-list');
      //筛选列表数据
      var filterDataList = [
        [
          {
            title : '升序',
            type: "time",
            mark  : '1'
          },{
            title : '降序',
            type: "time",
            mark  : '0'
          }
        ],
        [
          {
            title : '增值服务',
            type  : "type",
            mark  : '1'
          },{
            title : '实物兑换',
            type  : "type",
            mark  : '2'
          }
        ]
      ];
      //渲染筛选列表
      function renderFilterList(data){
        if(data){
          var nodes = data.map(function(item,index){
            return('<li data-mark="'+item.mark+'" data-type="'+item.type+'">'+item.title+'</li>')
          });
          $filterList.empty().append(nodes.join(''));
        }
      }
      //渲染筛选结果列表
      function renderList(data){
        if(data && data instanceof Array){
          var nodeList = data.map(function(item,index){
            return ('<li><div class="item-photo"><img src="'+item.head_pic+'" alt=""></div>\
              <div class="item-overview"><p class="data-time">'+fotmatter(item.create_time)+'</p>\
              <p>'+item.product_name+'</p></div><div class="item-amount">'+item.need_score+'</div></li>'
            )
          });
          $recordList.empty().append(nodeList.join(''));
        }
      }
      //筛选切换
      $('.record-filter-bar .filter-opts').on('tap',function(){
        $(this).addClass('active').siblings().removeClass('active');
        if($(this).index() < 2){
          renderFilterList(filterDataList[$(this).index()]);
          $filterList.removeClass('closed');
        }else{
          $searchBar.addClass('show');
          
        }
        return false;
      });
      //选择筛选条件
      $filterList.on('tap','li',function(){
        $filterList.addClass('closed');
        console.log($(this).data('mark'));
        var type=$(this).data('type');
        if(type=="type"){
        	$.ajax({
                type: "POST",
                url: ctx+"/exchange/getexchangemalllist",
                data: {
              	  uid:$('#userid').val(),
              	  type:$(this).data('mark'),
              	  Page:page,
              	  pageSize:pageSize
                },
                aysnc:true,
                dataType: "json",
                success: function(data){
                	renderList(data);
               		
                }
            });
        }
        
        if(type=="time"){
        	$.ajax({
                type: "POST",
                url: ctx+"/exchange/getexchangemalllist",
                data: {
              	  uid:$('#userid').val(),
              	  creattime:$(this).data('mark'),
              	  Page:page,
              	  pageSize:pageSize
                },
                aysnc:true,
                dataType: "json",
                success: function(data){
                	renderList(data);
               		
                }
            });
        }
        
        
        return false;
      });
      //搜索隐藏
      $searchBar.find('span').on('tap',function(){
        $searchBar.removeClass('show');
        return false;
      });
      
      //搜索按钮
     $('.search-bar .searchForm').on('submit',function(){
    	 var keywords = $(this).find('input').val();
    	 console.log(keywords);
    	   	$.ajax({
                type: "POST",
                url: ctx+"/exchange/getexchangemalllist",
                data: {
              	  uid:$('#userid').val(),
              	  keywords:keywords,
              	  Page:page,
              	  pageSize:pageSize
                },
                aysnc:true,
                dataType: "json",
                success: function(data){
                	renderList(data);
               		
                }
            });
    	 
    	 return false;
     });
    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
