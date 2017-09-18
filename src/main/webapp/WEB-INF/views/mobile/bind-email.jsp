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
  <title>绑定邮箱-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>    
</head>

<body class="grey-bg">
  <div class="modify-pwd-box">
    <form class="modifyForm" action="#" method="post">
      <div class="form-group separator">
        <label for="email">请输入邮箱</label>
        <input type="email" name="email" id="email" value="" placeholder="">
      </div>
      <div class="form-group">
        <label for="captcha">请输入验证码</label>
        <input type="text" name="captcha" id="captcha" value="" placeholder="">
        <span class="getCaptcha">获取验证码</span>
      </div>
      <div class="form-submit"><input type="submit" name="submit" value="确认绑定"></div>
    </form>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      var timerFlag = true;
      function countDown(sec,callback){
        var sec = sec || 60;
        var $btn = $('.getCaptcha');
        var timer = setInterval(function () {
          if(sec > 1){
            sec--;
            $btn.text(sec+'s').addClass('disable');
          }else{
            clearInterval(timer);
            $btn.text('重新发送').removeClass('disable');
            callback && callback();
          }
        }, 1000);
      }
      //获取验证码
      $('.getCaptcha').on('tap',function(){
        if(timerFlag){
          //这里ajax获取验证码
          countDown(60,function(){
            timerFlag = true;
          });
          timerFlag = false;
        }
        return false;
      });
    });
  </script>
	<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
