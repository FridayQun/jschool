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
  <title>账户安全-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>      
</head>

<body class="grey-bg">
 <input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
  <div class="modify-pwd-box">
    <form class="modifyForm" action="#" method="post">
      <div class="form-group separator">
        <label for="oldpwd">请输入原密码</label>
        <input type="password" name="hipassword" id="oldpwd" value="" placeholder="">
      </div>
      <div class="form-group">
        <label for="newspwd">请输入新密码</label>
        <input type="password" name="newpassword1" id="newspwd" value="" placeholder="">
        <span class="showpassword"></span>
      </div>
      <div class="form-group noborder">
        <label for="confirmpwd">请确认新密码</label>
        <input type="password" name="newpassword2" id="confirmpwd" value="" placeholder="">
      </div>
      <div class="form-submit"><input type="submit" name="submit" value="确认修改"></div>
    </form>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      //查看密码
      $('.showpassword').on('tap',function(){
        var $input = $(this).prev('input');
        $input.attr('type',($input.attr('type') === 'password') ? 'text' : 'password');
        return false;
      });
      
      $('.modifyForm').on('submit',function(event){
    	  var formData = $(this).serializeArray();
    	  console.log(formData);
    	  if(formData[0].value==""||(formData[1].value!=formData[2].value)){
    		  	alert("请输入原密码或保证新密码一致")
    	      	return false;
    	  }
          $.ajax({
              type: "POST",
              url: "${ctx}/user/modUserPassWord",
              data:formData,
              aysnc:true,
              dataType: "json",
              success: function(data){
            	  	if(data==1){
            	  		JKApp.dialog({
            	  			message:'保存成功！',
            	  			ok : function () {
            	  				window.location.href=ctx+"/mobileuserino/toUserIndex";
            	  			}
            	  		});
            	  	}
            	  if(data==0){
          	  		JKApp.dialog({message:'原密码错误'});
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
