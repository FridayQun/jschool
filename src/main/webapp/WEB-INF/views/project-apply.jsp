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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/apply.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/wangEditor.min.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <!-- 副文本编辑器 -->
  <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
  
  <script>var ctx = '${ctx}';</script>  
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  <input type="hidden" id="applyStatus" value="${applyStatus }"/>
  <div class="apply-section">
    <div class="wrapper">
      <div class="apply-title">
        <p>项目申请</p>
        <h3>${projName}</h3>
      </div>
      <div class="apply-content">
        <div class="apply-content-title">我要申请</div>
        <div class="apply-input-box">
          <form class="applyForm" action="${ctx}/project/applier" method="post" id="apply_form">
         		<input type="hidden" value="${projId}" name="pid" id="pid"/>
	            <textarea name="words" id="words" rows="10" cols="80"></textarea>
							<script>
								// Replace the <textarea id="editor1"> with a CKEditor
								// instance, using default configuration.
								CKEDITOR.replace('words', {
									filebrowserBrowseUrl : '',
									filebrowserUploadUrl : ctx+'/artcle/upload1',
									toolbar: [
				 						['Undo', 'Redo']
				 					]
								});
							</script>
				<div class="form-submit-group">
					<button type="submit"  >提 交</button>
					<button type="reset" name="reset">取 消</button>
				</div>
                </form>
            </div>
        </div>
      </div>
    </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
  $(document).ready(function (){
	  var applyStatus = $("#applyStatus").val();
	  if(applyStatus!=null&&applyStatus!=''){
		  alert(applyStatus);
	  }	  
  });
  </script>
</body>

</html>
