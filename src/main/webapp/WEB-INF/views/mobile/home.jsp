<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="鲸客校园,鲸客网,校园赞助,校园活动,校园推广,技能服务,校园营销,校园红人,校园自媒体">
  <meta name="description" content="鲸客校园,鲸客网,校园赞助,校园活动,校园推广,技能服务,校园营销,校园红人,校园自媒体">
  <meta name="author" content="">
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/swiper.min.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/home.css">
  <script>
    var ctx = '${ctx}';
  </script>
	<style>
.oneline-message {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.detail-line {
    font-size: 0.7rem;
    color: darkgray;
    overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
	</style>
</head>

<body>
  <div class="top-bar">
    <div class="search-bar">
      <form class="searchForm" action="#" method="post" id="keySubmit">
        <label><input type="search" name="keyWords" id="keyWords"  value="${keywords }" autocomplete="off" placeholder="请输入赞助、活动、学校等关键字"></label>
      </form>
      <c:if test="${user_level==null||user_level==1 }">
	        <a href="#" onclick="showInfo(${user_level})" class="publish-link" style="line-height: 53px;color: #00adec;font-size: 0.7rem;">发布</a>
        </c:if>
        <c:if test="${user_level!=null&&user_level>1 }">
		    <a href="${ctx}/mobile/login/toPublish" class="publish-link" style="line-height: 53px;color: #00adec;font-size: 0.7rem;">发布</a>
        </c:if>
    </div>
  </div>
  <div class="main-box">
    <div class="home-banner">
      <div class="swiper-container" id="homeBannerSwiper">
        <div class="swiper-wrapper">
          <c:forEach var="bunnerImg" items="${bunnerImgList}" >
	          <div class="swiper-slide"><img src="${bunnerImg.image}" alt=""></div>
          </c:forEach>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    <div class="nav-list">
    	<c:set var="sysModuleStart" value="${fn:length(sysModuleList)-8>=0?fn:length(sysModuleList)-8:0 }" />
   		<c:set var="sysModuleLength" value="${fn:length(sysModuleList)-1<0?0:fn:length(sysModuleList)-1 }" />
		<c:forEach begin="${sysModuleStart }" end="${sysModuleLength }" var="sysModule" items="${sysModuleList}" step="1"  >
			<div class="nav-item">
			    <a href="${ctx}/mobile/login/${sysModule.moduleUrl}">
					<div class="nav-icon-box" style="background: url(${sysModule.modulePic}) no-repeat 50% 50% / cover;"><img calss="nav-icon" src="${ctx}/resources/mobile/images/nav-icon.png" alt=""></div>
					<div class="nav-icon-name">${sysModule.moduleName}</div>
			    </a>
			</div>
      </c:forEach>
      <!--
 	  <div class="nav-item">
        <a href="${ctx}/mobile/login/toCreativityList">
	        <div class="nav-icon-box" style="background-image: url(${ctx}/resources/mobile/images/nav-icon.png)"><img calss="nav-icon" src="${ctx}/resources/mobile/images/nav-icon.png" alt=""></div>
	        <div class="nav-icon-name">创意大赛</div>
        </a>
      </div>
      <div class="nav-item">
        <a href="${ctx}/mobile/login/toCelebrity">
	        <div class="nav-icon-box" style="background-image: url(${ctx}/resources/mobile/images/nav-icon.png)"><img calss="nav-icon" src="${ctx}/resources/mobile/images/nav-icon.png" alt=""></div>
	        <div class="nav-icon-name">红人馆</div>
        </a>
      </div>
      <div class="nav-item">
        <a href="${ctx}/mobile/login/toHeadline">
	        <div class="nav-icon-box" style="background-image: url(${ctx}/resources/mobile/images/nav-icon.png)"><img calss="nav-icon" src="${ctx}/resources/mobile/images/nav-icon.png" alt=""></div>
	        <div class="nav-icon-name">校园头条</div>
        </a>
      </div>
      <div class="nav-item">
        <a href="${ctx}/integral/tointegralindex">
        	<div class="nav-icon-box" style="background-image: url(${ctx}/resources/mobile/images/nav-icon.png)"><img calss="nav-icon" src="${ctx}/resources/mobile/images/nav-icon.png" alt=""></div>
        	<div class="nav-icon-name">积分商城</div>
        </a>
      </div>-->
    </div>
	<div class="home-notice">
		<div class="notice-title">公告<i class="icon notice"></i></div>
		<div class="notice-desc">
		<c:forEach var="mesg" items="${mesgList}" >
			<a href="${ctx}/mobile/login/tomesg?id=${mesg.id}">${mesg.title}</a>
		</c:forEach>
		</div>
	</div>
    <div class="home-primary">
      <div class="primary-row">
        <div class="primary-title">
          <div class="perch"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
          <div class="inner-text"><a href="${ctx}/mobile/login/toProjectList?firstCateId=${supportCate.id}"><i class="icon heart-icon"></i><span>校园赞助</span></a></div>
        </div>
        <div class="primary-cols">
          <c:forEach var="supportCate" items="${supportCateList}" begin="0" end="3">
	          <div class="primary-col" style="padding: 5px 0;">
	          	<a href="${ctx}/mobile/login/toProjectList?firstCateId=${supportCate.id}">
		            <div class="col-photo"><img style="border-radius: 50%;" src="${supportCate.headPicPath}" alt=""></div>
		            <div class="col-title oneline-message">${supportCate.cateName}</div>
	            </a>
	          </div>
          </c:forEach>
        </div>
      </div>
		<div class="primary-row">
			<div class="primary-title">
				<div class="perch"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
				<div class="inner-text"><a href="${ctx}/mobile/login/toProjectList?firstCateId=${addressCate.id}"><i class="icon tag-icon"></i><span>校园场地</span></a></div>
			</div>
			<div class="primary-cols">
			<c:forEach var="addressCate" items="${addressCateList}" begin="0" end="3">
				<div class="primary-col" style="padding: 5px 0;">
					<a href="${ctx}/mobile/login/toProjectList?firstCateId=${addressCate.id}">
						<div class="col-photo"><img style="border-radius: 50%;" src="${addressCate.headPicPath}" alt=""></div>
						<div class="col-title oneline-message">${addressCate.cateName}</div>
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>
    <div class="home-recommend section">
      <div class="section-title">
        <span>推荐项目</span>
        <a href="${ctx }/mobile/login/toProjectList" class="more">更多<i class="icon right-arrows"></i></a>
      </div>
      <div class="section-body">
        <div class="recommend-box">
          <div class="left-part">
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment1[0].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[0].projType==0?'service':'funds' }"><img src="${recomment1[0].projPicPath}" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment1[0].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment1[0].username }</span><i class="icon ${recomment1[0].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment1[0].eduName==null?recomment1[0].companyName:recomment1[0].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment1[0].projLocation==null?'不限':recomment1[0].projLocation }</small>￥${recomment1[0].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment1[3].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[3].projType==0?'service':'funds' }"><img src="${recomment1[3].projPicPath}" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment1[3].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment1[3].username }</span><i class="icon ${recomment1[3].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment1[3].eduName==null?recomment1[3].companyName:recomment1[3].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment1[3].projLocation==null?'不限':recomment1[3].projLocation }</small>￥${recomment1[3].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
          <div class="right-part">
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment1[1].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[1].projType==0?'service':'funds' }"><img src="${recomment1[1].projPicPath}" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment1[1].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment1[1].username }</span><i class="icon ${recomment1[1].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment1[1].eduName==null?recomment1[1].companyName:recomment1[1].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment1[1].projLocation==null?'不限':recomment1[1].projLocation }</small>￥${recomment1[1].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment1[2].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[2].projType==0?'service':'funds' }"><img src="${recomment1[2].projPicPath}" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment1[2].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment1[2].username }</span><i class="icon ${recomment1[2].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment1[2].eduName==null?recomment1[2].companyName:recomment1[2].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment1[2].projLocation==null?'不限':recomment1[2].projLocation }</small>￥${recomment1[2].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="home-news section">
      <div class="section-title">
        <span>热门资讯</span>
        <a href="${ctx}/mobile/login/toHeadline" class="more">更多<i class="icon right-arrows"></i></a>
      </div>
      <div class="section-body">
        <div class="news-box">
          <div class="news-left">
          <c:if test="${newsList!=null && fn:length(newsList)>0}">
            <a href="${ctx}/mobile/login/toNewsDetails?id=${newsList[0].id}">
            </c:if>
            <c:if test="${newsList==null || fn:length(newsList)==0}">
            <a href="${ctx}/mobile/login/toHeadline">
            </c:if>
              <div class="news-photo" style="position: relative;">
			<c:if test="${newsList!=null && fn:length(newsList)>0}">
			<img style="height: 120px;" src="${newsList[0].picPath}" alt="">
			<p style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 100%; text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 95%;font-weight: 500;opacity: .9;margin: 0; padding: 0;">${newsList[0].title }</p>
			</c:if>
			<c:if test="${newsList==null || fn:length(newsList)==0}">
			<img src="${ctx}/resources/mobile/images/home-news-1.png" alt="">
			</c:if>
			</div>
<!--               <p>毕业季场地出租只要999</p> -->
            </a>
            <c:forEach var="news" begin="2" end="5" items="${newsList}" step="1" >
	            <p style=" margin-top: 8px; margin-bottom: 8px; "><a href="${ctx}/mobile/login/toNewsDetails?id=${news.id}">${news.title }</a></p>
            </c:forEach>
          </div>
          <div class="news-right">
            <c:forEach var="news" begin="6" end="9" items="${newsList}" step="1" >
	            <p style=" margin-top: 8px; margin-bottom: 8px; "><a href="${ctx}/mobile/login/toNewsDetails?id=${news.id}">${news.title }</a></p>
            </c:forEach>
            <c:if test="${newsList!=null && fn:length(newsList)>1}">
            <a href="${ctx}/mobile/login/toNewsDetails?id=${newsList[1].id}">
            </c:if>
            <c:if test="${newsList==null || fn:length(newsList)<=1}">
            <a href="${ctx}/mobile/login/toHeadline">
            </c:if>
              <div class="news-photo" style="position: relative;">
			<c:if test="${newsList!=null && fn:length(newsList)>1}">
			<img style="height: 120px;" src="${newsList[1].picPath}" alt="">
			<p style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 100%; text-align: center;background: rgba(10, 6, 6, 0.5);position: absolute;bottom: 0px;width: 100%;height: 25px;line-height: 25px;color: white;font-size: 95%;font-weight: 500;opacity: .9;margin: 0; padding: 0;">${newsList[1].title }</p>
			</c:if>
			<c:if test="${newsList==null || fn:length(newsList)<=1}">
			<img src="${ctx}/resources/mobile/images/home-news-1.png" alt="">
			</c:if>
			  </div>
<!--               <p>毕业季场地出租只要999</p> -->
            </a>
          </div>
        </div>
      </div>
    </div>
    <div class="home-hipster section">
      <div class="section-title">
        <span>校园达人</span>
        <a href="${ctx }/mobile/login/toCelebrity" class="more">更多<i class="icon right-arrows"></i></a>
      </div>
      <div class="section-body">
        <div class="hipster-list">
          <c:forEach var="star" items="${starList}" begin="0" end="7">
	          <div class="hipster-item">
	            <a href="${ctx}/mobileuserino/toMobileOtherUserInfo/?userid=${star.id}">
	              <div class="hipster-avatar" style="background-image:url(${fn:startsWith(star.head_pic_path, NORMAL_HEAD_ICON_URL)==false?star.head_pic_path:(star.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL)})"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
	              <div class="hipster-info" style="margin-right: 0.2em;"><span>${star.nickname }</span><i class="icon ${star.gender==2?'gender-girl':'gender-boy' }"></i><br><small>${star.edu_name }</small></div>
	              <div class="tags">${star.tag }</div>
				</a>
	          </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <div class="home-primary">
      <div class="primary-row">
        <div class="primary-title">
          <div class="perch"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
          <div class="inner-text"><a href="${ctx}/mobile/login/toProjectList?firstCateId=${thirdServerCate.id}"><i class="icon box-icon"></i><span>第三方服务</span></a></div>
        </div>
        <div class="primary-cols">
          <c:forEach var="thirdServerCate" items="${thirdServerCateList}" begin="0" end="3">
	          <div class="primary-col" style="padding: 5px 0;">
	            <a href="${ctx}/mobile/login/toProjectList?firstCateId=${thirdServerCate.id}">
	              <div class="col-photo"><img style="border-radius: 50%;" src="${thirdServerCate.headPicPath}" alt=""></div>
	              <div class="col-title oneline-message">${thirdServerCate.cateName }</div>
	            </a>
	          </div>
          </c:forEach>
        </div>
      </div>
      <div class="primary-row">
        <div class="primary-title">
          <div class="perch"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
          <div class="inner-text"><a href="${ctx}/mobile/login/toProjectList?firstCateId=${mediaCate.id}"><i class="icon tv-icon"></i><span>线上媒体</span></a></div>
        </div>
        <div class="primary-cols">
          <c:forEach var="mediaCate" items="${mediaCateList}" begin="0" end="3">
	          <div class="primary-col" style="padding: 5px 0;">
	            <a href="${ctx}/mobile/login/toProjectList?firstCateId=${mediaCate.id}">
	              <div class="col-photo"><img style="border-radius: 50%;" src="${mediaCate.headPicPath}" alt=""></div>
	              <div class="col-title oneline-message">${mediaCate.cateName }</div>
	            </a>
	          </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <div class="home-recommend section">
      <div class="section-title">
        <span>推荐项目</span>
        <a href="${ctx }/mobile/login/toProjectList" class="more">更多<i class="icon right-arrows"></i></a>
      </div>
      <div class="section-body">
        <div class="recommend-box">
          <div class="left-part">
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment2[0].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment2[0].projType==0?'service':'funds' }"><img src="${recomment2[0].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment2[0].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment2[0].username }</span><i class="icon ${recomment2[0].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment2[0].eduName==null?recomment2[0].companyName:recomment2[0].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment2[0].projLocation==null?'不限':recomment2[0].projLocation }</small>￥${recomment2[0].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment2[3].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment2[3].projType==0?'service':'funds' }"><img src="${recomment2[3].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment2[3].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment2[3].username }</span><i class="icon ${recomment2[3].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment2[3].eduName==null?recomment2[3].companyName:recomment2[3].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment2[3].projLocation==null?'不限':recomment2[3].projLocation }</small>￥${recomment2[3].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
          <div class="right-part">
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment2[1].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment2[1].projType==0?'service':'funds' }"><img src="${recomment2[1].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment2[1].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment2[1].username }</span><i class="icon ${recomment2[1].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment2[1].eduName==null?recomment2[1].companyName:recomment2[1].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment2[1].projLocation==null?'不限':recomment2[1].projLocation }</small>￥${recomment2[1].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${recomment2[2].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment2[2].projType==0?'service':'funds' }"><img src="${recomment2[2].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${recomment2[2].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${recomment2[2].username }</span><i class="icon ${recomment2[2].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${recomment2[2].eduName==null?recomment2[2].companyName:recomment2[2].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${recomment2[2].projLocation==null?'不限':recomment2[2].projLocation }</small>￥${recomment2[2].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="home-primary">
      <div class="primary-row">
        <div class="primary-title">
          <div class="perch"><img src="${ctx}/resources/mobile/images/empty-160.png" alt=""></div>
          <div class="inner-text"><a href="${ctx}/mobile/login/toProjectList?firstCateId=${skillCate.id}"><i class="icon group-icon"></i><span>技能服务</span></a></div>
        </div>
        <div class="primary-cols">
          <c:forEach var="skillCate" items="${skillCateList}" begin="0" end="3">
	          <div class="primary-col" style="padding: 5px 0;">
	            <a href="${ctx}/mobile/login/toProjectList?firstCateId=${skillCate.id}">
	              <div class="col-photo"><img style="border-radius: 50%;" src="${skillCate.headPicPath}" alt=""></div>
	              <div class="col-title">${skillCate.cateName }</div>
	            </a>
	          </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <div class="home-recommend section">
      <div class="section-title">
        <span>技能服务</span>
        <a href="${cxt }/mobile/login/toProjectList" class="more">更多<i class="icon right-arrows"></i></a>
      </div>
      <div class="section-body">
        <div class="recommend-box">
          <div class="left-part">
			<div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${skillProjectList[0].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[0].projType==0?'service':'funds' }"><img src="${skillProjectList[0].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${skillProjectList[0].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${skillProjectList[0].username }</span><i class="icon ${skillProjectList[0].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${skillProjectList[0].eduName==null?skillProjectList[0].companyName:skillProjectList[0].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${skillProjectList[0].projLocation==null?'不限':skillProjectList[0].projLocation }</small>￥${skillProjectList[0].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${skillProjectList[3].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[3].projType==0?'service':'funds' }"><img src="${skillProjectList[3].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${skillProjectList[3].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${skillProjectList[3].username }</span><i class="icon ${skillProjectList[3].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${skillProjectList[3].eduName==null?skillProjectList[3].companyName:skillProjectList[3].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${skillProjectList[3].projLocation==null?'不限':skillProjectList[3].projLocation }</small>￥${skillProjectList[3].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
          <div class="right-part">
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${skillProjectList[1].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[1].projType==0?'service':'funds' }"><img src="${skillProjectList[1].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem;overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${skillProjectList[1].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${skillProjectList[1].username }</span><i class="icon ${skillProjectList[1].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${skillProjectList[1].eduName==null?skillProjectList[1].companyName:skillProjectList[1].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${skillProjectList[1].projLocation==null?'不限':skillProjectList[1].projLocation }</small>￥${skillProjectList[1].moneyNeeds }</div>
                </div>
              </a>
            </div>
            <div class="recommend-row">
              <a href="${ctx}/mobile/login/toProjectDetail?id=${skillProjectList[2].id}">
                <div class="rr-col" style="width: 50%">
                  <div class="photo ${recomment1[2].projType==0?'service':'funds' }"><img src="${skillProjectList[2].projPicPath }" alt=""></div>
                </div>
                <div class="rr-col" style="width: 50%; overflow-y: hidden;">
                  <div class="title"><span style="white-space: normal;font-size: 0.7rem;line-height: 0.8rem; height: 1.5rem; overflow: hidden;text-overflow: ellipsis;max-block-size: 1.5rem;block-size: 1.5rem;">${skillProjectList[2].projName }</span></div>
                  <div class="detail-line"><span style=" margin-right: 0.2em; ">${skillProjectList[2].username }</span><i class="icon ${skillProjectList[2].gender==2?'gender-girl':'gender-boy' }"></i></div>
                  <div class="detail-line"><span>${skillProjectList[2].eduName==null?skillProjectList[2].companyName:skillProjectList[2].eduName }&nbsp;</span></div>
                  <div class="cost"><small style="margin-right: 1px;color: black;font-size: 0.4rem;display: inline-block;max-width: 50%;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${skillProjectList[2].projLocation==null?'不限':skillProjectList[2].projLocation }</small>￥${skillProjectList[2].moneyNeeds }</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="home-ad-banner">
      <div class="swiper-container" id="homeAdSwiper">
        <div class="swiper-wrapper">
          <c:forEach var="bunnerImg" items="${bunnerImgList}" >
	          <div class="swiper-slide"><img src="${bunnerImg.image}" alt=""></div>
          </c:forEach>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
    <%--
    <div class="home-like">
      <div class="like-title"><span>猜你喜欢</span><a href="${ctx }/mobile/login/toProjectList" class="more">更多<i class="icon right-arrows"></i></a></div>
      <div class="like-list">
      <c:forEach var="recomment" items="${recomments }">
      	<div class="like-item">
          <a href="">
            <div class="like-photo service"><img style="width:11.7rem; height: 9rem;" src="${recomment.projPicPath }" alt=""></div>
            <div class="like-desc">
              <div class="name-tags" style="text-overflow:ellipsis; overflow:hidden; white-space: nowrap; font-size: 10px;"><strong>${recomment.projName }</strong>${recomment.istop==1?'<span class="tags">置顶</span>':'' }${recomment.uid==1?'<span class="tags">自营</span>':'' }</div>
              <div class="name-and-school"><span style=" margin-right: 10px; ">${recomment.username }</span><i class="icon ${recomment.gender==2?'gender-girl':'gender-boy' }"></i><span style=" float: right; ">${recomment.eduName==null?recomment.companyName:recomment.eduName }</span></div>
              <div class="views"><span style="color: orange; margin-right: 10px;">￥${recomment.moneyNeeds }</span><span style="float:right;"><i class="icon eye"></i>${recomment.browsevolume }人浏览</span></div>
            </div>
          </a>
        </div>
      </c:forEach>
      </div>
    </div>
     --%>
  </div>
  <div class="tab-bar">
    <div class="tab-item active"><a href="${ctx}/mobile/login/toHome"><i class="tab-icon home-icon"></i><span>首页</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toProjectList"><i class="tab-icon project-icon"></i><span>项目</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toHeadline"><i class="tab-icon rss-icon"></i><span>资讯</span></a></div>
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
  <script src="${ctx}/resources/mobile/js/swiper.jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.marquee.min.js"></script>
  <script>
  $(function() {
      //banner切换
      var homeBannerSwiper = new Swiper('#homeBannerSwiper', {
        loop: true,
        pagination: '.swiper-pagination',
      });
      //广告切换
      var homeAdSwiper = new Swiper('#homeAdSwiper', {
        loop: true,
        pagination: '.swiper-pagination',
      });
      
      var login_openId = '<%=session.getAttribute("login_openId")%>';
    //关键字搜索
      $('#keySubmit').on('submit',function(){
	      var keywords = $("#keyWords").val();
    	  window.location.href=ctx+"/mobile/login/toProjectList?keywords="+keywords;
    	  return false;
      });

	var $mq = $('.notice-desc').marquee({
		duration: 14000,
		gap: 50,
		startVisible: true,
		delayBeforeStart: 0,
		direction: 'left',
		duplicated: true
	});

    
      if(login_openId=='null'){
      	  //thirdLogin();
      }

     function thirdLogin(){
      	var appid= 'wxe04b5cbb1afdca93';
      	var secret = 'e2f80332024f1d91b1a3c41bca3db344';
      	var redirect_uri='${ctx }%2Fmobile%2Flogin%2FWXlogin'.replace(/\//g, '2F%');
      	window.location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid='+appid+'&redirect_uri='+redirect_uri+'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
      }

	  //发布项目成功回调
     var isPublish = '${isPublish}';
     if(isPublish=='1'){
     	alert("您发布的项目已经提交审核，请您耐心等待！");
     }
    })
	function showInfo(userLevel){
		if(userLevel==null)
			alert("未登录！");
		else if(userLevel==1)
			alert("未认证，请认证！");
	}
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
