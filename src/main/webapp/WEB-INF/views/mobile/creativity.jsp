<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
<title>创意大赛-鲸客校园</title>
<link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
<link rel="stylesheet" href="${ctx}/resources/mobile/css/creativity.css">
<script>
	var ctx = '${ctx}';
	<c:if test="${login_userId == null}">
		alert("请登录");
		window.location.href="${ctx}/mobile/login/toLogin";
	</c:if>
</script>
</head>
<body>
	<div class="top-bar">
		<div class="search-bar">
			<form class="searchForm" action="#" method="post">
				<input type="search" name="keyWords" value="" autocomplete="off"
					placeholder="请输入赞助、活动、学校等关键字">
			</form>
			<a href="${ctx }/mobile/login/toPublish" class="publish-link" style="line-height: 53px;color: white;font-size: 0.7rem;">发布</a>
		</div>
	</div>
	<div class="main-box">
		<div class="title-bar">
		<p style="
			position: absolute;
			bottom: -0.7rem;
			text-align: center;
			width: 100%;
		"><input style="
			margin: 0 1rem;
			border: 0;
			border-radius: 5px;
			line-height: 2rem;
			padding: 0 2rem;
			background: skyblue;
		" type='button' value='详情'><input style="
			margin: 0 1rem;
			border: 0;
			border-radius: 5px;
			line-height: 2rem;
			padding: 0 2rem;
			background: skyblue;
		" type='button' value='报名' onclick='javascript: window.open("toPublish", "_self");'></p>
	</div>
		<div class="filter-tools" style="display: none;">
			<div class="filter-bar">
				<div class="filter-opts">
					<span>点赞量</span><i class="arrows"></i>
				</div>
				<!--  <div class="filter-opts"><span>影响力</span><i class="arrows"></i></div> -->
			</div>
			<div class="filter-list-wrapper">
				<div class="filter-sort-list closed">
					<li class="sort-item">升序</li>
					<li class="sort-item">降序</li>
				</div>
				<div class="filter-sort-list closed">
					<li class="sort-item">升序</li>
					<li class="sort-item">降序</li>
				</div>
			</div>
		</div>
		<div class="creativity-list"></div>
		<div class="load-more">点击查看更多</div>
	</div>
	<div class="tab-bar">
    <div class="tab-item"><a href="${ctx}/mobile/login/toHome"><i class="tab-icon home-icon"></i><span>首页</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toProjectList"><i class="tab-icon project-icon"></i><span>项目</span></a></div>
    <div class="tab-item active"><a href="${ctx}/mobile/login/toHeadline"><i class="tab-icon rss-icon"></i><span>资讯</span></a></div>
    <div class="tab-item">
    	<c:if test="${login_userId!=null}">
	    	<a href="${ctx}/mobileuserino/toUserIndex"><i class="tab-icon user-icon"></i><span>我的</span></a>
    	</c:if>
    	<c:if test="${login_userId==null }">
	     <c:if test="${login_openId!=null }">
	    	<a href="${ctx}/mobileuserino/tomonewdphone"><i class="tab-icon user-icon"></i><span>我的</span></a>
	    </c:if>
	    <c:if test="${login_openId==null }">
	    	<a href="${ctx}/mobile/login/toLogin"><i class="tab-icon user-icon"></i><span>我的</span></a>
	    </c:if>
    	</c:if>
    </div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
    <script>
    $(function(){
      var tagid='${jkTags.id}'
      var sortStr = '';
      var page=1;
      var pageSize=10;
      var loadBtn = $('.load-more');
      var orderStr="admireCount desc";
      var $list=$('.creativity-list');
      function autoShow(num){
        num < 10 ? loadBtn.addClass('hide') : loadBtn.removeClass('hide');
      }

		function delnull(value) {
			if(value==null) {
				return 0;
			} else {
				return value;
			}
		}

		function loadMore(data) {
			var nodeList = data.map(function(item,index){
				return ('<div class="creativity-item"><div style="float: right;width: 18%;height: 104px;overflow: hidden;position: relative;"><span class="admire-number" style="position: absolute;top: 30%;left: 10%;width: 4em;text-align: center;overflow: hidden;white-space: nowrap;"><i class="icon icon-heart"></i>'+delnull(item.admireCount)+'</span><div class="author-link" data-id="67" style="position: absolute;top: 60%;left: 10%;">'+(item.admireUid==null?'支持TA':'已支持')+'</div></div><div class="detail-col"><p>\
					'+item.projName+'</p><p><span>'+item.username+'</span></p>\
					<p style="margin-bottom: 0;"><span>'+(item.companyName==null?item.eduName:item.companyName)+'</span></p></div><div class="base-info">\
					<a href="${ctx}/mobile/login/toProjectDetail?id='+item.id+'">\
					  <div class="creativity-photo"><img src="'+item.projPicPath+'" alt=""></div>\
					</a></div>\
					</div>'
				)
			});
			$('.creativity-list').append(nodeList.join(''));
		}

		$(".filter-bar .filter-opts").on('tap',function(){
			if($(".filter-sort-list").eq($(this).index()).hasClass('closed') == false) {
				$(".filter-sort-list").eq($(this).index()).addClass('closed')
				return false;
			}
			$(this).addClass('active').siblings().removeClass('active');
			$(".filter-sort-list").eq($(this).index()).removeClass('closed').siblings().addClass('closed');
			sortStr ='';
			sortStr += $(this).text();
			return false;
		});
		$(".filter-sort-list .sort-item").on('tap',function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			$(".filter-sort-list").addClass('closed');
			sortStr += $(this).text();
			console.log(sortStr);
			page=1;
			$list.empty()
			if(sortStr=="点赞量升序") {
				orderStr="admireCount desc";
			}else if(sortStr=="点赞量降序") {
				orderStr="admireCount asc";
			}
			$.ajax({
			    type: "GET",
			    url: ctx+"/project/getProjectList",
			    data: {
					"orderStr":orderStr,
					 "tags":tagid,
					 "page":page,
					 "pageSize":pageSize,
					 "isrecomment": 1
				},
				dataType: "json",
				success: function(data) {
					if(data.newsList.length>0) {
						loadMore(data.newsList);
					}
				}
			});
			return false;
		});
		//支持Ta按钮
		$('.creativity-list').on('tap','.author-link', function() {
			var admireNumber = $(this).parent().find('.admire-number')[0];
			if(!admireNumber ) {
				return false;
			}
			var $this = $(this);
			var $thistext = $(this).text();

			$.ajax({
				type: "POST",
				url: ctx + "/operate/admire",
				data: {
					"fid": $this.data('id'),
					"type": 1
				},
				dataType: "json",
				success: function(data) {
					console.log(data);
					if ($thistext == '支持TA') {
						for(var i=0; i< admireNumber.childNodes.length; i++) {
							if(admireNumber.childNodes[i].nodeName == '#text') {
								var num = parseInt(admireNumber.childNodes[i].textContent);
								if(num == NaN) {
									break;
								}
								num++;
								admireNumber.childNodes[i].textContent = num;
								break;
							}
						}
						$this.text('已支持');
					} else if ($thistext == '已支持') {
						for(var i=0; i<admireNumber.childNodes.length; i++) {
							if(admireNumber.childNodes[i].nodeName == '#text') {
								var num = parseInt(admireNumber.childNodes[i].textContent);
								if(num == NaN) {
									break;
								}
								num--;
								admireNumber.childNodes[i].textContent = num;
								break;
							}
						}
						$this.text('支持TA');
					}
				}
			});
			return false;
		});
		//载入更多
		$(".load-more").on('tap',function() {
			page++;
			$.ajax({
				type: "GET",
				url: ctx+"/project/getProjectList",
				data: {	
					"orderStr":orderStr,
					"tags":tagid,
					"page":page,
					"pageSize":pageSize,
					"isrecomment":1
				},
				dataType: "json",
				success: function(data) {   
					if(data.newsList.length>0) {
						loadMore(data.newsList);
					} else {
						page--;
						loadBtn.addClass('hide')
					}
				}
			 });
			return false;
		});

		$.ajax({
			type: "GET",
			url: ctx+"/project/getProjectList",
			data: {
				"orderStr":orderStr,
				"tags":tagid,
				"page":page,
				"pageSize":pageSize,
				"isrecomment":1
			},
			dataType: "json",
			success: function(data) {   
				if(data.newsList.length>0){
					loadMore(data.newsList);
				}
			}
		});
	});
  </script>
  <jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>
</html>