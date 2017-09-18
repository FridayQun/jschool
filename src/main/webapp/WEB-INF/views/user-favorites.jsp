<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
</head>
<script> 
	var ctx='${ctx}'

</script>
<body>
  <jsp:include page="head.jsp" flush="true"/>

  <div class="user-section">
    <div class="wrapper">
       <c:choose>
       <c:when test="${not empty jkuser.backgroundPicture}">
    	  <div class="user-base-info" style="background-image:url(${jkuser.backgroundPicture})">
        </c:when>
         <c:otherwise>
      	   <div class="user-base-info" style="background-image:url(${ctx}/resources/artcle/images/user-bg.jpg)">
       </c:otherwise>
      </c:choose>
        <div class="info-inner">
        <c:if test="${empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${ctx}/resources/artcle/images/default.png" alt=""></div>
         </c:if>
         <c:if test="${not empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${jkuser.headPicPath}" alt=""></div>
         </c:if>
          <p class="user-name">${jkuser.nickname}
          
          <c:if test="${jkuser.gender==2}">
          <i class="sex-icon female"></i>
          </c:if>
             <c:if test="${jkuser.gender==1}">
          <i class="sex-icon male"></i>
          </c:if>
          
          </p>
          <p class="user-addr">${jkuser.location}</p>
          <p>${jkuser.slogan}</p>
        </div>
      </div>
      <div class="favorites-nav" id="favoritesNav">
        <div class="nav-col">
          <div class="col-inner"><a class="active" href="#" data-tag="project"><span>收藏的项目</span><br><span class="grey-font">0</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#" data-tag="headline"><span>收藏的资讯</span><br><span class="grey-font">0</span></a></div>
        </div>
      </div>
      <div class="favorites-box">
        <!-- 项目列表 -->
        <div class="favorites-list">
          <ul class="favorites-project-list"></ul>
          <div class="paging-bar ppb">
            <div class="paging-info">共0个项目</div>
            <div class="paging-box"></div>
          </div>
        </div>
        <!-- 头条列表 -->
        <div class="favorites-list hide">
          <ul class="favorites-headline-list"></ul>
          <div class="paging-bar phb">
            <div class="paging-info">共0个项目</div>
            <div class="paging-box"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/jQuery.page.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
    $(function () {
      var $projectList = $('.favorites-list').eq(0);
      var $headlineList = $('.favorites-list').eq(1);
      var pageNumberpro=1;
      var pageSizepro=10;
      var pageNumbernews=1;
      var pageSizenews=10;
      
      var totalofproj=0;
      var totalofnews=0;
      
      
      function fotmatter(data) {
          var date = new Date(data);
          return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
        }
   	$.ajax({
	    type: "post",
	    url: ctx+"/usercollection/getcollectionlist",
	    data: {
	    	"type":1,
	    	"pageSize":pageSizepro,
	    	"pageNumber":pageNumberpro
	    	},
	    dataType: "json",
	    success: function(data){   
	    	if(data.rows.length>0){
	    		$('.favorites-nav a.active .grey-font').text(data.total);
	    		$('.ppb .paging-info').text("共"+data.size+"个项目");
	    		totalofproj=data.total;
	    		renderProject(data.rows);
	    		   //项目分页
	    	      $(".ppb .paging-box").createPage({
	    	        pageCount:Math.ceil(totalofproj/pageSizepro),
	    	        current: pageNumberpro,
	    	        backFn: function(curr) {
	    	          console.log(curr);
	    	          pageNumberpro=curr;
	    	          $.ajax({
	    	      	    type: "post",
	    	      	    url: ctx+"/usercollection/getcollectionlist",
	    	      	    data: {
	    	      	    	"type":1,
	    	      	    	"pageSize":pageSizepro,
	    	      	    	"pageNumber":pageNumberpro
	    	      	    	},
	    	      	    dataType: "json",
	    	      	    success: function(data){   
	    	      	    	if(data.rows.length>0){
	    	      	    		renderProject(data.rows);
	    	      	    	}
	    	      	    }
	    	      	});
	    	          window.location.href = '#favoritesNav';
	    	        }
	    	      });
	    		
	    	}
	    }
	});
   	
   	
   	$.ajax({
	    type: "post",
	    url: ctx+"/usercollection/getcollectionlist",
	    data: {
	    	"type":2,
	    	"pageSize":pageSizenews,
	    	"pageNumber":pageNumbernews
	    	},
	    dataType: "json",
	    success: function(data){   
	    	if(data.rows.length>0){
	    		renderHeadline(data.rows);
	    		totalofnews=data.total;
	    		$('.favorites-nav .nav-col').eq(1).find('a .grey-font').text(data.total);
	    		$('.phb .paging-info').text("共"+data.size+"个项目");
	    	      //头条分页
	    	      $('.phb .paging-box').createPage({
	    	        pageCount:Math.ceil(totalofnews/pageSizenews),
	    	        current:pageNumbernews,
	    	        backFn: function(curr) {
	    	          pageNumbernews=curr;
	    	          console.log(curr);
	    	          $.ajax({
		    	      	    type: "post",
		    	      	    url: ctx+"/usercollection/getcollectionlist",
		    	      	    data: {
		    	      	    	"type":2,
		    	    	    	"pageSize":pageSizenews,
		    	    	    	"pageNumber":pageNumbernews
		    	      	    	},
		    	      	    dataType: "json",
		    	      	    success: function(data){   
		    	      	    	if(data.rows.length>0){
		    	      	    		renderHeadline(data.rows);
		    	      	    	}
		    	      	    }
		    	      	});
	    	          window.location.href = '#favoritesNav';
	    	        }
	    	      });
	    	}
	    }
	});
      

      //渲染项目列表
      function  renderProject(data){
        $projectList.find('ul').empty().append($.map(data,function(item){
          return('<li><div class="col c1"><a href="${ctx}/login/toProjectDetail?id='+item.id+'"><img src="'+item.proj_pic_path+'" alt=""></a></div>\
              <div class="col c2"><h3><a href="${ctx}/login/toProjectDetail?id='+item.id+'"><span class="blue-font">'+item.proj_name+'</span>\
              <small class="orange-font">￥'+item.money_needs+'</small></a></h3>\
              <p><span><i class="icon figure"></i>'+item.username+'</span><span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span><span><i class="icon clock"></i>'+fotmatter(item.create_time)+'</span>\
              </div></div><div class="col c3"><div class="col-inner">\
              <p><a href="${ctx}/login/toProjectDetail?id='+item.id+'" class="contact-link">查看</a><a class="del-link" data-id='+item.id+' data-type="1" href="#">删除</a></p></div></div></li>'
          )
        }).join(''));
      }

      //渲染头条列表
      function  renderHeadline(data){
        $headlineList.find('ul').empty().append($.map(data,function(item){
          return('<li><div class="headline-item-photo"><div class="inner-box">\
                  <div class="photo"><img src="'+item.pic_path+'" alt=""></div></div></div>\
                  <div class="headline-item-desc"><div class="inner-box">\
                  <h3>'+item.title+'</h3>\
                  <div class="desc-body">'+item.content+'</div>\
                  <p class="desc-footer"><span>'+item.username+'</span>\
                  <span><i class="icon eye"></i>'+item.browsevolume+'人浏览</span>\
                  <span class="create-time">'+fotmatter(item.create_time)+'</span></p></div></div>\
                  <div class="headline-item-link"><div class="inner-box"><a href="${ctx}/login/toNewsDetails?id='+item.id+'">查 看</a><a data-id='+item.id+' data-type="2" class="del-link" href="#">删除</a></div></div></li>'
                );
        }).join(''));
      }
      
      //项目和头条的切换
      $('.nav-col a').on('click',function(){
        var tag = $(this).data('tag');
        $(this).addClass('active').parents('.nav-col').siblings('.nav-col').find('a').removeClass('active');
        if(tag === 'project'){
          $projectList.removeClass('hide').siblings('.favorites-list').addClass('hide');
          console.log('切换到项目收藏列表');
        }else if(tag === 'headline'){
          $headlineList.removeClass('hide').siblings('.favorites-list').addClass('hide');
          console.log('切换到头条收藏列表');
        }
        return false;
      });
      
      //删除收藏
      $('body').on('click','.del-link',function(e){
    	  e.preventDefault();
    	  var id=$(this).data('id');
    	  var type=$(this).data('type');
    	  alert("确定要删除吗？");
    	    $.ajax({
	      	    type: "post",
	      	    url: ctx+"/operate/collect",
	      	    data: {
	      	    	"fid":id,
	      	    	"type":type
	      	    	},
	      	    dataType: "json",
	      	    success: function(data){ 
	      	    	if(type==1){
	      	    	     $.ajax({
	 	    	      	    type: "post",
	 	    	      	    url: ctx+"/usercollection/getcollectionlist",
	 	    	      	    data: {
	 	    	      	    	"type":1,
	 	    	      	    	"pageSize":pageSizepro,
	 	    	      	    	"pageNumber":pageNumberpro
	 	    	      	    	},
	 	    	      	    dataType: "json",
	 	    	      	    success: function(data){  
	 	    	      	 	$('.favorites-nav .nav-col').eq(0).find('a .grey-font').text(data.total);
	 	    	      	    	if(data.rows.length>=0){
	 	    	      	    		renderProject(data.rows);
	 	    	      	    	}
	 	    	      	    }
	 	    	      	});
	      	    		
	      	    	}else if(type==2){
	      	    		 $.ajax({
			    	      	    type: "post",
			    	      	    url: ctx+"/usercollection/getcollectionlist",
			    	      	    data: {
			    	      	    	"type":2,
			    	    	    	"pageSize":pageSizenews,
			    	    	    	"pageNumber":pageNumbernews
			    	      	    	},
			    	      	    dataType: "json",
			    	      	    success: function(data){  
			    	      	    	$('.favorites-nav .nav-col').eq(1).find('a .grey-font').text(data.total);
			    	      	    	if(data.rows.length>=0){
			    	      	    		renderHeadline(data.rows);
			    	      	    	}
			    	      	    }
			    	      	});
	      	    		
	      	    	}
	      	    	
	      	    }
	      	});
    	  
      });
      
      
      
    });
  </script>
</body>

</html>
