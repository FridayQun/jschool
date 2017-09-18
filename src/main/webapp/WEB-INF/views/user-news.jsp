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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var url='${ctx}';
  var ctx = '${ctx}';
  </script>  
</head>

<body>
 <%Integer id = (Integer)session.getAttribute("login_userId");%>
 <input hidden="true" type="text" id="uid"  value="<%=id%>"/>
 
 <input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
 
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
          <p class="user-name">${jkuser.nickname} <c:if test="${jkuser.gender==1}">
          	 <c:out value="<i class='sex-icon male'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${jkuser.gender==2}">
          	 <c:out value="<i class='sex-icon female'></i></p>" escapeXml="false"/>
          </c:if>
           <c:if test="${jkuser.gender==1}">
          	 <c:out value="<i class='sex-icon male'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${empty jkuser.gender}">
          </c:if>
          </p>
          <p class="user-addr">${jkuser.location}</p>
          <p>${jkuser.slogan}</p>
        </div>
      </div>
      <div class="user-nav">
        <div class="nav-col">
          <div class="col-inner"><a  href="${ctx}/login/toUser?nav=0"><span>我的发布</span><br><span class="grey-font">${totalofproject}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/login/toUser?nav=1"><span>我的头条</span><br><span class="grey-font">${totalofnews}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/login/toUser?nav=2"><span>我的申请</span><br><span class="grey-font">${appcount}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/user/getUserCollect"><span>我的收藏</span><br><span class="grey-font">${collectioncount}</span></a></div>
        </div>
      </div>
      <div class="user-body">
        <div class="sidebar">
          <div class="user-tags">
            <div class="tags-bar">
              <div class="col"><span>影响力 </span><span class="weight">${jkuser.influence}</span><span class="separate">|</span></div>
                    <c:forEach var="item" items="${taglist}" varStatus="status">
              		<span class="tags-item"> 
              		${item.tagName}
              		</span>
              	
              </c:forEach>
            </div>
             <div class="modify-link"><a href="<%=request.getContextPath()%>/user/moduserinfo">编辑个人信息</a></div>
          </div>
          <div class="other-box">
             <div class="manage-nav-box">
              <p>账号管理</p>
              <p><a  href="${ctx}/user/toSecurity">账号安全</a></p>
              <p><a  href="${ctx}/user/toAuthentication">认证管理</a></p>
              <p><a href="${ctx}/user/toMyProject?id=${jkuser.id}">项目管理${uid}</a></p>
              <p><a class="active" href="${ctx}/user/toMyNews?id=${jkuser.id}">头条管理</a></p>
            </div>
          </div>
        </div>
        <div class="main-box">
          <div class="user-publish-box">
            <h3 class="user-publish-title">我的头条</h3>
            <div class="list-tool-bar">
              <div class="filter-block">
                <select id="status-filter" class="status"  name="">
                  <option value="">全部状态</option>
                  <option value="1">原创</option>
                  <option value="2">转载</option>
                </select>
              
              </div>
              <div class="search-block">
                <form action="#" method="get">
                  <input type="search" name="keywords" value="" placeholder="输入项目关键词进行搜索">
                  <input type="submit" name="submint" value="">
                </form>
              </div>
            </div>
            <div class="released-list-box">
            <ul>
            </ul>
             <div class="load-more"><a href="#">查看更多</a></div>
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
    $(function() {
    	
        function fotmatter(data) {
            var date = new Date(data);
            return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
          }
        
        function delstatus(status) {
            if(status==1){
            	return "原创";
            }
            if(status==0){
            	return "转载";
            }
          }
    	
    	
    	var page=1;
    	var pageSize=10;
    	var uid=$('#uid').val();
      //加载表格
      $.ajax({
	              type: "GET",
	              url: url+"/artcle/getNewsListallstauts",
	              data: {
	            	  uid:uid,
		          	  page:page,
		          	  pageSize:pageSize,
		          	  
	              },
	              aysnc:true,
	              dataType: "json",
	              success: function(data){
	            	 	renderList(data.newsList, 1);
	            	 	fixedEmpty();
	              }
	          }); 

     

      //渲染列表
      function renderList(data,mode){
        var $releasedList = $('.released-list-box ul');
         var nodes = data.map(function(item,index){
           return ('<li><div class="released-datetime">'+fotmatter(item.createTime).substr(5)+'</div>\
              <div class="cf"><div class="col c1"><div class="col-inner">\
              <div class="project-photo"><img src="'+item.picPath+'" alt=""></div>\
              </div></div><div class="col c2"><div class="col-inner">\
              <h3><span>'+item.title+'</span><span>'+item.source+'</span></h3>\
              <p><span><i class="icon figure"></i>'+item.username+'</span><span><i class="icon eye"></i>'+item.browsevolume+'人浏览</span>\
              <span><i class="icon clock"></i>'+fotmatter(item.createTime)+'</span><span>'+delstatus(item.status)+'</span></p><p><span class="orange-font"></span></p>\
              </div></div><div class="col c3"><div class="col-inner"><p><a class="browse-link" href="${ctx}/login/toNewsDetails?id='+item.id+'">查看</a></p>\
              </div></div></div>'+(data[index+1] ? ((fotmatter(item.createTime).split('-')[1] != fotmatter(data[index+1].createTime).split('-')[1]) ?
                '<div class="datetime-separate"><span>'+fotmatter(item.createTime).split('-')[0]+'</span> <span class="dsdot"></span> <span>'+fotmatter(item.createTime).split('-')[1]+'月</span></div>' : ''
              ) :'')+'</li>'
           )
         });
         mode && $releasedList.empty();
         $releasedList.append(nodes.join(''));
      }
      //过滤选项
      $('.filter-block select').on('change',function(){
        console.log($(this).val());
       // renderList(listData,1);//第一个为数据（数组类型），第二个为是否是关闭追加模式（布尔类型，不传为追加模式)
      });
      //搜索按钮
      $('.search-block form').on('submit',function(){
    	  page=1;
    	  pageSize=10;
        var keywords = $(this).find('input[name="keywords"]').val();
        console.log(keywords);
        var typestatus=$('#status-filter').val();
        var parentCid=$('#mode-filter').val();
	        $.ajax({
	            type: "GET",
	            url: url+"/artcle/getNewsList",
	            data: {
	          	  uid:uid,
	          	  type:typestatus,
	          	  title:keywords,
	          	  page:page,
	          	  pageSize:pageSize
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	          	 	renderList(data.newsList, 1);
	          	 	fixedEmpty();
	            }
	        });
        
        return false;
      });
      //加载更多
      $('.load-more a').on('click',function(){
    	  page++;
    	  pageSize=10;
    	  var keywords = $(this).find('input[name="keywords"]').val();
    	  var typestatus=$('#status-filter').val();
  	        $.ajax({
  	            type: "GET",
  	            url: url+"/project/getProjectList",
  	            data: {
  	          	  uid:uid,
  	          	  type:typestatus,
  	          	  title:keywords,
  	          	  page:page,
  	          	  pageSize:pageSize
  	            },
  	            aysnc:true,
  	            dataType: "json",
  	            success: function(data){
  	            	if(data.newsList.length>0){
  	          	 		 renderList(data.newsList, 0);
  	           		 }else{
  	            		alert("没有更过数据");
  	           		 }
  	            }
  	        });
        return false;
      });
	    //修复没数据时，显示问题
      function fixedEmpty(){
			  var $loadMore = $('.load-more');
			  if($('.released-list-box li').length >=10){
				  $loadMore.removeClass('hide');
			  }else{
				  $loadMore.addClass('hide');
			  }
		  }
    });
  </script>
</body>

</html>
