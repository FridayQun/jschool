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
  <title>积分中心-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/swiper.min.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/integral.css">
  
    <script>
    var ctx = '${ctx}';
  </script> 
</head>

<body>
  <div class="integral-title">
    <div class="integral-amount">我的积分：${jkuser.point}</div>
    <a href="${ctx}/integral/tointegralexchange" class="record-link">兑换记录</a>
  </div>
  <div class="swiper-container" id="integralBannerSwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${ctx}/resources/mobile/images/integral-ad-1.jpg" alt=""></div>
      <div class="swiper-slide"><img src="${ctx}/resources/mobile/images/integral-ad-2.jpg" alt=""></div>
      <div class="swiper-slide"><img src="${ctx}/resources/mobile/images/integral-ad-3.jpg" alt=""></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <ul class="integral-list">
    
  </ul>
  <div class="load-more">点击查看更多</div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/swiper.jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    var page=1;
    var pageSize=10;
    var $loadMore = $('.load-more');
    $(function() {
    	
    	function autoShow(list) {
     		//列表长度超过10条，显示载入更多
     		if(list.length >= pageSize){
     			$loadMore.removeClass('hide');
     		}else{
     			$loadMore.addClass('hide');
     		}
     	}
    	
   	 $.ajax({
         type: "POST",
         url: ctx+"/mall/getmallpage",
         data: {
       		 page:page,
       		 pageSize:pageSize
         },
         aysnc:true,
         dataType: "json",
         success: function(data){
        	 autoShow(data);
       	  	if(data.length>0){
       	  		renderList(data,1);
       	  	}
         }
     });
    	
    	
      //banner切换
      var homeBannerSwiper = new Swiper('#integralBannerSwiper', {
        loop: true,
        pagination: '.swiper-pagination',
      });
      var $integralList = $('.integral-list');
      function renderList(data,empty){
        if(data && data instanceof Array){
          var nodeList = data.map(function(item,index){
            return ('<li><a href="${ctx}/integral/toDetails?id='+item.id+'">\
                  <div class="item-photo"><img src="'+item.headPic+'" alt=""></div>\
                  <div class="item-desc"><p>'+item.productName+'</p>\
                  <p class="orange-font"><i class="icon cart"></i>'+item.introduction+'积分</p></div></a></li>'
            )
          });
          empty ? $integralList.empty().append(nodeList.join('')) : $integralList.append(nodeList.join(''));
        }
      }
      $('.load-more').on('tap',function(){
    	 	 page=page+1;
    	 	 $.ajax({
    	         type: "POST",
    	         url: ctx+"/mall/getmallpage",
    	         data: {
    	       		 page:page,
    	       		 pageSize:pageSize
    	         },
    	         aysnc:true,
    	         dataType: "json",
    	         success: function(data){
    	        	 autoShow(data);
    	       	  	if(data.length>0){
    	       	  		renderList(data,0);
    	       	  	}else{
    	       	  		page=page-1;
    	       	  		//alert("没有更过数据")
    	       	  	}
    	         },
    	         error:function(){
    	        	 page=page-1;
    	         }
    	     });
        return false;
      });
    })
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
