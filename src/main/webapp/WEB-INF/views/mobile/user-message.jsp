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
  <title>我的消息-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  
  <script>
    var ctx = '${ctx}';
  </script> 
</head>

<body>
  <div class="user-message-list"></div>
  <div class="load-more" data-label="project">点击查看更多</div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      var pageNumber=1;
      var pageSize=10;
      var $loadMore = $('.load-more');
    	 function fotmatter(value, row, index) {
    		  if(value==null) return "";
    	      var date = new Date(value);
    	      return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
    	 }
    	//自动显示加载更多按钮
     	function autoShow(list) {
     		//列表长度超过10条，显示载入更多
     		if(list.length >= pageSize){
     			$loadMore.removeClass('hide');
     		}else{
     			$loadMore.addClass('hide');
     		}
     	}
    	 
    	var $list=$('.user-message-list');
    	function render(data,empty){
            if(data){
              var nodeList = data.map(function(item,index){
                return('<a href="${ctx}/mobileuserino/toUserChet?userid='+item.uid+'" >\
                		  <div class="message-item">\
                	      <div class="user-avatar" data-unread="'+(item.count ? item.count : '')+'"><img src="'+item.head_pic_path+'" alt=""></div>\
                	      <div class="message-desc">\
                	        <div class="user-base">\
                	          <span class="user-name">'+item.nickname+'</span>\
                	        <p>'+item.content.substring(item.content.indexOf('>')+1,item.content.indexOf('</a>'))+'</p>\
                	      	</div></div><div class="last-time">'+fotmatter(item.send_time)+'</div></div></a>'
                )
              });
              

              empty && $list.empty()
              $list.append(nodeList.join(''));
              autoShow($list);
             
            }
          }
    	$.ajax({
	         type: "POST",
	         url: ctx+"/mesg/getmesglistuser",
	         data: {
	        	 pageNumber:pageNumber,
	       		 pageSize:pageSize,
	         },
	         aysnc:true,
	         dataType: "json",
	         success: function(data){
	        	 autoShow(data.rows);
	        	 if(data.rows.length > 0){
	        		 render(data.rows);
	        		 $('.no-msg').remove();
	        	 }else{
	        		 $('body').append('<h3 class="no-msg" style="text-align: center;padding:2em 0;">您还有任何消息！</h3>');
	        		
	        	 }
	    	 }	

 	  });
    	
    	$loadMore.on('tap',function(){
    		pageNumber++;
    	 	$.ajax({
   	         type: "POST",
   	         url: ctx+"/mesg/getmesglistuser",
   	         data: {
   	        	 pageNumber:pageNumber,
   	       		 pageSize:pageSize,
   	         },
   	         aysnc:true,
   	         dataType: "json",
   	         success: function(data){
   	        	 autoShow(data.rows);
   	        	 if(data.rows.length>0){
   	        		 render(data.rows);
   	        	 	}else{
   	        	 		pageNumber--;
   	        	 	}
   	    	 }

    	  });
    	});
    	 
    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
