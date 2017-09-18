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
      <form class="findpwdForm" action="#" method="post">
        <input type="hidden"  id="sid" name="sid" value="">
        <div class="form-group">
          <label><input class="user-input" type="text" name="phone" id="phone" value="" placeholder="手机号或邮箱"></label>
        </div>
        <div class="form-group captcha-group">
          <label><input class="refresh-input" type="text" name="yzcode" id="yzcode" value="" placeholder=""></label>
          <button id="getCaptcha" type="button" name="getCaptcha" >获取验证码</button>
        </div>
        <div class="form-group">
          <label><input class="lock-input" name="password" id="password1" value="" placeholder="密码"></label>
        </div>
        <div class="form-group">
          <label><input class="lock1-input" type="password" name="confirmPassword" id="confirmPassword1" value="" placeholder="确认密码"></label>
        </div>
        <div class="form-submit"><input type="submit" name="submit" value="确认修改"></div>
      </form>
    </div>
  </div>
  <div class="register-footer findpwd">鲸客网，一站式校园活动解决专家</div>
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
      //获取验证码
      $('#getCaptcha').on('tap',function(){
        if(timerFlag){
          //这里ajax获取验证码
          var phone = $('#phone').val();
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

          countDown(60,function(){
            timerFlag = true;
          });
          timerFlag = false;
        }
        return false;
      });
      
        $('.findpwdForm').on('submit',function(){
           return false;
        });
	  	//忘记密码
	  	$(".form-submit input[name='submit']").on('click',function(){
	  		  var phone=$("#phone").val();
	  		  var yzcode=$("#yzcode").val();
	  		  var password=$("#password1").val();
	  		  var confirmPassword1 = $("#confirmPassword1").val();
	  		  var sid=$("#sid").val();
	          if(!phone){
	              JKApp.dialog({message : '请输入手机号或邮箱！'});
	              return false;
	            }else if(!yzcode){
	              JKApp.dialog({message : '请输入验证码！'});
	              return false;
	            }else if(!password){
	              JKApp.dialog({message : '请输入密码！'});
	              return false;
	            }else if(password != confirmPassword1){
	              JKApp.dialog({message : '两次输入的密码不一致，请重新输入！'});
	              return false;
	            }
	  	   	  $.ajax({
	  	          type: "POST",
	  	          url: ctx+"/mobile/login/resetpwd",
	  	          data: {"phone":phone,"yzcode":yzcode,"password":password,"sid":sid,"confirmPassword1":confirmPassword1},
	  	          aysnc:true,
	  	          dataType: "json",
	  	          success: function(obj){
	  	        	  alert("忘记密码成功！");
	  	        	  window.location.href=ctx+"/mobile/login/toLogin";
	  	          }
	  	      });  		  
	  	})
    })

  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
