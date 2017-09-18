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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/integral.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
   <input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
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
          <p class="user-name">${jkuser.nickname} <c:if test="${jkuser.gender==1}">
          	 <c:out value="<i class='sex-icon male'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${jkuser.gender==2}">
          	 <c:out value="<i class='sex-icon female'></i></p>" escapeXml="false"/>
          </c:if>
            <c:if test="${empty jkuser.gender}">
          </c:if></p>
          <p class="user-addr">${jkuserinfo.location}</p>
          <p>${jkuser.slogan}</p>
        </div>
      </div>
      <div class="user-nav">
        <div class="nav-col">
          <div class="col-inner"><a class="active" href="#" data-api="11"><span>我的发布</span><br><span class="grey-font">${totalofproject}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#" data-api="22"><span>我的头条</span><br><span class="grey-font">${totalofnews}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#" data-api="33"><span>我的申请</span><br><span class="grey-font">${appcount}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#" data-api="44"><span>我的收藏</span><br><span class="grey-font">${collectioncount }</span></a></div>
        </div>
      </div>
      <div class="user-body">
        <div class="sidebar">
          <div class="integral-base-box">
            <div class="base-row"><strong>积分中心</strong><span class="separate"> | </span><span class="weight">${jkuser.point}</span></div>
            <!--  <div class="base-row">当前等级：LV,0    积分：0 <br>距离升级还需积分：9</div>-->
            <div class="base-row">完善个人信息和发布信息可获取积分<br>每日登陆也可获取少量积分</div>
          </div>
          <div class="other-box">
            <div class="tab-bar">
              <a href="#" class="active">
                <span>我的关注</span><br><span class="grey-font">${jkuser.follows}</span></a><a href="#">
                <span>我的粉丝</span><br><span class="grey-font">${jkuser.fans}</span></a>
            </div>
            <div class="tab-content">
              <div class="content-group">
                <ul>
                                 <c:forEach var="item" items="${myFollowslist}" varStatus="status">
               			 		
                		 <li>
              			 <div class="user-avatar">
              			 <a href="${ctx}/login/toOtherUser?userid=${item['id']}">
              			 <img src=${item['head_pic_path']}  alt="">
              			 </a></div>
              			 <p>${item['nickname']}</p>
              			 </li>
              	
               </c:forEach>
                </ul>
              </div>
              <div class="content-group hide">
                <ul>
                	<c:forEach var="item" items="${fanslist}" varStatus="status">
                		<li>
              			 <div class="user-avatar">
              			<a href="${ctx}/login/toOtherUser?userid=${item['id']}">
              			 <img src=${item['head_pic_path']}  alt="">
              			 </a></div>
              			 <p>${item['nickname']}</p>
              			  </li>
              	
                  </c:forEach>
                </ul>
              </div>
              <div class="toggle-hint"><a href="#">更多<br><i class="icon down-arrows"></i></a></div>
            </div>
            <div class="manage-nav-box">
              <p>账号管理</p>
              <p><a class="active" href="${ctx}/user/toSecurity">账号安全</a></p>
              <p><a  href="${ctx}/user/toAuthentication">认证管理</a></p>
              <p><a href="${ctx}/user/toMyProject?id=${jkuser.id}">项目管理${uid}</a></p>
              <p><a href="${ctx}/user/toMyNews?id=${jkuser.id}">头条管理</a></p>
            </div>
          </div>
        </div>
        <div class="main-box">
          <div class="integral-main">
            <div class="integral-banner"><img src="${ctx}/resources/artcle/images/integral-banner.jpg" alt=""></div>
            <div class="integral-overview">
              <div class="overview-col c1"><span>全部积分</span><br><strong>${jkuser.point}</strong></div>
              <div class="overview-col c2"><a href="${ctx}/login/toScoreMall">积分商城</a></div>
              <div class="overview-col c3"><span><a href="${ctx}/user/toExchange">兑换记录<br><strong>${countofexchang}</strong></a></span></div>
            </div>
            <h3 class="integral-block-title">积分明细</h3>
            <div class="integral-details">
              <ul class="integral-details-list">
                
              </ul>
              <div class="load-more"><a href="#">更 多</a></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
  var page=1;
  var pageSize=10;
    $(function() {
    	var $loadMore = $('.load-more');
    	
    	function autoMore(){
    		if($('integral-details-list li').length > 10){
    			$loadMore.removeClass('hide');
    		}else{
    			$loadMore.addClass('hide');
    		}
    	}
        function fotmatter(data) {
            var date = new Date(data);
            return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
          }
        $.ajax({
	            type: "POST",
	            url: ctx+"/exchange/getlist",
	            data: {
	          	  uid:$('#infoid').val(),
	          	  ispid:0,
	          	  Page:page,
	          	  pageSize:pageSize
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	            		loadMore(data);
	            		autoMore()
	            }
	        });
    	
    	
    	
      var $detailsList = $('.integral-details-list');
      function loadMore(data){
        var nodeList = data.map(function(item,index){
          return(
        		  '<li><div class="details-item-col">'+item.operateName+'<br>'+fotmatter(item.createTime)+'</div>\
                  <div class="details-item-col '+(Number(item.needScore) >= 0 ? 'red-font' :'blue-font')+'"><strong>'+item.needScore+'</strong></div></li>'
          )
        });
        $detailsList.append(nodeList.join(''));
      }
  	//修复没数据时，显示问题
  	  function fixedEmpty(idx){
  		  var $paging = $('.paging');
  		  var $toggleHint = $(".toggle-hint");
  		  //修复粉丝关注 更多按钮问题
  		  if($('.content-group').eq(idx).find('li').length <= 6){
  			  $toggleHint.addClass('hide');
  		  }else{
  			  $toggleHint.removeClass('hide');
  		  }
  	  }
  	  fixedEmpty(0);
      //我的关注和我的粉丝 tab切换
      $('.tab-bar a').on('click', function() {
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.tab-content .content-group').eq($(this).index()).removeClass('hide').siblings('.content-group').addClass('hide');
        fixedEmpty($(this).index());
        return false;
      });
      //我的关注和我的粉丝 展开更多
      $('.tab-content .toggle-hint').on('click', function() {
        $(this).parents('.tab-content').toggleClass('more');
        return false;
      });
      //切换我的发布，我的头条，我的申请，我的攻略
      $('.user-nav .col-inner a').on('click',function(){
        var api = $(this).attr('data-api');
        $(this).addClass('active').parents('.nav-col').siblings().find('a').removeClass('active');
        console.log(api);
        return false;
      });
      //载入更多
      $('.load-more a').on('click',function(){
    	  page=page+1;
    	  $.ajax({
	            type: "POST",
	            url: ctx+"/exchange/getlist",
	            data: {
	          	  uid:$('#infoid').val(),
	          	  ispid:0,
	          	  Page:page,
	          	  pageSize:pageSize
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	            	if(data.length>0){
	            		loadMore(data);
	            	}else{
	            		 page=page-1;
	            		 $loadMore.addClass('hide');
	            		//alert("没有更多数据");
	            	}
	           		
	            }
	        });
        return false;
      })
      
    //修复没数据时，显示问题
	  function fixedEmpty(){
		  var $paging = $('.paging');
		  var $toggleHint = $(".toggle-hint");
			//修复粉丝关注 更多按钮问题
		  if($('.content-group li').length <= 6){
			  $toggleHint.addClass('hide');
		  }else{
			  $toggleHint.removeClass('hide');
		  }
			//修复分页
			if($('.paging a').length <3){
				$paging.addClass('hide');
			}else{
				$paging.removeClass('hide');
			}
	  }
      fixedEmpty();

    });
  </script>
</body>

</html>
