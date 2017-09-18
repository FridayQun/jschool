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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/creativity.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
    var ctx = '${ctx}';
  </script>
</head>

<body>
  <jsp:include page="head.jsp" flush="true"/>
  
  <input type="hidden" id="jkTagId" value="${jkTagId}"/>
  
  <div class="creativity-section">
    <div class="creativity-banner" style="background-image:url(${theHeadPic.image})" data-img="${theHeadPic.image}">
      <div class="creativity-banner-btns">
      	<a class="details-btn" href="#"><img src="${ctx}/resources/artcle/images/details-btn.png" alt=""></a>
      	<a class="apply-btn" href="#"><img src="${ctx}/resources/artcle/images/apply-btn.png" alt="" onclick="toPuhlish();"></a>
      </div>
    </div>
    <div class="wrapper">
      <div class="creativity-box" id="creativityList">
        <div class="creativity-sort-bar">
          <div class="sort-tags">
            <a class="" href="#">排名<i class="icon icon-down"></i></a>
          </div>
          <div class="search-bar">
            <form action="#" method="get" id="searchform">
              <input type="search" name="keywords"  id="keywords" value=""  value="${keywords}"placeholder="项目名称">
            </form>
          </div>
        </div>
        <div class="creativity-list">
          <ul>
          </ul>
        </div>
      </div>
      <div class="paging-bar">
        <div class="paging-info">共 120 位会员</div>
        <div class="paging-box"><a class="disabled prev">上一页</a><a class="active">1</a><a href="#" class="pagination">2</a><a href="javascript:;" class="pagination">3</a><a href="javascript:;" class="pagination">4</a><a>...</a><a href="javascript:;" class="pagination">6</a><a
              href="#" class="nextPage">下一页</a></div>
      </div>
    </div>
  </div>
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jQuery.page.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
    $(function() {
  	  var page = 0;
      var pageSize = 12;
      var login_userId = '<%=session.getAttribute("login_userId")%>';      
      //页面初始化条件数据
      var tagsId = null;
      var orderStr = "admireCount desc";
      
      var $creativityList = $('.creativity-list ul');

		function renderList(data) {
			var nodeList = data.map(function(item, index) {
				var companyOrEduName = "";
				var collectCount = 0;
				var admireStr = '<span class="like-btn" data-fid="'+item.id+'">支持他</span>';
				var collectStr = '<a href="#" class="favorite-btn" data-collect="'+item.id+'"><i class="icon star"></i></a>';
				if(item.admireUid!=null&&login_userId!='null') admireStr = '<span class="like-btn" data-fid="'+item.id+'">已支持</span>';
				if(item.collectUid!=null&&login_userId!='null') collectStr = '<a href="#" class="favorite-btn active" data-collect="'+item.id+'"><i class="icon star"></i></a>';
				if(item.companyName!=null) companyOrEduName =item.companyName;
				if(item.eduName!=null) companyOrEduName = item.eduName;
				if(item.admireCount!=undefined) collectCount = item.admireCount;
				return ('<li><div class="item-base"><a href="' + ctx+'/login/toProjectDetail?id='+item.id + '"><div class="item-photo">\
	                  <img src="' + item.projPicPath + '" alt=""></div>\
	                  <div class="item-title">' + item.projName +'</div></a></div><div class="item-info"><div class="item-info-col">\
	                  <div class="author-avatar"><img src="' + item.userHeadPicPath + '" alt=""></div>\
	                  <div class="author-info">' + item.username + '<br>' +companyOrEduName + '</div></div><div class="item-info-col">\
	                  <i class="icon icon-heart"></i><br><small class="collect-count">' + collectCount +'</small></div><div class="item-info-col">'+admireStr+'\
	                  </div></div></li>'
				);
			});
			$creativityList.empty().append(nodeList);
		}
      //顶部排序按钮
      $('.sort-tags a').on('click', function() {
        $(this).toggleClass('active');
        if($(this).hasClass("active")) orderStr = "admireCount asc";
        else orderStr = "admireCount desc";
        init();
        return false;
      });
      $("#searchform").on("submit",function(){
    	  init();
    	  return false;
      })
	function createOnce(str) {
		var span = document.createElement('span');
		span.style.fontSize = '30px';
		span.style.color = 'black';
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
      //支持他按钮
	$('body').on('click', '.creativity-list .like-btn', function(e) {
		if(login_userId==null || login_userId=='null') {
			alert('未登录');
			return;
		}

		var $this =  $(this);
		var $thistext = $this.text();

		var onceText = '-1';
		if($thistext == '支持他') {
			onceText = '+1';
		}
		var once = createOnce(onceText);
		e.target.appendChild(once);
		e.target.style.position = 'relative';
		setTimeout(function() {
			once.style.opacity = '0';
			once.style.top = '-50px';
		}, 0);
		setTimeout(function() {
			e.target.removeChild(once);
		}, 2000);

    	  if(login_userId=='null'){
    		  new_('未登录！');
    		  return;
    	  } else {
	          $.ajax({
	              type: "POST",
	              url: ctx+"/operate/admire",
	              data: {"fid":$this.data('fid'),"type":1},
	              dataType: "json",
	              success: function(data){
	            	  if($thistext=='支持他'){
						  for(var i=0; i<$this[0].childNodes.length; i++) {
							  if($this[0].childNodes[i].nodeName == '#text') {
								  $this[0].childNodes[i].data = '已支持';
								  var numContent = $this.parent().siblings('.item-info-col').find('.collect-count');
								  var num = parseInt(numContent.text());
								  num++;
								  numContent.html(num);
								  break;
							  }
						  }
	            	  } else if($thistext=='已支持') {
						  for(var i=0; i<$this[0].childNodes.length; i++) {
							  if($this[0].childNodes[i].nodeName == '#text') {
								  $this[0].childNodes[i].data = '支持他';
								  var numContent = $this.parent().siblings('.item-info-col').find('.collect-count');
								  var num = parseInt(numContent.text());
								  num--;
								  numContent.html(num);
								  break;
							  }
						  }
	            	  }
	              }
	          });    		  
    	  }
      });
      
      
    //初始化方法
      function init(){
          $.ajax({
              type: "GET",
              url: ctx+"/project/getProjectList",
              data: {"projName":$("#keywords").val(),"tags":$("#jkTagId").val(),"orderStr":orderStr,"page":1,"pageSize":pageSize, "isrecomment": 1, "projNameToUserName": true},
              dataType: "json",
              success: function(data){
            	  //初始化
            	  renderList(data.newsList,false);
            	  $(".paging-info").text("共"+data.total+"个项目");
		          //分页
		          $(".paging-box").createPage({
		            pageCount: data.pages,
		            current: 1,
		            backFn: function(curr) {
		            	$.ajax({
		                    type: "GET",
		                    url: ctx+"/project/getProjectList",
		                    data: {"projName":$("#keywords").val(),"tags":$("#jkTagId").val(),"orderStr":orderStr,"page":curr,"pageSize":pageSize,"isrecomment": 1, "projNameToUserName": true},
		                    dataType: "json",
		                    success: function(data){
								renderList(data.newsList,false);
		                    }
		                });
		            }
		          });
              }
          }); 
      }
      init();
    });
    function toPuhlish(){
    	var userLevel = <%=session.getAttribute("user_level")%>;
    	if(userLevel != 2) {
    		alert('未认证')
    		return false;
    	}
    	window.open(ctx +'/login/toPublish');    
    }
  </script>
</body>

</html>
