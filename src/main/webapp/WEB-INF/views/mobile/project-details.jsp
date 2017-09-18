<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css?v=155">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/project.css?v=155">
  <script>
    var ctx = '${ctx}';
  </script>    
</head>

<body>
  <div class="project-details">
    <div class="details-base">
      <div class="apply-amount">
        <div class="amount-text">${JkProject.applycount }</div>
        <p>目前申请数</p>
        <div class="btn-bar"><span class="favourite-btn ${hasCollect==1?'active':'' }"></span><span class="like-btn ${hasAdmire==1?'active':'' }"></span></div>
      </div>
      <h3>
      	<span class="tags"><c:if test="${JkProject.projType==0 }">赞助</c:if><c:if test="${JkProject.projType==1 }">供给</c:if></span>
      	<span>${JkProject.projName }</span>
      </h3>
      <p>项目分类：${JkProject.cateName }</p>
      <p>地域：${JkProject.projLocation}</p>
      <p>申请截止时间：<fmt:formatDate value="${JkProject.applyTime }" pattern="yyyy-MM-dd"/></p>
      <p>项目起止时间：<fmt:formatDate value="${JkProject.startTime }" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${JkProject.endTime }" pattern="yyyy-MM-dd"/></p>
      <p>预算：￥${JkProject.moneyNeeds }</p>
    </div>
    <div class="details-content">
      <p>内容描述：</p>
      <div>${JkProject.projDesc }</div>
    </div>
    <c:if test="${JkProject.uid==login_userId}">
	    <div class="applicant-box">
	    	<div class="applicant-box-title">申请此项目的用户</div>
	    	<ul class="applicant-list">
	    	    <c:forEach var="jkProjectApply" items="${jkProjectApplyList}" >
		    		<li>
		    			<div class="applicant-project-intro">
			    			<div class="applicant-avatar"><a href="${ctx}/mobileuserino/toMobileOtherUserInfo/?userid=${jkProjectApply.uid}"><img src="${fn:startsWith(jkProjectApply.headPicPath, NORMAL_HEAD_ICON_URL)?(jkProjectApply.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkProjectApply.headPicPath}" alt=""></a></div>
			    			<div class="applicant-base">${jkProjectApply.userName }<br><c:if test="${login_userId==JkProject.uid }">${jkProjectApply.phone}</c:if><br><fmt:formatDate value="${jkProjectApply.createTime }" pattern="yyyy-MM-dd"/></div>
			    			<div class="applicant-link">
				    			<c:if test="${jkProjectApply.status==0 }"><a style="cursor:pointer" class="opts-btn" onclick="agreeApply(${jkProjectApply.id},this);">达成合作</a></c:if>
					            <c:if test="${jkProjectApply.status==1 }"><a style="cursor:pointer" class="opts-btn" onclick="agreeApply(${jkProjectApply.id},this);">撤销合作</a></c:if>
			    			</div>
		    			</div>
		    			<div class="applicant-project-desc">${jkProjectApply.words}</div>
		    		</li>
	    	    </c:forEach>
	    	</ul>
	    </div>
    </c:if>
    <c:if test="${1==1}">
	    <div class="home-like">
	    	<div class="like-title"><span>猜你喜欢</span></div>
	    	<div class="like-list">
	    		<c:forEach var="recommProj" items="${recommProjList}" >
			    	<div class="like-item">
				    	<a href="${ctx}/mobile/login/toProjectDetail?id=${recommProj.id}">
				    		<div class="like-photo service"><img src="${recommProj.projPicPath}" alt=""></div>
				    		<div class="like-desc">
				    			<div class="name-tags"><strong>${recommProj.projName}</strong><br></div>
				    			<div class="views"><i class="icon eye"></i>${recommProj.browsevolume}次浏览</div>
				    		</div>
				    	</a>
			    	</div>
	    		</c:forEach>
		    </div>
		</div>
    </c:if>
  </div>
  <div class="fixed-bar">
  	<div class="author-info">
      <p>发布人：</p>
      <div class="info-row">
        <div class="info-col"><a href="${ctx}/mobileuserino/toMobileOtherUserInfo/?userid=${JkProject.uid}"><img src="${fn:startsWith(jkUserWithInfo.jkUser.headPicPath, NORMAL_HEAD_ICON_URL)?(jkUserWithInfo.jkUser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkUserWithInfo.jkUser.headPicPath}" alt=""></a></div>
        <div class="info-col">
        	<a href="">
        		<span class="author-name">${jkUserWithInfo.jkUser.nickname }</span><br>
	        	<small>
	        		<c:if test="${jkUserWithInfo.jkUserUserInfo.companyName!=null&&jkUserWithInfo.jkUserUserInfo.companyName!='' }">${jkUserWithInfo.jkUserUserInfo.companyName }</c:if>
	        		<c:if test="${jkUserWithInfo.jkUserUserInfo.eduName!=null&&jkUserWithInfo.jkUserUserInfo.eduName!='' }">${jkUserWithInfo.jkUserUserInfo.eduName }</c:if>
	        	</small>
        	</a>
        </div>
        <div class ="info-col"><a class="apply-btn" onclick="apply(${JkProject.id})">立即申请</a></div>
      </div>
    </div>
  </div>
  
  <input type="hidden" id="login_level" value="${jkUserWithInfo.jkUser.userLevel }"/>
  <input type="hidden" id="currentProjId" value="${JkProject.id}">
  <input type="hidden" id="login_userId" value="${login_userId}">
  
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
  function apply(id){
	if($("#login_level").val()==''||$("#login_level").val()==null||$("#login_level").val()=='0'||$("#login_level").val()=='1'){
		alert("请先认证或者注册！");
		return false;
	}else{
		$.ajax({
		    type: "POST",
		    url: ctx+"/mobile/projectapply/applier",
		    data: {"pid":id},
		    dataType: "json",
		    success: function(data){   
		    	if(data.error==0){
		    		 alert("申请成功");
		    	}else if(data.error==1){
				   	 alert(data.error_mesg);	    		
		    	}
		    }
		}); 		
		return false;
	}  
  } 
  function agreeApply(id,obj){
	 	 $.ajax({
	         type: "POST",
	         url: ctx+"/project/agreeApply",
	         data: {"id":id},
	         dataType: "json",
	         success: function(data){     	  
	        	 var $text = $(obj).text();
	        	 if(data.error!="1"&& $text=="达成合作"){
		       		 alert("已达成合作！");
		       		 $(obj).text("撤销合作");
	        	 }else if(data.error!="1"&& $text=="撤销合作"){
		       		 alert("已撤销合作！");
		       		 $(obj).text("达成合作");
	        	 }else if(data.error=="1"){
	        		 alert(data.error_mesg);
	        	 }
	         }
	     }); 
	 	 return false;
	  }
  
  $(function(){
	 var currentProjId = $("#currentProjId").val();
	 var login_userId = $("#login_userId").val();
	 $('.favourite-btn').on('tap',function(){
		 if(login_userId==''||login_userId==null){
			 alert("请您登录后收藏！");
			 return false;
		 }
		 var $this = $(this);
		 if(!$this.hasClass('active')){
			 $.ajax({
	              type: "POST",
	              url: ctx+"/operate/collect",
	              data: {"fid":currentProjId,"type":1},
	              dataType: "json",
	              success: function(data){     	  
	            	  $this.addClass('active');
	              }
	          }); 
		 }
		 return false; 
	 }) ;
	 
	 $('.like-btn').on('tap',function(){
		 if(login_userId==''||login_userId==null){
			 alert("请您登录后点赞！");
			 return false;
		 }
		 var $this = $(this);
		 $.ajax({
             type: "POST",
             url: ctx+"/operate/admire",
             data: {"fid":currentProjId,"type":1},
             dataType: "json",
             success: function(data){      
         		 if($this.hasClass('active')){
         			$this.removeClass('active');
        		 }else{
        			$this.addClass('active');
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
