<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
<script >
	var ctx = '${ctx}';
</script>
<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>我的关注-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/attention.css">
</head>

<body>
  <div class="main-box no-top-bar">
    <div class="attention-list">
      <ul></ul>
      <div class="load-more" data-label="project">点击查看更多</div>
    </div>
  </div>
  <div class="tab-bar">
    <div class="tab-item"><a href="${ctx}/mobile/login/toHome"><i class="tab-icon home-icon"></i><span>首页</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toProjectList"><i class="tab-icon project-icon"></i><span>项目</span></a></div>
    <div class="tab-item "><a href="${ctx}/mobile/login/toHeadline"><i class="tab-icon rss-icon"></i><span>资讯</span></a></div>
    <div class="tab-item active"><a href="${ctx}/mobileuserino/toUserIndex"><i class="tab-icon user-icon"></i><span>我的</span></a></div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
  
  	var pageSize=10;
  	var pageNumber=1
    $(function(){
      var $attentionList = $('.attention-list ul');
      var $loadMoreBtn = $('.load-more'); 
      //loadmore 自动显示
      function autoShow(){
    	  if($('.attention-list  ul li').length > 10){
    		  $loadMoreBtn.removeClass('hide');
    	  }else{
    		  $loadMoreBtn.addClass('hide');
    	  }
      }
      
      function delnull(value){
    	  if(value==null){
    		  return "";
    	  }else{
    		  return value;
    	  }
      }
      console.log({pageSize:pageSize,pageNumber:pageNumber});
      $.ajax({
          type: 'post',
          url: ctx+"/fansfollows/getfowllowslistpage",
          data: {pageSize:pageSize,pageNumber:pageNumber},
          aysnc:true,
          dataType: "json",
          success: function(data){
        	  if(data.followslist.length>0){
        		  renderList(data.followslist);
        		  $('.no-msg').remove();
        	  }else{
        		  $('body').append('<h3 class="no-msg" style="text-align: center;padding:2em 0;">您还有任何关注！</h3>');
        		  autoShow();
        	  }
          }
      });
      
      
      function renderList(data){
        $attentionList.append(data.map(function(item,index){
          return('<li><a href="'+ctx+'/mobileuserino/toMobileOtherUserInfo?userid='+item.id+'"><div class="user-avatar"><img src="'+item.head_pic_path+'" alt=""></div>\
                <div class="user-desc"><p>'+delnull(item.nickname)+'</p><p>'+item.location+'</p></div>\
                <div class="user-charm"><i class="iocn"></i>影响力 '+item.influence+'</div></a></li>'
            )
        }).join(''));
        autoShow();
      }
      //载入更多
      $loadMoreBtn.on('tap',function(){
    	  pageNumber++;
    	  $.ajax({
              type: 'post',
              url: ctx+"/fansfollows/getfowllowslistpage",
              data: {pageSize:pageSize,pageNumber:pageNumber},
              aysnc:true,
              dataType: "json",
              success: function(data){
            	  if(data.followslist.length>0){
            		  renderList(data.followslist);
            	  }else{
            		  pageNumber--;
            		  JKApp.dialog({message:'没有更多数据'});
            	  }
              }
          });
    	  
        return false;
      });
      
    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
