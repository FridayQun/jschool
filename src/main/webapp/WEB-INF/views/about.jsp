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
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/help.css">
	<link rel="stylesheet" href="${ctx}/resources/artcle/css/bootstrap.min.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
</head>

<body>
  <jsp:include page="head.jsp" flush="true"/>
 
  <div class="help-section">
    <div class="wrapper">
      <div class="help-box">
        <div class="help-sidebar">
          <div class="sidebar-header">
            <div class="sidebar-logo"><img src="${ctx}/resources/artcle/images/logo.png" alt=""></div>
            <p class="subtitle">一站式校园活动解决专家</p>
          </div>
          <ul class="help-nav">
          <c:forEach var="item" items="${foots }">
          	<li class="${pageName==item.footUri?'active':''}"><a href="${ctx}/${item.footLink }" data-uri="${item.footUri }">${item.footName }</a></li>
          </c:forEach>
<%--             <li class="${pageName=='about'?'active':''}"><a href="${ctx}/login/toHelp?pageName=about" data-uri="about">关于鲸客</a></li> --%>
<%--             <li class="${pageName=='invite'?'active':''}"><a href="${ctx}/login/toHelp?pageName=invite" data-uri="invite">招聘英才</a></li> --%>
<%--             <li class="${pageName=='contact'?'active':''}"><a href="${ctx}/login/toHelp?pageName=contact" data-uri="contact">联系我们</a></li> --%>
<%--             <li class="${pageName=='qa'?'active':''}"><a href="${ctx}/login/toHelp?pageName=qa" data-uri="qa">常见问题</a></li> --%>
<%--             <li class="${pageName=='guidance'?'active':''}"><a href="${ctx}/login/toHelp?pageName=guidance" data-uri="guidance">新手指导</a></li> --%>
<%--             <li class="${pageName=='rules'?'active':''}"><a href="${ctx}/login/toHelp?pageName=rules" data-uri="rules">平台规则</a></li> --%>
          </ul>
        </div>
        <div class="help-main" style="position: relative;">
			<c:forEach var="item" items="${foots }">
			<c:if test="${pageName==item.footUri }">
			<div class="main-title">${item.footName }</div>
			</c:if>
			</c:forEach>
			<div class="details-body">
<!-- 			  <p>鲸客网服务于校园社团，致力于为高校外联人打造专业校园服务平台的，以为校园活动提供从资金到执行的一站式解决方案为己任，整合校园市场的上下游资源，为品牌方、代理公司、学生社团以及第三方服务商，提供一个自由、安全的交易、交流渠道，实现校园活动与赞助商和服务商的一站式对接。</p> -->
				<div id='details-container' class='details-container'>
				<c:forEach var="detail" items="${details }">
					<img class='don-t-show' src="${detail.footPicPath }">
				</c:forEach>
				</div>
				<ul id='pagination' class="pagination" style="float: right;
					bottom: 0;
					position: absolute;
					right: 40px;
				">
<!-- 					<li><a href="#">&laquo;</a></li> -->
<!-- 					<li class="active"><a href="#">1</a></li> -->
<!-- 					<li><a href="#">&raquo;</a></li> -->
				</ul>
			</div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="foot.jsp" flush="true"/>
	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/bootstrap.min.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
		$(document).ready(function() {
			$('#pagination').append('<li><a href="#">&laquo;</a></li>');
			$('#details-container').children('img').each(function(index, item) {
				var page = $(format.call('<li><a href="#">{page}</a></li>', {
					'page': index+1
				}));
				$('#pagination').append(page);
			});
			$('#pagination').append('<li><a href="#">&raquo;</a></li>');
			$('#pagination > li > a').on('click', function() {
				var activeIndex = this.innerHTML;console.log(activeIndex);
				if(activeIndex == '«') {
					var next = parseInt($('#pagination > li > a.active').html());
					if(next <= 1) {
						return;
					}
					$('#pagination > li > a.active').removeClass('active');
					$('#pagination > li > a:eq('+(next-1)+')').addClass('active');
					$('#details-container img:eq('+(next-1)+')').addClass('don-t-show');
					$('#details-container img:eq('+(next-2)+')').removeClass('don-t-show');
				} else if(activeIndex == '»') {
					var pre = parseInt($('#pagination > li > a.active').html());
					if(pre >= $('#pagination > li').length-2) {
						return;
					}
					$('#pagination > li > a.active').removeClass('active');
					$('#pagination > li > a:eq('+(pre+1)+')').addClass('active');
					$('#details-container img:eq('+(pre-1)+')').addClass('don-t-show');
					$('#details-container img:eq('+(pre)+')').removeClass('don-t-show');
				} else {
					var curIndex = $('#pagination > li > a.active');
					curIndex.removeClass('active');
					$(this).addClass('active');
					$('#details-container img:eq('+(parseInt(curIndex.html())-1)+')').addClass('don-t-show');
					$('#details-container img:eq('+(activeIndex-1)+')').removeClass('don-t-show');
				}
			});
			
			$('#details-container img:first').removeClass('don-t-show');
			$('#pagination > li > a:eq(1)').addClass('active');
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
</body>

</html>
