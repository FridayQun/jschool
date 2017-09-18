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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/page.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
</head>

<body>
  <jsp:include page="head.jsp" flush="true"/>
  <div class="single-page">
    <div class="wrapper">
      <div class="page-inner">
       <p>公告标题：</p>
       <p>${JkSysMesg.title}</p>
       <p>公告内容：</p>
       <p>${JkSysMesg.content}</p>
      </div>
    </div>
  </div>
  <jsp:include page="foot.jsp" flush="true"/>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>

</body>

</html>
