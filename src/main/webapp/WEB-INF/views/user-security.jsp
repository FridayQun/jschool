<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">

<%-- jkuser --%>

<head>
	<meta charset='utf-8'>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>JingKe</title>
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
	<script>
var url='${ctx}';
var ctx = '${ctx}';
	</script>
</head>

<body>
	<%Integer id = (Integer)session.getAttribute("login_userId");%>
	<input hidden="true" type="text" id="uid"  value="<%=id%>"/>
	<input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
	<!-- 无用 -->
	<!-- <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/>  -->

    <!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
	<div class="user-section">
		<div class="wrapper">
<jsp:include page="user-header.jsp" flush="true"/>

			<div class="user-body">
<jsp:include page="user-slider-left.jsp" flush="true"/>

				<div class="main-box">

<div class="security-box">
	<div class="security-block">
		<div class="security-title">账户安全</div>
		<div class="base-section">
			<table>
				<tr>
					<td>绑定手机：</td>
					<td>${jkuser.phone}</td>
					<td><a href="modifyMobile" class="modify-style">修改手机</a></td>
				</tr>
				<tr>
					<td>绑定邮箱：</td>
					<c:if test="${empty jkuserinfo.contractMail}">
					<td>未绑定</td>
					<td><a href="${ctx}/user/moduserinfo" class="modify-style">绑定</a></td>
					</c:if>
					<c:if test="${not empty jkuserinfo.contractMail}">
					<td>${jkuserinfo.contractMail}</td>
					<td><a href="${ctx}/user/moduserinfo" class="modify-style">修改</a></td>
					</c:if>
				</tr>
				<tr>
					<td>更改密码：</td>
					<td>*********</td>
					<td><a href="modifyPwd" class="modify-style">修改</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="security-block hide" id="modifyMobile">
		<div class="security-title">修改手机号绑定</div>
		<div class="modify-mobile">
			<p><span>当前手机号 </span><span id="modphone">${jkuser.phone}</span></p>
			<p><span>输入验证码 </span>
			<input style="display:none" type="text" name="" id="sid" value="">
			<input type="text" name="" id="yzid"   value=""><span class="getCaptcha">获取验证码</span></p>
			<p class="submit-bar"><a href="#">提交</a></p>
		</div>
		<div class="input-new-mobile hide">

			<div class="form-group">
				<label for="mobile">新手机号</label>
				<input type="tel" name="mobile" id="mobile" value="">
			</div>
			<div class="form-group">
				<label for="captcha">输入验证码</label>
				<input type="text" style="display:none" name="captcha" id="newsid" value="">
				<input type="text" name="captcha" id="captcha" value="">
				<span class="getCaptcha">获取验证码</span>
			</div>
			<div class="form-submit">
				<input type="button" name="submit" id="modphone" value="提 交">
			</div>

			<div class="successed-hint hide"><i class="icon successed-icon"></i>绑定手机号成功！</div>
		</div>
	</div>
	<div class="security-block hide" id="modifyPwd">
		<div class="security-title">修改登录密码</div>
		<div class="modify-passwd">

			<div class="form-group">
				<label for="oldPwd">旧密码</label>
				<input type="password" name="hipassword" id="hipassword" value="">
			</div>
			<div class="form-group">
				<label for="newPwd">新密码</label>
				<input type="password" name="newpassword1" id="newpassword1" value="">
			</div>
			<div class="form-group">
				<label for="confirmPwd">确认密码</label>
				<input type="password" name="newpassword2" id="newpassword2" value="">
			</div>
			<div class="form-submit">
				<input type="Button" name="submit" id="psbt" value="保 存">
			</div>

			<div class="successed-hint hide"><i class="icon successed-icon"></i>修改密码成功！</div>
		</div>
	</div>
</div>

				</div>
			</div>
		</div>
	</div>
	<!--动态包含-->
	<jsp:include page="foot.jsp" flush="true"/>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/jQuery.page.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
	function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
	var alert = window.new_alert || alert;
$(function() {
	var captchaA = {timeout : true,timer: null};
	var captchaB = {timeout:true,timer: null};
	function countDown(el,sec,cb) {
		var sec = sec || 60;
		el.addClass('grey').text('60s');
		var timer = setInterval(function() {
			sec--;
			if(sec === 0){
				el.text('60s');
				clearInterval(timer);
				cb && cb();
			} else {
				el.text(sec+'s');
			}
		}, 1000);
		return function() {
			clearInterval(timer);
			el.text('60s');
		};
	}
	//第三方绑定按钮
	$('.third-party-section a').on('click',function() {
		var $parents = $(this).parents('.tp-item');
		var $label = $parents.find('small');
		if($parents.hasClass('bind')) {
			$label.text('未绑定');
			$(this).text('绑定');
			$parents.removeClass('bind');
		} else {
			$label.text('已绑定');
			$(this).text('修改');
			$parents.addClass('bind');
        }
		return true;
	});

	//修改手机，密码按钮，绑定邮箱
	$('.security-block .base-section a').on('click',function() {
		var thisHref = $(this).attr('href');
		$(this).parents('.security-block').addClass('hide');
		$('#'+thisHref).removeClass('hide');
		return false;
	});

	//获取验证码按钮
	$('.modify-mobile .getCaptcha').on('click',function() {
		var phone=$('#modphone').text();
		if(captchaA.timeout) {
			//获取验证码
			$.ajax({
				type: "GET",
				url: ctx+"/sms/gethash",
				data: {"phone":phone},
				dataType: "json",
				success: function(data){
					$.ajax({
						type: "POST",
						url: ctx+"/sms/getsms",
						data: {"phone":phone,"vcode":data.vcode,"type":0},
						aysnc:true,
						dataType: "json",
						success: function(obj){
							$("#sid").val(obj.sid);
						}
					});
				}
			});
			captchaA.timeout = false;
			captchaA.timer = countDown($(this), 60, function(){
				captchaA.timeout = true;
			});
		}
	});
	//提交表单
	$('.modify-mobile .submit-bar a').on('click',function(){
		//获取填写的验证码
		var inputText = $(this).parents('.modify-mobile').find('input').val();
		var yzid=$('#yzid').val();
		var sid=$('#sid').val();
		var phone=$('#modphone').text();
		captchaA.timer && captchaA.timer();
		console.log(inputText);
		if(phone!=''&&yzid!=''&&sid!='') {
			$.ajax({
				type: "POST",
				url: ctx+"/user/checkYzid",
				data: {"phone":phone,"yzCode":yzid,"sid":sid},
				aysnc:true,
				dataType: "json",
				success: function(obj) {
					if(obj==1) {
						$('.modify-mobile').addClass('hide');
						$('.input-new-mobile').removeClass('hide');
					} else {
						alert("验证码有误");
					}
				}
			});
		} else if(sid=="") {
			alert("请获取验证码");
		} else if(yzid=="") {
			alert("输入验证码");
		}

		//验证通过
		return false;
	});
	//更新手机号码时，获取验证码
	$('.input-new-mobile .getCaptcha').on('click',function() {
		if(captchaB.timeout) {
			var phone=$('#mobile').val();
			$.ajax({
				type: "GET",
				url: ctx+"/sms/gethash",
				data: {"phone":phone},
				dataType: "json",
				success: function(data) {
					$.ajax({
						type: "POST",
						url: ctx+"/sms/getsms",
						data: {"phone":phone,"vcode":data.vcode,"type":0},
						aysnc:true,
						dataType: "json",
						success: function(obj){
							$("#newsid").val(obj.sid);
						}
					});
                }
            });
			captchaB.timeout = false;
			captchaB.timer = countDown($(this), 60, function(){
				captchaB.timeout = true;
			});
		}
	});
	//更新手机号码,提交
	$('body').on("click","#modphone",function() {
		var phone = $('#mobile').val();
		var captcha = $('#captcha').val();
		var sid=$('#newsid').val();
		captchaB.timer && captchaB.timer();
		console.log(mobile,captcha);
		//提交成功
		if(phone!=''&&captcha!=''&&sid!='') {
			$.ajax({
				type: "POST",
				url: ctx+"/user/moduserphone",
				data: {
					"phone":phone,
					"yzCode":captcha,
					"sid":sid
				},
				dataType: "json",
				success: function(data) {
					if(data==1) {
						$('.input-new-mobile .successed-hint').removeClass('hide');
						window.location.href=ctx+"/login/toLogin";
					}
				}
			});
		} else {
			alert("请输入完整信息");
		}
		return false;
	});

	//修改密码提交按钮
	$('#psbt').click(function(){
		var hipassword = $('#hipassword').val();
		var newpassword1 = $('#newpassword1').val();
		var newpassword2 = $('#newpassword2').val();
		if(newpassword1!=newpassword2){
			alert("新密码不一致");
			return false;
		}
		$.ajax({
			type: "POST",
			url: "${ctx}/user/modUserPassWord",
			data: {
				hipassword:hipassword,
				newpassword1:newpassword1,
				newpassword2:newpassword2
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				if(data==1){
					alert("保存成功");
					window.location.href=ctx+"/login/toLogin";
				}
				if(data==0){
					alert("原密码错误");
				}
			}
		});
        return false;
	});
});
	</script>
</body>

</html>
