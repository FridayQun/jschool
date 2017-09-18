<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="ctx" value="<%=request.getContextPath()%>"/>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="zh">

<%-- jkuser --%>

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
var url='${ctx}';
var ctx = '${ctx}';
var idtype='${jkuser.idType}';
	</script>
</head>

<body>
	<%Integer id = (Integer)session.getAttribute("login_userId");%>
	<input hidden="true" type="text" id="uid"  value="<%=id%>"/>
	<input hidden="true" type="text" id="infoid"  value="${jkuser.id}"/>
	<input hidden="true" type="text" id="background-url"  value=""/>
	<!-- 无用 -->
	<!-- <input hidden="true"  type="text" id=totalofapp  value="${appcount}"/>  -->

    <!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
	<div class="user-section">
		<div class="wrapper">
<jsp:include page="user-header.jsp" flush="true"/>

			<div class="user-body">
<jsp:include page="user-slider-left.jsp" flush="true"/>

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
					<select style="min-width: 200px;height: 30px;line-height: 30px;padding: 0 5px;" class="clearfix"></select>
				</div>
				<div class="default-tag tagbtn" id="tagslist-container">
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
				</c:when>
				<c:when test="${pm3==2}">
					<option value="1">所有人可见</option>
				</c:when>
				<c:otherwise>
					<option value="1">所有人可见</option>
				</c:otherwise>
				</c:choose>

				</select>
			</div>
			<div class="form-group">
				<label class="input-label" for="company">单位名称</label>
				<input readonly class="input-style" type="text" name="company" id="company" value="${jkuserinfo.companyName}" placeholder="请在实名认证中修改">
			</div>
			<div class="form-group">
				<label class="input-label" for="departmentlab">部门/职位</label>
				<input readonly class="input-style" type="text" name="department" id="department" value="${jkuserinfo.departName}" placeholder="请在实名认证中修改">
			</div>
			<div class="form-group">
				<label class="input-label" for="district">地区</label>
				<div class="input-wrapper district-select">
					<c:set value="${fn:split(jkuserinfo.location,',') }" var="str1" />
					<select disabled class="myselect" id="cprovince" name="" value="${str1[0]}"></select>
					<select disabled class="myselect" id="ccity" name="" value="${str1[1]}"></select>
					<input type="hidden" name="cprovince" value="${str1[0]}">
					<input type="hidden" name="ccity" value="${str1[1]}">
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
				</c:when>
				<c:when test="${pm4==2}">
					<option value="1">所有人可见</option>
				</c:when>
				<c:otherwise>
					<option value="1">所有人可见</option>
				</c:otherwise>
				</c:choose>

				</select>
			</div>
			<div class="form-group">
				<label class="input-label" for="school">学校类型</label>

				<c:choose>
				<c:when test="${jkuserinfo.eduType==0}">
				<input type="hidden" name="school" value="0">
				</c:when>
				<c:when test="${jkuserinfo.eduType==1}">
				<input type="hidden" name="school" value="1">
				</c:when>
				<c:when test="${jkuserinfo.eduType==2}">
				<input type="hidden" name="school" value="2">
				</c:when>
				<c:otherwise>
				<input type="hidden" name="school" value="0">
				</c:otherwise>
				</c:choose>
				<select disabled class="myselect" id="school">

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
				<input readonly class="input-style" type="text" name="schoolname" id="schoolname" value="${jkuserinfo.eduName}" placeholder="输入学校名称">
			</div>

			<div class="form-group">
				<label class="input-label" for="admissiondate">入学时间</label>
				<input readonly class="input-style datepicker-style" data-toggle="datepicker" type="text" data-toggle="datepicker" name="admissiondate" id="admissiondate" value="<fmt:formatDate value="${jkuserinfo.eduTime}"/>">
			</div>

			<div class="form-group">
				<label class="input-label" for="faculty">院系</label>
				<input readonly class="input-style" type="text" name="faculty" id="faculty" value="${jkuserinfo.eduCollage}" placeholder="输入院系名称">
			</div>

			<div class="form-group">
				<label class="input-label" for="major">专业</label>
				<input readonly class="input-style" type="text" name="faculty" id="major" value="${jkuserinfo.eduMajor}" placeholder="输入专业名称">
			</div>

			<div class="form-group">
				<label class="input-label" for="club">社团</label>
				<input readonly class="input-style" type="text" name="faculty" id="club" value="${jkuserinfo.eduClub}" placeholder="输入社团">
			</div>

			<div class="form-group">
				<label class="input-label" for="faculty">院系</label>
				<input readonly class="input-style" type="text" name="faculty" id="faculty" value="${jkuserinfo.eduCollage}" placeholder="输入院系名称">
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
<!-- 	<input id="a-hidden-upload-file" style="display:none;" type="file" /> -->
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
// 	$(document).ready(function() {
// 		var fileInput = $('#a-hidden-upload-file');
// 		fileInput.on('change', function() {
// 			if(Math.floor(fileInput[0].files[0].size/1024) > 4000) {
// 				alert('太大');
// 				return;
// 			}
// 			var fd = new FormData();
// 			fd.append("file", fileInput[0].files[0]);
// 			$.ajax({
// 				url: ctx+"/artcle/upload",
// 				type: "POST",
// 				data: fd,
// 				processData: false,
// 				contentType: false
// 			}).done(function (result) {
// 				$('#user-background-image').css('background-image', 'url(' + window.URL.createObjectURL(fileInput[0].files[0]) + ')');
// 				$("#background-url").val(result.urlList[0]);
// 			});
// 		});
		
// 		// 令user-background-image可以被点击
// 		$('#user-background-image .upload-button').css('cursor', 'pointer');
// 		$('#user-background-image .upload-button').on('click', function() {
// 			var fileInput = $('#a-hidden-upload-file');
// 			fileInput[0].click();
// 		});
// 	});

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
					fid: $('#uid').val(),
					type: 0
				},
				aysnc: true,
				dataType: "json",
				success: function(obj) {
					var myselftagslist = obj.tagsList;
					for (var k in alltagslist) {
						if(alltagslist[k].parentId != 0) {
							continue;
						}
						$('#tagslist-parent .clearfix').append('<option value="' + alltagslist[k].id + '">' + alltagslist[k].tagName + '</option>');
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
									$("#tagslist").append('<a value="' + alltagslist[i].id + '" title="' + alltagslist[i].tagName + '" href="javascript:;"><span>' + alltagslist[i].tagName + '</span><em></em></a>');
									break;
								}
							}
							$(div).append('<a value="' + alltagslist[i].id + '" title="' + alltagslist[i].tagName + '" href="javascript:;"><span>' + alltagslist[i].tagName + '</span><em></em></a>');
						}
					}

					$($('#tagslist-container').children()[0]).show();
					// $($('#tagslist-parent .clearfix').children('a')[0]).addClass('active');
					$('#tagslist-parent .clearfix').on('change', function() {
						// $('#tagslist-parent .clearfix a.active').removeClass('active');
						$('#tagslist-container').children().hide();
						$('#tagslist-container [value='+$(this).val()+']').show();
						// $(this).addClass('active');
						console.log($(this));
					});
					searchAjax();
				}
			});
		}
	});

	$('.form-submit-bar input').on('click',function() {
		var tags ="";
		$('#tagslist a').each(function(i) {
			tags =$(this).attr('value')+','+ tags;
		});
		var pm1 = $("select[name='privacy1']").val();
		var pm2 = $("select[name='privacy2']").val();
		var pm3 = $("select[name='privacy3']").val();
		var pm4 = $("select[name='privacy4']").val();
		if(idtype==0&&idtype!="") {
			pmsum=(pm4*1000)*1+(2*100)*1+(pm2*10)*1+pm1*1;
		}
		if(idtype==1&&idtype!="") {	//idtype==1 表示公司 有单位信息 的权限
			pmsum=(2*1000)*1+(pm3*100)*1+(pm2*10)*1+pm1*1;
		}
		if(!idtype) {	//刚注册 没有idtype 等于空时 没有 学生和公司的信息权限
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
		var cprovince=$("#cprovince").find('option:checked').text();
		var ccity=$("#ccity").find('option:checked').text();
		var school=$('#school').val();
		var schoolname=$('#schoolname').val();
		var faculty=$('#faculty').val();
		var userinfoid=$('#userinfoid').val();
		var userid=$('#uid').val();
		var qq =$('#qq').val();
		var weixing=$('#weixing').val();
		var weibo=$('#weibo').val();
		var club=$('#club').val();
		var major=$('#major').val();
		var eduTime="";
		if(idtype==0&&idtype!="") {
			eduTime=$('#admissiondate').val().replace(/[年月]/g,'-').replace('日','')+" "+"00:00:00";
		}
		if(nikename==""||province==""||city=="") {
			alert("请输入必填信息");
			return false;
		}
		if(intro.length >200) {
			alert("个人简介文字超过了200字符限制！");
		}
		var uploadData = {
			nickname:nikename,
			gender:gender,
			ulocation:province+','+city,
			slogan:intro,
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
		};
		// 用不到了，在user-header里有实现了
		if($('#background-url').val()) {
			uploadData.backgroundPicture = $('#background-url').val();
		}
		$.ajax({
			type: "POST",
			url: ctx+"/user/modUser",
			data: uploadData,
			aysnc:true,
			dataType: "json",
			success: function(obj) {
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

	$('.district-select').each(function(item,index){
		var $province = $(this).find('select').eq(0);
		var $city = $(this).find('select').eq(1);
		var code = getDistrictCode($city.attr('value'));
		provinceAndCity($province,$city,code.province,code.city);
	});

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
