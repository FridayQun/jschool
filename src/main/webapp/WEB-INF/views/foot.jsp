<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="downmesgurl" value="<%=request.getContextPath()%>"/>
<c:set var="adviceuid" value="${login_userId}"/>
<style>
#cnzz_stat_icon_1263531026 img {
    display: initial;
    width: initial;
    border-style: initial;
}
</style>
<script >
	var downmesgurl='${downmesgurl}';
	var adviceuid='${adviceuid}';
</script>
  <div class="footer" style="padding-top: 44px;">
    <div class="footer-inner">
      <div class="logo-share">
        <a href="#" class="small-icon"><img src="${ctx}/resources/artcle/images/small-logo.png" alt=""></a>
        <a href="#" class="wechat-icon wq"></a>
        <a href="#" class="weibo-icon wb"></a>
      </div>
      <ul id="footer-link" class="footer-link">
      <!-- 
        <li><a href="${ctx}/login/toHelp?pageName=about"><span>关于鲸客</span><span>About us</span></a></li>
        <li><a href="${ctx}/login/toHelp?pageName=invite"><span>诚聘英才</span><span>recruitment</span></a></li>
        <li><a href="${ctx}/login/toHelp?pageName=contact"><span>联系我们</span><span>Contact us</span></a></li>
        <li><a href="${ctx}/login/toHelp?pageName=qa"><span>常见问题</span><span>Common problems</span></a></li>
        <li><a href="${ctx}/login/toHelp?pageName=guidance"><span>新手指导</span><span>guidance</span></a></li>
        <li><a href="${ctx}/login/toHelp?pageName=rules"><span>平台规则</span><span>rules</span></a></li>
         -->
        <!--
        <li><a class="feedback-link" href="#"><span>意见反馈</span><span>feedback</span></a></li> 
         -->
      </ul>
	  <ul id='friend-foot-links-list' class="links-list" style="color: #fff;
		width: 100%;
		margin: 0;
		overflow: hidden;
		text-align: center;
		font-size: 15px;
		margin-top: -20px;
		margin-bottom: 20px;
	  ">
			<li style="display: inline-block; color: #ccc;">友情链接: </li>
			<c:if test="${sponsors!=null && fn:length(sponsors)>0 }">
			<li style="display: inline-block; padding: 0 6px;">
			  <a href="${sponsors[0].link}" style="color: #ccc;">
			    <div class="friendly-link">${sponsors[0].name}</div>
			  </a>
			</li>
			</c:if>
		<c:set var="length" value="${fn:length(sponsors)>0?fn:length(sponsors)-1:0 }"></c:set>
        <c:forEach var="i" begin="1" end="${length }" step="1" >
          <li style="display: inline-block; border-left: 2px solid #ccc; padding: 0 6px;">
            <a href="${sponsors[i].link}" style="color: #ccc;">
              <div class="friendly-link">${sponsors[i].name}</div>
            </a>
          </li>
        </c:forEach>
      </ul>
      <div class="copyright-desc">
        <p id="twomesg">Copyright 2009 -2020上海鲸诚信息科技有限公司. All rights reserved</p>
        <p id="onemesg"> 上海城岸市场营销策划有限公司版权所有 <a href="">沪ICP备16049082号</a>
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1263531026'%3E%3C/span%3E"));</script>
  <script src='http://s13.cnzz.com/z_stat.php?id=1263531026&show=pic' type='text/javascript'></script>
</p>
      </div>
    </div>
  </div>
  <div class="overlay sms-box hide">
    <div class="send-box">
      <form class="sendForm" action="#" method="post">
        <div class="form-group"><span class="to-user"></span></div>
        <div class="form-group">
          <textarea name="message-input" id="message-input"></textarea>
        </div>
        <div class="form-submit"><input type="submit" name="submit" value="发 送"></div>
      </form>
    </div>
  </div>
  <div class="overlay feedback-layer hide">
  	<div class="feedback-box">
  		<form class="feedbackForm" action="#" method="post">
	  		<h3 class="feedback-title">意见反馈</h3>
	  		<div class="form-group">
	  			<textarea name="feedback-message-input" id="feedback-message"></textarea>
	  		</div>
	  		<div class="form-submit"><input type="submit" name="submit" value="发 送"></div>
  		</form>
  	</div>
  </div>
   <script>
   $(document).ready(function() {
	   if($('#friend-foot-links-list').children().length <= 1) {
		   $.ajax({
			   type: "POST",
			   url: downmesgurl+"/sponsor/getListPage",
			   data: {},
			   dataType: "json",
			   success: function(data) {
				   data.sponsors;
				   if(data.sponsors.length > 0) {
					   $('#friend-foot-links-list').append(format.call('<li style="display: inline-block; padding: 0 6px;"><a href="{link}" style="color: #ccc;"><div class="friendly-link">{name}</div></a></li>', {
						   'link': data.sponsors[0].link,
						   'name': data.sponsors[0].name
					   }));
				   }
				   for(var i=1; i<data.sponsors.length; i++) {
					   $('#friend-foot-links-list').append(format.call('<li style="display: inline-block; border-left: 2px solid #ccc; padding: 0 6px;"><a href="{link}" style="color: #ccc;"><div class="friendly-link">{name}</div></a></li>', {
						   'link': data.sponsors[i].link,
						   'name': data.sponsors[i].name
					   }));
				   }
			   }
		   });
	   }
   });
  $(function(){
	  var $feedback = $('.feedback-layer');
	  function setWeChat (el,url) {
		  el.css('position','relative').hover(function(){
			  $(this).append('<div class="wechat-qrcode"><img src="'+url+'" alt="" /></div>');
			},function(){
				$(this).find('.wechat-qrcode').remove();
			});
		  el.on('click',function(){
			  return false;
		  });
    }
    setWeChat($('.wq'),'${ctx}/resources/artcle/images/wechat-qrcode.png');
    setWeChat($('.wb'),'${ctx}/resources/artcle/images/weibo-qrcode.png');
    var mesgtype=[2,3];
    $.ajax({
        type: "POST",
        url: downmesgurl+"/mesg/getmesglistbyexlast",
        data: {
        		type:mesgtype.toString(),
        },
        aysnc:true,
        dataType: "json",
        success: function(data){
        	var oneflag=0;
        	var twoflag=0;
        	for(var i=0;i<data.rows.length;i++){
        		var temp=data.rows[i];
        		if(temp.type==2&&oneflag==0){
        			oneflag=1;
        			$('#onemesg').text(temp.content);
        			
        		}
        		if(temp.type==3&&twoflag==0){
        			twoflag=1;
        			$('#twomesg').text(temp.content);
        			
        		}
        		if(oneflag==1&&twoflag==1){
        			break;
        		}
        	}

		}

	});
    //意见反馈链接
    $('.feedback-link').on('click',function(){
    	if(!adviceuid) {
    		$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后提交意见反馈", ConfirmFun: function(){
    			window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
    		} });
    	}
    	$feedback.removeClass('hide');
    	$('#feedback-message').val('');
    	return false;
    });
    //关闭意见反馈弹窗
    $feedback.on('click',function(e){
    	if(e.target === $(this)[0]){
    		$feedback.addClass('hide'); 
    	}
    });
    //意见反馈表单提交
    $('.feedbackForm').on('submit',function(event){
    	event.preventDefault();
    	var message = $(this).find('#feedback-message').val();
    	
    	if(message==''){
    		new_alert("请输入内容");
    	}
    	
    	if(adviceuid==''){
    		new_alert("请先登录");
    	}
    	if(message.length>50){
    		new_alert("长度要小于50");
    		return false;
    	}
        $.ajax({
            type: "POST",
            url: "${ctx}/advice/addadvice",
            data: {
              uid:adviceuid,
              content:message
          	 
            },
            aysnc:true,
            dataType: "json",
            success: function(data){
          	
          	  
            }
        });
    	console.log(message);
    	$feedback.trigger('click');
    });
    
		$.ajax({
			type: "POST",
			url: "${ctx }/footerInfor/getFooter",
			aysnc: true,
			dataType: "json",
			success: function(data){
				var showList = $('#footer-link');
				// <li><a href="${ctx}/login/toHelp?pageName=about"><span>关于鲸客</span><span>About us</span></a></li>
				console.log("data.foots:");
				console.log(data.foots);
				for(var i in data.foots) {
					showList.append(format.call('<li><a href="${ctx}/{link}"><span>{name}</span><span>{enName}</span></a></li>', {
						'link': data.foots[i].footLink,
						'name': data.foots[i].footName,
						'enName': data.foots[i].footEnName
					}));
				}
			}
		});
  });
  function format(args) {
      var res = this;
      if(arguments.length == 1 && typeof(args) != 'string') {
          for(var key in args) {
              // if(args[key] == undefined) continue;
              var reg = new RegExp("({)"+key+"(})", "g");
              if(args[key]!=undefined && args[key]!=null)
              	res = res.replace(reg, args[key]);
              else
              	res = res.replace(reg, '');
          }
      } else {
          for(var i=0; i<arguments.length; i++) {
              // if(arguments[i] == undefined) continue;
              var reg = new RegExp("({)"+i+"(})", "g");
              if(arguments[key]!=undefined && arguments[key]!=null)
              	res = res.replace(reg, arguments[i]);
              else
              	res = res.replace(reg, '');
          }
      }
      return res;
  }
  </script>
