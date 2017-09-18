<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/news.css">
  <script>
    var ctx = '${ctx}';
  </script>    
</head>

<body>
  <div class="top-bar">
    <div class="sort-bar"><span>类型</span><i class="icon arrows"></i></div>
    <div class="search-bar">
      <form class="searchForm" action="#" method="post" id="keySubmit">
        <input type="search" name="keyWords" id="keyWords" value="" placeholder="搜索你感兴趣的资讯">
      </form>
      <a href="project-publish.html" class="publish-link"></a>
    </div>
    <div class="message-hint remind"><span class="icon message"></span></div>
  </div>
  <ul class="filter-select-list closed">
  	<li data-type="-1">全部</li>
	<c:forEach var="cate" items="${cateList }">
	<li data-type="${cate.id }">${cate.cateName }</li>
	</c:forEach>
  </ul>
  <div class="main-box">
    <ul class="news-list">
<!--       <li> -->
<!--         <a href="news-details.html"> -->
<!--           <div class="news-title">情人节：上海大学生倡导情侣支持无烟生活</div> -->
<!--           <div class="news-thumb"> -->
<%--             <div class="thumb-col"><img src="${ctx}/resources/mobile/images/news-photo-1.jpg" alt=""></div> --%>
<%--             <div class="thumb-col"><img src="${ctx}/resources/mobile/images/news-photo-1.jpg" alt=""></div> --%>
<%--             <div class="thumb-col"><img src="${ctx}/resources/mobile/images/news-photo-1.jpg" alt=""></div> --%>
<!--           </div> -->
<!--           <div class="news-status"><span>中青在线</span><span>刚刚</span></div> -->
<!--         </a> -->
<!--       </li> -->
    </ul>
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
    $(function() {
      var page = 0;
      var pageSize = 10;
      var type=null;
      var keyWords = $("#keyWords").val();
        
      var $filterList = $('.filter-select-list');
      var $newList = $('.news-list');
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
      
      function showMore(){
    	  if($('.news-list li').length >= 10){
    		  $('.load-more').removeClass('hide');
    	  }else{
    		  $('.load-more').addClass('hide');
    	  }
      }

      //渲染列表
      function renderList(data,empty){
    	  // <div class="news-title">'+item.title+'</div>\
    	  // <div class="news-status"><span>'+item.source+'</span><span>'+new Date(item.createTime).Format("yyyy年MM月dd日")+'</span></div>\
        var nodeList = data.map(function(item,index){
          return( '<li><a style="display: flex;" href="'+ctx+'/mobile/login/toNewsDetails?id='+item.id+'">\
          <div class="news-thumb" style="width: 40%;">\
          <div class="thumb-col" style="background-image:url('+item.picPath+'); background-size: 100% 100%; height: 7em;"><img src="'+item.picPath+'" alt=""></div>\
          </div>\
          <div class="headline-item-desc" style="width: 56%;margin-left: 3%;height: 7em;margin: 0.2em auto;">\
          <div class="inner-box">\
          <p style="font-weight: bold;margin-top: 0.5em; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">'+item.title+'</p>\
          <div class="desc-body" style="height: 2.5em;text-overflow: ellipsis;white-space: nowrap;">'+getContentAbstract($(item.content))+'</div>\
          <p style="font-size: small;" class="desc-footer"><span style="    display: inline-block;    width: 50%;    overflow: hidden;    text-overflow: ellipsis;    white-space: nowrap;">'+item.username+'&nbsp;&nbsp;'+(item.companyName==null?item.eduName:item.companyName)+'</span><span style="float: right;width: 49%;white-space: nowrap;text-overflow: ellipsis;overflow: hidden;" class="create-time">'+new Date(item.createTime).Format('yyyy年MM月dd日')+'</span></p>\
          </div>\
          </div>\
          </a></li>')
        });
        empty ? $newList.empty().append(nodeList.join('')) : $newList.append(nodeList.join(''));
        
      }
      //打开分类
      $('.top-bar .sort-bar').on('tap',function(){
        if($filterList.hasClass('closed')) {
        	$filterList.removeClass('closed');
        } else {
        	$filterList.addClass('closed');
        }
      });
      //选择分类
      $filterList.on('tap','li',function(){
    	var $self = $(this);
        $filterList.addClass('closed');
	  	setTimeout(function(){
			type = $self.data('type');
			$(".news-list").empty();
			page = 0;
			init();
		}); 
        return false;
      });
      //点击加载更多
      $('.load-more').on('tap',function(){
    	  init();
          return false;
      });
      //关键字搜索
      $('#keySubmit').on('submit',function(){
    	  keyWords = $("#keyWords").val();
    	  $(".news-list").empty();
		  page = 0;
    	  init();
    	  return false;
      });
      
      //初始化方法
      function init() {
    	  page = page + 1;
          $.ajax({
              type: "GET",
              url: ctx+"/artcle/getNewsList",
              data: {"title":keyWords,"type":type,"page":page,"pageSize":pageSize},
              dataType: "json",
              success: function(data){   
            	  if(data.newsList.length > 0){
            		  renderList(data.newsList);
                	  showMore();
            	  }else{
            		  $('.load-more').addClass('hide');
            	  }
              }
          });   
      }
      init();
    });
    $(document).ready(function() {
    	$('.desc-body').each(function(index, item) {
            item.innerHTML = getContentAbstract(item.childNodes);
        });
    });
    
    function getContentAbstract(content) {
		var ps = [$('<p style=" overflow: hidden; margin: 0; font-size: 80%; text-overflow: ellipsis; "></p>'), $('<p style=" overflow: hidden; margin: 0; font-size: 80%; text-overflow: ellipsis; "></p>'), $('<p style=" overflow: hidden; margin: 0; font-size: 80%; text-overflow: ellipsis; "></p>')];
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
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
