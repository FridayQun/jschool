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
  <title>实名认证-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>    
</head>

<body>
	<input type="hidden" id="type"  value="${type}"/>	
	<input type="hidden" id="userid"  value="${loginid}"/>
  <c:if test="${ empty jkUserCeritifired.id}">
  <div class="user-auth-box">
    <form class="modifyForm" action="#" method="post">
      <div class="form-group">
        <div class="form-label">真实姓名：</div>
        <div class="form-input">
          <input type="text" class="input-style" name="realname" value="" placeholder="请输入真实姓名">
        </div>
      </div>

      <div class="form-group">
        <div class="form-label">身份证号：</div>
        <div class="form-input">
          <input type="text"  class="input-style" name="idno" value="" placeholder="输入身份证号码">
        </div>
      </div>
      <div class="form-group" id="idcardFront">
        <div class="form-label">身份正面：</div>
        <div class="form-input file-input"><input type="file" name="idcardFront" value=""><span>请选择文件</span></div>
      </div>
      <div class="upload-note">1.必须看得清证件信息，且证件信息不能被遮挡；<br>2.仅支持.jpg .bmp .png .gif的图片格式，图片大小不超过3M；<br>3.您提供的照片信息将予以保护，不会用于其他用途。</div>
      <div class="form-group" id="idcardBack">
        <div class="form-label">身份反面：</div>
        <div class="form-input file-input"><input type="file" name="idcardBack" value=""><span>请选择文件</span></div>
      </div>
      <div class="form-group" id="holdphoto">
        <div class="form-label">手持照片：</div>
        <div class="form-input file-input"><input type="file" name="photo" value=""><span>请选择文件</span></div>
      </div>
      <div class="form-group">
        <div class="form-label">公司名称：</div>
        <div class="form-input">
          <input class="input-style" type="text" name="company" value="" placeholder="请输入公司名称">
        </div>
      </div>
   
      <div class="form-group">
        <div class="form-label">职位：</div>
        <div class="form-input">
          <input class="input-style" type="text" name="position" value="" placeholder="请输入您的职位">
        </div>
      </div>
      <div class="form-group">
      <div class="form-label">地区：</div>
          <div class="form-input" id="district">
            <select class="myselect" id="province" name="province" value="">
              <option value="0" selected="selected" disabled="disabled">请选择省</option>
            </select>
            <select class="myselect" id="city" name="city" value="">
              <option value="0" selected="selected" disabled="disabled">请选择市</option>
            </select>
          </div>
      </div>
      
        <div class="form-group">
        <div class="form-label">详细地址：</div>
        <div class="form-input">
          <input class="input-style" type="text" name="address" value="" placeholder="请输入您的详细地址">
        </div>
      </div>
 	  <div class="form-group" id="document">
        <div class="form-label">身份核实：</div>
        <div class="form-input file-input"><input type="file" name="document" value=""><span>请选择文件</span></div>
      </div>
      <p><small>请上传职位/称号证明材料，例如：工作证明/合同/工牌等</small></p>
      <div class="form-submit"><input type="submit" name="submit" value="提交认证"></div>
    </form>

  </div>
  </c:if>
   <c:if test="${not empty jkUserCeritifired.id}">
   			 <div class="main-box">
      			 <h2 style="text-align: center;margin: 4em auto;">已通过审核</h2>
      		 </div>
   </c:if>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script>
    $(function() {
    	//提交
    	 $('.modifyForm').on('submit',function(event){
    		 	var idcarurl=$('#idcardFront').data("uploadid");
        	var idcardBack=$('#idcardBack').data("uploadid");
        	var holdphoto=$('#holdphoto').data("uploadid");
        	var document=$('#document').data("uploadid");
    		 	var formData = $(this).serializeArray();
    		 	var province=$("#province").find('option:checked').text();
    	   	var city=$("#city").find('option:checked').text();
    	   	
    	   	var IDcard = /^\d{6}(19|2\d)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)?$/;
    	   	
    	   	var realname = $(this).find('input[name="realname"]').val();
    	   	var idno     = $(this).find('input[name="idno"]').val();
    	   	
    	   	var company  = $(this).find('input[name="company"]').val();
    	   	var position = $(this).find('input[name="position"]').val();
    	   	
    	   	if(!realname){
    	   		JKApp.dialog({message:"请输入您的真实姓名！"});
    	   	}else if(!IDcard.test(idno)){
    	   		JKApp.dialog({message:"请输入正确的身份证号码！"});
    	   	}else if(idcarurl === undefined || idcarurl ==='' || idcarurl=== null){
    	   		JKApp.dialog({message:"请上传身份证正面照片！"});
    	   	}else if(idcardBack === undefined || idcardBack === '' || idcardBack === null){
    	   		JKApp.dialog({message:"请上传身份证背面照片！"});
    	   	}else if(holdphoto === undefined || holdphoto === '' || holdphoto === null){
    	   		JKApp.dialog({message:"请上传手持照片！"});
    	   	}else if(!company){
    	   		JKApp.dialog({message:"请输入公司名称！"});
    	   	}else if(!position){
    	   		JKApp.dialog({message:"请输入职位！"});
    	   	}else{
    	   		formData.push({
    		 		name:"uid",
    		 		value:$('#userid').val()
    		 	});
    		 	formData.push({
    		 		name:"idcardPositive",
    		 		value:idcarurl
    		 	});
    		 	formData.push({
    		 		name:"idcardOpposite",
    		 		value:idcardBack
    		 	});
    		 	formData.push({
    		 		name:"idcardHold",
    		 		value:holdphoto
    		 	});
    		 	formData.push({
    		 		name:"document",
    		 		value:document
    		 	});
    		 	formData.push({
    		 		name:"location",
    		 		value:province+","+city
    		 	});
    		 	formData.push({
    		 		name:"type",
    		 		value:"1"
    		 	});
    		 	
    		 	console.log(formData);
    	  		$.ajax({
                    url: ctx+"/userceritifired/add",
                    type: "POST",
                    data: formData,
                    aysnc:true,
      	            dataType: "json",
                    success: function(data){
                    	if(data==1){
                    			alert("提交成功");
                    			window.location.href=ctx+"/mobileuserino/toUserIndex";
                    			
                    	}else{
                    		alert("提交失败");
                    	}
                    }
                });
    	   	}
    		 	return false;
    	 });
    	  //省市联动
         (function districtSelect(){
           var $province = $('#district select[name="province"]');
           var $city = $('#district select[name="city"]');
           var code = getDistrictCode($city.attr('value'));
           provinceAndCity($province,$city,code.province,code.city);
         })();
    
      //上传
      $('.file-input input').on('change',function() {
        $(this).next('span').text($(this)[0].files[0].name);
        var $formGroup = $(this).parents('.form-group');
        var file = $(this)[0].files[0];
        var fd = new FormData();
        fd.append("file", file);
        $.ajax({
            url: ctx+"/artcle/upload",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false,
            success: function(data){
            	if(data.error==0){
            		$formGroup.attr('data-uploadid',data.urlList[0]);
            	}else{
            		alert("上传图片失败");
            	}
            }
        });
      });
    });
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
