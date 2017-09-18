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
          <c:if test="${jkuser.gender==1}">
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
          <div class="col-inner"><a href="#" data-api="44"><span>我的收藏</span><br><span class="grey-font">${collectioncount}</span></a></div>
        </div>
      </div>
      <div class="user-body">
        <div class="sidebar">
          <div class="integral-base-box ">
            <div class="base-row"><strong>积分中心</strong><span class="separate"> | </span><span class="weight">${jkuser.point}</span><a class="details-link" href="${ctx}/user/toIntegralDetils">积分明细</a></div>
             <!--   <div class="base-row">当前等级：LV,0    积分：0 <br>距离升级还需积分：9</div> -->
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
              			 	<c:if test="${not empty item['head_pic_path']}">
              			  	 <img src="${item['head_pic_path']}"  alt=""> 
              			   </c:if>
              			   <c:if test="${empty item['head_pic_path']}">
              			  	 <img src="${ctx}/resources/artcle/images/default.png"  alt=""> 
              			   </c:if>
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
              				<c:if test="${not empty item['head_pic_path']}">
              			  	 <img src="${item['head_pic_path']}"  alt=""> 
              			   </c:if>
              			   <c:if test="${empty item['head_pic_path']}">
              			  	 <img src="${ctx}/resources/artcle/images/default.png"  alt=""> 
              			   </c:if>
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
            <h3 class="integral-block-title">积分任务</h3>
            <div class="integral-tab-box">
              <div class="label">
                <a href="#" class="active">新手任务</a>
                <a href="#">每日任务</a>
              </div>
              <div class="content">
                <div class="content-item">
                  <p>1. 所有普资华企用户均可参与本次活动。</p>
                  <p>2. 完成相应任务，可进入账户中心下方，新手任务中领取奖励。</p>
                  <p>3. 5元抵用券的奖励内容为5张1元抵用券，每张抵用券需单笔投资满200元方可使用。</p>
                  <p>10元抵用券的奖励内容为1张10元抵用券，每张抵用券需单笔投资满2000元方可使用。</p>
                  <p>15元抵用券的奖励内容为5张1元抵用券+1张10元抵用券，抵用券的使用规则如上。</p>
                  <p>4. 抵用券的使用有效期为90天，请合理安排投资。</p>
                  <p>5. 最终解释权归普资华企所有。</p>
                </div>
                <div class="content-item hide">每日任务</div>
              </div>
            </div>
            <h3 class="integral-block-title">积分特权</h3>
            <div class="integral-privilege">
              <div class="privilege-img"><img src="${ctx}/resources/artcle/images/privilege-img.png" alt=""></div>
              <div class="privilege-desc">
                <div class="desc-col c1">1000以下积分用户每日可使用1次置顶，2次一键刷新功能。超限后每使用一次置顶扣除20积分，每使用一次一键刷新扣除5积分。</div>
                <div class="desc-col c2">第二阶段用户每日可使用2次置顶，4次一键刷新功能。超限后每使用一次置顶扣除20积分，每使用一次一键刷新扣除5积分。</div>
                <div class="desc-col c3">第三阶段积分用户每日可使用3次置顶，10次一键刷新功能。超限后每使用一次置顶扣除20积分。</div>
                <div class="desc-col c4">皇冠积分用户每日可使用5次置顶，无限次数一键刷新功能。</div>
              </div>
            </div>
            <h3 class="integral-block-title">积分规则</h3>
            <div class="integral-rules">
              <div class="integral-rules-title"><img src="${ctx}/resources/artcle/images/integral-rules-title.png" alt=""></div>
              <div class="integral-rules-desc">
                <p>1、 每位用户，每个任务只可以完成一次；</p>
                <p>2、 如果您已完成任务，请耐心等待，积分将会在　　一个工作日内增加到个人账户上；</p>
                <p>3、 如果您在完成任务3个工作日内尚未获得积分,　　请再次尝试关注和分享，或者联系我们；</p>
                <p>4、 如发现有任何恶意刷分，以及违反本活动规定的行为，花蜜街保留不另行通知而直接取消该用户参与资格或采取其他相应法律措施的权利。</p>
                <p>5、 在法律范围允许内，花蜜街拥有本活动的最终解释权，并有权限据需要取消活动或增删、修订本活动规则。</p>
              </div>
              <div class="exchange-process"><img src="${ctx}/resources/artcle/images/exchange-process.png" alt=""></div>
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
    $(function() {
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
      //新手人物和每日人物切换
      $('.integral-tab-box .label a').on('click',function(){
        var index = $(this).index();
        $(this).addClass('active').siblings().removeClass('active');
        $('.integral-tab-box .content .content-item').eq(index).removeClass('hide').siblings().addClass('hide');
        return false;
      });
      
      
    });
  </script>
</body>

</html>
