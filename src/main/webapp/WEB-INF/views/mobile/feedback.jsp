<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
<script>
	var ctx='${ctx}';

</script>
<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>意见反馈-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/feedback.css">
</head>

<body>
  <div class="feedback-box">
	<form class="feedbackForm" action="" method="post">
      <h3>意见反馈</h3>
      <div class="form-group">
        <textarea id="content" name="content" placeholder="请输入您的意见或者建议..."></textarea>
      </div>
      <div class="form-submit"><input type="submit" name="submit" value="提 交"></div>
    </form>
  </div> 
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  
</body>
<script>
	$(".feedbackForm").submit(function(e){
	    var message=$('#content').val();
	    if(message==''){
    		alert("请输入内容");
    	}
	    if(message.length>50){
    		alert("长度要小于50");
    		return false;
    	}
		$.ajax({
            type: "POST",
            url: "${ctx}/advice/addadvice",
            data: {
              content:message
          	 
            },
            aysnc:true,
            dataType: "json",
            success: function(data){
          		if(data=='1'){
          			window.location.href='${ctx}/mobileuserino/toUserIndex'
          		}
          	  
            }
        });
	  return false;
	});
</script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</html>
