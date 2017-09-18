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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/project.css">
  
  <script>
    var ctx = '${ctx}';
  </script>      
</head>

<body>
  <div class="publish-form-box">
		<form class="publishForm" action="" >
			<div class="form-group">
				<div class="form-label" style="font-weight: bold;">收货信息：</div>
				<div class="form-input"></div>
			</div>
			<div class="form-group">
				<div class="form-label">你的名字</div>
				<div class="form-input">
					<input class="input-style" type="text" name="shippingName" value="" placeholder="16字以内">
				</div>
			</div>
			<div class="form-group">
				<div class="form-label">手机号</div>
				<div class="form-input">
					<input class="input-style" type="text" name="phone" value="" placeholder="您的手机号">
				</div>
			</div>
			<div class="form-group">
				<div class="form-label">邮编</div>
				<div class="form-input">
					<input class="input-style" type="text" name="code" value="" placeholder="国内邮编">
				</div>
			</div>
			<div class="form-group" style="margin-bottom: 0.5em;">
				<div class="form-label">地区：</div>
				<div class="form-input" id="district">
					<select class="myselect" name="province"></select>
					<select class="myselect" name="projLocation"></select>
				</div>
			</div>
			<div class="form-group" style="margin-top: 0.5em;">
				<div class="form-label">详细地址：</div>
				<div class="form-input">
					<textarea name="locationDetail" placeholder="200字以内"></textarea>
				</div>
			</div>
			<div class="form-submit-bar">
				<input type="submit" name="submit" value="提交">
			</div>
		</form>

	</div>
  <div class="calendar-box"></div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
$(function() {
	var id = "${jkScoreMallId}";
	if(!id) {
		JKApp.dialog({message:'信息错误！'});
	}
	//省市联动
	(function districtSelect() {
		var $province = $('#district select[name="province"]');
		var $city = $('#district select[name="projLocation"]');
		provinceAndCity($province,$city);
	})();
	$('.publishForm').on('submit',function() {
		if(!id) {
			JKApp.dialog({message:'信息错误，请刷新页面！'});
		}

		var shippingName = $('.input-style[name=shippingName]').val();
		var phone = $('.input-style[name=phone]').val();
		var code = $('.input-style[name=code]').val();
		var province = $('.myselect[name=province]').val();
		var projLocation = $('.myselect[name=projLocation]').val();
		var locationDetail = $('.form-input textarea[name=locationDetail]').val();

		if(!shippingName) {
			JKApp.dialog({message:'请输入名字！'});
			return false;
		}
		if(!phone) {
			JKApp.dialog({message:'请输入手机！'});
			return false;
		}
		if(!code) {
			JKApp.dialog({message:'请输入邮编！'});
			return false;
		}
		if(!province) {
			JKApp.dialog({message:'请选择省市！'});
			return false;
		}
		if(!projLocation) {
			JKApp.dialog({message:'请选择省市！'});
			return false;
		}
		if(!locationDetail) {
			JKApp.dialog({message:'请输入地址！'});
			return false;
		}

		var object = {
			name: shippingName,
			phone: phone,
			code: code,
			province: province,
			city: projLocation,
			county: '',
			detail: locationDetail
		};
		$.ajax({
			type: "POST",
			url: ctx+"/mall/exchange",
			data: {
				"id": id,
				"addOn": JSON.stringify(object)
			},
			dataType: "json",
			success: function(data) {
				if(data.error==0) {
					window.open(ctx+"/integral/toDetails?id="+id+'&success=1', '_self');
				} else if(data.error==1) {
					JKApp.dialog({message:'兑换失败'});
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
