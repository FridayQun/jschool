<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="pageSize" value="5"/>
<!DOCTYPE html>
<html lang="zh">
<body>
  <div class="m-header-left">
    <div class="logo">
      <a href="#"><img src="${ctx}/resources/template/images/small-logo.png" alt=""></a>
    </div>
    <h4>后台管理系统</h4>
  </div>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/slick.min.js"></script>
  <script>
  </script>
</body>

</html>
