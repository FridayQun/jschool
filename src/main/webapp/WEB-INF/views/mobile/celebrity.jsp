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
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/celebrity.css">
  <script>
    var ctx = '${ctx}';
  </script>
</head>

<body>
<div class="top-bar">
    <div class="search-bar">
      <form class="searchForm" action="#" method="get">
        <input type="search" name="keywords" value="${keywords}" autocomplete="off" placeholder="请输入用户姓名关键字">
      </form>
		<c:if test="${user_level==null||user_level==1 }">
		<a href="#" onclick="showInfo(${user_level})" class="publish-link" style="line-height: 53px;color: white;font-size: 0.7rem;">发布</a>
		</c:if>
		<c:if test="${user_level!=null&&user_level>1 }">
		<a href="${ctx}/mobile/login/toPublish" class="publish-link" style="line-height: 53px;color:  white;font-size: 0.7rem;">发布</a>
		</c:if>
    </div>
  </div>
  <div class="main-box">
    <div class="filter-tools" >
      <div class="filter-bar">
        <div class="filter-opts"><span>筛选</span><i class="arrows"></i></div>
        <div class="filter-opts"><span>影响力</span><i class="arrows"></i></div>
      </div>
      <div class="filter-select-list closed">
        <div class="select-row">
          <div class="select-col select-title">性别</div>
          <div class="select-col mode-filter">
            <span class="active">不限</span>
            <span>男</span>
            <span>女</span>
          </div>
        </div>
        <div class="select-row">
          <div class="select-col select-title">地区</div>
          <div class="select-col district">
            <span style="vertical-align: top;" class="active">不限</span>
            <select name="province"></select>
            <select name="city"></select>
          </div>
        </div>
        <div class="select-row">
          <div class="select-col select-title">标签</div>
          <div class="select-col classify">
            <span style="vertical-align: top;" class="active">不限</span>
			<select class='fTag' name="fTag">
			<c:forEach var="fTag" items="${fTags}">
				<option value="${fTag.id}">${fTag.tagName}</option>
			</c:forEach>
			</select>
			<select class='tag' name="tag">
			<c:forEach var="tag" items="${tags}">
				<option value="${tag.id}">${tag.tagName}</option>
			</c:forEach>
			</select>
          </div>
        </div>
        <div class="select-row">
          <div class="confirm-btn">完 成</div>
        </div>
      </div>
	  <div class="filter-sort-list closed">
        <div class="sort-item" data-value="hot desc">热度</div>
        <div class="sort-item" data-value="influence desc">影响力</div>
      </div>
    </div>
    <ul class="celebrity-list">
    </ul>
    <div class="load-more">点击查看更多</div>
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
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
		var $filterList = $('.filter-select-list');
		var $projectList = $('.project-list');
		var $filterSortList = $('.filter-sort-list');
		var $celebrityList = $('.celebrity-list');
		var page = 0;
		var pageSize = 10;
		var orderStr = null;
      
      var $loadMore = $('.load-more');
      //省市联动
      (function districtSelect() {
        var $province = $('.district select').eq(0);
        var $city = $('.district select').eq(1);
        provinceAndCity($province, $city);
      })();
      
      function showMore(){
    	  if($('.celebrity-list li').length > 10){
    		  $loadMore.removeClass('hide');
    	  }else{
    		  $loadMore.addClass('hide');
    	  }
      }

      //渲染列表
      function renderList(data, empty) {
        empty && $celebrityList.empty();
        $celebrityList.append($.map(data, function(item) {
       	 var companyOrEduName = "";
       	 var tagStr='';
         var location = item.location;
       	 var influence = item.influence;
         if(item.company_name!=null) companyOrEduName =item.company_name;
         if(item.edu_name!=null) companyOrEduName = item.edu_name;
         if(typeof(location)=="undefined") location='';
         if(typeof(influence)=="undefined") influence=0;
         //if(item.istop==1 ) tagStr='<small class="tags">置顶</small>';
         if(item.tag!=null&&item.tag!='') tagStr+='<small class="tags">'+item.tag+'</small>';
          return ('<li><a href="'+ctx+'/mobileuserino/toMobileOtherUserInfo/?userid='+item.id+'"><div class="celebrity-avatar">\
                <div style="background-image:url(' +judgeHeadPic(item.head_pic_path, item.gender) +
            ')"><img src="'+ctx+'/resources/mobile/images/empty-160.png" alt=""></div>\
                </div><div class="celebrity-info"><div class="celebrity-name">\
                <span>'+item.nickname+'</span>\
                '+tagStr+'\
                </div><div class="addr"><span>'+companyOrEduName+'</span><span><i class="icon small-local"></i>'+location+'</span></div></div>\
                <div class="celebrity-charm"><i class="icon fire"></i>影响力 '+influence+'</div></a></li>');
        }).join(''));
      }

      function judgeHeadPic(headPic, gender) {
    	  headPic = headPic || '';
    	  console.log(headPic);
    	  console.log(typeof headPic);
    	  return headPic.indexOf('${NORMAL_HEAD_ICON_URL}')==0?(gender==2?'${GIRL_HEAD_ICON_URL}':'${BOY_HEAD_ICON_URL}'):headPic;
      }
      
      //筛选切换
      $('.filter-bar .filter-opts').on('tap', function() {
    	  console.log('xppp');
        var index = $(this).index();
        $(this).toggleClass('active');
        if (index === 0) {
          $filterList.toggleClass('closed');
		  $filterSortList.addClass('closed');
        } else {
			$filterSortList.toggleClass('closed');
			$filterList.addClass('closed');
          if($(this).hasClass('active')){
            console.log('升序');
          }else{
            console.log('降序');
          }
        }
        return false;
      });

		$filterSortList.find('.sort-item').on('tap',function(){
			$(this).addClass('active').siblings().removeClass('active');
			$filterSortList.toggleClass('closed');
			orderStr = $(this).data('value');
			$(".celebrity-list").empty();
			page = 0;
			init();
			return false;
		});

      // 筛选省份选择
      $('.district select').on('change', function() {
        $(this).parents('.district').find('span').removeClass('active');
        $(this).parents('.district').find('select').addClass('active');
      });
		// 筛选标签选择
		$('.classify select').on('change', function() {
			$(this).parents('.classify').find('span').removeClass('active');
			$(this).parents('.classify').find('select').addClass('active');
		});
		$('.classify .fTag').on('change', function() {
			$.ajax({
				type: "GET",
				url: ctx+"/tag/getTagList2",
				data: {
					fid: $(this).val(),
					type: 0
				},
				dataType: "json",
				success: function(data){
					$('.tag').empty();
					var $tag = $('.tag');
					if(!data.tagsList) {
						return;
					}
					for(var i=0; i<data.tagsList.length; i++) {
						$tag.append('<option value="'+data.tagsList[i].id+'">'+data.tagsList[i].tagName+'</option>');
					}
				}
			});
		});
      // 筛选选项
      $('.select-row span').on('tap', function() {
        $(this).addClass('active').siblings().removeClass('active');
        return false;
      });

      // 筛选的确认按钮
      $('.filter-select-list .confirm-btn').on('tap', function() {
        $filterList.addClass('closed');
        var mode = $('.mode-filter span.active').text(); //选中的类型
		if(mode == '不限') mode = null;
		else if(mode == '男') mode = 1;
		else mode = 2;
        var district = null;
        var tags = null;
        if ($('.district span.active').length < 1) {
          var province = $('.district select').eq(0).find('option:checked').text();
          var city = $('.district select').eq(1).find('option:checked').text();
          district = province + ',' + city;
        } else {
          district = null;
        }
		if($('.classify span.active').length < 1) {
			var tags = [parseInt($('.classify select').eq(1).val())];
			if(isNaN(tags[0])) {
				tags = null;
			}
		} else {
			tags = null;
		}
        console.log(mode, district, tags);
		page = 1;
		$(".celebrity-list").empty();
		$.ajax({
			type: "GET",
			url: ctx+"/user/getUserList",
			traditional: true, // 阻止深度序列化
			data: {
				"tags":tags,
				"location":district,
				"gender":mode,
				"page":page,
				"pageSize":pageSize,
				"userlevel":2,
				"orderStr":orderStr
			},
			dataType: "json",
			success: function(data){
				if(data.newsList.length > 0){
					renderList(data.newsList);
					showMore();
				}else{
					$loadMore.addClass('hide');
				}
			}
		});
        return false;
      });

      //载入更多
      $('.load-more').on('tap', function() {
    	init();
        return false;
      });
      
    //初始化方法
      function init(){
    	  page = page + 1;
          $.ajax({
              type: "GET",
              url: ctx+"/user/getUserList",
              data: {"page":page,"pageSize":pageSize,"userlevel":2, "orderStr":orderStr, "nicknmae": '${keywords}'},
              dataType: "json",
              success: function(data){      
            	  if(data.newsList.length > 0){
            		  renderList(data.newsList);
            		  showMore();
            	  }else{
            		  $loadMore.addClass('hide');
            	  }
              }
          });   
          
      }
      init();
    })
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
