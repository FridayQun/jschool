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
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>JingKe</title>
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/celebrity.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/luara.left.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <style>
	.gender{
		margin-left: 4px;
		margin-right: 15px;
	}
	.tag {
		position: absolute;
		top: 0;
		right: 0;
		width: 80px;
		background-color: gold;
		color: white;
		border-radius: 3px;
		filter: alpha(opacity=80);
		-moz-opacity: 0.8;
		opacity: 0.8;
		text-align: center;
	}
	.advice {
		height: 315px;
		border-top: 1px solid #d2d2d2;
		padding: 0 10px;
		margin-bottom: 10px;
	}
	.advice:last-child {
		margin-bottom: 0;
		border-bottom: 1px solid #d2d2d2;
	}
  </style>
	<script>
var ctx = '${ctx}';
	</script>
</head>

<body>
    <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>

  <div class="list-section">
    <div class="wrapper">
      <div class="filter-box" style="border-right: none">
        <div class="filter-opts">
<!--           <div class="filter-row-parent"> -->
<!--             <div class="title">标签分类</div> -->
<!--             <div class="tags"> -->
<!--               <a class="active" href="#">全部</a> -->
<!--             </div> -->
<!--           </div> -->
          <div class="filter-row">
            <div class="title">个人标签</div>
            <div class="tags">
              <a class="active" href="#">全部</a>
              <c:forEach var="jkTag" items="${jkTagList}" >
              <c:if test="${jkTag.parentId == 0}">
	              <a href="#" ><input type="hidden" value="${jkTag.id }"/>${jkTag.tagName}</a>              
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="filter-row filter-opts">
            <div class="title">性别</div>
            <div class="tags">
              <a class="active" href="#" data-gender="">不限</a>
              <a href="#" data-gender="1">男</a>
              <a href="#" data-gender="2">女</a>
            </div>
          </div>
           <div class="filter-row fold">
            <div class="title">地区限制</div>
            <div class="tags district-select">
              <!-- 这里有改动 4-13 -->
              <select class="province" name="province1" >
              </select>
              <select class="city" name="city1" >
              </select>
            </div>
          </div>
          <div class="search-bar">
            <form class="searchForm" action="${ctx}/login/toCelebrity" method="get">
              <label for=>搜索</label>
              <input type="search" name="keywords" id="keywords" value="${keywords }"><input type="submit" name="submit" value="">
            </form>
          </div>
        </div>
        <!-- 伪造分割线 -->
        <div style="width: 249px;position: absolute;top: -1px;right: 0;bottom: -1px;background: #f4f4f4;border-left: 1px solid rgb(210, 210, 210);border-top: 1px solid #f4f4f4;border-bottom: 1px solid #f4f4f4;z-index: 1;border-right:none;"></div>
        <div class="advertising" style="border: 1px solid rgb(210, 210, 210); top: -1px; z-index: 10; background: white;">
			<ul>
			<c:if test="${celebretyAds != null}">
			<c:forEach var="celebretyAd" items="${celebretyAds }">
				<li><a href="${celebretyAd.url}"><img style="width: 212px;height: 313px;padding: 9px;" src="${celebretyAd.image}" alt="1"/></a></li>
			</c:forEach>
			</c:if>
			<c:if test="${celebretyAds == null}">
				<li><a href="#"><img src="" alt="1" /></a></li>
			</c:if>
			</ul>
			<ol>
			<c:if test="${celebretyAds != null}">
			<c:forEach var="celebretyAd" items="${celebretyAds }">
				<li></li>
			</c:forEach>
			</c:if>
			<c:if test="${celebretyAds == null}">
				<li></li>
			</c:if>
			</ol>
		</div>
      </div>
	  <div style="display: block; width: 100%; height: auto; margin: 0; padding: 0; border: 0;">
	  <div class="list-box" style="float: right; width: 19%;display: inline-block;margin-left: 0%;">
		<div style="
			height: 65px;
			padding: 0 20px;
			line-height: 64px;">
			<a style="
				vertical-align: middle;
				color: #7e7e7e;" href="#" >红人推荐</a>
        </div>
		<c:forEach var="recomment" items="${recomments}" >
			<div class='advice'>
				<div class="col c1">
				<a href="${ctx}/login/toOtherUser?userid=${recomment.id}"><img style="
					width: 100%;
					height: 190px;
                    margin: 33px 0 5px 0;
					" src="${(recomment.head_pic_path==null || fn:startsWith(recomment.head_pic_path, NORMAL_HEAD_ICON_URL)) ? (recomment.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL) : recomment.head_pic_path  }" alt=""></a>
				</div>
				<div class="col c2">
	              <h3 style="position: relative; margin-bottom: 6px; font-weight: normal;"><a href="${ctx}/login/toOtherUser?userid=${recomment.id}"><span>${recomment.nickname }</span><span style="
"><c:if test="${recomment.gender==2}"><i style="margin-left: 4px;" class="icon gender-girl"></i></c:if><c:if test="${recomment.gender!=2}"><i style="margin-left: 4px;" class="icon gender-boy"></i></c:if></span><span style="float: right;"><i class="icon influence"></i>${recomment.influence }</span></a></h3>
	              <p style="margin: 0;"><span style="margin-left: 0px;"><c:if test="${recomment.company_name!=null }">${recomment.company_name }</c:if>
	                <c:if test="${recomment.edu_name!=null }">${recomment.edu_name }</c:if></span></p>
	              <p style="margin: 0;"><span>${recomment.location!=null?recomment.location:'' }</span>
				  </p>
	            </div>
			</div>
		</c:forEach>
      </div>
      <div class="list-box" style="width: 79.5%;display: inline-block;position: relative;padding: 0 0 50px 0; min-height: 990px">
        <div class="list-sort-bar">
          <span class="title">默认</span>
          <a style="display: none;" href="##" data-sort="s1" class="sort-btn">热度<i class="icon down"></i></a>
          <a style="display: none;" href="##" data-sort="s2" class="sort-btn">影响力<i class="icon down"></i></a>
        </div>
        <ul class="result-list">
<!--           <li> -->
<!--             <a href="#"> -->
<%--               <div class="photo"><img src="${ctx}/resources/artcle/images/celebrity-l1.jpg" alt=""></div> --%>
<!--               <div class="user-info"> -->
<!--                 <span class="user-name">璐璐</span> -->
<!--                 <span class="user-charm">影响力 1245</span> -->
<!--               </div> -->
<!--               <p>山东大学</p> -->
<!--             </a> -->
<!--           </li> -->
        </ul>
        <div class="paging-bar" style=" position: absolute; width: 100%; bottom: 10px; padding-right: 20px; box-sizing: border-box; ">
          <div class="paging-info">共 120 位会员</div>
          <div class="paging-box">
            <a href="#" class="prev">&#60;</a>
            <a href="#" class="pagination active">2</a>
            <a href="#" class="pagination">3</a>
            <a href="#" class="next">&#62;</a>
          </div>
        </div>
      </div>

	  </div>

<!--       <div class="recommend-box"> -->
<!--         <div class="recommend-title">猜你喜欢</div> -->
<!--         <ul class="recommend-list"> -->
<!--           <li> -->
<!--             <a href=""> -->
<%--               <div class="celebrity-photo"><img src="${ctx}/resources/artcle/images/celebrity-l3.jpg" alt=""></div> --%>
<!--               <div class="celebrity-intro"> -->
<!--                 <span class="user-name">张大雷</span> -->
<!--                 <span class="user-group">杭州云暴科技有限公司</span> -->
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
    var NORMAL_HEAD_ICON_URL = "<%=Constant.NORMAL_HEAD_ICON_URL %>";
    var GIRL_HEAD_ICON_URL = "<%=Constant.GIRL_HEAD_ICON_URL %>";
    var BOY_HEAD_ICON_URL = "<%=Constant.BOY_HEAD_ICON_URL %>";
    if(typeof String.prototype.startsWith!="function"){String.prototype.startsWith=function(prefix){return this.slice(0,prefix.length)===prefix}};

	$(function(){
		// <!--调用Luara示例-->
		// 轮播
		$(".advertising").luara({width:"235", height:"331", interval:4500, selected:"seleted", deriction:"left"});
	});

    $(function() {
      var $filterTags = $('.filter-opts .tags a');
      var $resultList = $('.result-list');
      var login_userId = '<%=session.getAttribute("login_userId")%>';      
      
      var nowClickCateObj = null;    
      var orderStr = null;
      var locationName = '';
      //更新列表
      function updateList(data) {
        data = data.newsList;
        if (data && data.length > 0) {
          var nodeList = data.map(function(item, index) {
          	var companyOrEduName = "";
            console.log(item);
            if(item.company_name!=null)
              companyOrEduName =item.company_name;
            if(item.edu_name!=null)
              companyOrEduName = item.edu_name;
            var urlStr = '<a href="' + ctx+'/login/toOtherUser?userid='+item.id + '">';
            if(login_userId=='null')
              urlStr = '<a href="##" onclick="showInfo3(null);">';
            var gender = item.gender == 2?'<i class="icon gender-girl"></i>':'<i class="icon gender-boy"></i>';
            var tag = item.tag?item.tag:'无';
            if(item.head_pic_path.startsWith(NORMAL_HEAD_ICON_URL)) {
              if(item.gender == 2) {
                return ('<li>'+urlStr+'<div style="position:relative;" class="photo">'+
                '<span class="tag">'+tag+'</span>'
                +'<img src="' + GIRL_HEAD_ICON_URL + '" alt=""></div><div class="user-info"><span class="user-name">' + item.nickname + '</span><span class="gender">'+gender+'</span><span class="user-charm"><i class="icon influence"></i>' + item.influence +
              '</span></div><p>' + companyOrEduName + '</p><p>'+fixStr(item.location)+'</p></a></li>')
              } else {
                return ('<li>'+urlStr+'<div style="position:relative;" class="photo">'+
                '<span class="tag">'+tag+'</span>'
                +'<img src="' + BOY_HEAD_ICON_URL + '" alt=""></div><div class="user-info"><span class="user-name">' + item.nickname + '</span><span class="gender">'+gender+'</span><span class="user-charm"><i class="icon influence"></i> ' + item.influence +
              '</span></div><p>' + companyOrEduName + '</p><p>'+fixStr(item.location)+'</p></a></li>')
              }
            }
            return ('<li>'+urlStr+'<div style="position:relative;" class="photo">'+
                '<span class="tag">'+tag+'</span>'
                +'<img src="' + item.head_pic_path + '" alt=""></div><div class="user-info"><span class="user-name">' + item.nickname + '</span><span class="gender">'+gender+'</span><span class="user-charm"><i class="icon influence"></i> ' + item.influence +
              '</span></div><p>' + companyOrEduName + '</p><p>'+fixStr(item.location)+'</p></a></li>')
          });
          $resultList.empty().append(nodeList.join(''));
        } else {
          $resultList.empty().append('<div class="empty-hint">没有找到匹配的用户！</div>');
        }
      }

        // 处理undefined
        function fixStr(param) {
        	return param==undefined?'':param;
        }

      function paging() {
        var $pagingBtns = $('.paging-box a');
        $pagingBtns.on('click', function() {
          if ($(this).hasClass('prev')) {
            console.log("上一页按钮");
          } else if ($(this).hasClass('next')) {
            console.log("下一页按钮");
          } else {
            console.log("分页按钮");
          }
          return false;
        });
      }
      //顶部过滤标签
      $filterTags.on('click', function() {
    	nowClickCateObj = $(this);
        var param = $(this).attr('href');
        $(this).addClass('active').siblings().removeClass('active');
        search();
        return false;
      });
      //首次加载，模拟一个点击事件
      $('.filter-opts .tags a:eq(0)').click();
      
      //排序按钮
      $('.list-sort-bar a.sort-btn').on('click', function() {
        $(this).toggleClass('active');
        if($(this).hasClass('active')){
            if($(this).data('sort')=='s1') orderStr='hot asc';
            else orderStr='influence asc';
          }else{
            if($(this).data('sort')=='s2') orderStr='influence desc';
            else orderStr='hot desc';
        }
        nowClickCateObj.click();
      });

      $('.unfold-btn').on('click', function() {
        $(this).parents('.filter-row').toggleClass('fold');
        return false;
      });

      //分页
      $(".paging-box").createPage({
        pageCount: 6,
        current: 1,
        backFn: function(curr) {
          console.log(curr);
        }
      });
      
    //选择地区
      $('.district-select').each(function(item,index){
        var $province = $(this).find('select').eq(0);
        var $city = $(this).find('select').eq(1);
        var code = getDistrictCode($city.attr('value'));
        provinceAndCity($province,$city,code.province,code.city);
      });
    
      $('.district-select select') .on('change',function(){
    	  var p = $('.district-select select').eq(0).find('option:checked').text();
    	  var c = $('.district-select select').eq(1).find('option:checked').text();
    	  locationName = p+","+c;
    	  if(p=="不限"){
    		  locationName="";
    	  }
    	  search();
      })
      function search(){
    	  setTimeout(function(){
  			//筛选条件	
            var tag = $(".filter-row:eq(0) a.active input").val();
  			var gender = $(".filter-row:eq(1) a.active").data("gender");
  			var keywords = $("#keywords").val();
  			if(tag=='') tag=null;
  			if(locationName==''||locationName=='全部') locationName=null;
  			if(gender=='') gender=null;
  			if(keywords=='') keywords=null;
              $.ajax({
                  type: "GET",
                  url: ctx+"/user/getUserList",
                  data: {"tags":tag,"location":locationName,"gender":gender,"nicknmae":keywords,"page":1,"pageSize":$("#pageSize").val(),"userlevel":2,"orderStr":orderStr},
                  dataType: "json",
                  success: function(data){      
                  	updateList(data);
                  	$(".paging-info").text("共"+data.total+"个会员");
                  	$("#pages").val(data.pages);
                      $(".paging-box").createPage({
                          pageCount: data.pages,
                          current: 1,
                          backFn: function(curr) {      	
              	            var tag = $(".filter-row:eq(0) a.active input").val();
                  			var locationName = $(".filter-row:eq(1) a.active").text();
                  			var gender = $(".filter-row:eq(2) a.active").data("gender");
                  			var keywords = $("#keywords").val();
                  			if(tag=='') tag=null;
                  			if(locationName==''||locationName=='全部') locationName=null;
                  			if(gender=='') gender=null;
                  			if(keywords=='') keywords=null;
                              $.ajax({
                                  type: "GET",
                                  url: ctx+"/user/getUserList",
                                  data: {"tags":tag,"location":locationName,"gender":gender,"nicknmae":keywords,"page":curr,"pageSize":$("#pageSize").val(),"userlevel":2,"orderStr":orderStr},
                                  dataType: "json",
                                  success: function(data){
                                  	updateList(data);
                                  }
                              });  
                          }
                      });
                  }
              });	  
  	  	});
      }
    });
    function showInfo3() {
    	$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后查看", ConfirmFun: function(){
			window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
		} });
    }
  </script>
</body>

</html>
