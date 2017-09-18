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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/template/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/template/css/login.css">
  <script>var ctx = '${ctx}';</script>
</head>
<body class="login-bg">
  <div class="login-box">
  	<input type="hidden" id="error" value="${error }">
    <div class="logo"><img src="${ctx}/resources/template/images/login-logo.png" alt=""></div>
    <div class="login-form-box">
      <form class="loginForm" action="${ctx}/template/login/login" method="post">
        <div class="form-group">
          <label><input type="text" class="user" name="loginname" id="userName" value="" placeholder="用户名"></label>
        </div>
        <div class="form-group">
          <label><input type="password"  class="passwd" name="password" id="userPwd" value="" placeholder="密码"></label>
        </div>
        <div class="form-note">
          <label><input type="checkbox" name="remember" value=""><span>记住用户名</span></label>
        </div>
        <div class="form-submit"><input type="submit" name="submit"  id="loginsubmit" value="登 录"></div>
      </form>
    </div>
  </div>
  <script src="${ctx}/resources/template/js/jquery.min.js"></script>
  <script>
    $(function () {
        function showError(){
           var $error = $('.error');
           function autoRemove(){
             setTimeout(function(){
               $error.fadeOut();
             },2000);
           }
          if($error.length < 1){
            $error = $('<div class="error fadeOut"><i class="icon"></i><span>用户名或密码错误</span></div>');
            $('.form-group').eq(0).append($error);
            autoRemove();
          }else{
            $error.fadeIn(autoRemove);
          }
        }
        if($("#error").val()!=''&&$("#error").val()=='1'){
        	showError();
        }
        	
//         //提交（阻止掉，用ajax提交）
//         $('.loginForm').on('submit',function(){
//       	  return false;
//         });
//         $('#loginsubmit').on('click',function(){
//           var formData = $(this).serializeArray();
//           var userName = $("#userName").val();
//           var pwd      = $("#userPwd").val();
//           if(!userName || !pwd){
//             showError();
//             return false;
//           }
//           $.ajax({
//               type: "POST",
//               url: ctx+"/template/login/login",
//               data: {"loginname":userName,"password":pwd},
//               dataType: "json",
//               sync:true,
//               success: function(data){
//               	if(data.error=='0'){
//               		window.location.href=ctx+"/template/login/toGrid?gridName=adminuser";
//               	}else{
//               		showError();
// 		            return false;
//               	}
//               }
//           }); 
//         });
      });
  </script>
</body>
</html>
