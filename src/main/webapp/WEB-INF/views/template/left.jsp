<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="pageSize" value="5"/>
<!DOCTYPE html>
<html lang="zh">
<body>
    <input type="hidden" id="gridName" value="${gridName}">
    <div class="manage-nav-bar">
      <ul class="nav-list">
 
        <c:if test="${role==0}">
        	<li class="${gridName=='adminuser'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=adminuser">管理员中心</a></li>
        </c:if>
        <c:if test="${role==1||role==0}">
        	<li class="${gridName=='user'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=user">用户中心</a></li>
        </c:if>
        <c:if test="${role==2||role==0}">
        	<li class="${gridName=='ProjectGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=ProjectGrid">项目管理</a></li>
       	</c:if>
		<c:if test="${role==3||role==0}">
       	 	<li class="${gridName=='NewsCate'?'active':'' }">
       	 	<a href="${ctx}/template/login/toGrid?gridName=NewsCate">资讯类目管理</a></li>
        </c:if>
       	<c:if test="${role==3||role==0}">
       	 	<li class="${gridName=='NewsGrid'?'active':'' }">
       	 	<a href="${ctx}/template/login/toGrid?gridName=NewsGrid">资讯管理</a></li>
        </c:if>
       	<c:if test="${role==4||role==0}">
        	<li class="${gridName=='TagGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=TagGrid">标签管理</a></li>
        </c:if>
        <c:if test="${role==2||role==0}">
       		 <li class="${gridName=='ProjectCateGrid'?'active':'' }">
       		 <a href="${ctx}/template/login/toGrid?gridName=ProjectCateGrid">项目类型</a></li>
        </c:if>
        <c:if test="${role==4||role==0}">
        	<li class="${gridName=='ProductGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=ProductGrid">积分商城</a></li>
        </c:if>
        <c:if test="${role==4||role==0}">
        	<li class="${gridName=='ScoreRecordGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=ScoreRecordGrid">积分记录</a></li>
        </c:if>
        <c:if test="${role==4||role==0}">
        	<li class="${gridName=='AdGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=AdGrid">广告管理</a></li>
        </c:if>
        <c:if test="${role==4||role==0}">
        	<li class="${gridName=='mesg'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=mesg">公告维护</a></li>
      	</c:if>
      	<c:if test="${role==4||role==0}">
        	<li class="${gridName=='sysmoduleGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=sysmoduleGrid">导航栏维护</a></li>
      	</c:if>
      	<c:if test="${role==4||role==0}">
        	<li class="${gridName=='scoreGrid'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=scoreGrid">积分操作管理</a></li>
      	</c:if>
		<c:if test="${role==4||role==0}">
        	<li class="${gridName=='sponsor'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=sponsor">友情链接管理</a></li>
      	</c:if>
      	<c:if test="${role==4||role==0}">
        	<li class="${gridName=='footer'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=footer">底边栏管理</a></li>
      	</c:if>
      	<c:if test="${role==4||role==0}">
        	<li class="${gridName=='advice'?'active':'' }">
        	<a href="${ctx}/template/login/toGrid?gridName=advice">意见</a></li>
      	</c:if>
      </ul>
    </div>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/slick.min.js"></script>
  <script>

  </script>
</body>

</html>
