<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
  <title>编辑个人信息-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>  
</head>

<body>
	<input type="hidden" id="userid"  value="${jkuser.id}"/>
	<input type="hidden" id=userinfoid  value="${jkuserinfo.id}"/>
  <input type="hidden" id="infoid"  value="${jkuser.id}"/>
  <div class="user-modify-box">
    <form class="modifyForm" action="${ctx}/user/modUser" method="post">
      <div class="user-modify-avatar">
      <c:choose>
      		   <c:when test="${not empty jkuser.headPicPath}">
		       		 <div class="old-avatar"><img src="${jkuser.headPicPath}" alt=""></div>
		      </c:when>
		      <c:when test="${empty jkuser.headPicPath}">
		       		 <div class="old-avatar"><img src="${ctx}/resources/mobile/images/default.png" alt=""></div>
		      </c:when>
	  </c:choose>
        <div class="modify-input"><input type="file" name="modifyUpload" value=""></div>
        <div class="modify-hint">编辑头像</div>
      </div>
      <div class="modify-input-box">
        <div class="form-group">
          <div class="form-label">昵称：</div>
          <div class="form-input">
            <input type="text" class="input-style" id="nickname" name="nickname" value="${jkuser.nickname}" placeholder="请输入姓名">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">地区：</div>
          <div class="form-input" id="district">
          	<c:set value="${fn:split(jkuserinfo.location,',') }" var="str1" />
            <select class="myselect" id="province" name="province" value="${str1[0]}">
              <option value="0" selected="selected" disabled="disabled">请选择省</option>
            </select>
            <select class="myselect" id="city" name="city" value="${str1[1]}">
              <option value="0" selected="selected" disabled="disabled">请选择市</option>
            </select>
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">邮箱：</div>
          <div class="form-input">
            <input type="email" class="input-style" id="mobile" name="mobile" value="${jkuserinfo.contractMail}" placeholder="请输入邮箱">
          </div>
        </div>
           <div class="form-group">
          <div class="form-label">电话：</div>
          <div class="form-input">
            <input type="number" disabled="disabled" class="input-style" id="phone" name="phone" value="${jkuser.phone}" placeholder="请输入手机">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">QQ：</div>
          <div class="form-input">
            <input type="number" class="input-style" id="contractQq" name="contractQq" value="${jkuserinfo.contractQq}" placeholder="请输入QQ">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">微信：</div>
          <div class="form-input">
            <input type="text" class="input-style" id="contractWeixin" name="contractWeixin" value="${jkuserinfo.contractWeixin}" placeholder="请输入微信">
          </div>
        </div>
         <div class="form-group">
          <div class="form-label">微博：</div>
          <div class="form-input">
            <input type="text" class="input-style" id="contractWeibo" name="contractWeibo" value="${jkuserinfo.contractWeibo}" placeholder="请输入微博">
          </div>
        </div>
        <c:if test="${jkuser.idType==0}">
        <div class="form-group">
          <div class="form-label">学校：</div>
          <div class="form-input">
            <input class="input-style" type="text" id="school" name="school" value="${jkuserinfo.eduName}" placeholder="请输入学校">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">学院：</div>
          <div class="form-input">
            <input class="input-style" type="text" id="sdept" name="sdept" value="${jkuserinfo.eduCollage}" placeholder="请输入分院">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">社团：</div>
          <div class="form-input">
            <input class="input-style" type="text"  id="clubs" name="clubs" value="${jkuserinfo.eduClub}" placeholder="请输入社团">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">专业：</div>
          <div class="form-input">
            <input class="input-style" type="text"  id="major" name="major" value="${jkuserinfo.eduMajor}" placeholder="请输入专业">
          </div>
        </div>
        <div class="form-group">
          <div class="form-label">入学时间</div>
          <div class="form-input">
            <input class="input-style" type="date"  id="admissionDates" name="admissionDates" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${jkuserinfo.eduTime}"/>">
          </div>
        </div>
        </c:if>
        <div class="form-group">
          <div class="form-label">个人介绍：</div>
          <div class="form-input">
            <textarea name="slogan" id="slogan" placeholder="如果你不能简洁地表达你的想法，那只能说明你还不够了解它。此处为个人介绍填写" >${jkuser.slogan}</textarea>
          </div>
        </div>
        <div class="form-submit"><input type="submit" id="submit" name="submit" value="保 存"></div>
      </div>
    </form>

  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
  
  var type='${jkuser.idType}';
  
    $(function() {
    	
    	
    	 $('.modifyForm').on('submit',function(event){
    		 var userinfoid=$('#userinfoid').val();
    	    	var userid=$('#userid').val();
    	    	var nickname=$('#nickname').val();
    	    	var mobile=$('#mobile').val();
    	    	var school=$('#school').val();
    	    	var sdept=$('#sdept').val();
    	    	var clubs=$('#clubs').val();
    	    	var contractQq=$('#contractQq').val();
    	    	var phone=$('#phone').val();
    	    	var contractWeixin=$('#contractWeixin').val();
    	    	var contractWeibo=$('#contractWeibo').val();
    	    	var major=$('#major').val();
    	    	var admissionDates="";
    	    	console.log(type);
    	    	if(type===0&&type!=''){
    	    		alert(33);
    	    		 admissionDates=$('#admissionDates').val()+" "+"00:00:00";
    	    	}
    	    	var slogan=$('#slogan').val();
    	    	var province=$("#province").find('option:checked').text()
    	   	    var city=$("#city").find('option:checked').text()
    		 	event.preventDefault();
  	   	  $.ajax({
   	   		 type: "POST",
   	          url: ctx+"/user/modUser",
   	          data: {
   	        	  contractQq:contractQq,
   	        	  phone:phone,
   	        	  contractWeixin:contractWeixin,
   	        	  contractWeibo:contractWeibo,
   	        	  nickname:nickname,
 	        	  ulocationinfo:province+','+city,
 	        	  slogan:slogan,
 	        	  contractMail:mobile,
 	        	  eduName:school,
 	        	  eduCollage:sdept,
 	        	  uid:userid,
 	        	  uinfoid:userinfoid,
 	        	  eduClub:clubs,
 	        	  eduMajor:major,
 	        	  eduTime:admissionDates,       	 
   	          },
   	          aysnc:true,
   	          dataType: "json",
   	          success: function(obj){
   	        	  if(obj.error==0){
   	        		window.location.href=ctx+"/mobileuserino/toUserIndex";
   	        	  }else{
   	        		  alert(obj.error_mesg);
   	        	  }
   	          }
   	      }); 
       	  
       	  return false;
       	 });
    	
      //省市联动
      (function districtSelect(){
        var $province = $('#district select[name="province"]');
        var $city = $('#district select[name="city"]');
        var code = getDistrictCode($city.attr('value'));
        provinceAndCity($province,$city,code.province,code.city);
      })();

      $('.user-modify-avatar input').on('change',function(){
        var file = $(this)[0].files[0];
        $(this).parents('.user-modify-avatar').find('.old-avatar img').attr('src',window.URL.createObjectURL(file));
        var fd = new FormData();
        fd.append("file", file);
        $.ajax({
             url: ctx+"/user/modelhendpicture",
             type: "POST",
             data: fd,
             processData: false,
             contentType: false
         }).done(function (result) {
         });
      });
    })
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
