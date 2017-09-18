<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/publish-preview.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  
  <script>var ctx = '${ctx}';</script>  
</head>

<body>
    <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <div class="publish-section">
    <div class="wrapper">
      <div class="docs">
        <div class="publish-preview-box">
        	<div class="publish-preview-sharebar" style="top: 210px;">
        		<div class="bshare-custom icon-medium">
        		<span>分享到：</span>
							    <div class="bsPromo bsPromo2"></div>
							    <a title="分享到微信" class="bshare-weixin" href="javascript:void(0);"></a>
							    <a title="分享到QQ空间" class="bshare-qzone" href="javascript:void(0);"></a>
							    <a title="分享到新浪微博" class="bshare-sinaminiblog" href="javascript:void(0);"></a>
							    <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
						</div>
        	</div>
        	<div class="preview-body">
        		  <div class="preview-details">
          <p>
          		<strong>项目类型:</strong>
          		<c:if test="${JkProject.projType==0}">赞助</c:if>
          		<c:if test="${JkProject.projType==1}">供给</c:if>
          </p>
          <p>
          		<strong>明确需求标题和详情：</strong>${JkProject.projName}
          </p>
          <p>
          		<strong>选择类型：</strong>${JkProject.cateName}
          	</p>
          <p>
          		<strong>选择需要做什么：</strong>${JkProject.cateName}
          </p>
          <p>
          		<strong>地域：</strong>
				<c:if test="${JkProject.projLocation!=null&&JkProject.projLocation!=''}">${JkProject.projLocation }</c:if>
				<c:if test="${JkProject.projLocation==null||JkProject.projLocation==''}">不限地区</c:if>
          </p>
          <p>
          		<strong>明确预算：</strong>${JkProject.moneyNeeds}
          </p>
          <p>
          		<strong>场次／数量：</strong>${JkProject.timesNumber}次
          </p>
          <p>
          		<strong>设置申请截止日期：</strong><fmt:formatDate value="${JkProject.applyTime }" pattern="yyyy-MM-dd"/>
          </p>
          <p>
          		<strong>活动的起止日期：</strong><fmt:formatDate value="${JkProject.startTime }" pattern="yyyy-MM-dd"/>——<fmt:formatDate value="${JkProject.endTime }" pattern="yyyy-MM-dd"/>
          </p>
          <p>
          		${JkProject.projDesc }
          </p>
          <%--<p><img src="${ctx}/resources/artcle/images/desc-img.png" alt=""></p> --%>
          <p>
 		  		<c:if test="${fileList!=null }">
	 		  		<strong>附件：</strong><a style="cursor:pointer" target="_blank" data-filepath="${fileList[0].filePath}">${fileList[0].fileName }</a>
 		  		</c:if>
 		  		</p>
          <p>
          		<strong>主题图片：</strong><span class="topic-small-photo">
          		<img src="${JkProject.projPicPath }" alt=""></span>
          </p>
          <p>
          		<strong>标签：</strong>
          		<c:forEach var="jkTag" items="${jkTags}" >
	          		<span class="tag">${jkTag.tagName}</span>          		
          		</c:forEach>
          </p>
<!--           <p><a class="edit-btn" href="">修改编辑</a></p> -->
          </div>
							<div class="preview-sidebar">
								<div class="author-info">
			            <div class="author-ir">
			              <h3>${projUser.nickname}</h3>
			              <div class="author-other-info">
			                <div class="works-count">地区：${projUser.location}</div>
			                <c:if test="${projUser.idType==0}"><div class="pviews">学校：${JkUserInfo.eduName }</div></c:if>
	                		<c:if test="${projUser.idType==1}"><div class="pviews">公司：${JkUserInfo.companyName }</div></c:if>
			              </div>
			            </div>
			            <div class="author-il">
			              <div class="author-avatar"><a href="${ctx}/login/toOtherUser?userid=${JkProject.uid}"><img src="${projUser.headPicPath}" alt=""></a></div>
			            </div>
			          </div>
							</div>
        	</div>
        </div>
      </div>
<!--       <div class="docs gap"> -->
<!--         <div class="applicant-box"> -->
<!--           <div class="applicant-list-title"><strong>申请此项目的用户</strong></div> -->
<!--           <ul class="applicant-list"> -->
<%--           	<c:forEach var="jkProjectApply" items="${jkProjectApplyList}" > --%>
<!-- 	          	<li> -->
<!-- 	              <div class="col-1"> -->
<!-- 	                <div class="col-inner"> -->
<%-- 	                  <div class="applicant-avatar"><img src="${jkProjectApply.userPicPath }" alt=""></div> --%>
<!-- 	                </div> -->
<!-- 	              </div> -->
<!-- 	              <div class="col-2"> -->
<%-- 	                <div class="col-inner">${jkProjectApply.userName }<br>2017-02-12</div> --%>
<!-- 	              </div> -->
<!-- 	              <div class="col-3"> -->
<%-- 	                <div class="col-inner">${jkProjectApply.words}</div> --%>
<!-- 	              </div> -->
<!-- 	              <div class="col-4"> -->
<!-- 	                <div class="col-inner"><a href="chat.html">联系TA</a></div> -->
<!-- 	              </div> -->
<!-- 	            </li> -->
<%--           	</c:forEach> --%>
<!--           </ul> -->
<!--         </div> -->
<!--       </div> -->
    </div>
  </div>
  <form id="downloadform" action="${ctx}/artcle/download" method="post">
  	<input type="hidden" name="url" value="${fileList[0].filePath}"/>
  	<input type="hidden" name="fileName" value="${fileList[0].fileName}"/>
  </form>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
  <script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  
  <script>
	//下载附件
		$("a[data-filepath]").on("click",function(){
	  	$("#downloadform").submit();
		 	 return false;
	  })
  </script>
  
</body>

</html>
