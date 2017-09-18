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
  <title>绑定手机号码-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>      
</head>

<body class="grey-bg">
  <div class="modify-pwd-box">
      <div class="form-group separator">
        <label for="mobile">请输入新手机</label>
        <input type="tel" name="mobile" id="mobile" value="" placeholder="">
      </div>
      <div class="form-group">
        <label for="captcha">请输入验证码</label>
        <input type="text" hidden="true" name="sid" id="sid" value="" placeholder="">
        <input type="text" name="captcha" id="captcha" value="" placeholder="">
        <span class="getCaptcha">获取验证码</span>
      </div>
      <div class="form-submit"><input type="button" name="submit" value="确认绑定"></div>
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
    	  var phone=$('#mobile').val();
        if(timerFlag){
          //这里ajax获取验证码
          if(phone==""){
        	  alert("请输入手机号");
        	  return false;
          }
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
                    	  if(obj.error==0){
                    	 	 $("#sid").val(obj.sid);
                    	  }
                    	  else{
                    		  alert(data.error_mesg);
                    	  }
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
      
      $('.form-submit input').on('tap',function(){
    		 var phone=$('#mobile').val();
    		 var sid=$("#sid").val();
    		 var yzid=$("#captcha").val();
    		 console.log(ctx,phone,sid,yzid);
    	      $.ajax({
                  type: "POST",
                  url: ctx+"/user/moduserphone",
                  data: {
                  	"phone":phone,
                  	"yzCode":yzid,
                  	"sid":sid
                  	
                  },
                  dataType: "json",
                  success: function(data){
                	  if(data==0){
                		  alert("验证码错误");
                	  }
                	  
                	  if(data==1){
                		$('.input-new-mobile .successed-hint').removeClass('hide');
                		window.location.href=ctx+"/mobileuserino/toUserIndex";
                	  }
                	  if(data==3){
                		 
                  		$('.input-new-mobile .successed-hint').removeClass('hide');
                  		window.location.href=ctx+"/mobile/login/toRegister?phone="+phone+"&sid="+sid+"&yzcode="+yzid;
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
