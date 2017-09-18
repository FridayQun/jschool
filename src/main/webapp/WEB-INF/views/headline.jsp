<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/headline.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  
      <script>
    var ctx = '${ctx}';
  </script>
</head>

<body>
   <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  
  <input type="hidden" id="pages" value="${pages}"/>
  <input type="hidden" id="type" value="${type}"/>
  
  <div class="headline-section">
    <div class="wrapper">
      <div class="headline-head">
        <div class="headline-tag-bar">
          <div class="tags-title">校园头条分类：</div>
          <div class="tags">
            <a class="${type==-1?'active':''}" data-index="-1" href="">全部</a>
            <c:if test="${fn:length(cateList) - 1 >= 0}">
			<c:forEach var="i" begin="0" end="${fn:length(cateList) - 1 }" step="1">
				<a class="${type==cateList[i].id?'active':''}" data-index="${cateList[i].id }" href="">${cateList[i].cateName}</a>
			</c:forEach>
			</c:if>
          </div>
          <div class="search-bar">
	        	<form action="${ctx}/login/toHeadline" method="get">
	        		<input type="search" name="keywords"  placeholder="搜索" value="${keywords}" id="keywords">
	        		<input type="submit" name="submit" value="">
	        	</form>
	        </div>
        </div>
        <div class="publish-btn">
        	<c:if test="${user_level==null||user_level<=1 }">
        		<a href="#" onclick="showInfo2(${user_level})">发布校园头条</a>
        	</c:if>
        	<c:if test="${user_level!=null&&user_level>1 }">
        		<a href="${ctx}/login/toNewsPublish">发布校园头条</a>
        	</c:if>
        </div>
      </div>
      <div class="headline-main" id="headline">
      <!-- 暂时隐藏 -->
<!--         <div class="headline-filter-bar"> -->
<!--           <span>综合</span> -->
<!--           <a class="sort-btn" href="#">热度<i class="icon down"></i></a> -->
<!--           <a class="sort-btn" href="#">影响力<i class="icon down"></i></a> -->
<!--         </div> -->
        <div class="headline-list-wrapper">
          <ul class="headline-list">
            <c:forEach var="news" items="${newsList}" >
                <li>
	              <a href="${ctx}/login/toNewsDetails?id=${news.id}">
	                <div class="headline-item-photo">
	                  <div class="inner-box">
	                    <div class="photo"><img style='height: 230px;width: 300px;' src="${news.picPath}" alt=""></div>
	                  </div>
	                </div>
	                <div class="headline-item-desc">
	                  <div class="inner-box">
	                    <h3>${news.title}</h3>
	                    <p>${news.description}</p>
	                    <div class="desc-body" style="height: 8.5em;">${news.content}</div>
	                    <p class="desc-footer">
	                      <span>${news.username}&nbsp;&nbsp;
	                      	<c:if test="${news.companyName!=null }">${news.companyName }</c:if>
	                      	<c:if test="${news.eduName!=null }">${news.eduName }</c:if>
	                      </span>
<!-- 	                      <span>影响力<strong class="red-font">0</strong></span> -->
	                      <span><i class="icon eye"></i>${news.browsevolume}人浏览</span>
	                      <span class="create-time"><fmt:formatDate value="${news.createTime }" pattern="yyyy年MM月dd日"/></span>
	                    </p>
	                  </div>
	                </div>
	              </a>
	            </li>
            </c:forEach>
          </ul>
        </div>
        <div class="paging-bar">
          <div class="paging-info">共${total }个项目</div>
          <div class="paging-box"></div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jQuery.page.js"></script><script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
    $(function() {
        $(document).ready(function() {
            $('.desc-body').each(function(index, item) {
                item.innerHTML = getContentAbstract(item.childNodes);
            });
        });

        function getContentAbstract(content) {
			var ps = [$('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>'), $('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>'), $('<p style="text-overflow: ellipsis;white-space: nowrap;overflow: hidden;"></p>')];
			var p = $(content);
			var index = 0;
			fixIntoPs(p);
			if(index < 3) {
				for(; index<3; index++) {
					ps[index] = '&nbsp;';		// 占空间
				}
			}

			return $('<a></a>').append(ps).html();
			
			function includes(con) {
				for(var i=0; i<this.length; i++) {
					if(this[i] == con) {
						return true;
					}
				}
				return false;
			}
			function trim(con) {
				return con.replace(/[\n, \s]/g, '');
			}
			// 返回值表示index现在是否处于新的一行
			function fixIntoPs(con) {
				if(index >= 3) {
					return true;
				}
				var nextLine = ['p', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7', 'div'];
				var newLine = ['br', 'hr'];
				var noLine = ['span', 'a'];
				var ignore = ['img'];
				var lastTagName = '';
				nextLine.includes = nextLine.includes || includes;
				newLine.includes = newLine.includes || includes;
				noLine.includes = noLine.includes || includes;
				for(var i=0; index<3 && i<con.length; i++) {
					lastTagName = con[i].nodeName.toLowerCase();
					if(nextLine.includes(con[i].nodeName.toLowerCase())) {
						if(fixIntoPs(con[i].childNodes) == false) {
							index++;
						}
					} else if(newLine.includes(con[i].nodeName.toLowerCase())) {
						// ps[index++] = '&nbsp;<br>';
					} else if('#text' == con[i].nodeName.toLowerCase()) {
						var str = trim(con[i].textContent);
						if(str.length != 0) {
							ps[index].html(ps[index].html()+con[i].textContent.replace(/\n/g, ''));
						}
					} else if(noLine.includes(con[i].nodeName.toLowerCase())) {
						fixIntoPs(con[i].childNodes);
					} else {
						// ignore;
					}
				}

				return nextLine.includes(lastTagName);
			}
		}

      var $headlineList = $('.headline-list');
	  var newsType = null;
      Date.prototype.Format = function (fmt) { //author: meizz 
  	    var o = {
  	        "M+": this.getMonth()+1, //月份 
  	        "d+": this.getDate(), //日 
  	        "h+": this.getHours(), //小时 
  	        "m+": this.getMinutes(), //分 
  	        "s+": this.getSeconds(),
  	        "q+": Math.floor((this.getMonth()+3)/3), 
  	        "S": this.getMilliseconds() 
  	    };
  	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  	    for (var k in o)
  	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  	    return fmt;
    }
      function renderList(data){
    	data = data.newsList;  
        if (data && data.length > 0) {
          var nodeList = data.map(function(item,index){
              var companyOrEduName = "";
              if(item.companyName!=null) companyOrEduName =item.companyName;
              if(item.eduName!=null) companyOrEduName = item.eduName;
        	  return (
              '<li><a href="'+ctx+'/login/toNewsDetails?id='+item.id+'"><div class="headline-item-photo"><div class="inner-box">\
              <div class="photo"><img style="height: 230px;width: 300px;" src="'+item.picPath+'" alt=""></div></div></div><div class="headline-item-desc">\
              <div class="inner-box"><h3>'+item.title+'</h3>\
              <p></p>\
              <div class="desc-body" style="height: 8.5em;">'+getContentAbstract(item.content)+'</div>\
              <p class="desc-footer"><span>'+item.username+' '+companyOrEduName+'</span>\
              <span><i class="icon eye"></i>'+item.browsevolume+'人浏览</span>\
              <span class="create-time">'+new Date(item.createTime).Format("yyyy年MM月dd日")+'</span></p></div></div></a></li>'
            )
          });
          $headlineList.empty().append(nodeList.join(''));
        }
      };

      //头条分类
      $('.headline-tag-bar .tags a').on('click',function(){
        var type= $(this).data("index");
        window.location.href=ctx+"/login/toHeadline?type="+type;
        return false;
      })
      
      //分页
      $(".paging-box").createPage({
        pageCount: $("#pages").val(),
        current: 1,
        backFn: function(curr) {
          $.ajax({
              type: "GET",
              url: ctx+"/artcle/getNewsList",
              data: {"title":$("#keywords").val(),"type":'${type}',"page":curr,"pageSize":5},
              dataType: "json",
              success: function(data){
            	  $('.paging-info').html('共'+data.total+'个项目');
            	  renderList(data);
              }
          });   
        }
      });
// 	<c:if test="${param.isPublish == 1}">
// 	alert('发布成功');
// 	</c:if>
    });

    function showInfo2(userLevel){
		  var alert = window.new_alert || alert;
		  if(userLevel==null)
			  $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后发布头条", ConfirmFun: function(){
				  window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
			  } });
		  else if(userLevel<=1) {
			  $.DialogBySHF.Confirm({ Width: 350, Height: 200, Title: "提示", Content: "请您完成实名认证后发布校园头条", ConfirmFun: function(){
				  window.open("${ctx}/login/toUser?item=authentication", "_self");
			  } , CancelFun: function(){}});
		  }
  }

  </script>
</body>

</html>
