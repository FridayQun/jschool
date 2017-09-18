<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset='utf-8'>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telphone=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<title>鲸客校园</title>
<link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
<link rel="stylesheet" href="${ctx}/resources/mobile/css/project.css">
<script>
	var ctx = '${ctx}';
</script>
</head>

<body>
	<div class="project-details">
		<ul class="project-list">
			<c:forEach var="item" items="${jkProjectList}">
				<li class="funds">
					<a href="  ">
							<div class="item-photo"><img src="${item.projPicPath}" alt=""></div>
							<div class="item-desc">
								<div class="item-title">
									<div class="item-title-text">
										<h3>${item.projName}</h3>
									</div>
									<strong class="cost">￥${item.moneyNeeds}</strong>
								</div>
								<p>
									<span><i class="icon small-user"></i>${item.username}</span>
									<span><i class="icon eye"></i>${item.browsevolume}人浏览/${item.applycount}人申请</span>
									<span><i class="icon clock"></i>${item.createTime}</span><br>
									<span><i class="icon small-local"></i>${item.projLocation} </span>
								</p>
								<p><i class="icon alarm"></i><span>${item.applyTime}</span><span>截止申请</span></p>
							</div>
					</a>
				</li>
			</c:forEach>


		</ul>
	</div>

	<script src="${ctx}/resources/mobile/js/moment.js"></script>
    <script src="${ctx}/resources/mobile/js/moment-with-locales.js"></script>
	<script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
	<script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
	<script src="${ctx}/resources/mobile/js/common.js"></script>
	<script>
	
		$( function(){
			 moment.locale('zh-cn');
			$('.clock').each(function(){
				$(this).parent('span').text((moment($(this).parent('span').text()).fromNow()))
			});
			
			
			
			
		})
	
		
	</script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
