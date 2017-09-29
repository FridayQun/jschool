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
  <script>
  var url='${ctx}';
  var ctx = '${ctx}/resources/artcle';
  </script>  
</head>

<body>
    <!--动态包含-->
 <%Integer id = (Integer)session.getAttribute("login_userId");%>
 <input hidden="true" type="text" id="uid"  value="<%=id%>"/>
 <input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
 <input hidden="true" type="text" id="type"  value="${type}"/>
 <%Integer  totalofproject = (Integer)request.getAttribute("totalofproject");%>
 <input hidden="true"  type="text" id=totalofproject  value="<%=totalofproject%>"/>
 <%Integer  totalofnews = (Integer)request.getAttribute("totalofnews");%>
 <input hidden="true"  type="text" id=totalofnews  value="<%=totalofnews%>"/>
 <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/> 
 
  <jsp:include page="head.jsp" flush="true"/>
  <div class="user-section">
    <div class="wrapper">
    <c:choose>
       <c:when test="${not empty jkuser.backgroundPicture}">
    	  <div class="user-base-info" style="background:url(${jkuser.backgroundPicture}) no-repeat 50% 50% / cover">
        </c:when>
         <c:otherwise>
      	   <div class="user-base-info" style="background:url(${ctx}/resources/artcle/images/user-bg.jpg) no-repeat 50% 50% / cover">
       </c:otherwise>
      </c:choose>
           
        <div class="info-inner">
          <c:if test="${empty jkuser.headPicPath}">
          		<div class="user-head"><img style="height: 100%;" src="${ctx}/resources/artcle/images/default.png" alt=""></div>
         </c:if>
         <c:if test="${not empty jkuser.headPicPath}">
          		<div class="user-head"><img style="height: 100%;" src="${jkuser.headPicPath}" alt=""></div>
         </c:if>
           <p style="margin-left: 60px;" class="user-name">${jkuser.nickname}
		<c:if test="${ empty jkUserCeritifired.id}">
	    	<c:if test="${jkuser.gender==1}">
		        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${jkuser.gender==2}">
		        <c:out value="<i class='icon gender-n-real-girl'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${empty jkuser.gender}">
		        <c:out value="<i class='icon gender-n-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
	    </c:if>
	    <c:if test="${ not empty jkUserCeritifired.id}">
	    	<c:if test="${jkuser.gender==1}">
		        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${jkuser.gender==2}">
		        <c:out value="<i class='icon gender-real-girl'></i></p>" escapeXml="false"/>
		    </c:if>
		
		    <c:if test="${empty jkuser.gender}">
		        <c:out value="<i class='icon gender-real-boy'></i></p>" escapeXml="false"/>
		    </c:if>
	    </c:if>
          <p class="user-addr"><c:if test="${jkuser.idType==0}">${jkuserinfo.eduName}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.companyName}</c:if></p>
<%--           <p>${jkuser.slogan}</p> --%>
        </div>
         <div class="shortcut-opts">
         <c:if test="${type==0}">
         	<c:choose>
         		<c:when test="${jkUserFansFollows.id>0}">
         			 <a class="follow-btn" id="add" style="display:none;" href="#">+关注</a>
         			 <a class="follow-btn" id="cancle"  href="#">取消关注  </a>
         		 </c:when>
         		 <c:otherwise >
         			 <a class="follow-btn" id="add"  href="#">+关注</a>
         			 <a class="follow-btn" id="cancle" style="display:none;" href="#">取消关注  </a>
         		 </c:otherwise>
         	</c:choose>
         	 <a class="send-btn" href="#">发私信</a>
          </c:if>
        </div>
      </div>
<%--       <c:if test="${type==1}"> --%>
<!--       <div class="user-nav" id="userBody"> -->
<%--       </c:if> --%>
<%--       <c:if test="${type==0}"> --%>
<!--       <div class="user-nav ta" id="userBody"> -->
<%--       </c:if> --%>
<!--         <div class="nav-col"> -->
<%--           <div class="col-inner"><a data-api="0" class="active" href="#"><span><c:if test="${type==1}">我的发布</c:if><c:if test="${type==0}">TA的发布</c:if></span><br><span class="grey-font">${totalofproject}</span></a></div> --%>
<!--         </div> -->
<!--         <div class="nav-col"> -->
<%--           <div class="col-inner"><a data-api="1"  href="#"><span><c:if test="${type==1}">我的头条</c:if><c:if test="${type==0}">TA的头条</c:if></span><br><span class="grey-font">${totalofnews}</span></a></div> --%>
<!--         </div> -->
      
<%--         <c:if test="${type==1}"> --%>
<!--           <div class="nav-col" > -->
<%--          	 <div class="col-inner"  ><a  data-api="2" href="#"><span>我的申请</span><br><span class="grey-font">${appcount}</span></a></div> --%>
<!--           </div> -->
<%--           </c:if> --%>
<%--           <c:if test="${type==0}"> --%>
<%--           </c:if> --%>
<%--          <c:if test="${type==1}"> --%>
<!--        	 <div class="nav-col"> -->
<%--           <div class="col-inner"><a class="collection" data-api="3"  href="${url}/user/getUserCollect"><span>我的收藏</span><br><span class="grey-font">${collectioncount}</span></a></div> --%>
<!--         </div> -->
<%--         </c:if> --%>
<%--          <c:if test="${type==0}"> --%>
<%--           </c:if> --%>
<!--       </div> -->
      
      <div class="user-body">
        <div class="sidebar">
          <div class="user-tags">
            <div class="tags-bar">
              <div class="col" style='width: 104px; text-align: center;'><span>影响力</span><span class="weight">${jkuser.influence}</span></div><hr style="float: left;height: 30px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
               <div class="col" style='width: 160px; text-align: center;'><span>连续登录天数 <span class="weight">${jkuser.loginTimes}</span></span></div>
            </div>
            <hr style='margin: 0 15px;'>
            <div class="tags-bar">
            	<a href="${ctx }/login/toOtherUser?item=follows&userid=${jkuser.id}"><div class="col" style='width: 104px; text-align: center;'><span>TA的关注</span><br><span class="grey-font">${jkuser.follows}</span></div></a>
            	<hr style="float: left;height: 40px;width: 1px;margin: 0;padding: 0;border: 0;background: #d2d2d2;">
				<a href="${ctx }/login/toOtherUser?item=fans&userid=${jkuser.id}"><div class="col" style='width: 160px; text-align: center;'><span>TA的粉丝</span><br><span class="grey-font">${jkuser.fans}</span></div></a>
            </div>
            <c:if test="${type==1}">
            <div class="modify-link"><a href="<%=request.getContextPath()%>/user/moduserinfo">编辑个人信息</a></div>
            </c:if>
          </div>
          <c:if test="${type==0}">
          <div class="user-intro">
          	<c:set var="pm2" ><fmt:parseNumber value="${(jkuserinfo.permissions % 100)/10}" integerOnly="true"/></c:set>
          	<c:set var="pm3" ><fmt:parseNumber value="${(jkuserinfo.permissions / 100)%10}" integerOnly="true"/></c:set>
          	<c:set var="pm4" ><fmt:parseNumber value="${jkuserinfo.permissions/1000 }" integerOnly="true"/></c:set>

				<p><span class='label'><i class="icon ta-name"></i>姓名：</span>${jkuser.username }</p>
<%-- 	          	<c:if test="${pm2==1}">  --%>
			  <c:if test="${(jkuserinfo.permissions%100) < 20}">
				  <p><span class='label'><i class="icon ta-contact"></i>联系方式：</span>${jkuser.phone	}</p>
			  </c:if>
			  <c:if test="${(jkuserinfo.permissions%100) >= 20}">
				  <p><span class='label'><i class="icon ta-contact"></i>联系方式：</span>***********</p>
			  </c:if>
			  <p><span class='label'><i class="icon ta-area-icon"></i>地区：</span>${jkuser.location	}</p>
<%-- 	            </c:if> --%>
<%-- 	            <c:if test="${pm2==2}">  --%>
<!-- 	            	<p>联系方式:您无权限查看此用户信息</p> -->
<%-- 	            </c:if> --%>
<%-- 	            <c:if test="${jkuser.idType==0}"> --%>
<%-- 	            <c:if test="${pm4==1}">  --%>
				<p><span class='label'><i class="icon ta-school"></i>学校/公司：</span><c:if test="${jkuser.idType==0}">${jkuserinfo.eduName}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.companyName}</c:if></p>
<%-- 				<p>学院：${jkuserinfo.eduCollage}</p> --%>
				<p><span class='label'><i class="icon ta-profession"></i>专业/职位：</span><c:if test="${jkuser.idType==0}">${jkuserinfo.eduMajor}</c:if><c:if test="${jkuser.idType==1}">${jkuserinfo.departName}</c:if></p>
<%-- 				<c:if test="${jkuser.idType==0 }"> --%>
					<p><span class='label'><i class="icon ta-corporation"></i>社团：</span>${jkuserinfo.eduClub}</p>
<%-- 				</c:if> --%>
<%-- 				<p>入学时间：<fmt:formatDate value="${jkuserinfo.eduTime}"/></p> --%>
<%-- 	            </c:if> --%>
<%-- 	            <c:if test="${pm4==2}">  --%>
<!-- 		            <p>学校：您无权限查看此用户信息</p> -->
<!-- 		            <p>学院：您无权限查看此用户信息</p> -->
<!-- 		            <p>社团：您无权限查看此用户信息</p> -->
<!-- 		            <p>专业：您无权限查看此用户信息</p> -->
<!-- 		            <p>入学时间：您无权限查看此用户信息</p> -->
<%-- 	            </c:if> --%>
<%-- 	            </c:if> --%>
<%-- 	            <c:if test="${jkuser.idType==1}"> --%>
<%-- 	            	 <c:if test="${pm3==1}">  --%>
<%-- 				<p>公司名称：${jkuserinfo.companyName}</p> --%>
<%-- 				<p>部门/职位：${jkuserinfo.departName}</p> --%>
<%-- 		           	</c:if> --%>
<%-- 		           	 <c:if test="${pm3==2}">  --%>
<!-- 			            <p>公司名称：您无权限查看此用户信息</p> -->
<!-- 			            <p>部门/职位：您无权限查看此用户信息</p> -->
<%-- 		           	</c:if> --%>
<%--            		</c:if> --%>
	            
<%-- 	            <c:if test="${jkuserinfo.permissions%10==1}">  --%>
				<p><span class='label'><i class="icon ta-self-intro-icon"></i>个人介绍：</span>${jkuser.slogan}</p>
				<p style="
					overflow: hidden;
					height: 30px;
				"><span class='label'><i class="icon ta-label-icon"></i>标签：</span><c:forEach var="item" items="${taglist}"
					varStatus="status"><span style="
						border-radius: 0.2em;
						padding: 0.3em 0.7em;
						margin: 0 0.2em 0.5em 0.2em;
						border: 1px solid #fe9a6e;
						color: #fe9a6e;
						line-height: 30px;
					">${item.tagName}</span></c:forEach></p>
<%-- 	            </c:if> --%>
<%-- 	            <c:if test="${jkuserinfo.permissions%10==2}">  --%>
<!-- 	         	     <p>个人介绍：您无权限查看此用户信息</p> -->
<%-- 	            </c:if> --%>
<!-- 	           	 <p>认证状况：</p> -->
<%--            		 <c:if test="${not empty jkUserCeritifired }"> --%>
<!--            			<p> -->
<%--             		<span class="badge"><img src="${ctx}/resources/artcle/images/shiming.png" alt=""></span> --%>
<!--            			</p>  -->
<%--          	     </c:if> --%>
	            <%-- <p>认证状况：</p>--%>
	            <%-- 	<p><span class="badge">--%>
	            <%-- 		<c:if test="${not empty jkuserinfo.contractMail}">--%>
	           	<%-- 		 <img src="${ctx}/resources/artcle/images/duanxin.png" alt="">--%>
	           	<%-- 		 </c:if>--%>
	            <%-- 	</span>--%>
	            <%-- 	<span class="badge">--%>
	            <%-- 		 <img src="${ctx}/resources/artcle/images/shiming.png" alt="">--%>
	            <%--     </span></p>  --%>
				<hr>
				<div class='user-item' style='border: 0; width:auto; height:auto; margin: 0; padding: 0;'><div class='nav-col' style='border: 0; width:auto; height:auto; margin: 0; padding: 0;'><a data-api="5" style="
				    text-align: center;
				    font-weight: normal;
				    font-size: 20px;
				    margin: 0;
				    color: #767d89;
				    display: block;
				    " href="javascrip:void(0)">点击查看个人资料<span style="
				    margin-left: 40px;
				    color: #ccc;
				">&gt;</span></a></div></div>
          	</div>
          	</c:if>

<!--           <div class="integral-box"> -->
<%--           	<c:if test="${type==1}"> --%>
<!--           		  <div class="integral-title"> -->
<%--           		  	<span>我的积分:${jkuser.point}</span> --%>
<%--           		  	<a href="${url}/user/toIntegral">积分中心</a> --%>
<!--           		  </div> -->
<%--             </c:if> --%>
<%--             <c:if test="${type==0}"> --%>
<%--           		  <div class="integral-title">TA的积分:${jkuser.point}</div> --%>
<%--             </c:if> --%>
<!--             <div class="integral-ad">积分商城小广告位及入口</div> -->
<%--             <c:if test="${type==1}"> --%>
<%--           		  <div class="link-bar"><a href="${ctx}/login/toScoreMall">积分商城</a></div> --%>
<%--             </c:if> --%>
<!--           </div> -->
<!--           <div class="other-box"> -->
<!--             <div class="tab-bar"> -->
<!--               <a href="#" class="active"> -->
<!--                 <span> -->
<%--                 <c:if test="${type==1}">我的</c:if> --%>
<%--                 <c:if test="${type==0}">TA的</c:if> --%>
<%--             	    关注</span><br><span class="grey-font">${jkuser.follows}</span></a><a href="#"> --%>
<!--                 <span> -->
<%--                 <c:if test="${type==1}">我的</c:if> --%>
<%--                 <c:if test="${type==0}">TA的</c:if> --%>
<%--                                            粉丝</span><br><span class="grey-font">${jkuser.fans}</span></a> --%>
<!--             </div> -->
<!--             <div class="tab-content"> -->
<!--               <div class="content-group"> -->
<!--                 <ul> -->
<%--                 <c:forEach var="item" items="${myFollowslist}" varStatus="status"> --%>

<!--                 		 <li> -->
<!--               			 <div class="user-avatar"> -->
<%--               			 <a href="${ctx}/login/toOtherUser?userid=${item['id']}"> --%>

<%--               			   <c:if test="${not empty item['head_pic_path']}"> --%>
<%--               			  	 <img src="${item['head_pic_path']}"  alt="">  --%>
<%--               			   </c:if> --%>
<%--               			   <c:if test="${empty item['head_pic_path']}"> --%>
<%--               			  	 <img src="${ctx}/resources/artcle/images/default.png"  alt="">  --%>
<%--               			   </c:if> --%>
<!--               			 </a></div> -->
<%--               			 <p>${item['nickname']}</p> --%>
<!--               			 </li>  -->
              	
<%--                </c:forEach> --%>
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="content-group hide"> -->
<!--                 <ul> -->
      
<%--                <c:forEach var="item" items="${fanslist}" varStatus="status"> --%>
<!--                 		<li> -->
<!--               			 <div class="user-avatar"> -->
<%--               			<a href="${ctx}/login/toOtherUser?userid=${item['id']}"> --%>
              			 
<%--               			  <c:if test="${not empty item['head_pic_path']}"> --%>
<%--               			 		<img src="${item['head_pic_path']}"  alt=""> --%>
<%--               			  </c:if> --%>
<%--               			  <c:if test="${empty item['head_pic_path']}"> --%>
<%--               			  	 <img src="${ctx}/resources/artcle/images/default.png"  alt="">  --%>
<%--               			   </c:if> --%>
<!--               			 </a></div> -->
<%--               			 <p>${item['nickname']}</p> --%>
<!--               			  </li> -->
              	
<%--                </c:forEach> --%>
                  
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="toggle-hint"><a href="#">更多<br><i class="icon down-arrows"></i></a></div> -->
<!--             </div> -->
<%--              <c:if test="${type==1}"> --%>
<!--             <div class="manage-nav-box"> -->
<!--               <p>账号管理</p> -->
<%--               <p><a class="active" href="${ctx}/user/toSecurity">账号安全</a></p> --%>
<%--               <p><a  href="${ctx}/user/toAuthentication">认证管理</a></p> --%>
<%--               <p><a href="${ctx}/user/toMyProject?id=${jkuser.id}">项目管理${uid}</a></p> --%>
<%--               <p><a href="${ctx}/user/toMyNews?id=${jkuser.id}">头条管理</a></p> --%>
<!--             </div> -->
<%--             </c:if> --%>
<!--           </div> -->
			<div class="user-item">
				<div class="tags-bar nav-col">
					<a href="#" style="
						font-weight: normal;
						font-size: 20px;
						margin: 0;
						color: #767d89;
						display: block;
						height: 40px;
						line-height: 40px;
					" data-api="0"><i class="icon ta-s-project-icon"></i>TA的项目</a>
				</div>
				<hr style="margin: 0 15px;">
				<div class="tags-bar nav-col">
					<a href="#" style="
						font-weight: normal;
						font-size: 20px;
						margin: 0;
						color: #767d89;
						display: block;
						height: 40px;
						line-height: 40px;
					" data-api="1"><i class="icon ta-top-icon"></i>TA的头条</a>
				</div>
			</div>
        </div>
        <div class="main-box">
          <ul class="user-publish-list"></ul>
          <div class="paging"></div>
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
var type=$('#type').val();
var projstatus;
var newstatus;
if(type==0) {
	projstatus="1,3,4";
	newstatus='1';
}else if(type==1) {
	projstatus="-1,0,1,2,3,4";
	newstatus=null;
}

var pagesize=10;
var current=1;
var newscurrent=1;
var appcurrent=1;
var urllist=[url+"/project/getProjectListMap",url+"/artcle/getNewsListallstauts",url+"/project/getProjectByApUid", "", "", url+"/user/getUserInfo"];
var currentlist=[current,newscurrent,appcurrent, 1, 1, 0];
var maxlist=[Math.ceil($('#totalofproject').val()/pagesize),Math.ceil($('#totalofnews').val()/pagesize),Math.ceil($('#totalofapp').val()/pagesize), 1, 1, 1];
var postlist=["POST","GET","POST","POST","POST","POST"];

$(function() {
	function fotmatter(data) {
		var date = new Date(data);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
	}
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) return unescape(r[2]);
		return null;
	}

	$('.user-item .nav-col a:not(".collection")').on('click',function() {
		for(var i=0;i<6;i++){
			currentlist[i]=1;
		}

		var api = $(this).attr('data-api');
		console.log(urllist);
		console.log(api);
		var parmlist=[{
			uid: $("#infoid").val(),
			page: currentlist[api],
			status: projstatus,
			pageSize: pagesize,
		}, {
			uid: $("#infoid").val(),
			status: newstatus,
			page: currentlist[api],
			pageSize: pagesize
		}, {
			uid:$("#infoid").val(),
			page:currentlist[api],
			pageSize:pagesize
		}, {}, {}, {
			id : $("#infoid").val()
		}];
		$(this).addClass('active').parents('.nav-col').siblings().find('a').removeClass('active');
		$.ajax({
			type: postlist[api],
			url: urllist[api],
			data: parmlist[api],
			aysnc:true,
			dataType: "json",
			success: function (data) {
				console.log(data);
				$(".paging").createPage({
					pageCount: maxlist[api],
					current: currentlist[api],
					backFn: function (curr) {
						currentlist[api]=curr;
						console.log(curr);
						$.ajax({
							type: postlist[api],
							url: urllist[api],
							data: parmlist[api],
							aysnc: true,
							dataType: "json",
							success: function(data){
								console.log(data);
								var newsList = data.newsList;
								$('.paging').show();
								if(api==0 || api==2){
									render(newsList, 1);
								}
								if(api==1){
									rendernews(newsList, 1);
								}
								if(api == 5) {
									$('.paging').hide();
									renderUserInformation(data, 1);
								}

								window.location.href='#userBody';
							}
						});
					}
				});

				var newsList = data.newsList;
				$('.paging').show();
				if(api==0||api==2){
					render(newsList,1);
				}
				if(api==1){
					rendernews(newsList,1);
				}
				if(api == 5) {
					$('.paging').hide();
					renderUserInformation(data, 1);
				}
				window.location.href='#userBody';
			}
		});

		return false;
	});
 
	<!--获取项目列表信息-->
	$.ajax({
		type: "POST",
		url: url+"/project/getProjectListMap",
		data: {
			uid:$("#infoid").val(),
			page:current,
			pageSize:pagesize,
			status:projstatus,
		},
		aysnc: true,
		dataType: "json",
		success: function(data){

			$(".paging").createPage({
				pageCount: Math.ceil($('#totalofproject').val()/pagesize),
				current: current,
				backFn: function(curr) {
					current=curr;
					console.log(curr);
					$.ajax({
						type: "POST",
						url: url+"/project/getProjectListMap",
						data: {
							uid:$("#infoid").val(),
							page:current,
							pageSize:pagesize,
							status:projstatus
						},
						aysnc:true,
						dataType: "json",
						success: function(data){
							var newsList = data.newsList;

							render(newsList,1);
							window.location.href='#userBody';
						}
					});
				}
			});
			var newsList = data.newsList;
			render(newsList,1);
		}
	});

	//我的关注和我的粉丝 tab切换
	$('.tab-bar a').on('click',function(){
		$(this).addClass('active').siblings('a').removeClass('active');
		$('.tab-content .content-group').eq($(this).index()).removeClass('hide').siblings('.content-group').addClass('hide');
		fixedEmpty($(this).index());
		return false;
	});
	//我的关注和我的粉丝 展开更多
	$('.tab-content .toggle-hint').on('click',function(){
		$(this).parents('.tab-content').toggleClass('more');
		return false;
	});
	function dellprojecturl(id){
		if(type==1) {
			return '<div class="col-inner"><a href="${ctx}/login/toProjectDetail?id='+id+'">查看</a></div>';
		}
		if(type==0) {
			return '<div class="col-inner"><a href="${ctx}/login/toProjectDetail?id='+id+'">查看</a></div>';
		}

	}
    
    function renderUserInformation(data, empty) {
    	var $list = $('.user-publish-list');
		if($list.length < 1 ) {
			$('.main-box .user-headline-list').attr('class','user-publish-list');
			$list = $('.user-publish-list');
		}
		empty && $list.html('');
		var headLine = '<h3 style="border-bottom: 1px solid #e9e9e9;padding: 0.5em 0;margin: 0;color: #00adec;margin-left: 20px;margin-right: 20px;font-size: 22px;">个人信息</h3>';
        headLine += '<h3 style="margin-left: 20px; margin-right: 20px;">基本信息</h3>';
		if(parseInt(data.userinfo.permissions%10) == 1) {
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">真实姓名:</label>' + fixNull(data.userinfo.realname) + '</div>';
		}
        headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">性别:</label>' + (data.user.gender == 1 ? '男' : '女') + '</div>';
        headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">地区:</label>' + fixNull(data.user.location) + '</div>';
        headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">简介:</label>' + fixNull(data.user.slogan) + '</div>';
        headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">个人标签:</label>' + joinTag(data.taglist) + '</div>';

        if(parseInt(data.userinfo.permissions%100/10) == 1) {
            headLine += '<h3 style="margin-left: 20px; margin-right: 20px;">联系方式</h3>';
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">电话:</label>' + fixNull(data.user.phone) + '</div>';
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">QQ:</label>' + fixNull(data.userinfo.contractQq) + '</div>';
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">微信:</label>' + fixNull(data.userinfo.contractWeixin) + '</div>';
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">微博:</label>' + fixNull(data.userinfo.contractWeibo) + '</div>';
            headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">邮箱:</label>' + fixNull(data.userinfo.contractMail) + '</div>';
        }
        headLine += '<h3 style="margin-left: 20px; margin-right: 20px;">其他信息</h3>';
		if(data.user.idType == 0) {
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">学校名称:</label>'+fixNull(data.userinfo.eduName)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">入学时间:</label>'+fixNull(data.userinfo.eduTime)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">院系:</label>'+fixNull(data.userinfo.eduCollage)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">专业:</label>'+fixNull(data.userinfo.eduMajor)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">社团:</label>'+fixNull(data.userinfo.eduClub)+'</div>';
		} else {
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">公司名称:</label>'+fixNull(data.userinfo.companyName)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">部门名称:</label>'+fixNull(data.userinfo.departName)+'</div>';
			headLine += '<div class="form-group" style="margin: 10px 50px;"><label class="input-label" style="display: inline-block;width: 60px;text-align: left;margin-right: 20px;">职称:</label>'+fixNull(data.userinfo.title)+'</div>';
		}
		$list.append(headLine);

		function joinTag(tagList) {
		    console.log("输出data");
		    console.log(data);
			tagList = tagList || [];
			var ret = "";
			console.log("we come to here!");
			for(var i=0; i<tagList.length; i++) {
				ret += tagList[i].tagName;
				console.log(ret);
				ret += " ";
			}
			return ret;
		}
		
		function fixNull(str) {
			return str==null?"":str;
		}
    }

	function render(data, empty) {
		var $list = $('.user-publish-list');
		if($list.length < 1 ) {
			$('.main-box .user-headline-list').attr('class','user-publish-list');
			$list = $('.user-publish-list');
		}

		var nodeList = data.map(function(item,index) {
			return('<li><div class="list-col c1"><div class="col-inner"><div class="project-photo '+(item.projType ? 'capital' :'service')+'"">\
				<img style="height: 100%;" src="'+item.projPicPath+'" alt=""></div></div></div><div class="list-col c2"><div class="col-inner">\
				<p class="title"><span class="orange-font">￥'+item.moneyNeeds+'</span><span class="blue-font">'+item.projName+'</span></p>\
				<p class="base-info">\
				<span><i class="icon figure"></i>'+item.username+'</span>\
				<span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span>\
				<span><i class="icon clock"></i>'+item.diffdate+'天前</span></p>\
				<p>131231231231</p>\
				<p class="tags"><span>'+item.cateName+'</span><span>'+dellocation(item.projLocation)+'</span></p></div></div><div class="list-col c3">\
				'+dellprojecturl(item.id)+'</div></li>'
			)
		});
		empty && $list.empty();
		$list.append(nodeList.join(''));
	}

    function dellocation(value){
    	if(value==null||value==''){
    		return "不限";
    	}else {
    		return value;
    	}
    }
    
    <!--插入头条列表 -->
    function rendernews	(data, empty) {
		var $list = $('.user-headline-list');
		if($list.length < 1 ){
			$('.main-box .user-publish-list').attr('class','user-headline-list');
			$list = $('.user-headline-list');
		}
		console.log($list,'插入头条列表');
		var nodeList = data.map(function(item, index) {
			return ('<li><a href="${ctx}/login/toNewsDetails?id='+item.id+'"><div class="headline-item-photo"><div class="inner-box">\
				<div class="photo"><img style="height: 99%; width: 99%;" src="'+item.picPath+'" alt=""></div></div></div>\
				<div class="headline-item-desc"><div class="inner-box">\
				<h3>'+item.title+'</h3>\
				<div class="desc-body">'+getContentAbstract(item.content)+'</div><p class="desc-footer">\
				<span>'+item.username+'</span>\
				<span class="create-time">'+fotmatter(item.createTime)+'</span></p></div></div></a></li>'
			)
		});
		empty && $list.empty();
		$list.append(nodeList.join(''));
	}

	$('#add').on('click',function(){
		$.ajax({
			type: "POST",
			url: url+"/fansfollows/addfanfollow",
			data: {
				fanid:$("#uid").val(),
				followid:$("#infoid").val()
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				if(data==1) {
					$('#add').css("display","none");
					$('#cancle').removeAttr("style")

				}else if(data==2) {
					alert("已关注");
				}
			}
		});
	});
	  
	$('#cancle').on('click',function(){
		$.ajax({
			type: "POST",
			url: url+"/fansfollows/delfanfollow",
			data: {
				fanid:$("#uid").val(),
				followid:$("#infoid").val()
			},
			aysnc:true,
			dataType: "json",
			success: function(data){
				if(data==1) {
					$('#cancle').css("display","none");
					$('#add').removeAttr("style");
				}
			}
		});
	});
	  
	//修复没数据时，显示问题
	function fixedEmpty(idx) {
		var $paging = $('.paging');
		var $toggleHint = $(".toggle-hint");
		//修复粉丝关注 更多按钮问题
		if($('.content-group').eq(idx).find('li').length <= 6) {
			$toggleHint.addClass('hide');
		} else {
			$toggleHint.removeClass('hide');
		}
	}
	fixedEmpty(0);

	//联系TA
	var $smsBox = $('.sms-box');
	$('.send-btn').on('click',function(){
		var userName = $('.user-base-info .user-name').text();
		$('.sms-box .to-user').text('发送给 ：'+userName);
		$smsBox.removeClass('hide');
		return false;
	});
	  
	$('.sms-box .sendForm').on('submit',function(){
		var message = $(this).find('textarea').val();
		var $textarea=$(this).find('textarea');
		console.log(message);

		$.ajax({
			type: "POST",
			url: url+"/mesg/addmesg",
			data: {
				toId:$('#infoid').val(),
				content:message,
				type:0
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				$textarea.val("");
				$smsBox.trigger('click');
			}

		});

		return false;
	});
	  
	$smsBox.on('click',function(e){
		if(e.target === $smsBox[0]){
			$smsBox.addClass('hide');
		}
	});
	getQueryString('nav') && $('.user-item .nav-col').eq(Number(getQueryString('nav'))).find('a').trigger('click');
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
  
  </script>
</body>

</html>