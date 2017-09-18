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
  <title>我的-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/login.css">
  <script>
    var ctx = '${ctx}';
  </script>    
</head>

<body class="login-bg">
  <a href="${ctx }/mobile/login/toRegister" class="register-link">注册</a>
  <div class="login-box">
    <div class="logo"><img src="${ctx}/resources/mobile/images/logo.png" alt=""></div>
    <div class="form-box">
      <form class="loginForm"  id="loginForm" action="${ctx}/mobile/login/login" method="post">
        <div class="form-group">
          <label><input type="text" class="user-input" name="phone" id="phone_login" value="" placeholder="账号"></label>
        </div>
        <div class="form-group">
          <label><input type="password" class="lock-input" name="password" id="password_login" value="" placeholder="密码"></label>
        </div>
        <div class="form-note"><a href="${ctx }/mobile/login/toForgetPw">忘记密码？</a></div>
        <div class="form-submit"><input type="submit" id="loginsubmit" name="submit" value="登 录"></div>
      </form>
    </div>
  </div>
  <div class="login-footer">
    <div class="other-login-title"><span>第三方账号登录</span></div>
    <div class="other-login-link">
<%--       <a href="#"><img src="${ctx}/resources/mobile/images/weibo-icon.png" alt=""></a> --%>
<%--       <a href="#"><img src="${ctx}/resources/mobile/images/qq-icon.png" alt=""></a> --%>
      <a onclick="thirdLogin();"><img src="${ctx}/resources/mobile/images/wechat-icon.png" alt=""></a>
    </div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
	(function() {
		var orders = location.search.substr(1).split('&');
		for(var i=0; i<orders.length; i++) {
			orders[i] = orders[i].split('=');
			if(orders[i][0] == 'error') {
alert("用户名或密码错误");
			}
		}
	})();

    $(function() {
      $('.loginForm').on('submit',function(){
        var formData = $(this).serializeArray();
        var userName = formData[0].value;
        var pwd      = formData[1].value;
        if(!userName){
          JKApp.dialog({message : '请输入账号'});
          return false;
        }else if(!pwd){
          JKApp.dialog({message : '请输入密码'});
          return false;
        }
      });
    })
    function thirdLogin(){
    	var appid= 'wxe04b5cbb1afdca93';
    	var secret = 'e2f80332024f1d91b1a3c41bca3db344';
    	window.location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid='+appid+'&redirect_uri='+ctx+'/mobile/login/WXlogin&response_type=code&scope=snsapi_userinfo&state=0#wechat_redirect';
    }
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
