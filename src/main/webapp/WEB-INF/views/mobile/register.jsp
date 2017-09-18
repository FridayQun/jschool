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
  <div class="register-box">
    <div class="logo"><img src="${ctx}/resources/mobile/images/logo.png" alt=""></div>
    <div class="form-box">
      <form class="registerForm" action="#" method="post">
        <input type="text" class="hide"  name="sid" id="sid" value="${sid}">
        <input type="text" class="hide"  name="yzcode" id="yzcode" value="${yzcode}">
        <div class="form-group">
          <label><input class="user-input" type="text" name="phone" id="phone" value="${phone }" ></label>
        </div>
        <div class="form-group">
          <label><input class="lock-input" type="password" name="password" id="userPd1" value="" placeholder="密码"></label>
        </div>
        <div class="form-group">
          <label><input class="lock1-input" type="password" name="confirmPassword1" id="confirmPassword1" value="" placeholder="确认密码"></label>
        </div>
        <div class="form-submit"><input type="submit" id="registersubmit" name="submit" value="同意协议并注册"></div>
        <div class="form-note"><a href="#">《鲸客网服务协议》</a></div>
      </form>
    </div>
  </div>
  <div class="register-footer">鲸客网，一站式校园活动解决专家</div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      var timerFlag = true;
      function countDown(sec,callback){
        var sec = sec || 60;
        var $btn = $('#getCaptcha');
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
      
	  $('.registerForm').on('submit',function(){
			return false;
	      });
		  //注册ajax提交
		  $('#registersubmit').on('click',function(){	  
			  var phone=$("#phone").val();
			  var yzcode=$("#yzcode").val();
			  var password=$("#userPd1").val();
			  var confirmPassword1 = $("#confirmPassword1").val();
			  var sid=$("#sid").val();
			  if(password!=confirmPassword1){
				  alert("两次密码不相同！");
				  return;
			  }
		   	  $.ajax({
		          type: "POST",
		          url: ctx+"/mobile/login/register",
		          data: {"phone":phone,"yzcode":yzcode,"password":password,"sid":sid},
		          aysnc:true,
		          dataType: "json",
		          success: function(data){
		        	    if(data.error=='0'){
			        	    alert("注册成功！");		        	    	
		        	    }else{
		        	    	alert(data.error_mesg);
		        	    }
		        	    window.location.href=ctx+'/mobile/login/toHome';
		          }
		      }); 
		  });
    })


    </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
