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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/project.css">
  
  <script>
    var ctx = '${ctx}';
  </script>      
</head>

<body>
  <div class="publish-form-box">
    <form class="publishForm" action="${ctx}/mobile/project/publishProject" method="post">
      <input type="hidden"  name="projPicPath"  id="projPicPath" value="">
      <div class="form-group">
        <div class="form-label">类型：</div>
        <div class="form-input">
          <label class="radio-btn"><input type="radio" name="projType" value="0"><span>赞助</span></label>
          <label class="radio-btn"><input type="radio" checked="checked" name="projType" value="1"><span>供给</span></label>
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">项目分类：</div>
        <div class="form-input">
          <select class="myselect w10" onchange="gradeChange()" id="firstCate">
            <option value="0" selected="selected" disabled="disabled">选择一级类目</option>
            <c:forEach var="firstCate" items="${firstCateList}" >
            	<option value="${firstCate.id}">${firstCate.cateName}</option>
            </c:forEach>
          </select><br>
          <select class="myselect w10" name="cid" id="secondCate" >
            <option value="0" selected="selected" disabled="disabled">选择二级类目</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">地区：</div>
        <div class="form-input" id="district">
          <select class="myselect" name="province"></select>
          <select class="myselect" name="projLocation"></select>
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">申请截止日期：</div>
        <div class="form-input">
          <input class="input-style calender-input" type="date" name="applyTime" value="" placeholder="2017-02-14">
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">项目开始日期：</div>
        <div class="form-input">
          <input class="input-style calender-input" type="date" name="startTime" value="" placeholder="2017-02-14">
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">项目截止日期：</div>
        <div class="form-input">
          <input class="input-style calender-input" type="date" name="endTime" value="" placeholder="2017-02-14">
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">预算：</div>
        <div class="form-input">
          <input class="input-style-w5" type="number" onkeypress='return (/[\d]/.test(String.fromCharCode(event.keyCode)))' name="moneyNeeds" value="" placeholder="选填">/可议价
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">场次：</div>
        <div class="form-input">
          <input class="input-style-w5" type="number" onkeypress='return (/[\d]/.test(String.fromCharCode(event.keyCode)))' name="timesNumber" value="" placeholder="选填">/次
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">项目标题：</div>
        <div class="form-input">
          <input class="input-style" type="text" name="projName" value="" placeholder="16字以内">
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">项目描述：</div>
        <div class="form-input">
          <textarea name="projDesc" placeholder="200字以内"></textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">主题图片：</div>
        <div class="form-group-content upload-photo-group">
           <div class="upload-preview empty"><input type="file" name="upload" id="zhutiPic" value=""></div>
           <span>建议上传尺寸为450*450像素，大小不超过3M，显示效果更佳</span>
        </div>
      </div>
      <div class="form-group">
        <div class="form-label">标签：<font style="color:grey">(选择标签不得超过5个)</font></div>
        <div class="form-input" id = "tagPro">
          <c:forEach var="tag" items="${tagList }">
	          <label class="checkbox-btn"><input type="checkbox" name="tags" value="${tag.id }"><span>${tag.tagName }</span></label>
          </c:forEach>
        </div>
      </div>
     <div class="form-submit-bar">
<!--         <input type="submit" name="submit" value="保存"> -->
        <input type="submit" name="submit" value="发布">
      </div>
    </form>
  </div>
  <div class="calendar-box"></div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      //省市联动
      (function districtSelect(){
        var $province = $('#district select[name="province"]');
        var $city = $('#district select[name="projLocation"]');
        provinceAndCity($province,$city);
      })();
      //上传图片
      $('#zhutiPic').on('change',function(){
        $(this).next('span').text($(this)[0].files[0].name);
        var file = $(this)[0].files[0];
        var fd = new FormData();
        fd.append("file", file);
        $.ajax({
            url: ctx+"/artcle/upload",
            type: "POST",
            data: fd,
            processData: false,
            contentType: false
        }).done(function (result) {     
        	$("#projPicPath").val(result.urlList[0]);
        });
      });
      $('.publishForm').on('submit',function(){
    	  var projectMode1 = $('#firstCate option:checked').val();
    	  var projectMode2 = $('#secondCate option:checked').val();
    	  var applyTime = $(this).find('input[name="applyTime"]').val();
    	  var startTime = $(this).find('input[name="startTime"]').val();
    	  var endTime   = $(this).find('input[name="endTime"]').val();
    	  var projName  = $(this).find('input[name="projName"]').val();
    	  var projDesc  = $(this).find('textarea').val();
    	  var projPicPath = $("#projPicPath").val();
    	 
    	  if(projectMode1=== '0' || !projectMode2 === '0'){
    		  JKApp.dialog({message:'请选择项目分类！'});
    		  return false;
    	  }else if(!applyTime){
    		  JKApp.dialog({message:'请选择项目申请截止日期！'});
    		  return false;
    	  }else if(!startTime){
    		  JKApp.dialog({message:'请选择项目开始日期！'});
    		  return false;
    	  }else if(!endTime){
    		  JKApp.dialog({message:'请选择项目截止日期!'});
    		  return false;
    	  }else if(!projName){
    		  JKApp.dialog({message:'请输入项目标题!'});
    		  return false;
    	  }else if(!projDesc){
    		  JKApp.dialog({message:'请输入项目描述!'});
    		  return false;
    	  }else if(!projPicPath){
    		  JKApp.dialog({message:'请上传主题图片！'});
    		  return false;
    	  }
      });
    });

    (function () {
        var flag = 0;
        $("#tagPro").find('input').on("change", function() {
            if($(this).prop("checked") == true && flag < 5){
                flag++;
            }else if($(this).prop('checked') == false){
                flag--;
            } else{
                $(this).prop('checked', false);
            }
        });
    })();
    
    function gradeChange(){
    	var firstCateId = $("#firstCate").val();
    	$.ajax({
    	    type: "GET",
    	    url: ctx+"/projectcate/getSecondCateList",
    	    data: {"parentId":firstCateId},
    	    dataType: "json",
    	    success: function(data){   
    	    	if(data!=null){
   	    			$("#secondCate").empty();
    	    		for(var i=0;i<data.length;i++){
    	    			$("#secondCate").append('<option value="'+data[i].id+'">'+data[i].cateName+'</option>');
    	    		}
    	    	}
    	    }
    	}); 
    }
    
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
