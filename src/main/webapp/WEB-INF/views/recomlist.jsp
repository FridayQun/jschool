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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/list.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <input type="hidden" id="pages" value="${pages }"/>
  <input type="hidden" id="pageSize" value="${pageSize }"/>
  <input type="hidden" id="keywords" value="${keywords }"/>
  <input type="hidden" id="tagName" value="${tagName }"/>
  <input type="hidden" name="projLocation" id="projLocation" value="不限"/>
  <div class="list-section">
    <div class="wrapper">
      <div class="list-box">
        <div class="list-sort-bar">
          <span class="title">项目匹配页</span>
        </div>
        <ul class="result-list">
          <c:forEach var="jkProject" items="${jkProjectList}" >
	          <li>
	            <div class="col c1">
	              <a href="${ctx}/login/toProjectDetail?id=${jkProject.id}"><img src="${jkProject.projPicPath }" alt=""></a>
	            </div>
	            <div class="col c2" style="width: 710px;">
	              <h3><a href="${ctx}/login/toProjectDetail?id=${jkProject.id}"><span class="blue-font">${jkProject.projName }</span><small class="orange-font">${jkProject.moneyNeeds}</small></a></h3>
	              <p><span><i class="icon figure"></i>${jkProject.username }</span><span><i class="icon eye"></i>${jkProject.browsevolume }人浏览/${jkProject.applycount }人申请</span><span><i class="icon clock"></i>${jkProject.createTime}</span></p>
	              <p>
				    <c:if test="${jkProject.companyName!=null }">${jkProject.companyName }</c:if>
	                <c:if test="${jkProject.eduName!=null }">${jkProject.eduName }</c:if>
				  </p>
	              <div class="remaining-time"><span class="red-font"><i class="icon alarm"></i><fmt:formatDate value="${jkProject.applyTime }" pattern="yyyy年MM月dd日"/>
	              </span><span data-timeList="${jkProject.status},${jkProject.startTime},${jkProject.endTime}"></span></div>
	            </div>
	            <div class="col c3">
	              <div class="col-inner">
	              	<p><a  data-uid='${jkProject.uid}' class="contact-link">联系TA</a></p>
	            	<p>
	            	<%-- <a href="#" class="good-btn"><i class="icon good"></i></a>
	            	<a href="#" class="favorite-btn" data-admire="${jkProject.id }"><i class="icon star"></i></a>
	            	<a href="#" class="share-btn" data-collect="${jkProject.id }"><i class="icon share"></i></a> --%>
	               </p>           	
	              </div>
	            </div>
	          </li>         
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
  
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js">
  </script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script >
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
  var login_userId = '<%=session.getAttribute("login_userId")%>'; 
  var $smsBox = $(".sms-box");
  
//计算两个日期之间差
  function diffTime(status,startDate,endDate) {  
	    if(status=='-1'){
	    	return "已截止";      	    	
	    }
	    var diff=new Date(endDate).getTime() - new Date(startDate).getTime();//时间差的毫秒数    	  
	    //计算出相差天数  
	    var days=Math.floor(diff/(24*3600*1000));  
	    //计算出小时数  
	    var leave1=diff%(24*3600*1000);    //计算天数后剩余的毫秒数  
	    var hours=Math.floor(leave1/(3600*1000));  
	    var returnStr = "已截止";
	    if(hours>0) {  
	    	returnStr = "";
	        returnStr = hours + "小时" + returnStr;  
	    }  
	    if(days>0) {  
	        returnStr = days + "天后截止";  
	    }  
	    return returnStr;  
	}
  //格式化时间
  Date.prototype.Format = function (fmt) { //author: meizz 
	    var o = {
	        "M+": this.getMonth()+1, //月份 
	        "d+": this.getDate(), //日 
	        "h+": this.getHours(), //小时 
	        "m+": this.getMinutes(), //分 
	        "s+": this.getSeconds(), //秒 
	        "q+": Math.floor((this.getMonth()+3)/3), //季度 
	        "S": this.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
  }
  
  $(function(){
	  $(".remaining-time span[data-timelist]").each(function(){
		  var thisList = $(this).data('timelist').split(',');
		  $(this).text(diffTime(thisList[0],thisList[1],thisList[2]));
	  });
	  
	  //联系我们
	   var toId = null;
	  $('body').on('click','.contact-link',function(){
      	if(login_userId=='null'){
    		  alert('未登录！');
    		  return false;
    	    }else if(login_userId==$(this).find("input").val()){
    	    	alert('这是您自己的项目！');
      		return false;
    	    }
      	toId = $(this).data("uid")
      	$smsBox.removeClass('hide');        	
      	return false;
      })
      $smsBox.on('click',function(e){
		  if(e.target === $smsBox[0]){
          $smsBox.addClass('hide');
        }
		 });
	
	  
	  $(".form-submit input[name=submit]").on('click',function(){
     	 var message = $("#message-input").val();  
     	$.ajax({
 	        type: "POST",
 	        url: ctx+"/mesg/addmesg",
 	        data: {toId:toId,content:message,type:0},
 	        aysnc:true,
 	        dataType: "json",
 	        success: function(data){
 	        	alert("发送成功！");
 	        	$smsBox.addClass('hide');
    			 }	
   		});
     	return false;
     }) 
	  
	  
  });
  
  </script>
</body>



</html>
