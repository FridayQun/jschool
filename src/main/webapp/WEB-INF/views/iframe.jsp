<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>yunbao</title>
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>

<body>
	<p>
		My Editor:<br>
		<textarea name="editor1" id="editor1" rows="10" cols="80">
            	初始化内容
        </textarea>
		<script>
			// Replace the <textarea id="editor1"> with a CKEditor
			// instance, using default configuration.
			CKEDITOR.replace('editor1', {
				filebrowserBrowseUrl : '',
				filebrowserUploadUrl : 'upload1',
			});
		</script>
	</p>
</body>
</html>
