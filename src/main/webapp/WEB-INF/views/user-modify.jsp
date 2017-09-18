<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/user.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/tab.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  var idtype='${jkuser.idType}';
  </script>  
</head>

<body>
	<input type="hidden" id="userid"  value="${jkuser.id}"/>
 	<input type="hidden" id=userinfoid  value="${jkuserinfo.id}"/>
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
          		<div class="user-head"><img src="${ctx}/resources/artcle/images/default.png" alt=""><input type="file"></div>
         </c:if>
         <c:if test="${not empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${jkuser.headPicPath}" alt=""><input type="file"></div>
         </c:if>
          <p class="user-name">${jkuser.nickname}
          <c:if test="${jkuser.gender==1}">
          	 <c:out value="<i class='sex-icon male'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${jkuser.gender==2}">
          	 <c:out value="<i class='sex-icon female'></i></p>" escapeXml="false"/>
          </c:if>
           <c:if test="${empty jkuser.gender}">
          </c:if>
          </p>
          <p class="user-addr">${jkuser.location}</p>
          <p>${jkuser.slogan}</p>
        </div>
        <div class="edit-user-banner"><input type="file" name="userBanner" value=""><span><i class="icon upload"></i>上传封面图</span></div>
      </div>
      <div class="user-nav">
        <div class="nav-col">
          <div class="col-inner"><a  href="#"><span>我的发布</span><br><span class="grey-font">${totalofproject}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a  href="#"><span>我的头条</span><br><span class="grey-font">${totalofnews}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#"><span>我的申请</span><br><span class="grey-font">${appcount}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#"><span>我的收藏</span><br><span class="grey-font">${collectioncount}</span></a></div>
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
          </div>
          <div class="integral-box">
           <a href="${ctx}/user/toIntegral"><div class="integral-title">我的积分:${jkuser.point}</div></a>
            <div class="integral-ad">积分商城小广告位及入口</div>
          </div>
          <div class="other-box">
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
          <div class="modify-user-info">
            <h3 class="modify-user-title">编辑个人信息</h3>
            <div class="modify-form-box">
             
                <div class="form-section">
                  <h3>基本信息</h3>
                  <div class="privacy-select">
                    <select class="myselect" name="privacy1" >
                       <c:choose>
                     	 <c:when test="${jkuserinfo.permissions%10==1}">
                      		 <option value="1" selected ="selected">所有人可见</option>
                     		 <option value="2">仅自己可见</option>
                    	  </c:when>
                    	  <c:when test="${jkuserinfo.permissions%10==2}">
                      		<option value="1">所有人可见</option>
                    		<option value="2" selected ="selected">仅自己可见</option>
                     	 </c:when>
                     	<c:otherwise>
       							<option value="1">所有人可见</option>
                    			<option value="2" selected ="selected">仅自己可见</option>
   						</c:otherwise>
                      </c:choose>
                    </select>
                  </div>
                  <c:if test="${jkuser.userLevel<2}">
                  <div class="form-group">
                    <label class="input-label required" for="nickname">昵称</label>
                    <input class="input-style" type="text" name="nickname" id="nickname" value="${jkuser.nickname}" placeholder="" value="">
                  </div>
                  </c:if>
                  <div class="form-group">
                    <label class="input-label" for="realname">真实姓名</label>
                    <input class="input-style" type="text" name="realname" id="realname" value="${jkuserinfo.realname}" placeholder="" value=""  onfocus=this.blur()>
                  </div>
                  <div class="form-group">
                    <label class="input-label required">性别</label>
                    <div class="input-wrapper">
                     <c:choose>
                      <c:when test="${jkuser.gender==1}">  
                     		 <label><input type="radio" id="gender" name="gender" value="1" checked="checked"><span>&nbsp;&nbsp;男</span></label>&nbsp;&nbsp;
                     		 <label><input type="radio" id="gender" name="gender" value="2"><span>&nbsp;&nbsp;女</span></label>
                      </c:when>
                      <c:otherwise> 
                      		 <label><input type="radio" id="gender" name="gender" value="1" ><span>&nbsp;&nbsp;男</span></label>&nbsp;&nbsp;
                     		 <label><input type="radio" id="gender"  name="gender" value="2" checked="checked"><span>&nbsp;&nbsp;女</span></label>
                       </c:otherwise> 
                      </c:choose>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="input-label required" for="district">地区</label>
                    <div class="input-wrapper district-select">
                    <c:set value="${fn:split(jkuser.location,',') }" var="str1" />
                      <select class="myselect" id="province" name="province" value="${str1[0]}"></select>
                      <select class="myselect" id="city" name="city" value="${str1[1]}"></select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="intro">简介</label>
                    <textarea name="intro" id="intro" placeholder="请输入简介（200字以内）">${jkuser.slogan} </textarea>
                  </div>
                  <div class="form-group">
                    <label class="input-label">个人标签</label>
                    <div class="plus-tag tagbtn clearfix maxwidth input-wrapper" id="tagslist"></div>

                    <div class="tagbtn tagbtn-parent" id="tagslist-parent">
                        <div class="clearfix">
                          <!--<a class='active' value="17" title="个人标签2" href="javascript:void(0);"><span>个人标签2</span><em></em></a>
                        --></div>
                    </div>
                    <div class="default-tag tagbtn" id="tagslist-container">
                        <!--<div class="clearfix" value='1'>
                        </div>-->
                    </div>
                  </div>
                </div>
                <div class="form-section">
                  <h3>联系方式</h3>
                  <c:set var="pm2" ><fmt:parseNumber value="${(jkuserinfo.permissions % 100)/10}" integerOnly="true"/></c:set>  
                  <div class="privacy-select">
                    <select class="myselect"   name="privacy2">
                      <c:choose>
                     	 <c:when test="${pm2==1}">
                      		 <option value="1" selected ="selected">所有人可见</option>
                     		 <option value="2">仅自己可见</option>
                    	  </c:when>
                    	  <c:when test="${pm2==2}">
                      		<option value="1">所有人可见</option>
                    		<option value="2" selected ="selected">仅自己可见</option>
                     	 </c:when>
                     	 <c:otherwise>
       							<option value="1">所有人可见</option>
                    			<option value="2" selected ="selected">仅自己可见</option>
   						</c:otherwise>
                     	 </c:choose>
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="mobile">电话</label>
                    <input class="input-style" type="tel" name="moblie" id="moblie" value="${jkuser.phone}" placeholder="输入手机号码" onfocus=this.blur()>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="qq">QQ</label>
                    <input class="input-style" type="number" name="qq"  id="qq" value="${jkuserinfo.contractQq}" placeholder="">
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="weixing">微信</label>
                    <input class="input-style" type="text" name="weixing"  id="weixing" value="${jkuserinfo.contractWeixin}" placeholder="">
                  </div>
                   <div class="form-group">
                    <label class="input-label" for="weibo">微博</label>
                    <input class="input-style" type="text" name="weibo"  id="weibo" value="${jkuserinfo.contractWeibo}" placeholder="">
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="email">邮箱</label>
                    <input class="input-style" type="email" name="email" id="email" value="${jkuserinfo.contractMail}" placeholder="请输入邮箱号">
                  </div>
                </div>
                 <c:if test="${jkuser.userLevel>=2}">
                 	 <c:if test="${jkuser.idType==1}">
               			<div class="form-section">
                 		 <h3>职业信息</h3>
                  		 <c:set var="pm3" ><fmt:parseNumber value="${(jkuserinfo.permissions % 1000)/100}" integerOnly="true"/></c:set>  
                		  <div class="privacy-select">
	                     <select class="myselect" hidden="true" name="privacy3">
	                      	<c:choose>
	                     	 <c:when test="${pm3==1}">
	                      		 <option value="1" selected ="selected">所有人可见</option>
	                     		<!--  <option value="2">仅自己可见</option> -->
	                    	  </c:when>
	                    	  <c:when test="${pm3==2}">
	                      		<option value="1">所有人可见</option>
	                    		<!-- <option value="2" selected ="selected">仅自己可见</option> -->
	                     	 </c:when>
	                     	 	 <c:otherwise>
	       							<option value="1">所有人可见</option>
	                    			<!-- <option value="2" selected ="selected">仅自己可见</option> -->
	   						</c:otherwise>
	                     	 </c:choose>
	                    </select>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="company">单位名称</label>
                    <input class="input-style" type="text" name="company" id="company" value="${jkuserinfo.companyName}" placeholder="请输入完整的公司名称">
                  </div>
                  		<div class="form-group">
                    		<label class="input-label" for="departmentlab">部门/职位</label>
                   			 <input class="input-style" type="text" name="department" id="department" value="${jkuserinfo.departName}" placeholder="请输入你所在的部门或职位">
                 		</div>
                		<div class="form-group">
                  				  <label class="input-label" for="district">地区</label>
                    			  <div class="input-wrapper district-select">
				                      <c:set value="${fn:split(jkuserinfo.location,',') }" var="str1" />
				                      <select class="myselect" id="cprovince" name="cprovince" value="${str1[0]}"></select>
				                      <select class="myselect" id="ccity" name="ccity" value="${str1[1]}"></select>
                  				  </div>
                 		</div>
                 		
              	</div>
               		 </c:if>
               		 <c:if test="${jkuser.idType==0}">
               			<div class="form-section">
		                  <h3>教育信息</h3>
		                  <c:set var="pm4" ><fmt:parseNumber value="${jkuserinfo.permissions/1000 }" integerOnly="true"/></c:set>  
		                  <div class="privacy-select">
	                    <select class="myselect" hidden="true" name="privacy4">
	                      <c:choose>
	                     	 <c:when test="${pm4==1}">
                      		 <option value="1" selected ="selected">所有人可见</option>
                     		<!--  <option value="2">仅自己可见</option> -->
                    	  </c:when>
                    	  <c:when test="${pm4==2}">
                      		<option value="1">所有人可见</option>
                    		<!-- <option value="2" selected ="selected">仅自己可见</option> -->
                     	 </c:when>
                     	 	 <c:otherwise>
       							<option value="1">所有人可见</option>
                    			<!-- <option value="2" selected ="selected">仅自己可见</option> -->
   						</c:otherwise>
                     	 </c:choose>
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="school">学校类型</label>
                    
                    <select class="myselect" name="school" id="school">
                      <c:choose>
                      <c:when test="${jkuserinfo.eduType==0}">
                      		 <option value="0"  selected = "selected">大学</option>  
                      		 <option value="1"  >高中</option>
                      		 <option value="2"  >初中</option>
                      </c:when>
                      <c:when test="${jkuserinfo.eduType==1}">
                      		 <option value="0"  >大学</option>  
                      		 <option value="1"  selected = "selected">高中</option>
                      		 <option value="2"  >初中</option>
                      </c:when>
                        <c:when test="${jkuserinfo.eduType==2}">
                      		 <option value="0"  >大学</option>  
                      		 <option value="1"  >高中</option>
                      		 <option value="2"  selected = "selected">初中</option>
                      </c:when>
                      <c:otherwise>
                      		 <option value="0"  selected = "selected" >大学</option>  
                      		 <option value="1"  >高中</option>
                      		 <option value="2"  >初中</option>
                      
                      </c:otherwise>
                      </c:choose>
                      
                    </select>
                  </div>
                  <div class="form-group">
                    <label class="input-label" for="schoolname">学校名称</label>
                    <input class="input-style" type="text" name="schoolname" id="schoolname" value="${jkuserinfo.eduName}" placeholder="输入学校名称">
                  </div>
                  
                     <div class="form-group">
                        <label class="input-label" for="admissiondate">入学时间</label>
                        <input class="input-style datepicker-style" data-toggle="datepicker" type="text" data-toggle="datepicker" name="admissiondate" id="admissiondate" value="<fmt:formatDate value="${jkuserinfo.eduTime}"/>">
                      </div>
              
                  <div class="form-group">
                    <label class="input-label" for="faculty">院系</label>
                    <input class="input-style" type="text" name="faculty" id="faculty" value="${jkuserinfo.eduCollage}" placeholder="输入院系名称">
                  </div>
                  
                   <div class="form-group">
                    <label class="input-label" for="major">专业</label>
                    <input class="input-style" type="text" name="faculty" id="major" value="${jkuserinfo.eduMajor}" placeholder="输入专业名称">
                  </div>
                  
                   <div class="form-group">
                    <label class="input-label" for="club">社团</label>
                    <input class="input-style" type="text" name="faculty" id="club" value="${jkuserinfo.eduClub}" placeholder="输入社团">
                  </div>
                  
                   <div class="form-group">
                    <label class="input-label" for="faculty">院系</label>
                    <input class="input-style" type="text" name="faculty" id="faculty" value="${jkuserinfo.eduCollage}" placeholder="输入院系名称">
                  </div>
                </div>
                	 </c:if>
                 </c:if>
                <div class="form-submit-bar"><input type="button" name="submit" value="保 存"></div>
            
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/districts.js"></script>
  <script src="${ctx}/resources/artcle/js/datepicker.min.js"></script>
  <script src='${ctx}/resources/artcle/js/tab.js'></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
  function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
  var alert = window.new_alert || alert;
    $(function() {
    	 $.ajax({
          type: "GET",
          url: ctx + "/tag/getAllTagList",
          data: {
              tagType: 0
          },
          aysnc: true,
          dataType: "json",
          success: function(obj) {
              var alltagslist = obj.tagsList;

              $.ajax({
                  type: "GET",
                  url: ctx + "/tag/getTagList",
                  data: {
                      fid: $('#userid').val(),
                      type: 0
                  },
                  aysnc: true,
                  dataType: "json",
                  success: function(obj) {
                      var myselftagslist = obj.tagsList;
                      for (var k in alltagslist) {
                          // <a class='active' value="17" title="个人标签2" href="javascript:void(0);"><span>个人标签2</span><em></em></a>
                          if(alltagslist[k].parentId != 0) {
                              continue;
                          }
                          $('#tagslist-parent .clearfix').append('<a value="' + alltagslist[k].id + '" title="' + alltagslist[k].tagName + '" href="#"><span>' + alltagslist[k].tagName + '</span><em></em></a>');
                          var div = $("<div class='clearfix'></div>")[0];
                          $(div).attr('value', alltagslist[k].id);
                          $(div).hide();
                          $('#tagslist-container').append(div);
                          for(var i in alltagslist) {
                              if(alltagslist[k].id != alltagslist[i].parentId) {
                                  continue;
                              }
                              for (var j in myselftagslist) {
                                  if (alltagslist[i].id == myselftagslist[j].id) {
                                  // 列表上增加一个
                                      $("#tagslist").append('<a value="' + alltagslist[i].id + '" title="' + alltagslist[i].tagName + '" href="#"><span>' + alltagslist[i].tagName + '</span><em></em></a>');
                                      break;
                                  }
                              }
                              // 总的地方增加一个
                              $(div).append('<a value="' + alltagslist[i].id + '" title="' + alltagslist[i].tagName + '" href="#"><span>' + alltagslist[i].tagName + '</span><em></em></a>');
                          }
                      }

                      $($('#tagslist-container').children()[0]).show();
                      $($('#tagslist-parent .clearfix').children('a')[0]).addClass('active');
                      $('#tagslist-parent .clearfix').children('a').on('click', function() {
                          console.log(this);
                          $('#tagslist-parent .clearfix a.active').removeClass('active');
                          $('#tagslist-container').children().hide();
                          $('#tagslist-container [value='+$(this).attr('value')+']').show();
                          $(this).addClass('active');
                      });
                      searchAjax();
                  }
              });
          }
      });

        //修改用户数据
        $('.form-submit-bar input').on('click',function(){
        	
        	 var tags ="";
             $('#tagslist a').each(function(i){
            	 tags =$(this).attr('value')+','+ tags;
              });
           var pm1 = $("select[name='privacy1']").val(); 
           var pm2 = $("select[name='privacy2']").val();
           var pm3 = $("select[name='privacy3']").val();
           var pm4 = $("select[name='privacy4']").val();
           if(idtype==0&&idtype!=""){//idtype==0 表示学生 有教育信息 的权限
        	   pmsum=(pm4*1000)*1+(2*100)*1+(pm2*10)*1+pm1*1;
           }
           if(idtype==1&&idtype!=""){//idtype==1 表示公司 有单位信息 的权限
        	   pmsum=(2*1000)*1+(pm3*100)*1+(pm2*10)*1+pm1*1;
           }
           if(!idtype){   //刚注册 没有idtype 等于空时 没有 学生和公司的信息权限
        	   pmsum=(2*1000)*1+(2*100)*1+(pm2*10)*1+pm1*1;
           }

      	   var nikename=$('#nickname').val();
      	   var realname=$('#realname').val();
      	   var gender=$("input[name='gender']:checked").val();
      	   var province=$("#province").find('option:checked').text()
      	   var city=$("#city").find('option:checked').text()
      	   var intro=$('#intro').val();
      	   var moblie=$('#moblie').val();
      	   var email=$('#email').val();
      	   var company=$('#company').val();
      	   var department=$('#department').val();
      	   var cprovince=$("#cprovince").find('option:checked').text()
      	   var ccity=$("#ccity").find('option:checked').text()
      	   var school=$('#school').val();
      	   var schoolname=$('#schoolname').val();
      	   var faculty=$('#faculty').val();
      	   var userinfoid=$('#userinfoid').val();
      	   var userid=$('#userid').val();
      	   var qq =$('#qq').val();
      	   var weixing=$('#weixing').val();
      	   var weibo=$('#weibo').val();
      	   var club=$('#club').val();
      	   var major=$('#major').val();
      	   var eduTime="";
      	   if(idtype==0&&idtype!=""){
      	  	  eduTime=$('#admissiondate').val().replace(/[年月]/g,'-').replace('日','')+" "+"00:00:00";
      	   }
      	   if(nikename==""||province==""||city==""){
      	 		  alert("请输入必填信息");
      	 		  return false;
      	   }
      	   if(intro.length >200){
      		   alert("个人简介文字超过了200字符限制！");
      	   }
  	   	  $.ajax({
  	   		 type: "POST",
  	          url: ctx+"/user/modUser",
  	          data: {
  	        	  nickname:nikename,
  	        	//  realname:realname,
  	        	  gender:gender,
  	        	  ulocation:province+','+city,
  	        	  slogan:intro,
  	        	  //phone:moblie,
  	        	  contractMail:email,
  	        	  companyName:company,
  	        	  departName:department,
  	        	  ulocationinfo:cprovince+','+ccity,
  	        	  eduType:school,
  	        	  eduName:schoolname,
  	        	  eduCollage:faculty,
  	        	  uid:userid,
  	        	  uinfoid:userinfoid,
  	        	  contractQq:qq,
  	        	  tags:tags,
  	        	  permissions:pmsum,
  	        	  contractWeixin:weixing,
  	        	  contractWeibo:weibo,
  	        	  eduTime:eduTime,
  	        	  eduClub:club,
  	        	  eduMajor:major
  	          },
  	          aysnc:true,
  	          dataType: "json",
  	          success: function(obj){
  	        	  if(obj.error==0){
  	        		  alert("保存成功");
  	        		window.location.href=ctx+"/login/toUser";
  	        	  }else{
  	        		  alert(obj.error_mesg);
  	        	  }
  	          }
  	      }); 
  	   	  return false;
        });
        
      //省市联动
      $('.district-select').each(function(item,index){
        var $province = $(this).find('select').eq(0);
        var $city = $(this).find('select').eq(1);
        var code = getDistrictCode($city.attr('value'));
        provinceAndCity($province,$city,code.province,code.city);
      });
      
      //用户上传banner图
      $('.edit-user-banner input').on('change',function(){
    	  var userid=$('#userid').val();
       	 var file = $(this)[0].files[0];
       	var fd = new FormData();
		fd.append("file", file);

        $('.user-base-info').css('background-image', 'url('+window.URL.createObjectURL(file)+')');
        $.ajax({
            url: ctx+"/user/modelbackgroundpicture",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false
        }).done(function (result) {
        	
        });
	   	  
      });
      
      //更换头像
      $('.user-head input').on('change',function(){
    	  var file = $(this)[0].files[0];
    		var fd = new FormData();
    		fd.append("file", file);
    	  $(this).prev('img').attr('src',window.URL.createObjectURL(file));
    	  $.ajax({
              url: ctx+"/user/modelhendpicture",
              type: "POST",
              data: fd,
              processData: false,
              contentType: false
          }).done(function (result) {
          	
          });
      });
      
      $.fn.datepicker.languages['zh-CN'] = {
    	        format: 'yyyy年mm月dd日',
    	        days: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
    	        daysShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
    	        daysMin: ['日', '一', '二', '三', '四', '五', '六'],
    	        months: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
    	        monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    	        weekStart: 1,
    	        startView: 0,
    	        yearFirst: true,
    	        yearSuffix: '年',
    	        autoHide:true
    	      };
    	      $('[data-toggle="datepicker"]').datepicker({
    	        language: 'zh-CN'
    	      });

    });
        
  </script>
</body>

</html>
