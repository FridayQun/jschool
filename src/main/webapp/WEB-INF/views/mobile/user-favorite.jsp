<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh">
 <script>
    var ctx = '${ctx}';
  </script>
<head>
  <meta charset='utf-8'>
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telphone=no, email=no">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>我的收藏-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/favorite.css">
</head>

<body>
  <div class="favorite-title-bar">
    <div class="tab-item active" data-label="project">项目</div>
    <div class="tab-item" data-label="news">资讯</div>
  </div>
  <div class="favorite-body">
    <ul class="favorite-project-list">
     
    </ul>
    <ul class="favorite-news-list hide">
     
    </ul>
    <div class="load-more" data-label="project">点击查看更多</div>
  </div>
    <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
    	var $list = $('.favorite-body ul');
      var $projectList = $('.favorite-project-list');
      var $newsList = $('.favorite-news-list');
      var $loadMore = $('.load-more');
      var newspageSize=10;
      var newspageNumber=1;
      var projpageSize=10;
      var projpageNumber=1;
      //时间格式转化
    	function fotmatter(data) {
    		var date = new Date(data);
    		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
    	}
    	//自动显示加载更多按钮
    	function autoShow(list) {
    		//列表长度超过10条，显示载入更多
    		if(list.find('li').length >=10){
    			$loadMore.removeClass('hide');
    		}else{
    			$loadMore.addClass('hide');
    		}
    	}
	
      //加载项目
      		$.ajax({
        	    type: "post",
        	    url: ctx+"/usercollection/getcollectionlist",
        	    data: {
        	    	"type":2,
        	    	"pageSize":newspageSize,
        	    	"pageNumber":newspageNumber
        	    	},
        	    dataType: "json",
        	    success: function(data){   
        	    	if(data.rows.length>0){
        	    		renderNews(data.rows,0);
        	    		$('.no-msg').remove();
        	    	}else{
        	    		$loadMore.addClass('hide');
        	    	}
        	    }
        	});
      
	      
         	$.ajax({
    	    type: "post",
    	    url: ctx+"/usercollection/getcollectionlist",
    	    data: {
    	    	"type":1,
    	    	"pageSize":projpageSize,
    	    	"pageNumber":projpageNumber
    	    	},
    	    dataType: "json",
    	    success: function(data){   
    	    	if(data.rows.length>0){
    	    		renderProject(data.rows,0);
    	    		$('.no-msg').remove();
    	    	}else{
    	    		$('body').append('<h3 class="no-msg" style="text-align: center;padding:2em 0;">您还有任何收藏！</h3>');
    	    	}
    	    	autoShow($projectList);
    	    }
    	});
      
      //渲染项目列表
      function renderProject(data,mode) {
    	mode && $list.empty();
        $projectList.append(data.map(function(item,index){
          return(
            '<li class="'+(item.proj_type==0 ? "service" :"funds")+'"><a href='+ctx+'/mobile/login/toProjectDetail?id='+item.id+'>\
            <div class="item-photo"><img src="'+item.proj_pic_path+'" alt=""></div>\
            <div class="item-desc"><p>'+item.proj_name+' '+item.cate_name+'</p><p><small><i class="icon eye"></i>'+item.browsevolume+'人浏览  '+item.applycount+'人申请</small></p></div></a></li>'
          )
        }).join(''));
      }
      //渲染资讯列表
      function renderNews(data,mode) {
    	  mode && $list.empty();
        $newsList.append(data.map(function(item,index){
          return( '<li><a href='+ctx+'/mobile/login/toNewsDetails?id='+item.id+'><div class="news-thumb-item"><img src="'+item.pic_path+'" alt=""></div>\
                  <div class="news-thumb-desc"><p>'+item.title+'</p>\
                  <p><small><span>'+item.username+'</span><span>'+fotmatter(item.create_time)+'</span></small></p></div></a></li>'
                )
        }).join(''));
      }

      //类型切换
      $('.favorite-title-bar .tab-item').on('tap', function() {
        $(this).addClass('active').siblings().removeClass('active'); //切换标记
        $list.eq($(this).index()).removeClass('hide').siblings('ul').addClass('hide'); //切换显示列表
        $loadMore.attr('data-label', $(this).data('label'));
        var label = $(this).attr('data-label');
        var type;
        if(label==='news'){
        	type=2;
        	autoShow($newsList);
        }
        if(label==='project'){
        	type=1;
        	autoShow($projectList);
        }
        
        return false;
      });
      //载入更多
      $loadMore.on('tap', function() {
        var label = $(this).attr('data-label');
        //测试添加
        if(label === 'news'){
        	newspageNumber++;
        	$.ajax({
        	    type: "post",
        	    url: ctx+"/usercollection/getcollectionlist",
        	    data: {
        	    	"type":2,
        	    	"pageSize":newspageSize,
        	    	"pageNumber":newspageNumber
        	    	},
        	    dataType: "json",
        	    success: function(data){   
        	    	if(data.rows.length>0){
        	    		renderNews(data.rows,0);
        	    	}else{
        	    		newspageNumber--;
        	    		$loadMore.addClass('hide');
        	    		//alert("没有更多数据");
        	    	}
        	    }
        	});
        }else if(label === 'project'){
        	projpageNumber++;
        	$.ajax({
        	    type: "post",
        	    url: ctx+"/usercollection/getcollectionlist",
        	    data: {
        	    	"type":1,
        	    	"pageSize":projpageSize,
        	    	"pageNumber":projpageNumber
        	    	},
        	    dataType: "json",
        	    success: function(data){   
        	    	if(data.rows.length>0){
        	        renderProject(data.rows,0);
        	    	}else{
        	    		projpageNumber--;
        	    		$loadMore.addClass('hide');
        	    		//alert("没有更多数据");
        	    	}
        	    }
        	});
        }
        return false;
      });
    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
