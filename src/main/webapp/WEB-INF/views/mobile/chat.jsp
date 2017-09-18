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
  <title>消息-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/chat.css">
</head>

<body>
 <input hidden="true" type="text" id="userid"  value="${userid}"/>
  <div class="chat-boy">
    <div class="chat-list">
   
     
    

    </div>
  </div>
  <div class="chat-footer-bar">
    <div class="chat-input-bar">
      <!-- <div class="add-btn"></div> -->
      <div class="chat-input"><form action="#" method="post"><input type="text" name="" value="" placeholder="请输入内容..."></form></div>
      <div class="record-btn">发送</div>
    </div>
    <div class="face-input-box"></div>
  </div>

  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
    	
    	$.ajax({
	        type: "POST",
	        url: ctx+"/mesg/getmesglistuserone",
	        data: {
	        	userid:$('#userid').val()
	        },
	        aysnc:true,
	        dataType: "json",
	        success: function(data){
	        	
	        	renderList(data);
   			 }	

  		});
    
      
      var $chatList = $('.chat-list');
      var timer = null;
      function delimage(id,fimage,timage){
    	  if(id==$('#userid').val()){
    		  return fimage;
    	  }else{
    		  return timage;
    	  }
      }
      function getNowDate(sendtime) {
    	  var nowDate = sendtime?new Date(sendtime):new Date() ;
    	  return nowDate.getFullYear() + '-' + (nowDate.getMonth()+1) + '-'+ nowDate.getDate() + ' '+ nowDate.getHours()+':'+nowDate.getMinutes()+':'+nowDate.getSeconds()
      }
      //发送单条信息
      function sendMessage(data){
        $chatList.append('<div class="message-item right">\
        <p style="text-align: center;color: #999;">'+getNowDate()+'</p>\
        <div class="message-content">'+data.message+'</div><div class="guest-avatar">\
        <img src="${loginuser.headPicPath}" alt=""></div></div>');
        $('body').scrollTop($('.message-item').last().position().top);
      }
      //渲染这个聊天列表
      function renderList(data){
    	 $chatList.empty();
        $chatList.append(data.map(function(item,index){
          return ('<div class="message-item '+color(item.isread)+' '+((item.fid==$('#userid').val()) ? "left" : "right" )+'">\
        	  <p style="text-align: center;color: #999;">'+getNowDate(item.send_time)+'</p>\
              <div class="guest-avatar">\
              <a href="${ctx}/mobileuserino/toMobileOtherUserInfo?userid='+item.from_id+'" >\
          	  <img src="'+delimage(item.fid,item.fhead_pic_path,item.thead_pic_path)+'" alt=""></a></div>\
              <div class="message-content">'+item.content+'</div></div>'
          )
        }).join(''));
        $('body').scrollTop($('.message-item').last().position().top);
      }
      //发送
      $('.chat-input form').on('submit',function(){
        var $input = $(this).find('input');
        var message = $input.val();
        if(message==''){
        	alert("不能发送空数据");
        	return false;
        }
        message && sendMessage({message:message});
        $input.val('');
        $.ajax({
	        type: "POST",
	        url: ctx+"/mesg/addmesg",
	        data: {
	        	toId:$('#userid').val(),
	        	content:message,
	        	isread:0,
	        	type:0
	        },
	        aysnc:true,
	        dataType: "json",
	        success: function(data){
	        	
   			 }	

  		});
        return false;
      });

      //发送按钮
      $('.record-btn').on('tap',function(){
        $('.chat-input form').trigger('submit');
        
        return false;
      });
      
      function color(isread){
    	  	if(isread==1){
    	  		return "isread"
    	  	}
      }

    /*   //模拟轮训
	       timer = setInterval(function(){
	    	  
	    	   
	        renderList([1]);
	      },1000);  */

    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
