<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">
<script>
	var ctx='${ctx}';
</script>
<head>
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>JingKe</title>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/chat.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>

  <div class="chat-section">
    <div class="wrapper">
      <div class="docs">
        <div class="chat-project">
          <div class="block-title">项目名称</div>
          <div class="project-info">
            <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-photo.png" alt=""></div>
            <div class="project-intro">
              <p><strong>上海地区50人教室</strong><span>￥500.00</span></p>
              <p><span>133天21时</span><span>后截止申请</span></p>
            </div>
          </div>
          <div class="project-desc">
            <div class="desc-col1">
              <div class="applicant-avatar"><img src="${ctx}/resources/artcle/images/applicant-avatar.png" alt=""></div>
            </div>
            <div class="desc-col2"><strong>萌大猫</strong><br>2017-02-12</div>
            <div class="desc-col3">
              <div class="contact-info">
                <span>姓名：张三三</span>
                <span>电话：18403982154</span>
                <span>公司：杭州云暴科技有限公司</span>
                <span>地址：杭州市西湖区西溪花园凌波苑11幢1124号</span>
              </div>
              <div class="desc-body">提供场地，这次校园行除了为活动提供赞助资金外，还希望将app的功能融入到活动中。app里的一些功能是非常适合校园活动，还希望将app的功能融入到活动中。app里的一些功能是非常适合校园活动，例如讲座、十佳歌手比赛等等，我们都可以提供现场互动平台。</div>
            </div>
          </div>
          <div class="chat-box">
            <div class="chat-body">
              <ul class="chat-list"></ul>
            </div>
            <div class="chat-input">
              <div class="chat-tool-bar">
                <a href="#" id="smilies-btn"><i class="icon smilies"></i></a>
                <a href="#" ><i class="icon img"></i><input type="file" name="uploadPhoto"></a>
              </div>
              <div class="input-box">
                <div class="input-col"><div id="message" contenteditable="true"></div></div>
                <div class="input-col"><button id="sendMessage" type="button">发 送</button></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jquery.qqFace.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
    $(function () {
    
    	$.ajax({
	        type: "POST",
	        url: ctx+"/mesg/getmesglistuserone",
	        data: {
	        },
	        aysnc:true,
	        dataType: "json",
	        success: function(data){
   			 }	

  		});
    	
    	
      var $chatList = $('.chat-list');
      var $messageArea = $('#message');
      var $sendMessage = $('#sendMessage');
  		
      function appendMessage(args){
        var itemNodes = null;
        if(args.mode){
          itemNodes = '<li class="to-message"><div class="user"><div class="user-avatar"><img src="'+args.avatar+'" alt=""></div>\
                      <div class="user-name">'+args.userName+'</div></div>\
                      <div class="message"><div class="datatime">'+args.datatime+'</div>\
                      <div class="desc">'+args.message+'</div></div></li>';
        }else{
          itemNodes = '<li class="from-message"><div class="user"><div class="user-avatar"><img src="'+args.avatar+'" alt=""></div>\
                      <div class="user-name">'+args.userName+'</div></div>\
                      <div class="message"><div class="desc">'+args.message+'</div>\
                      <div class="datatime">'+args.datatime+'</div></div></li>';
        }
        $chatList.append(itemNodes);
      }
      function getNow(){
        var date = new Date();
        return date.getFullYear() + '-' + (date.getMonth()+1) + '-'+(date.getDate()) + ' ' +(date.getHours())+':'+(date.getMinutes());
      }
      $('#smilies-btn').on('click',function(){
    	  new_alert("未完成");
        return false;
      });
      $('.chat-tool-bar input[type="file"]').on('change',function(){
        var file = $(this)[0].files[0];
        var imgUri = window.URL.createObjectURL(file);
        $messageArea.append('<a href="'+imgUri+'" target="_blank"><img src="'+imgUri+'" alt=""></a>');
      });

      $sendMessage.on('click',function(){
        appendMessage({
          mode  : true,
          avatar : '${ctx}/resources/artcle/images/applicant-avatar.png',
          userName: '萌大猫',
          datatime : getNow(),
          message : $messageArea.html(),
        });
        $messageArea.empty();
      });

      appendMessage({
        mode  : true,
        avatar : '${ctx}/resources/artcle/images/applicant-avatar.png',
        userName: '萌大猫',
        datatime : getNow(),
        message : '提供场地，这次校园行除了为活动提供赞助资金外，还希望将app的功能融入到活动中。app里的一些功能是非常适合校园活动，还希望将app的功能融入到活动中。app里的一些功能是非常适合校园活动，例如讲座、十佳歌手比赛等等，我们都可以提供现场互动平台。',
      });
      appendMessage({
        mode  : false,
        avatar : '${ctx}/resources/artcle/images/applicant-avatar.png',
        userName: '萌大猫',
        datatime : getNow(),
        message : '我正在忙，稍后会联系你！',
      });

      // $(window).keydown(function(event){
      //   (event.keyCode === 13) && $sendMessage.trigger('click');
      // });
    });
  </script>
</body>

</html>
