<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="pageSize" value="5"/>

<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="鲸客校园,鲸客网,校园赞助,校园活动,校园推广,技能服务,校园营销,校园红人,校园自媒体">
  <meta name="description" content="鲸客校园,鲸客网,校园赞助,校园活动,校园推广,技能服务,校园营销,校园红人,校园自媒体">
  <meta name="author" content="">
  <title>JingKe</title>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/slick.min.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/home.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
    <script>
    var ctx = '${ctx}';
    var pageSize = '${pageSize}';
	//alert('<% out.print((null+"123").length()); %>')
  </script>

	<style>
	li.demand:before {
		right: 5px !important;
	}
	li.demand:after {
		right: 12px !important;
	}
	li.supply:before {
		right: 5px !important;
	}
	li.supply:after {
		right: 12px !important;
	}
	td.demand:before {
		right: 14px !important;
	}
	td.demand:after {
		right: 20px !important;
	}
	td.supply:before {
		right: 14px !important;
	}
	td.supply:after {
		right: 20px !important;
	}
	.hover-display>a>p {
		visibility: hidden;
	}
	.hover-display:HOVER>a>p {
		visibility: visible;
	}
	</style>
</head>

<body class="home">
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <input type="hidden" id="supportCateId" value="${supportCate }"/>
  <div class="banner">
    <div class="banner-slick">
      <c:forEach var="bunnerImg" items="${bunnerImgList}" >
	      <div><a href="${bunnerImg.url}" style="background-image:url('${bunnerImg.image}')"></a></div>
      </c:forEach>
    </div>
  </div>
  <div class="home-main">
    <div class="wrapper">
      <div class="home-main-notice">
        <div class="notice-title"><i class="icon notice"></i>公告：</div>
        <div class="notice-roll">
          <div class="roll-box">
          	 <c:forEach var="mesg" items="${mesgList}" >
           		 <a href="${ctx}/user/toNoticeById?id=${mesg.id}">${mesg.title }</a>
           	 </c:forEach>
          </div>
        </div>
      </div>
      <div class="section">
        <div class="section-title-bar">
          <div class="section-title"><i class="icon sponsor"></i>校园赞助</div>
          <div class="section-tags">
          
          	<c:forEach var="supportCate" items="${supportCateList}" begin='0' end='4'>
          		<a href="${ctx}/project/getProjectList?isrecomment=3&cid=${supportCate.id}&page=1&pageSize=10" data-cid="${supportCate.id}">${supportCate.cateName}</a>
          	</c:forEach>
          </div>
          <div class="section-more"><a href="${ctx}/login/toProjectList?firstCateId=${supportCateList[0].parentId}">更多<br><small>MORE</small></a></div>
        </div>
        <div class="section-list-block">
          <ul class="section-list" style="padding-left: 25px;padding-right: 25px;">        
              <c:forEach var="supportProject" items="${supportProjectList}" >
	          	<li class="${supportProject.projType==0?'demand':'supply'}">
	              <a href="${ctx}/login/toProjectDetail?id=${supportProject.id}">
	                <div class="photo"><img src="${supportProject.projPicPath }" alt=""></div>
	                <div class="desc">
	                  <div class="desc-row">
	                    <div class="col-l">${supportProject.projName}</div>
	                    <div style="line-height: 16px;width: 30%;" class="col-r"><span style=" vertical-align: middle; margin-right: 2px;">浏览量</span><span style="font-size: 12px;line-height: 20px; vertical-align: top;">${supportProject.browsevolume}</span></div>
	                  </div>
	                  <div class="desc-row">
	                  	<div class="col-l font12" style="line-height: 1.5em;">${supportProject.username}<c:if test="${supportProject.gender==2 }"><i style="margin-left: 4px;" class="icon gender-girl"></i></c:if><c:if test="${supportProject.gender!=2 }"><i style="margin-left: 4px;" class="icon gender-boy"></i></c:if></div>
	                  	<div class="col-r" style="color: black;"><c:if test="${supportProject.companyName!=null }">${supportProject.companyName}</c:if><c:if test="${supportProject.companyName==null }">${supportProject.eduName}</c:if></div>
	                  </div>
	                  <div class="desc-row" style="margin-top: 0.3em;">
	                    <div class="col-l cost" style="font-size: 16px;">￥${supportProject.moneyNeeds }<c:if test="${supportProject.uid==1 }"><i style="margin-left: 15px; margin-right: 0;" class="icon self-support"></i><span style="color: #b0b0b0;font-size: 15px;line-height: 20px;">自营</span></c:if></div>
	                    <div class="col-r"><fmt:formatDate value="${supportProject.createTime }" pattern="yyyy-MM-dd"/></div>
	                  </div>
	                </div>
	              </a>
	            </li>    	
          	</c:forEach>
          </ul>
        </div>
      </div>
      <div class="section">
        <div class="section-title-bar">
          <div class="section-title"><i class="icon place"></i>校园场地</div>
          <div class="section-tags">
          	<c:forEach var="addressCate" items="${addressCateList}" begin='0' end='4'>
          		<a href="${ctx}/project/getProjectList?isrecomment=3&cid=${addressCate.id}&page=1&pageSize=10" data-cid="${addressCate.id}">${addressCate.cateName}</a>
          	</c:forEach>
          </div>
          <div class="section-more"><a href="${ctx}/login/toProjectList?firstCateId=${addressCateList[0].parentId}">更多<br><small>MORE</small></a></div>
        </div>
        <div class="section-list-block">
          <ul class="section-list" style="padding-left: 25px;padding-right: 25px;">
          
              <c:forEach var="addressProject" items="${addressProjectList}" >
	          	<li class="${addressProject.projType==0?'demand':'supply'}">
	              <a href="${ctx}/login/toProjectDetail?id=${addressProject.id}">
	                <div class="photo"><img src="${addressProject.projPicPath }" alt=""></div>
	                <div class="desc">
	                  <div class="desc-row">
	                    <div class="col-l">${addressProject.projName}</div>
	                    <div style="line-height: 16px;width: 30%;" class="col-r"><span style="vertical-align: middle;margin-right: 2px;">浏览量</span><span style="font-size: 12px;line-height: 20px; vertical-align: top;">${addressProject.browsevolume}</span></div>
	                  </div>
	                  <div class="desc-row">
	                  	<div class="col-l font12" style="line-height: 1.5em;">${addressProject.username}<c:if test="${addressProject.gender==2 }"><i style="margin-left: 4px;" class="icon gender-girl"></i></c:if><c:if test="${addressProject.gender!=2 }"><i style="margin-left: 4px;" class="icon gender-boy"></i></c:if></div>
	                  	<div class="col-r" style="color: black;"><c:if test="${addressProject.companyName!=null }">${addressProject.companyName}</c:if><c:if test="${addressProject.companyName==null }">${addressProject.eduName}</c:if></div>
	                  </div>
	                  <div class="desc-row" style="margin-top: 0.3em;">
	                    <div class="col-l cost" style="font-size: 16px;">￥${addressProject.moneyNeeds }<c:if test="${addressProject.uid==1 }"><i style="margin-left: 15px;  margin-right: 0;" class="icon self-support"></i><span style="color: #b0b0b0;font-size: 15px;line-height: 20px;">自营</span></c:if></div>
	                    <div class="col-r"><fmt:formatDate value="${addressProject.createTime }" pattern="yyyy-MM-dd"/></div>
	                  </div>
	                </div>
	              </a>
	            </li>    	
          	</c:forEach>
          </ul>
        </div>
      </div>
      <div class="section">
        <div class="section-title-bar">
          <div class="section-title"><i class="icon service"></i>校园媒体</div>
          <div class="section-tags">
            <c:forEach var="onlineMediaCate" items="${onlineMediaCateList}" begin='0' end='4'>
          		<a href="${ctx}/project/getProjectList?isrecomment=3&cid=${onlineMediaCate.id}&page=1&pageSize=10" data-cid="${onlineMediaCate.id}">${onlineMediaCate.cateName}</a>
          	</c:forEach>
          </div>
          <div class="section-more"><a href="${ctx}/login/toProjectList?firstCateId=${onlineMediaCateList[0].parentId}">更多<br><small>MORE</small></a></div>
        </div>
        <div class="section-list-block">
          <ul class="section-list" style="padding-left: 25px;padding-right: 25px;">
             <c:forEach var="onlineMediaProject" items="${onlineMediaProjectList}" >
          	    <li class="${onlineMediaProject.projType==0?'demand':'supply'}">
	              <a href="${ctx}/login/toProjectDetail?id=${onlineMediaProject.id}">
	                <div class="photo"><img src="${onlineMediaProject.projPicPath}" alt=""></div>
	                <div class="desc">
	                  <div class="desc-row">
	                    <div class="col-l">${onlineMediaProject.projName}</div>
	                    <div style="line-height: 16px;width: 30%;" class="col-r"><span style="vertical-align: middle;margin-right: 2px;">浏览量</span><span style="font-size: 12px;line-height: 20px; vertical-align: top;">${onlineMediaProject.browsevolume}</span></div>
	                  </div>
	                  <div class="desc-row">
	                  	<div class="col-l font12" style="line-height: 1.5em;">${onlineMediaProject.username}<c:if test="${onlineMediaProject.gender==2 }"><i style="margin-left: 4px;" class="icon gender-girl"></i></c:if><c:if test="${onlineMediaProject.gender!=2 }"><i style="margin-left: 4px;" class="icon gender-boy"></i></c:if></div>
	                  	<div class="col-r" style="color: black;"><c:if test="${onlineMediaProject.companyName!=null }">${onlineMediaProject.companyName}</c:if><c:if test="${onlineMediaProject.companyName==null }">${onlineMediaProject.eduName}</c:if></div>
	                  </div>
	                  <div class="desc-row" style="margin-top: 0.3em;">
	                    <div class="col-l cost" style="font-size: 16px;">￥${onlineMediaProject.moneyNeeds }<c:if test="${onlineMediaProject.uid==1 }"><i style="margin-left: 15px; margin-right: 0;" class="icon self-support"></i><span style="color: #b0b0b0;font-size: 15px;line-height: 20px;">自营</span></c:if></div>
	                    <div class="col-r"><fmt:formatDate value="${onlineMediaProject.createTime }" pattern="yyyy-MM-dd"/></div>
	                  </div>
	                </div>
	              </a>
	            </li>    	
          	</c:forEach>
          </ul>
        </div>
      </div>
      <div class="section">
        <div class="section-inner">
          <div class="home-ad" style="display: flex;">
          	<a class="shop-link" href="${ctx}/login/toScoreMall"><img src="${ctx}/resources/artcle/images/shop-link.jpg" alt=""></a>
          	<div style="width: 1116px; height: 184px; overflow: hidden;"><div style="margin: 0; padding:0; height: 736px;"><c:if test="${homeAd != null }">
          	<c:forEach var="h" items="${homeAd }">
          	<a class="ad-banner" href="${h.url}"><img style="width: 1116px; height: 184px; margin: 0; padding: 0;" src="${h==null?'':h.image}" alt=""></a>
          	</c:forEach>
          	<a class="ad-banner" href="${homeAd[0].url}"><img style="width: 1116px; height: 184px; margin: 0; padding: 0;" src="${homeAd[0]==null?'':homeAd[0].image}" alt=""></a>
          	</c:if></div></div>
          </div>
          <div class="recommend-project">
            <div class="tab-label">
              <div class="tab-label-title">
                <div class="title-text">项目推荐<br><small>Project recommend</small></div>
              </div>
              <div class="tab-label-list">
	            <c:forEach var="firstCate" items="${firstCateList }" >
					<li><a href="##" onclick="getProjectListByFirstCate(${firstCate.id })">${firstCate.cateName }</a></li>
	          	</c:forEach>
              </div>
            </div>
            <div class="tab-content">
              <table id="proj_tj" class='proj_tj'>
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
                <tr>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                </tr>
                <tr>
                 <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                  <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                   <td><div>
                    <a href="">
                    	<div class="photo"><img src="${ctx}/resources/artcle/images/re-2.jpg" alt=""></div>
                    	<div class="photo-desc">圣诞场地</div>
                    </a></div>
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <div class="tarento-block">
            <h3>校园达人<br><small>The campus's got talent</small></h3>
            <div class="tarento-list-box">
              <div class="tarento-list-wrapper" style="overflow: initial;">
                <ul class="tarento-list" style="height: 191px; overflow: initial;">
                  <c:forEach var="student" items="${students}" begin='0' end='5'>
                  	  <a href="${ctx}/login/toOtherUser?userid=${student.id}">
		                  <li style="font-size: 12px; overflow: initial;">
		                    <div class="avatar" style="overflow: initial;"><c:if test="${fn:startsWith(student.head_pic_path, NORMAL_HEAD_ICON_URL) == false }"><img src="${student.head_pic_path}" alt=""></c:if><c:if test="${fn:startsWith(student.head_pic_path, NORMAL_HEAD_ICON_URL) == true }"><c:if test="${student.gender==2 }"><img src="${GIRL_HEAD_ICON_URL}" alt=""></c:if><c:if test="${student.gender!=2 }"><img src="${BOY_HEAD_ICON_URL}" alt=""></c:if></c:if><c:if test="${student.tag != null && student.tag != ''}"><i
                        style="
                            color: black;
                            position: absolute;
                            top: -17px;
                            right: 0;
                            background: url(resources/artcle/images/king.png) no-repeat 50% 50% / cover;
                            height: 40px;
                            width: 60px;
                            line-height: 50px;
                            transform: rotate(18deg);
                        ">${student.tag }</i></c:if></div>
		                    <p style="line-height: 9px; overflow: visible;white-space: nowrap;" class="avatar-desc">${student.nickname }<c:if test="${student.gender == 2}"><i style="margin-left: 5px;" class="icon gender-girl"></i></c:if><c:if test="${student.gender != 2}"><i style="margin-left: 5px;" class="icon gender-boy"></i></c:if><span style=" background: gainsboro;    border-radius: 5px;"><i class="icon influence"></i><span style="background: gainsboro;border-radius: 25%;padding: 3px 1px;">${student.influence }</span></span></p><p>${student.edu_name }</p>
		                  </li>
                      </a>
                  </c:forEach>
                </ul>
              </div>
              <div class="prev-btn"></div>
              <div class="next-btn"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="section headlines">
      <!--
        <div class="section-inner">
          <div class="headlines-box">
            <div class="box-1">
              <h3><span class="big-font">Campus</span><br>headlines</h3>
              <p>校园头条</p>
            </div>
            <div class="box-2">
              <div class="headlines-img-1"><img src="${ctx}/resources/artcle/images/headlines-1.jpg" alt=""></div>
              <div class="headlines-desc-1">若是用现有的社会地位和资产收入评价成就时，我觉得自己到目前为止，仍然算是极其失败的人，因为可以说我尚未具备这二者中的任何一个，地位嘛，我是学生；</div>
            </div>
            <div class="box-3">
              <div class="headlines-img-2"><img src="${ctx}/resources/artcle/images/headlines-3.jpg" alt=""></div>
              <div class="headlines-desc-2">
                <h3><span class="big-font">Campus</span><br>headlines</h3>
                <p>校园资讯<br>校园最新资讯 </p>
              </div>
            </div>
            <div class="box-4">
              <h4>The latest <br><span class="big-font">information</span></h4>
              <h3>热门资讯</h3>
              <p>
              <c:forEach var="zx" items="${zxList}" begin='0' end='3'>
	              	<a href="${ctx }/login/toNewsDetails?id=${zx.id}">${zx.title }</a><br>
                </c:forEach>
              </p>
            </div>
            <div class="box-5"><img src="${ctx}/resources/artcle/images/headlines-4.jpg" alt=""></div>
            <div class="box-6">
              <h3>头条信息</h3>
              <p>资讯，海量信息<br>即刻分享<br>operation of project</p>
            </div>
            <div class="box-7"><img src="${ctx}/resources/artcle/images/headlines-5.jpg" alt=""></div>
            <div class="box-8">
              <h3>攻略</h3>
              <p><span class="white-font">User’s news</span> 
              <c:forEach var="gl" items="${glList}" >
	              	<br><a href="${ctx }/login/toNewsDetails?id=${gl.id}">${gl.title }</a>
                </c:forEach>
              </p>
            </div>
          </div>
        </div>
      -->
      <!-- ============================================================================================================================================================== -->
      <!--
	  <div id="news-tab-list" class="tab-product tab-sub-3 ui-style-gradient">
		<h2 class="tab-hd">
			<c:forEach var="item" items="${newsCateList }">
				<span class="tab-hd-con"><a href="javascript:">${item.cateName }</a></span>
			</c:forEach>
		</h2>
		<div class="tab-bd dom-display">
			<c:forEach var="list" items="${newsList }">
			<div class="tab-bd-con"> <ul class="m-list list-tweet">
				<c:forEach var="item" items="${list }">
					<li class="clearfix eat-me"> <i class="tweet-xxl">★</i>
					  <h3><a href="javascript:">${item.title }</a></h3>
					  <a href="javascript:"><img src="${item.headPicPath }" alt="${item.title }" width="90" height="90"></a>
					  	<p class='rich-text-to-be-simple-brief-text'>
					  		<input value='${item.content }'>
						</p>
						<p class="desc-footer" style='float: left;'>
							<span>${item.username}&nbsp;&nbsp;
								<c:if test="${item.companyName!=null }">${item.companyName }</c:if>
								<c:if test="${item.eduName!=null }">${item.eduName }</c:if>
							</span>
							<span><i class="icon eye"></i>${item.browsevolume}人浏览</span>
	                    </p>
					  <span class="tweet-detail-func cBlue" style='float: right;'><span class="create-time" style='float:left;'><fmt:formatDate value="${item.createTime }" pattern="yyyy年MM月dd日"/></span></span> </li>
				</c:forEach>
			</ul> </div>
			</c:forEach>
		</div>
      </div>
      -->
	  <table border="0" style="width: 100%;height: auto;border-collapse: collapse;table-layout: fixed;">
	<colgroup>
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
		<col width="8.33%">
	</colgroup>
	<tbody><tr style=""><td colspan="4" style="
    background: #e2e0e0;height: 182px;"><div style="
    border-left: solid 10px black;margin: 0;padding: 0;height: 100%;width: auto;align-items: center;display: flex;"><div style="
    text-align: left;margin: auto 0;width: auto;"><p style="
    padding-left: 10px;font-size: 45px;font-weight: 500;width: 100%;">CAMPUS</p><p style="
    padding-left: 10px;font-size: 30px;font-weight: 500;width: 100%;">HEADLINES</p><p style="
    padding: 10px 0 10px 10px;font-size: 30px;font-weight: 500;width: 100%;">校园头条</p></div></div></td><td colspan="2" style="
	position: relative;height: 182px;"><div class="hover-display" style="height: 191px; border: 0; margin: 0; padding: 0;"><c:if test="${newsList!=null && fn:length(newsList)>0 && newsList[0]!=null && fn:length(newsList[0])>0}"><a href="${ctx}/login/toNewsDetails?id=${newsList[0][0].id}" style="
    padding: 0;margin: 0;position: initial;"><img src="${newsList[0][0].picPath}" style="
    width: 100%;height: 100%;"><p style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 20px;font-weight: 500;opacity: .9;">${newsList[0][0].title}</p></a></c:if></div></td><td colspan="6" style="
    background-color: rgba(74, 168, 202, 1);color: white;font-weight: 500;height: 182px;"><div style="height: 182px; border: 0; margin: 0; padding: 0;"><p style="
    font-size: 25px;margin: 10px 30px;"><c:if test="${newsCateList!=null && fn:length(newsCateList) > 0}">${newsCateList[0].cateName}</c:if></p><ul style="
    list-style-type: disc;padding: 0 40px;margin: 10px 0;font-size: 20px;"><c:if test="${newsList!=null && fn:length(newsList)>0 && newsList[0]!=null && fn:length(newsList[0])>0}"><c:set var="length" value="${fn:length(newsList[0])>5?5:fn:length(newsList[0])}" /><c:forEach var="i" begin="1" end="${length-1}" step="1"><li style="
    list-style-type: disc;"><a href="${ctx}/login/toNewsDetails?id=${newsList[0][i].id}" style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    display: inline-block;
    color: white;">${newsList[0][i].title}</a></li></c:forEach></c:if></ul></div></td></tr><tr><td colspan="4" style="
    position: relative;height: 182px;"><div class="hover-display" style="height: 191px; border: 0; margin: 0; padding: 0;"><c:if test="${newsList!=null && fn:length(newsList)>1 && newsList[1]!=null && fn:length(newsList[1])>0}"><a href="${ctx}/login/toNewsDetails?id=${newsList[1][0].id}" style="
    padding: 0;margin: 0;position: initial;"><img src="${newsList[1][0].picPath}" style="
    width: 100%;height: 100%;"><p style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 20px;font-weight: 500;opacity: .9;">${newsList[1][0].title}</p></a></c:if></div></td><td colspan="4" style="
    height: 182px;color: rgb(175,176,178);"><div style="height: 182px; border: 0; margin: 0; padding: 0;"><p style="
    font-size: 25px;margin: 10px 30px;"><c:if test="${newsCateList!=null && fn:length(newsCateList) > 1}">${newsCateList[1].cateName}</c:if></p><ul style="
    list-style-type: disc;padding: 0 40px;margin: 10px 0;font-size: 20px;"><c:if test="${newsList!=null && fn:length(newsList)>1 && newsList[1]!=null && fn:length(newsList[1])>0}"><c:set var="length" value="${fn:length(newsList[1])>5?5:fn:length(newsList[1])}" /><c:forEach var="i" begin="1" end="${length-1}" step="1"><li style="
    list-style-type: disc;"><a href="${ctx}/login/toNewsDetails?id=${newsList[1][i].id}" style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    display: inline-block;
    color: rgb(175,176,178);">${newsList[1][i].title}</a></li></c:forEach></c:if></ul></div></td><td colspan="4" style="
    height: 182px;position: relative;"><div class="hover-display" style="height: 191px; border: 0; margin: 0; padding: 0;"><c:if test="${newsList!=null && fn:length(newsList)>2 && newsList[2]!=null && fn:length(newsList[2])>0}"><a href="${ctx}/login/toNewsDetails?id=${newsList[2][0].id}" style="
    padding: 0;margin: 0;position: initial;"><img src="${newsList[2][0].picPath}" style="
    width: 100%;height: 100%;"><p style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 20px;font-weight: 500;opacity: .9;">${newsList[2][0].title}</p></a></c:if></div></td></tr><tr><td colspan="4" rowspan="2" style="
    height: 364px;background-color: rgb(242,242,242);color: rgb(139,139,139);"><div style="height: 364px; border: 0; margin: 0; padding: 0;"><p style="
    font-size: 25px;margin: 10px 30px;line-height: 40px;"><c:if test="${newsCateList!=null && fn:length(newsCateList) > 2}">${newsCateList[2].cateName}</c:if></p><ul style="
    list-style-type: disc;padding: 0 40px;margin: 10px 0;font-size: 20px;"><c:if test="${newsList!=null && fn:length(newsList)>2 && newsList[2]!=null && fn:length(newsList[2])>0}"><c:set var="length" value="${fn:length(newsList[2])>10?10:fn:length(newsList[2])}" /><c:forEach var="i" begin="1" end="${length-1}" step="1"><li style="
    list-style-type: disc;margin: 3px 0;"><a href="${ctx}/login/toNewsDetails?id=${newsList[1][i].id}" style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    display: inline-block;
    color: rgb(139,139,139);">${newsList[2][i].title}</a></li></c:forEach></c:if></ul></div></td><td colspan="4" style="
    height: 182px;position: relative;"><div class="hover-display" style="height: 191px; border: 0; margin: 0; padding: 0;"><c:if test="${newsList!=null && fn:length(newsList)>3 && newsList[3]!=null && fn:length(newsList[3])>0}"><a href="${ctx}/login/toNewsDetails?id=${newsList[3][0].id}" style="
    padding: 0;margin: 0;position: initial;"><img src="${newsList[3][0].picPath}" style="
    width: 100%;height: 100%"><p style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 20px;font-weight: 500;opacity: .9;">${newsList[3][0].title}</p></a></c:if></div></td><td colspan="4" style="
    height: 182px;background-color: rgb(22,31,38);color: white;"><div style="height: 182px; border: 0; margin: 0; padding: 0;"><p style="
    font-size: 25px;margin: 10px 30px;"><c:if test="${newsCateList!=null && fn:length(newsCateList) > 3}">${newsCateList[3].cateName}</c:if></p><ul style="
    list-style-type: disc;padding: 0 40px;margin: 10px 0;font-size: 20px;color: rgb(154,154,152);"><c:if test="${newsList!=null && fn:length(newsList)>3 && newsList[3]!=null && fn:length(newsList[3])>0}"><c:set var="length" value="${fn:length(newsList[3])>5?5:fn:length(newsList[3])}" /><c:forEach var="i" begin="1" end="${length-1}" step="1"><li style="
    list-style-type: disc;"><a href="${ctx}/login/toNewsDetails?id=${newsList[3][i].id}" style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    display: inline-block;
    color: rgb(154,154,152);">${newsList[3][i].title}</a></li></c:forEach></c:if></ul></div></td></tr><tr><td colspan="5" style="
    height: 182px;background-color: rgb(58,68,78);color: rgb(237,238,240);"><div style="height: 182px; border: 0; margin: 0; padding: 0;"><p style="
    font-size: 25px;margin: 10px 30px;"><c:if test="${newsCateList!=null && fn:length(newsCateList) > 4}">${newsCateList[4].cateName}</c:if></p><ul style="
    list-style-type: disc;padding: 0 40px;margin: 10px 0;font-size: 20px;color: rgb(153,154,156);"><c:if test="${newsList!=null && fn:length(newsList)>4 && newsList[4]!=null && fn:length(newsList[4])>0}"><c:set var="length" value="${fn:length(newsList[4])>5?5:fn:length(newsList[4])}" /><c:forEach var="i" begin="1" end="${length-1}" step="1"><li style="
    list-style-type: disc;"><a href="${ctx}/login/toNewsDetails?id=${newsList[4][i].id}" style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    display: inline-block;
    color: rgb(153,154,156);">${newsList[4][i].title}</a></li></c:forEach></c:if></ul></div></td><td colspan="3" style="
    height: 182px;position: relative;"><div class="hover-display" style="height: 191px; border: 0; margin: 0; padding: 0;"><c:if test="${newsList!=null && fn:length(newsList)>4 && newsList[4]!=null && fn:length(newsList[4])>0}"><a href="${ctx}/login/toNewsDetails?id=${newsList[4][0].id}" style="
    padding: 0;margin: 0;position: initial;"><img src="${newsList[4][0].picPath}" style="
    width: 100%;height: 100%;"><p style="text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    width: 100%;
    text-align: center;background: rgba(10, 6, 6, 0.65);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 20px;font-weight: 500;opacity: .9;">${newsList[4][0].title}</p></a></c:if></div></td></tr></tbody>
</table>

	  <!-- ============================================================================================================================================================== -->
      </div>
      <!--<div class="section">
        <div class="section-title-bar">
          <div class="section-title"><i class="icon demand"></i>需求项目推荐</div>
          <div class="section-tags">
          	<c:forEach var="firstCate" items="${firstCateList}" begin='0' end='4'>
          		<a href="${ctx}/project/getProjectListByFirstCate?cid=${firstCate.id}&projType=0&page=1&pageSize=10" data-type="0" data-cid="${firstCate.id}" >${firstCate.cateName }</a>
          	</c:forEach>
          </div>
          <div class="section-more"><a href="${ctx}/login/toProjectList?projType=0">更多<br><small>MORE</small></a></div>
        </div>
        <div class="section-list-block">
          <ul class="section-list">
         	<c:forEach var="fwProject" items="${fwProjectList}" >
	            <li class="demand">
	              <a href="${ctx}/login/toProjectDetail?id=${fwProject.id}">
	                <div class="photo"><img src="${fwProject.projPicPath}" alt=""></div>
	                <div class="desc">
	                  <div class="desc-row">
	                    <div class="col-l">${fwProject.projName }</div>
	                    <div class="col-r">${fwProject.timesNumber }</div>
	                  </div>
	                  <div class="desc-row">
	                    <div class="col-l font12"><i class="icon user"></i>
	                    	${fwProject.username}&nbsp;&nbsp;
	                    	<c:if test="${fwProject.companyName!=null }">${fwProject.companyName }</c:if>
	                    	<c:if test="${fwProject.eduName!=null }">${fwProject.eduName }</c:if>
	                    </div>
	                    <div class="col-r"><fmt:formatDate value="${fwProject.createTime }" pattern="yyyy-MM-dd"/></div>
	                  </div>
	                  <div class="desc-row">
	                    <div class="col-l cost">￥${fwProject.moneyNeeds }</div>
	                    <c:if test="${fwProject.username=='鲸客校园'}">
		                    <div class="col-r"><i class="icon shop"></i>自营</div>
	                    </c:if>
	                  </div>
	                </div>
	              </a>
	            </li>
         	</c:forEach>
          </ul>
        </div>
      </div>-->
      <!--<div class="section">
        <div class="section-title-bar">
          <div class="section-title"><i class="icon provide"></i>供给项目推荐</div>
          <div class="section-tags">
          	<c:forEach var="firstCate" items="${firstCateList}" begin='0' end='7'>
          		<a href="${ctx}/project/getProjectListByFirstCate?cid=${firstCate.id}&projType=1&page=1&pageSize=10" data-cid="${firstCate.id}" data-type="1">${firstCate.cateName }</a>
          	</c:forEach>
          </div>
          <div class="section-more"><a href="${ctx}/login/toProjectList?projType=1">更多<br><small>MORE</small></a></div>
        </div>
        <div class="section-list-block">
          <ul class="section-list">
             <c:forEach var="zjProject" items="${zjProjectList}" >
	            <li class="supply">
	              <a href="${ctx}/login/toProjectDetail?id=${zjProject.id}">
	                <div class="photo"><img src="${zjProject.projPicPath}" alt=""></div>
	                <div class="desc">
	                  <div class="desc-row">
	                    <div class="col-l">${zjProject.projName }</div>
	                    <div class="col-r">${zjProject.timesNumber }</div>
	                  </div>
	                  <div class="desc-row">
	                    <div class="col-l font12"><i class="icon user"></i>
	                    	${zjProject.username}&nbsp;&nbsp;
	                    	<c:if test="${zjProject.companyName!=null }">${zjProject.companyName }</c:if>
	                    	<c:if test="${zjProject.eduName!=null }">${zjProject.eduName }</c:if>
	                    </div>
	                    <div class="col-r"><fmt:formatDate value="${zjProject.createTime }" pattern="yyyy-MM-dd"/></div>
	                  </div>
	                  <div class="desc-row">
	                    <div class="col-l cost">￥${zjProject.moneyNeeds }</div>
	                    <c:if test="${zjProject.username=='鲸客校园'}">
		                    <div class="col-r"><i class="icon shop"></i>自营</div>
	                    </c:if>
	                  </div>
	                </div>
	              </a>
	            </li>
         	</c:forEach>
          </ul>
        </div>
      </div>-->
<!--       <div class="section"> -->
<!--         <div class="section-title-bar"> -->
<!--           <div class="section-title"><i class="icon love"></i>猜你喜欢</div> -->
<!--           <div class="section-tags"> -->
<!--             <a href="js/l.js">活动执行</a> -->
<!--             <a href="">兼职服务</a> -->
<!--             <a href="">创业团队</a> -->
<!--             <a href="">校内冲场</a> -->
<!--             <a href="">众包服务</a> -->
<!--           </div> -->
<!--           <div class="section-more"><a href="">更多<br><small>MORE</small></a></div> -->
<!--         </div> -->
<!--         <div class="section-list-block"> -->
<!--           <ul class="section-list"> -->
<!--             <li class="supply"> -->
<!--               <a href=""> -->
<%--                 <div class="photo"><img src="${ctx}/resources/artcle/images/l1.jpg" alt=""></div> --%>
<!--                 <div class="desc"> -->
<!--                   <div class="desc-row"> -->
<!--                     <div class="col-l">上海地区50人展厅</div> -->
<!--                     <div class="col-r">数量 1</div> -->
<!--                   </div> -->
<!--                   <div class="desc-row"> -->
<!--                     <div class="col-l font12"><i class="icon user"></i>张三 上海大学</div> -->
<!--                     <div class="col-r">2016-12-30</div> -->
<!--                   </div> -->
<!--                   <div class="desc-row"> -->
<!--                     <div class="col-l cost">￥500.00</div> -->
<!--                     <div class="col-r"><i class="icon shop"></i>自营</div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </a> -->
<!--             </li> -->
<!--           </ul> -->
<!--         </div> -->
<!--       </div> -->
      <div class="section">
        <div class="section-inner">
          <div class="sponsor-block">
            <h3>优秀赞助商<br><small>Outstanding sponsor</small></h3>
            <div class="sponsor-list-box">
              <div class="sponsor-list-wrapper" style="overflow: initial;">
                <ul class="sponsor-list" style="height: 191px; overflow: initial;">
                  <c:forEach var="company" items="${companys}" begin='0' end='7'>
                      <a href="${ctx}/login/toOtherUser?userid=${company.id}">
		                  <li style="font-size: 12px; overflow: initial;">
		                    <div class="sponsor-logo" style="overflow: initial;"><c:if test="${fn:startsWith(company.head_pic_path, NORMAL_HEAD_ICON_URL) == false }"><img src="${company.head_pic_path}" alt=""></c:if><c:if test="${fn:startsWith(company.head_pic_path, NORMAL_HEAD_ICON_URL) == true }"><c:if test="${company.gender==2 }"><img src="${GIRL_HEAD_ICON_URL}" alt=""></c:if><c:if test="${company.gender!=2 }"><img src="${BOY_HEAD_ICON_URL}" alt=""></c:if></c:if><c:if test="${company.tag != null && company.tag != ''}"><i
                        style="
                            color: black;
                            position: absolute;
                            top: -17px;
                            right: 0;
                            background: url(resources/artcle/images/king.png) no-repeat 50% 50% / cover;
                            height: 40px;
                            width: 60px;
                            line-height: 50px;
                            transform: rotate(18deg);
                        ">${company.tag }</i></c:if></div>
		                    <p style="line-height: 9px; overflow: visible;white-space: nowrap; margin-top: 20px;" class="sponsor-name">${company.nickname }<c:if test="${company.gender == 2}"><i style="margin-left: 5px;" class="icon gender-girl"></i></c:if><c:if test="${company.gender != 2}"><i style="margin-left: 5px;" class="icon gender-boy"></i></c:if><span style=" background: gainsboro; border-radius: 5px;"><i class="icon influence"></i><span style="background: gainsboro;border-radius: 25%;padding: 3px 1px;">${company.influence }<c:if test="${company.influence==null }">0</c:if></span></span></p><p>${company.company_name }</p>
		                  </li>
                      </a>
                  </c:forEach>
                </ul>
              </div>
              <div class="prev-btn"></div>
              <div class="next-btn"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/slick.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jquery.marquee.min.js"></script>
  <script src="${ctx}/resources/artcle/js/newsTabList.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
  
    $(function() {
    	Date.prototype.Format = function (fmt) { //author: meizz 
    	    var o = {
    	        "M+": this.getMonth() + 1, //月份 
    	        "d+": this.getDate(), //日 
    	        "h+": this.getHours(), //小时 
    	        "m+": this.getMinutes(), //分 
    	        "s+": this.getSeconds(), //秒 
    	        "q+": Math.floor((this.getMonth() + 3) / 3), 
    	        "S": this.getMilliseconds() //毫秒 
    	    };
    	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    	    for (var k in o)
    	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    	    return fmt;
    	}
      var homeApp = {
        init : function() {
          this.navInit(); //主导航菜单
          //校园达人切换
          this.carousel({
            el: $('.tarento-list-wrapper'),
            next: $('.tarento-list-box .next-btn'),
            prev: $('.tarento-list-box .prev-btn')
          });
          //优秀赞助商切换
          this.carousel({
            el: $('.sponsor-list-wrapper'),
            next: $('.sponsor-list-box .next-btn'),
            prev: $('.sponsor-list-box .prev-btn')
          });
          this.tabCut();
        },
        navInit : function(){
          var navData = [{
            title: '校园赞助',
            item: [{
              title: '迎新晚会',
              url: '#'
            }],
            recommend: [{
              title: '活动场地',
              other: '湖北大学',
              url: '#',
            }]
          }];


		  var navData1 = '${allCateList}';
		  var navData = JSON.parse(navData1);

          var $serviceList = $('.service-list ul');
          var $listDetails = $('.service-list-details');
          var itemNodes = '';

          function initListDetail(data) {
            var $moreList = $('.service-list-details .more-list');
            var $recommendList = $('.service-list-details .recommend-list');
            var moreItemNodes = '';
            var recommendNoes = '';
            console.log(data);
            if (data) {
              (data.item.slice(3)).forEach(function(item, index) {
                moreItemNodes += '<li><a href="' + ctx+'/login/toProjectList?firstCateId='+item.id + '">' + item.title + '</a></li>';
              });
              data.recommend.forEach(function(item, index) {



                recommendNoes += '<li><a style="width: 100%; white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" href="' + ctx+'/login/toProjectDetail?id='+item.id + '"><span>推荐</span><span class="separate">|</span><span style="width: 70%; overflow: hidden; text-overflow: ellipsis;">' + item.title + '</span></a></li>';
              });
              $moreList.empty().append(moreItemNodes);
              $recommendList.empty().append(recommendNoes);
            }
          }
          navData.forEach(function(item, index) {
            var itemLinks = '';
            (item.item.slice(0, 3)).forEach(function(v, i) {
              itemLinks += '<a href="'+ctx+'/login/toProjectList?firstCateId='+v.id+'">' + v.title + '</a>';
            });
            itemNodes += '<li><div class="sl-title">' + item.title + '</div><p>' + itemLinks + '</p></li>';
            itemLinks = null;
          });
          $serviceList.append(itemNodes);
          $('.service-list li').hover(function() {
            var index = $(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            initListDetail(navData[index]);
            $listDetails.removeClass('hide');
          }, function() {
            $listDetails.addClass('hide');
          });
          $('.service-list-details').hover(function() {
            $listDetails.removeClass('hide');
          }, function() {
            $('.service-list li').removeClass('active');
            $listDetails.addClass('hide');
          });
        },
        carousel : function (args) {
          var $container = args.el;
          var $next = args.next;
          var $prev = args.prev;
          var $ul = $container.find('ul');
          var $li = $container.find('li');
          var liSize = $li.length;
          var liWidth = $li.outerWidth();
          var flag = true;
          $ul.width(liSize * liWidth);
          $next.on("click", function() {
            $ul.stop(true).animate({
              marginLeft: '-' + (liWidth) + 'px'
            }, function() {
              $ul.append($container.find('li:first-child'));
              $(this).css('margin-left', 0);
            });
          });
          $prev.on("click", function() {
            if(flag){
              flag = false;
              $ul.css('margin-left', '-' + liWidth + 'px').prepend($container.find('li:last-child'));
              $ul.stop().animate({
                marginLeft: '0px'
              },function(){
                flag = true;
              });
            }
          });
        },
        tabCut:function(){
          $('.section-title-bar .section-tags a').on('click',function(e){
        	var theA = $(this).parents(".section-title-bar").find(".section-more a");
        	if($(this).data("type")=="0"){
	        	theA.attr("href",ctx+"/login/toProjectList?firstCateId="+$(this).data("cid")+"&projType=0");        		
        	}else if($(this).data("type")=="1"){
        		theA.attr("href",ctx+"/login/toProjectList?firstCateId="+$(this).data("cid")+"&projType=1");
        	}else{
        		theA.attr("href",ctx+"/login/toProjectList?firstCateId="+$(this).data("cid"));
        	}
            var uri = $(this).attr('href');
            var $listBox = $(this).parents('.section').find('.section-list-block');
            $(this).addClass('active').siblings('a').removeClass('active');
            $listBox.addClass('loading');
            function render(data){
            	'<i class="icon user"></i>';
              var list = '<ul class="section-list" style="padding-left: 25px;padding-right: 25px;">';
              var newsList = data.newsList;
              newsList.forEach(function(item,index){
	            var isZy = ""
            	if(item.projType==0) item.mode="demand";
            	if(item.projType==1) item.mode="supply";
            	if(item.companyName!=null) item.workAddr = item.companyName;
	            if(item.username=='鲸客校园') isZy ='自营'; 
            	else if(item.eduName!=null) item.workAddr = item.eduName;
                list += '<li class="'+item.mode+'"><a href="'+ctx+'/login/toProjectDetail?id='+item.id+'">\
                        <div class="photo"><img src="'+item.projPicPath+'" alt=""></div><div class="desc"><div class="desc-row">\
                        <div class="col-l">'+item.projName+'</div><div class="col-r" style="line-height: 16px;width: 30%;"><span style="vertical-align: middle;margin-right: 2px;">浏览量</span><span style="font-size: 12px;line-height: 20px; vertical-align: top;">'+item.browsevolume+'</span></div></div>\
                        <div class="desc-row"><div class="col-l font12" style="line-height: 1.5em;">'+item.username+(item.gender==2?'<i style="margin-left: 4px;" class="icon gender-girl"></i>':'<i style="margin-left: 4px;" class="icon gender-boy"></i>')+'</div>\
                        <div class="col-r" style="color: black;">'+(item.companyName!=null?item.companyName:item.eduName)+'</div></div>'+
                        '<div class="desc-row" style="margin-top: 0.3em;"><div class="col-l cost" style="font-size: 16px;">￥'+item.moneyNeeds+(item.uid==1?'<i style="margin-left: 15px; margin-right: 0;" class="icon self-support"></i><span style="color: #b0b0b0;font-size: 15px;line-height: 20px;">自营</span>':'')+'</div>\
                        <div class="col-r">'+new Date(item.createTime).Format("yyyy-MM-dd")+'</div></div></div></a></li>';
              });
              list += '</ul>';
              $listBox.empty().append(list);
              $listBox.removeClass('loading');
            }
            uri && $.getJSON(uri,function(json){
            	render(json);
            });
            return false;
          });
        }
      };
      homeApp.init();
      //banner轮播
      $('.banner-slick').slick({
        dots: true,
        autoplay:true,
        arrows:false,
        draggable:false
      });
      
      var $mq = $('.roll-box').marquee({
        	duration: 12000,
        	gap: 50,
          startVisible: false,
        	delayBeforeStart: 0,
        	direction: 'left',
        	duplicated: true
        });

        $('.roll-box').hover(function() {
          $mq.marquee('pause');
        }, function() {
          $mq.marquee('resume');
        });
        
        $('.tab-label-list a').on('click',function(){
        	$(this).addClass('active').parents('li').siblings('li').find('a').removeClass('active');
        	return false;
        });
        
//         var isPublish = '${isPublish}';
//         if(isPublish=='1'){
//         	alert("发布成功！");
//         }else if(isPublish=='2'){
//         	alert("已保存至草稿箱！");
//         }
       
    });
    
    getProjectListByFirstCate($("#supportCateId").val());
 
    //项目推荐板块的数据获取
    function getProjectListByFirstCate(cid){
        function createItem(item) {
			console.log(item);
            var ret = $('<td style="position: relative; padding: 0 2px;"><div><a href="'+ctx+'/login/toProjectDetail?id='+item.id+'"></a></div></td>');
            if(item.projType == 0) {
                ret.addClass('demand');
            } else {
                ret.addClass('supply');
            }
            var photo = $(format.call('<div style="max-height: 9999px;margin: 0;padding: 0;" class="photo"><img src="{picPath}"/></div>', {
                'picPath': item.projPicPath
            }));
            var desc = $('<div class="desc" style="text-align: left; padding: 0;"></div>');
            ret.children('div').children('a').append(photo);
            ret.children('div').children('a').append(desc);

            var line1 = $(format.call('<div class="desc-row"><p style="font-size: 14px;margin: 10px 0 5px 0px;">{projName}</p></div>', {
                'projName': item.projName
            }));
            var line2 = $(format.call('<div class="desc-row"><div class="col-l font12" style="line-height: 1.5em;">{username}<i style="margin-left: 4px;" class="icon {sex}"></i></div><div style="line-height: 16px; right: 10px;" class="col-r"><i class="icon eye"></i><span style="font-size: 12px;line-height: 20px; vertical-align: top;">{browsevolume}</span></div></div>', {
                'username': item.username,
				'sex': item.gender==0?'':(item.gender==1?'gender-boy':'gender-girl'),
                // 'browsevolume': item.browsevolume,
                'browsevolume': item.browsevolume
            }));
			// {companyName} {eduName} {startTime}
            var line3 = $(format.call('<div class="desc-row"><div class="col-l">{institution}</div><div class="col-r" style="right: 10px;">{selfSupport}</div></div>', {
                'institution': item.companyName?item.companyName:item.eduName,
        		'selfSupport': item.uid=='1'?'<i class="icon self-support" style=" margin-right: 0;"></i><span style="color: black; font-size: 15px; line-height: 20px;">自营</span>':''
            }));
			var line4 = $(format.call('<div class="desc-row"><div class="col-l cost">￥{moneyNeeds}</div><div style="line-height: 29px;right: 10px;" class="col-r">{startTime}</div></div>', {
                'moneyNeeds': item.moneyNeeds,
				'startTime': getDate(item.startTime, '-')
            }));
            desc.append(line1);
            desc.append(line2);
            desc.append(line3);
			desc.append(line4);

            return ret;
        }
        $.ajax({
            type: "GET",
            url: ctx+"/project/getProjectListByFirstCate",
            data: {"cid":cid,"isrecomment":4,"orderStr":"isrecomment desc,createTime desc"},
            dataType: "json",
            success: function(data){
          	  var list = data.newsList;
          	  $("#proj_tj tr:eq(0)").empty();
          	  $("#proj_tj tr:eq(1)").empty();
          	  // $("#proj_tj tr:eq(2)").empty();
              console.log(list);
          	  for(var i in list){
          		  if( i < 4){
          				$("#proj_tj tr:eq(0)").append(createItem(list[i]));
          		  }else if(i>=4 && i<8){
          				$("#proj_tj tr:eq(1)").append(createItem(list[i]));
          		  }
                // 这里原本是三行，现在要求两行了
                /*else if(i>=8 && i< 12){
          				$("#proj_tj tr:eq(2)").append('<td><a href="'+ctx+'/login/toProjectDetail?id='+list[i].id+'"><div class="photo"><img src="'+list[i].projPicPath+'" alt=""></div><div class="photo-desc">'+list[i].cateName+'</div></a></td>');
          		  }*/
          	  }
            }
        }); 
    }

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
    function getDate(time, split) {
		split = split||'';
        var date = new Date(time);
        var year = date.getFullYear();
        var month = '0'+(date.getMonth()+1);
        month = month.substr(-2);
        var day = '0'+date.getDate();
        day = day.substr(-2);
        return year+split+month+split+day;
    }
    
    // 头条显示第一个tab
    $(document).ready(function() {
    	function getText(item) {
    		var text = '';console.log(item.childNodes);
    		item.childNodes.forEach(function(cItem) {
    			if(cItem.children) {
    				if(cItem.tagName == 'P') {
    					text += '<br />';
    				}
    				text += getText(cItem);
    				if(cItem.tagName == 'P') {
    					text += '<br />';
    				}
    			} else {
    				text += cItem.data;
    			}
    		});
    		return text;
    	}
    	$('.tab-bd.dom-display >.tab-bd-con:first').addClass('current');
    	$('.rich-text-to-be-simple-brief-text').each(function(index, item) {
    		var inItem = $($(item).children('input').val())[0];
    		$(item).html(getText(inItem));
    	});

    	var setIntervalMarinTop = 0;
    	var minTop = $('.home-ad>div>div').children('a').length*184*(-1);
    	setInterval(function() {
    		var target = $('.home-ad>div>div');
    		setIntervalMarinTop -= 184;
    		switch(setIntervalMarinTop) {
    		case minTop:
    			target.css('margin-top', 0);
    			setIntervalMarinTop = -184;
    			target.animate({
    				marginTop: setIntervalMarinTop+'px'
    			}, 200);
    			break;
    		default:
    			target.animate({
    				marginTop: setIntervalMarinTop+'px'
    			}, 200);
    			break;
    		}
    	}, 5000);
    });
  </script>
</body>

</html>
