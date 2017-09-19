<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<% request.setAttribute("today", new Date().getTime()); %>
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/list.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/luara.left.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>
  <style>
    .advice {
      height: 240px;
    }
    .advice:last-child {
    	margin-bottom: 0;
    }
    .view-button {
		display: block;
		width: 126px;
		line-height: 32px;
		background-color: #00acec;
		margin: 0 auto 2.4em auto;
		border-radius: 0.2em;
		text-align: center;
		color: #fff;
    }
  </style>
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <input type="hidden" id="pages" value="${pages }"/>
  <input type="hidden" id="pageSize" value="${pageSize }"/>
  <input type="hidden" id="keywords" value="${keywords }"/>
  <input type="hidden" id="tagName" value="${tagName }"/>
  <input type="hidden" name="projLocation" id="projLocation" value="不限"/>
  <div class="list-section" style="background: #f4f4f4;">
    <div class="wrapper">
      <div class="filter-box">
        <div class="filter-opts">
          <div class="filter-row firstcate">
            <div class="title">项目分类</div>
            <div class="tags">
              <c:if test="${firstCateId==null||firstCateId=='' }">
	              <a class="active" style="display: none;" href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:if test="${firstCateId!=null&&firstCateId!='' }">
	              <a href="#" style="display: none;"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:forEach var="firstCate" items="${cateList}" >
              	  <c:if test="${firstCateId==firstCate.id||thefirstCate.parentId==firstCate.id }">
		              <a href="#" class="active"><input type="hidden" value="${firstCate.id }"/>${firstCate.cateName }</a>              
              	  </c:if>
              	  <c:if test="${firstCateId!=firstCate.id&&thefirstCate.parentId!=firstCate.id }">
		              <a href="#"><input type="hidden" value="${firstCate.id }"/>${firstCate.cateName }</a>              
              	  </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="filter-row">
            <div class="title">分类详情</div>
            <div class="tags" id="secondCates">
              <c:if test="${firstCateId==null||firstCateId=='' }">
	              <a class="active" href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:if test="${firstCateId!=null&&firstCateId!='' }">
	              <a href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:forEach var="i" begin="0" end="${fn:length(secondCateList)-1 }" step="1" >
              	  <c:if test="${firstCateId==secondCateList[i].id }">
		              <a href="#" class="active" <c:if test="${i>=20 }">style="display: none;"</c:if>><input type="hidden" value="${secondCateList[i].id }"/>${secondCateList[i].cateName }</a>              
              	  </c:if>
              	  <c:if test="${firstCateId!=secondCateList[i].id }">
		              <a href="#" <c:if test="${i>=20 }">style="display: none;"</c:if>><input type="hidden" value="${secondCateList[i].id }"/>${secondCateList[i].cateName }</a>
              	  </c:if>
              </c:forEach>
            </div>
          </div>
          <div id="fz_secondCates" hidden>
<!-- 	          <a class="active" href="#"><input type="hidden" value=""/>全部</a> -->
              <c:forEach var="secondCate" items="${secondCateList}" >
		        <a href="#" data-parentid="${secondCate.parentId}"><input type="hidden" value="${secondCate.id }"/>${secondCate.cateName }</a>              
              </c:forEach>
          </div>
		  <div id="show-more" style="display: none;">
			<p style="
				text-align: center;
			"><a href="#" style="
				padding: 0px 40%;
				background: #eae8ec;
				">显示更多</a></p>
			</div>
          <div class="filter-row">
            <div class="title">项目类型</div>
            <div class="tags">
              <c:if test="${projType==null }">
	              <a class="active" href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:if test="${projType!=null }">
	              <a href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:if test="${projType==0 }">
	              <a class="active" href="#"><input type="hidden" value="0"/>赞助</a>
              </c:if>
              <c:if test="${projType!=0 }">
	              <a href="#"><input type="hidden" value="0"/>赞助</a>
              </c:if>
              <c:if test="${projType==1 }">
	              <a class="active" href="#"><input type="hidden" value="1"/>供给</a>
              </c:if>
              <c:if test="${projType!=1 }">
	              <a href="#"><input type="hidden" value="1"/>供给</a>
              </c:if>
            </div>
          </div>
          <div class="filter-row">
            <div class="title">标签类型</div>
            <div class="tags">
              <c:if test="${tagName==null||tagName=='' }">
                	<a class="active" href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:if test="${tagName!=null&&tagName!='' }">
              	    <a href="#"><input type="hidden" value=""/>全部</a>
              </c:if>
              <c:forEach var="jkTag" items="${jkTagList}" >
                <c:if test="${tagName==jkTag.tagName }">
	              	<a class="active"  href="#" ><input type="hidden" value="${jkTag.id }"/>${jkTag.tagName}</a>              
                </c:if>
                <c:if test="${tagName!=jkTag.tagName }">
	              	<a href="#"><input type="hidden" value="${jkTag.id }"/>${jkTag.tagName}</a>              
                </c:if>
              </c:forEach>
            </div>
          </div>
          <div style="display: none;" class="filter-row">
            <div class="title">项目状态</div>
            <div class="tags">
              <a class="active" href="#"><input type="hidden" value=""/>全部</a>
              <a href="#"><input type="hidden" value="3"/>申请中</a>
            </div>
          </div>
          <div class="filter-row fold">
            <div class="title">地区限制</div>
            <div class="tags district-select">
              <!-- 这里有改动 4-13 -->
              <select class="province" name="province1" style="min-width: 150px;" >
              </select>
              <select class="city" name="city1" style="min-width: 150px;" >
              </select>
            </div>
          </div>
        </div>
        <div style="width: 305px;position: absolute;top: -1px;right: -1px;bottom: -1px;background: #f4f4f4;border-left: 1px solid rgb(210, 210, 210);border-top: 1px solid #f4f4f4;border-bottom: 1px solid #f4f4f4;z-index: 1;"></div>
		<div class="advertising" style="border: 1px solid #d2d2d2; z-index: 10; background: white;">
			<!-- <a href="${projectAd.url}"><img src="${projectAd.image}" alt=""></a> -->
			<ul>
			<c:if test="${projectAds != null}">
			<c:forEach var="projectAd" items="${projectAds }">
				<li><a href="${projectAd.url}"><img style="width: 275px;height: 313px;padding: 9px;" src="${projectAd.image}" alt="1"/></a></li>
			</c:forEach>
			</c:if>
			<c:if test="${projectAds == null}">
				<li><a href="#"><img src="" alt="1" /></a></li>
			</c:if>
			</ul>
			<ol>
			<c:if test="${projectAds != null}">
			<c:forEach var="projectAd" items="${projectAds }">
				<li></li>
			</c:forEach>
			</c:if>
			<c:if test="${projectAds == null}">
				<li></li>
			</c:if>
			</ol>
		</div>
      </div>
      <!-- 项目推荐 -->
      <div id="recomment-container" style="float: right;width: 23.7%;margin: 16px 0; background-color: #fff; border: 1px solid #d2d2d2;">
        <div style="
        height: 65px;
        padding: 0 20px;
        line-height: 64px;">
          <a style="
          vertical-align: middle;
          color: #c5c5c5; font-size: 23px;" href="#" >项目推荐</a>
        </div>
        <c:forEach var="recomment" items="${recomments}" >
        	<hr style=" margin: 0 10px; padding: 0; ">
          <div class='advice'>
	            <div class="col c1">
	              <a href="${ctx}/login/toProjectDetail?id=${recomment.t}"><img style="
    width: 90%;
    height: 130px;
    margin: 5px 5%;
" src="${recomment.projPicPath }" alt=""></a>
	            </div>
	            <div class="col c2">
	              <h3 style="margin: 10px 0 0px 0; padding: 0 9%;"><a href="${ctx}/login/toProjectDetail?id=${recomment.t}"><span style="white-space: nowrap; text-overflow: ellipsis; overflow-x: hidden; width: 52%; display: inline-block;" class="blue-font">${recomment.projName }</span><span style=" font-weight: normal; font-size: 80%; color: gainsboro; float: right; vertical-align: top ">浏览量：${recomment.browsevolume }</span></a></h3>
	              <p style="padding: 0 9%; margin: 5px 0 5px 0;"><span><i class="icon figure"></i>${recomment.username }<i class="icon <c:if test="${recomment.gender==2 }">gender-girl</c:if><c:if test="${recomment.gender!=2 }">gender-boy</c:if>"></i><span style="margin-left: 10px;"><i class="icon influence"></i>${recomment.influence }</span></span>
				    <span style="float: right;width: 40%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis; text-align: right;"><c:if test="${recomment.companyName!=null }">${recomment.companyName }</c:if>
	                <c:if test="${recomment.eduName!=null }">${recomment.eduName }</c:if></span></p>
	              <p style="padding: 0 9%; margin: 5px 0 5px 0;"><span style="color: orange;">￥${recomment.moneyNeeds }</span>
                  <span style="float: right;"><i class="icon clock"></i><fmt:formatNumber type="number" value="${(today-(recomment.createTime==null?today:recomment.createTime.time))/1000/3600/24 }" maxFractionDigits="0"/>天前</span>
				  </p>
	            </div>
	          </div>
        </c:forEach>
        </div>
      <!-- 项目推荐 end -->
      <div class="list-box" style="width: 75%;min-height: 1211px; padding-bottom: 90px; box-sizing: content-box;">
        <div class="list-sort-bar" style="border-bottom: none;">
          <a href="#" class="title">默认</a>
          <a href="##"  data-sort="s1"  class="sort-btn">热度<i class="icon down"></i></a>
          <a href="##"  data-sort="s3"  class="sort-btn">申请数<i class="icon down"></i></a>
          <a href="##"  data-sort="s2"  class="sort-btn">金额<i class="icon down"></i></a>
        </div>
        <hr style="margin: 0 10px;">
        <ul class="result-list" style="margin: 0 10px;">
          <c:forEach var="jkProject" items="${jkProjectList}" >
	          <li style="padding: 32 12px;">
              <c:if test="${jkProject.projType==1}"><div class="col c1 superscript-supply"></c:if>
	            <c:if test="${jkProject.projType!=1}"><div class="col c1 superscript-needed"></c:if>
	              <a href="${ctx}/login/toProjectDetail?id=${jkProject.id}"><img src="${jkProject.projPicPath }" alt=""></a>
	            </div>
	            <div class="col c2" style="width: 530px;">
	              <h3><a href="${ctx}/login/toProjectDetail?id=${jkProject.id}"><span class="blue-font">${jkProject.projName }</span></a></h3>
	              <p><span><i class="icon figure"></i>${jkProject.username }</span><span><i class="icon eye"></i>${jkProject.browsevolume }人浏览/0人申请</span><span><i class="icon clock"></i><fmt:formatDate value="${jkProject.createTime }" pattern="yyyy-MM-dd"/></span></p>
	              <p>
				    <c:if test="${jkProject.companyName!=null }">${jkProject.companyName }</c:if>
	                <c:if test="${jkProject.eduName!=null }">${jkProject.eduName }</c:if>
				  </p>
	              <div class="remaining-time" style="text-align: left;"><span class="red-font"><i class="icon alarm"></i><fmt:formatDate value="${jkProject.applyTime }" pattern="yyyy年MM月dd日"/></span><span>后截止申请</span><small class="orange-font">500</small><span class="tag">置顶</span><span class="tag">自营</span></div>
	            </div>
	            <div class="col c3">
					<div class="col-inner">
						<p><a href="${ctx}/login/toProjectDetail?id=${jkProject.id}" class="view-button">查看</a></p>
					</div>
	            </div>
	          </li>         
          </c:forEach>
        </ul>
      </div>
      <div class="paging-bar" style="margin: -6em 0 2em 0; box-sizing: border-box; padding-right: 20px;">
        <div class="paging-info total">共${total}个项目</div>
        <div class="paging-box">
<!--           <a href="#" class="prev">&#60;</a> -->
<!--           <a href="#" class="pagination">2</a> -->
<!--           <a href="#" class="pagination">3</a> -->
<!--           <a href="#" class="next">&#62;</a> -->
        </div>
      </div>
<!--       <div class="recommend-box"> -->
<!--         <div class="recommend-title">猜你喜欢</div> -->
<!--         <ul class="recommend-list"> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-list-i.png" alt=""></div> --%>
<!--               <div class="project-intro"> -->
<!--                 <h3>上海地区50人教室</h3> -->
<!--                 <p><span class="orange-font">￥500.00</span></p> -->
<!--               </div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-list-i.png" alt=""></div> --%>
<!--               <div class="project-intro"> -->
<!--                 <h3>上海地区50人教室</h3> -->
<!--                 <p><span class="orange-font">￥500.00</span></p> -->
<!--               </div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-list-i.png" alt=""></div> --%>
<!--               <div class="project-intro"> -->
<!--                 <h3>上海地区50人教室</h3> -->
<!--                 <p><span class="orange-font">￥500.00</span></p> -->
<!--               </div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-list-i.png" alt=""></div> --%>
<!--               <div class="project-intro"> -->
<!--                 <h3>上海地区50人教室</h3> -->
<!--                 <p><span class="orange-font">￥500.00</span></p> -->
<!--               </div> -->
<!--             </a> -->
<!--           </li> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="project-photo"><img src="${ctx}/resources/artcle/images/project-list-i.png" alt=""></div> --%>
<!--               <div class="project-intro"> -->
<!--                 <h3>上海地区50人教室</h3> -->
<!--                 <p><span class="orange-font">￥500.00</span></p> -->
<!--               </div> -->
<!--             </a> -->
<!--           </li> -->
<!--         </ul> -->
<!--       </div> -->
    </div>
  </div>
  
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jquery.luara.0.0.1.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jQuery.page.js"></script>
  <script src="${ctx}/resources/artcle/js/districts.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
$(function() { // < !--调用Luara示例-->
	// 轮播
	$(".advertising").luara({
		width: "295",
		height: "333",
		interval: 4500,
		selected: "seleted",
		deriction: "left"
	});
});

var pageBox = null;

$(function() {
	var login_userId = '<%=session.getAttribute("login_userId")%>';
	var keywords = $("#keywords").val();
	var orderStr = null;
	var nowClickCateObj = null;

	var $filterTags = $('.filter-opts .tags a');
	var $resultList = $('.result-list');
	//更新列表
	function updateList(data) {
		console.log(data);
		console.log('updateList');
		data = data.newsList;
		if (data && data.length > 0) {
			var nodeList = data.map(function(item, index) {
				var t1 = new Date(item.createTime).Format("yyyy-MM-dd hh:mm:ss");
				var t2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
				var t3 = new Date(item.applyTime).Format("yyyy-MM-dd hh:mm:ss");
				var days = Math.ceil((new Date().getTime()-(item.createTime==null?new Date().getTime():item.createTime))/1000/3600/24);
				var applyDays = diffTime(item.status, new Date(), new Date(item.applyTime));
				var companyOrEduName = "";
				if (item.eduName != null) companyOrEduName = item.eduName;
				if (item.companyName != null) companyOrEduName = item.companyName;
				var nodeStr = '';
				if (item.projType == 0) nodeStr = '<li style="padding: 32px 12px;"><div class="col c1 superscript-needed"><a href="' + ctx + '/login/toProjectDetail?id=' + item.id + '"><img src="' + item.projPicPath + '" alt=""></a></div><div class="col c2" style="width: 530px;"><h3 style="margin-top: 8px; margin-bottom: 8px;"><a href="' + ctx + '/login/toProjectDetail?id=' + item.id + '"><span style="vertical-align: top;" class="blue-font">' + item.projName + '</span>';
				if (item.projType == 1) nodeStr = '<li style="padding: 32px 12px;"><div class="col c1 superscript-supply"><a href="' + ctx + '/login/toProjectDetail?id=' + item.id + '"><img src="' + item.projPicPath + '" alt=""></a></div><div class="col c2" style="width: 530px;"><h3 style="margin-top: 8px; margin-bottom: 8px;"><a href="' + ctx + '/login/toProjectDetail?id=' + item.id + '"><span style="vertical-align: top;" class="blue-font">' + item.projName + '</span>';
				var admireStr = '<a href="#" class="good-btn" data-admire="' + item.id + '"><i class="icon good"></i></a>';
				var collectStr = '<a href="#" class="favorite-btn" data-collect="' + item.id + '"><i class="icon star"></i></a>';
				var shareStr = '<a href="#" class="share-btn"><i class="icon share"></i></a>';
				if (item.admireUid != null && login_userId != 'null') admireStr = '<a href="#" class="good-btn active" data-admire="' + item.id + '"><i class="icon good"></i></a>';
				if (item.collectUid != null && login_userId != 'null') collectStr = '<a href="#" class="favorite-btn active" data-collect="' + item.id + '"><i class="icon star"></i></a>';
				nodeStr += '</a></h3><p style="margin-top: 7px; margin-bottom: 7px;"><span><i class="icon figure"></i>' + item.username + (item.gender==2?'<i class="icon gender-girl"></i>':'<i class="icon gender-boy"></i>') + '</span><span><i class="icon influence"></i>'+item.influence+'</span><span><i class="icon eye"></i>' + item.browsevolume + '人浏览/' + item.applycount + '人申请</span><span><i class="icon clock"></i>' + days + '天前</span></p><p style="margin-top: 7px;">' + companyOrEduName + '</p><div style="text-align: left;" class="remaining-time"><span class="red-font"><i class="icon alarm"></i>' + applyDays + '</span>'+(applyDays!='已截止'?'<span>后截止申请</span>':'')+'<small class="orange-font">￥' + item.moneyNeeds + '</small>';
				if (item.istop != 0) nodeStr += '<span class="tag">置顶</span>';
				if (item.username == '鲸客校园') nodeStr += '<span class="tag">自营</span>';
				nodeStr += '</div></div><div class="col c3"><div class="col-inner"><p><a href="${ctx}/login/toProjectDetail?id=' + item.id + '" class="view-button"><input type="hidden" value="' + item.uid + '"/>查看</a></p></div></div></li>';
				return nodeStr;
			});
			$resultList.empty().append(nodeList.join(''));
		} else {
			$resultList.empty().append('<div class="empty-hint">没有找到匹配的项目！</div>');
		}
// 		$('#recomment-container').outerHeight($resultList.parent().outerHeight());
	}
	//计算天数差的函数，通用  
	function getDays(sDate1, sDate2) { //sDate1和sDate2是2006-12-18格式  
		var aDate, oDate1, oDate2, iDays;
		aDate = sDate1.split("-");
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]); //转换为12-18-2006格式  
		aDate = sDate2.split("-");
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 3600000 / 24);
		return iDays
	}
	//计算两个日期之间差
	function diffTime(status, startDate, endDate) {
		if (status == '-1') {
			return "已截止";
		}
		var diff = endDate.getTime() - startDate.getTime(); //时间差的毫秒数    	  
		//计算出相差天数  
		var days = Math.floor(diff / (24 * 3600 * 1000));
		//计算出小时数  
		var leave1 = diff % (24 * 3600 * 1000); //计算天数后剩余的毫秒数  
		var hours = Math.floor(leave1 / (3600 * 1000));
		var returnStr = "已截止";
		if (hours > 0 || days > 0) {
			returnStr = "";
		}
		if (hours > 0) {
			returnStr = hours + "小时" + returnStr;
		}
		if (days > 0) {
			returnStr = days + "天" + returnStr;
		}
		return returnStr;
	}
	//格式化时间
	Date.prototype.Format = function(fmt) { //author: meizz 
		var o = {
			"M+": this.getMonth() + 1,
			//月份 
			"d+": this.getDate(),
			//日 
			"h+": this.getHours(),
			//小时 
			"m+": this.getMinutes(),
			//分 
			"s+": this.getSeconds(),
			//秒 
			"q+": Math.floor((this.getMonth() + 3) / 3),
			//季度 
			"S": this.getMilliseconds() //毫秒 
		};
		if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o) if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	}
	$('#show-more a').on('click', function() {
		$('#secondCates').children('a').show();
		$('#show-more').hide();
	});
	//分页
// 	console.log('createPage:'+$("#pages").val());
// 	$(".paging-box").createPage({
// 		pageCount: $("#pages").val(),
// 		current: 1,
// 		backFn: function(curr) {
// 			var cid = $(".filter-row:eq(0) a.active input").val();
// 			if ($(".filter-row:eq(1) a.active input").val() != '' && $(".filter-row:eq(1) a.active input").val() != null) cid = $(".filter-row:eq(1) a.active input").val();
// 			var projType = $(".filter-row:eq(2) a.active input").val();
// 			var tag = $(".filter-row:eq(3) a.active input").val();
// 			var status = $(".filter-row:eq(4) a.active input").val();
// 			var projLocation = $("#projLocation").val();
// 			if (cid == '') cid = null;
// 			if (projType == '') projType = null;
// 			if (tag == '') tag = null;
// 			if (status == '') status = null;
// 			if (projLocation == '不限' || projLocation == '') projLocation = null;
// 			$.ajax({
// 				type: "GET",
// 				url: ctx + "/project/getProjectList",
// 				data: {
// 					"parentCid": cid,
// 					"projType": projType,
// 					"projName": keywords,
// 					"tags": tag,
// 					"status": status,
// 					"projLocation": projLocation,
// 					"page": curr,
// 					"pageSize": $("#pageSize").val(),
// 					"orderStr": orderStr
// 				},
// 				dataType: "json",
// 				success: function(data) {
// 					updateList(data);
// 				}
// 			});
// 		}
// 	});
	//二级类目筛选
	$(".firstcate a").on("click",
	function() {
		$(this).addClass('active').siblings().removeClass('active');
		var $parentId = $(this).find("input")[0].value;
		var firstCateId = '${firstCateId}';
		var count = 0;
		if ($parentId != '' && $parentId != null) {
			var $tags = $("#secondCates");
			var $fz_tags = $("#fz_secondCates a");
			$tags.empty();
			$tags.append('<a class="active" href="#"><input type="hidden" value=""/>全部</a>');
			$.each($fz_tags,
			function(index, item) {
				if ($(this).attr('data-parentid') == $parentId) {
					count++;
					if (firstCateId == $(this).find("input")[0].value) {
						if(count <= 20) {
							$tags.append('<a href="#" class="active"><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
						} else {
							$tags.append('<a href="#" style="display: none;" class="active"><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
						}
					} else {
						if(count <= 20) {
							$tags.append('<a href="#"><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
						} else {
							$tags.append('<a href="#" style="display: none;" ><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
						}
					}
				}
			});
		} else {
			var $tags = $("#secondCates");
			var $fz_tags = $("#fz_secondCates a");
			$tags.empty();
			$tags.append('<a class="active" href="#"><input type="hidden" value=""/>全部</a>');
			$.each($fz_tags,
			function(index, item) {
				count++;
				if(count <= 20) {
					$tags.append('<a href="#"><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
				} else {
					$tags.append('<a style="display: none;" href="#"><input type="hidden" value="' + $(this).find("input")[0].value + '"/>' + $(this).text() + '</a>');
				}
			});
		}
		if(count > 20) {
			$('#show-more').show();
		} else {
			$('#show-more').hide();
		}
		nowClickCateObj = $(this);
		tagClick();
		$(".filter-row:eq(1) a.active").click();
		return false;
	});
	//分类点击事件
	$("body").on("click", ".filter-opts:not('.firstcate') a",
	function() {
		$(this).addClass('active').siblings().removeClass('active');
		nowClickCateObj = $(this);
		tagClick();
		return false;
	});
	//首次加载，模拟一个点击事件
	$(".filter-row:eq(0) a.active").click();
	//点击事件调用的方法
	function tagClick() {
		console.log('tagClick');
		setTimeout(function() {
			//筛选条件	
			var cid = $(".filter-row:eq(0) a.active input").val();
			if ($(".filter-row:eq(1) a.active input").val() != '' && $(".filter-row:eq(1) a.active input").val() != null) cid = $(".filter-row:eq(1) a.active input").val();
			var projType = $(".filter-row:eq(2) a.active input").val();
			var tag = $(".filter-row:eq(3) a.active input").val();
			var status = $(".filter-row:eq(4) a.active input").val();
			var projLocation = $("#projLocation").val();
			if (cid == '') cid == null;
			if (projType == '') projType == null;
			if (tag == '') tag == null;
			if (status == '') status == null;
			if (projLocation == '不限' || projLocation == '') projLocation = null;
			$.ajax({
				type: "GET",
				url: ctx + "/project/getProjectList",
				data: {
					"parentCid": cid,
					"projType": projType,
					"projName": keywords,
					"tags": tag,
					"status": status,
					"projLocation": projLocation,
					"page": 1,
					"pageSize": $("#pageSize").val(),
					"orderStr": orderStr
				},
				dataType: "json",
				success: function(data) {
					updateList(data);
					$(".total").text("共" + data.total + "个项目");
					$("#pages").val(data.pages);
					console.log('createPage');
					$(".paging-box").remove();
					$('.paging-bar').append('<div class="paging-box"></div>');
					$(".paging-box").createPage({
						pageCount: $("#pages").val(),
						current: 1,
						backFn: function(curr) {
							var cid = $(".filter-row:eq(0) a.active input").val();
				 			if ($(".filter-row:eq(1) a.active input").val() != '' && $(".filter-row:eq(1) a.active input").val() != null) cid = $(".filter-row:eq(1) a.active input").val();
				 			var projType = $(".filter-row:eq(2) a.active input").val();
				 			var tag = $(".filter-row:eq(3) a.active input").val();
// 				 			var status = $(".filter-row:eq(4) a.active input").val();
				 			var projLocation = $("#projLocation").val();
				 			if (cid == '') cid = null;
				 			if (projType == '') projType = null;
				 			if (tag == '') tag = null;
				 			if (status == '') status = null;
				 			if (projLocation == '不限' || projLocation == '') projLocation = null;
				 			$.ajax({
				 				type: "GET",
				 				url: ctx + "/project/getProjectList",
				 				data: {
				 					"parentCid": cid,
				 					"projType": projType,
				 					"projName": keywords,
				 					"tags": tag,
				 					"status": status,
				 					"projLocation": projLocation,
				 					"page": curr,
				 					"pageSize": $("#pageSize").val(),
				 					"orderStr": orderStr
				 				},
				 				dataType: "json",
				 				success: function(data) {
				 					updateList(data);
				 				}
				 			});
						}
					});
				}
			});
		});
		return false;
	}

	//选择地区
	$('.district-select').each(function(item, index) {
		var $province = $(this).find('select').eq(0);
		var $city = $(this).find('select').eq(1);
		var code = getDistrictCode($city.attr('value'));
		provinceAndCity($province, $city, code.province, code.city);
	});

	$('.district-select select').on('change',
	function() {
		var p = $('.district-select select').eq(0).find('option:checked').text();
		var c = $('.district-select select').eq(1).find('option:checked').text();
		$("#projLocation").val(p + ":" + c);
		if (p == "不限") {
			$("#projLocation").val("");
		}
		tagClick();
	})

	//排序按钮
	$('.title').on('click',
	function() {
		orderStr = '';
		$('.list-sort-bar a.sort-btn').removeClass('active');
		nowClickCateObj.click();
	});
	$('.list-sort-bar a.sort-btn').on('click',
	function() {
		$(this).toggleClass('active');
		orderStr = '';
		if ($(this).hasClass('active')) {
			if ($(this).data('sort') == 's1') orderStr = 'admireCount asc';
			else if ($(this).data('sort') == 's2') orderStr = 'moneyNeeds asc';
			else if ($(this).data('sort') == 's3') orderStr = 'applycount asc';
		} else {
			if ($(this).data('sort') == 's2') orderStr = 'moneyNeeds desc';
			else if ($(this).data('sort') == 's1') orderStr = 'admireCount desc';
			else if ($(this).data('sort') == 's3') orderStr = 'applycount desc';
		}

		nowClickCateObj.click();

	});

	$('.unfold-btn').on('click',
	function() {
		$(this).parents('.filter-row').toggleClass('fold');
		return false;
	});

	function createOnce(str) {
		var span = document.createElement('span');
		span.style.opacity = 1;
		span.style.display = 'inline-block';
		span.style.width = '5px';
		span.style.left = '-2px';
		span.style.backgroundImage = 'url()';
		span.innerHTML = str;
		span.style.position = 'absolute';
		span.style.top = '-10px';
		span.style.transitionDuration='2s';
		return span;
	}
	
	$('body').on('click', '.result-list .c3 .good-btn',
	function(e) {
		console.log('点赞按钮');
		return false;
	});

	$('body').on('click', '.result-list .c3 .favorite-btn',
	function(e) {
		console.log('收藏按钮');
		return false;
	});

	$('body').on('click', '.result-list .c3 .share-btn',
	function() {
		console.log('分享按钮');
		return false;
	});

	$('body').on('click', '.result-list .c3 .good-btn',
	function(e) {
		if (login_userId == 'null') {
			alert('未登录！');
			return;
		}
		$.ajax({
			type: "POST",
			url: ctx + "/operate/admire",
			data: {
				"fid": $(this).data('admire'),
				"type": 1
			},
			dataType: "json",
			success: function(data) {}
		});
		var str = '+1';
		if($(this).hasClass('active')) {
			str = '-1';
		}
		var once = createOnce(str);
		e.target.appendChild(once);
		e.target.style.position = 'relative';
		setTimeout(function() {
			once.style.opacity = '0';
			once.style.top = '-30px';
		}, 0);
		setTimeout(function() {
			e.target.removeChild(once);
		}, 2000);
		$(this).toggleClass('active');
		return false;
	});

	$('body').on('click', '.result-list .c3 .favorite-btn',
	function() {
		var $self = $(this);
		if (!$(this).hasClass('active')) {
			if (login_userId == 'null') {
				alert('未登录！');
				return;
			}
			$.ajax({
				type: "POST",
				url: ctx + "/operate/collect",
				data: {
					"fid": $(this).data('collect'),
					"type": 1
				},
				dataType: "json",
				success: function(data) {
					$self.addClass('active')
				}
			});
		}
		if(!$(this).hasClass('active')) {
			var once = createOnce('+1');
			e.target.appendChild(once);
			e.target.style.position = 'relative';
			setTimeout(function() {
				once.style.opacity = '0';
				once.style.top = '-30px';
			}, 0);
			setTimeout(function() {
				e.target.removeChild(once);
			}, 2000);
		}
		return false;
	});

	$('body').on('click', '.result-list .c3 .share-btn',
	function() {
		console.log('分享按钮');
		return false;
	});

	var $smsBox = $(".sms-box");
	var toId = null;
	$('body').on('click', '.contact-link',
	function() {
		if (login_userId == 'null') {
			alert('未登录！');
			return false;
		} else if (login_userId == $(this).find("input").val()) {
			alert('这是您自己的项目！');
			return false;
		}
		toId = $(this).find("input").val();
		$smsBox.removeClass('hide');
		return false;
	});
	$smsBox.on('click',
	function(e) {
		if (e.target === $smsBox[0]) {
			$smsBox.addClass('hide');
		}
	});
	$(".form-submit input[name=submit]").on('click',
	function() {
		var message = $("#message-input").val();
		$.ajax({
			type: "POST",
			url: ctx + "/mesg/addmesg",
			data: {
				toId: toId,
				content: message,
				type: 0
			},
			aysnc: true,
			dataType: "json",
			success: function(data) {
				alert("发送成功！");
				$smsBox.addClass('hide');
			}
		});
		return false;
	})
});
  </script>
</body>

</html>
