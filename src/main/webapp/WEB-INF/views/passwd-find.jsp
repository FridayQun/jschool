<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>JingKe</title>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
  
  <script>
  var ctx = '${ctx}';
  </script>
</head>

<body class="login-bg">
  <div class="login-box">
    <div class="login-logo"><img src="${ctx}/resources/artcle/images/logo-white.png" alt=""></div>
    <div class="login-block">
      <div class="passwd-find-title">忘记密码</div>
      <div class="passwd-find-form">
        <div class="tab-content register">
          <form class="registerForm" action="${ctx}/login/resetpwd" method="post">
            <input type="hidden"  id="sid" name="sid" value="">
            <div class="form-group"><label for="user"><i class="icon form-user"></i></label><input type="text" name="phone" id="phone" value="" placeholder="手机号或邮箱"></div>
            <div class="form-group"><label for="captcha"><i class="icon form-captcha"></i></label><input type="text" name="yzcode" id="yzcode"><button type="button" name="getCaptcha">获取验证码</button></div>
            <div class="form-group"><label for="password"><i class="icon form-pd"></i></label><input type="password" name="password" id="password1" value="" placeholder="密码"></div>
            <div class="form-group"><label for="confirmPassword"><i class="icon form-pd2"></i></label><input type="password" name="confirmPassword" id="confirmPassword1" value="" placeholder="确认密码"></div>
            <div class="form-submit"><input type="submit" name="submit" value="确 定"></div>
          </form>
        </div>
      </div>
      <div class="reset-succeed hide">
        <div class="inner-box">
          <p><i class="icon correct-icon"></i></p>
          <h3>重置密码成功</h3>
          <p><small><span class="second">5</span>秒后自动跳转</small></p>
          <div class="close-btn">确 定</div>
        </div>
      </div>
    </div>
    <div class="login-footer">鲸客网，一站式校园活动解决专家</div>
  </div>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script>
    $(function() {
      //页面调整
      var toLogin = function(){
        window.location.href = ctx+"/login/toLogin";
      }
      //重置成功
      function resetSucceed(cb) {
        var $second = $('.second');
        var secs = 5;
        $('.reset-succeed').removeClass('hide');
        var timer = setInterval(function(){
          secs--;
          if(secs === 0 ){
            clearInterval(timer);
            cb && cb();
          }else{
            $second.text(secs);
          }
        },1000);
      }
      function countDown(sec,cb){
          var sec = sec || 60;
          $getCaptcha.addClass('grey').text('60s');
          var timer = setInterval(function(){
            sec--;
            if(sec === 0){
              $getCaptcha.text('60s');
              clearInterval(timer);
              cb && cb();
            }else{
              $getCaptcha.text(sec+'s');
            }
          },1000);
        }
      var $getCaptcha = $('.registerForm button[name="getCaptcha"]');
      var timeout = true;
      //获取验证码
      $('.registerForm button[name="getCaptcha"]').on('click',function(){
        if(timeout){
          timeout = false;
    	 
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
            timeout = true;
          });
        }
      });
      
	//忘记密码
	$(".form-submit input[name='submit']").on('click',function(){
		  var phone=$("#phone").val();
		  var yzcode=$("#yzcode").val();
		  var password=$("#password1").val();
		  var confirmPassword1 = $("#confirmPassword1").val();
		  var sid=$("#sid").val();
		  
	   	  $.ajax({
	          type: "POST",
	          url: ctx+"/login/resetpwd",
	          data: {"phone":phone,"yzcode":yzcode,"password":password,"sid":sid,"confirmPassword1":confirmPassword1},
	          aysnc:true,
	          dataType: "json",
	          success: function(obj){
	        	  resetSucceed(function(){
	        		  window.location.href=ctx+"/login/toLogin";
	        	  });
	          }
	      }); 
		  
	})
      
      $('.registerForm').on('submit',function(){
//         var formData = $(this).serializeArray();
//         console.log(formData);
//         resetSucceed(toLogin);
        return false;
      });
      $('.close-btn').on('click',toLogin);
    });
  </script>
</body>

</html>
