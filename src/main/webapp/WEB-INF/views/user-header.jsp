<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<%-- 需要的变量如下： --%>
<%-- jkuser --%>
<%-- jkuserinfo --%>
<c:choose>
<c:when test="${not empty jkuser.backgroundPicture}">
<div id="user-background-image" class="user-base-info" style="background:url(${jkuser.backgroundPicture}) no-repeat 100% 100% / cover;">
</c:when>
<c:otherwise>
<div id="user-background-image" class="user-base-info" style="background:url(${ctx}/resources/artcle/images/user-bg.jpg) no-repeat 100% 100% / cover;">
</c:otherwise>
</c:choose>
	<div class="upload-button" style="
	    position: absolute;
	    top: 10px;
	    right: 20px;"><a href="#"><i class="icon upload-image-button"></i>上传</a></div>
    <div class="info-inner">

    <c:if test="${empty jkuser.headPicPath || fn:startsWith(jkuser.headPicPath, NORMAL_HEAD_ICON_URL)==true}">
        <c:if test="${jkuser.gender == 2 }"><div class="user-head"><img src="${GIRL_HEAD_ICON_URL}" alt=""><input type="file"></div></c:if>
        <c:if test="${jkuser.gender != 2 }"><div class="user-head"><img src="${BOY_HEAD_ICON_URL}" alt=""><input type="file"></div></c:if>
    </c:if>

    <c:if test="${not empty jkuser.headPicPath && fn:startsWith(jkuser.headPicPath, NORMAL_HEAD_ICON_URL)==false}">
        <div class="user-head"><img src="${jkuser.headPicPath}" alt=""><input type="file"></div>
    </c:if>

        <p class="user-name"><span style="margin-left: 60px;">${jkuser.nickname}</span>
    <c:if test="${ empty jkUserCeritifired.id}">
    	<c:if test="${jkuser.gender==1}">
	        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
	    </c:if>
	
	    <c:if test="${jkuser.gender==2}">
	        <c:out value="<i class='icon gender-n-real-girl'></i></p>" escapeXml="false"/>
	    </c:if>
	
	    <c:if test="${empty jkuser.gender}">
	        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
	    </c:if>
    </c:if>
    <c:if test="${ not empty jkUserCeritifired.id}">
    	<c:if test="${jkuser.gender==1}">
	        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
	    </c:if>
	
	    <c:if test="${jkuser.gender==2}">
	        <c:out value="<i class='icon gender-real-girl'></i></p>" escapeXml="false"/>
	    </c:if>

		<c:if test="${empty jkuser.gender}">
	        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
	    </c:if>
    </c:if>

        <%-- 用户要求显示公司/学校 --%>
        <c:if test="${jkuserinfo.companyName!=null}"><p class="user-addr">${jkuserinfo.companyName}</p></c:if>
        <c:if test="${jkuserinfo.eduName!=null}"><p class="user-addr">${jkuserinfo.eduName}</p></c:if>
    </div>
    <div class="shortcut-opts">
    </div>
</div>

<input id="a-hidden-upload-file" style="display:none;" type="file" />

<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var fileInput = $('#a-hidden-upload-file');
	fileInput.on('change', function() {
		if(Math.floor(fileInput[0].files[0].size/1024) > 4000) {
			alert('太大');
			return;
		}
		var fd = new FormData();
		fd.append("file", fileInput[0].files[0]);
		$.ajax({
			url: ctx+"/artcle/upload",
			type: "POST",
			data: fd,
			processData: false,
			contentType: false
		}).done(function (result) {
			$.ajax({
				type: "POST",
				url: ctx+"/user/modUser",
				data: {
					uid: ${jkuser.id},
					backgroundPicture: result.urlList[0]
				},
				aysnc:true,
				dataType: "json"
			}).done(function() {
				$('#user-background-image').css('background-image', 'url(' + window.URL.createObjectURL(fileInput[0].files[0]) + ')');
			});
		}).fail(function() {
			alert('上传失败，请检查格式.');
		});
	});
	
	// 令user-background-image可以被点击
	$('#user-background-image .upload-button').css('cursor', 'pointer');
	$('#user-background-image .upload-button').on('click', function() {
		var fileInput = $('#a-hidden-upload-file');
		fileInput[0].click();
	});
});
</script>
