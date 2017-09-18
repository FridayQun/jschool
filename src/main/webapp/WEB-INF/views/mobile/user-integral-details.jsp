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
    var id='${jkScoreMall.id}';
  </script>      
</head>

<body>
  <div class="swiper-container" id="integralBannerSwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${jkScoreMall.headPic}" alt=""></div>
      <div class="swiper-slide"><img src="${jkScoreMall.headPic}" alt=""></div>
      <div class="swiper-slide"><img src="${jkScoreMall.headPic}" alt=""></div>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <div class="detail-title">
    <div class="title-text">
      <p>${jkScoreMall.productName}</p>
      <p class="orange-font">${jkScoreMall.needScore}积分<i class="icon cart"></i></p>
    </div>
    <!--  <div class="share-btn"><i class="icon share"></i>分享</div>-->
  </div>
  <div class="detail-body">
    <p>图文详情</p>
    <div>${jkScoreMall.productDesc}</div>
  </div>
  <div class="exchange-btn" data-type="${jkScoreMall.type }"><i class="icon cart-white"></i>立即兑换</div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/swiper.jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
	<script>
$(function() {
	if(true) {
		var commands = window.location.search.substring(1);
		commands = commands.split('&');
		for(var i=0; i<commands.length; i++) {
			var cc = commands[i].split('=');
			if(cc[0] == 'success' && cc[1] == '1') {
				JKApp.dialog({message:'兑换成功，请等待稍后联系。'});
				break;
			}
		}
	}

	var userPoint = ${jkuser.point};
	var needPoint = ${jkScoreMall.needScore};
	//banner切换
	var homeBannerSwiper = new Swiper('#integralBannerSwiper', {
		loop: true,
		pagination: '.swiper-pagination',
	});
	$('.exchange-btn').on('tap',function() {
		if(userPoint < needPoint) {
			JKApp.dialog({message:'积分不足，您的积分为: '+userPoint});
			return false;
		}
		if(window.confirm("确认兑换吗？")) {
			if($('.exchange-btn').data('type') == 1) {
				window.open(ctx+"/integral/toShippingAddress?id="+id, "_self");
				return;
			}
			$.ajax({
				type: "POST",
				url: ctx+"/mall/exchange",
				data: {
					id:id,
					type: $('.exchange-btn').data('type')
				},
				aysnc:true,
				dataType: "json",
				success: function(data) {
					if(data.error==0) {
						JKApp.dialog({message : '兑换成功！',ok:function() {
							window.location.href=ctx+"/integral/tointegralindex"
						}});
					} else {
						JKApp.dialog({message:data.error_mesg});
					}
				}
			});
		}

		return false;
	});
});
	</script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
