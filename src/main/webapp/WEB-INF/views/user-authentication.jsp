<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
<c:choose>
<c:when test="${not empty jkUserCeritifiredwait.id }">
<h2 style="text-align: center;margin: 4em auto;">审核已提交，请等待</h2>
</c:when>
<c:otherwise>
	<c:if test="${ empty jkUserCeritifired.id}">

<div class="auth-user-info">
	<h3 class="auth-user-title">实名认证</h3>
	<div class="auth-form-box">
		<div class="form-group modeSelect">
			<label class="input-label" for="mode">认证类型</label>
			<div class="input-wrapper">
				<label><input type="radio" name="mold" value="0" data-name='student' checked="checked"><span>学生用户</span></label>
				<label><input type="radio" name="mold" value="1" data-name='company' ><span>公司企业</span></label>
			</div>
		</div>
		<div class="auth-mold">
			<div class="student-input-form">
				<div class="form-group">
					<label class="input-label" for="realname">真实姓名</label>
					<input class="input-style" type="text" name="realname" id="realname" value="">(必填)
				</div>
				<div class="form-group">
					<label class="input-label" for="idcard">身份证号</label>
					<input class="input-style" type="text" name="idcard" id="idcard" value="">(必填)
				</div>
				<div class="upload-card-group" id="idcardFront">
					<label class="input-label" for="idcardFront">证件正面</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="idcardFront" value=""><span>证件正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/card-front.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.必须看清证件信息，且证件信息不能被遮挡；</p>
							<p>2.仅支持 .jpg .bmp .png .gif 的图片格式，图片大小不超过3M；</p>
							<p>3.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="upload-card-group" id="idcardBack">
					<label class="input-label" for="idcardBack">证件反面</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="idcardBack" value=""><span>证件反面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/card-back.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.必须看清证件信息，且证件信息不能被遮挡；</p>
							<p>2.仅支持 .jpg .bmp .png .gif 的图片格式，图片大小不超过3M；</p>
							<p>3.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="upload-card-group" id="holdphoto">
					<label class="input-label" for="photo">手持照片</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="photo" value=""><span>照片正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/photo-sample.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.请上传本人手持身份证正面头部照片和上半身照片；</p>
							<p>2.照片为免冠，未化妆的数码照片原始图片，请勿编辑修改；</p>
							<p>3.必须看清证件信息，且证件信息不能被遮挡，持证人五官清晰可见；</p>
							<p>4.仅支持.jpg、.bmp、.png、.gif的图片格式，图片大小不超过3M；</p>
							<p>5.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="input-label" for="school">学校</label>
					<input class="input-style" type="text" name="school" id="school" value="">(必填)
				</div>
				<div class="form-group">
					<label class="input-label" for="admissiondate">入学时间</label>
					<input class="datepicker-style" type="text" data-toggle="datepicker" name="admissiondate" id="admissiondate" value="">(必填)
				</div>
				<div class="form-group">
					<label class="input-label" for="faculty">二级学院</label>
					<input class="input-style" type="text" name="faculty" id="faculty" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="clubs">社团</label>
					<input class="input-style" type="text" name="clubs" id="clubs" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="major">专业</label>
					<input class="input-style" type="text" name="major" id="major" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="sno">学号</label>
					<input class="input-style" type="text" name="sno" id="sno" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="district">地址</label>
					<div class="input-wrapper district-select">
						<select class="myselect" name="province" id="province"></select>
						<select class="myselect" name="city" id="city"></select>
					</div>
				</div>
				<div class="form-group">
					<label class="input-label" for="address">详细地址</label>
					<input class="input-style" type="text" name="address" id="address" value="">
				</div>
				<div class="upload-card-group" id="papers">
					<label class="input-label" for="papers">身份核实</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="papers" value=""><span>证件正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/photo-sample.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>学生用户请上传学生证、校园卡等证件</p>
						</div>
					</div>
				</div>
				<div class="form-submit">
					<input id="studentSubmit" type="submit" name="submit" value="提交认证">
				</div>
			</div>
			<div class="company-input-form hide">

				<div class="form-group">
					<label class="input-label" for="lpRealname">真实姓名</label>
					<input class="input-style" type="text" name="lpRealname" id="lpRealname" value="">(必填)
				</div>
				<div class="form-group">
					<label class="input-label" for="lpIdcard">身份证号</label>
					<input class="input-style" type="text" name="lpIdcard" id="lpIdcard" value="">(必填)
				</div>
				<div class="upload-card-group" id="lpIdcardFront">
					<label class="input-label" for="lpIdcardFront">证件正面</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="lpIdcardFront" value=""><span>证件正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/card-front.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.必须看清证件信息，且证件信息不能被遮挡；</p>
							<p>2.仅支持 .jpg .bmp .png .gif 的图片格式，图片大小不超过3M；</p>
							<p>3.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="upload-card-group" id="lpIdcardBack">
					<label class="input-label" for="lpIdcardBack">证件反面</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="lpIdcardBack" value=""><span>证件反面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/card-back.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.必须看清证件信息，且证件信息不能被遮挡；</p>
							<p>2.仅支持 .jpg .bmp .png .gif 的图片格式，图片大小不超过3M；</p>
							<p>3.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="upload-card-group" id="lpPhoto">
					<label class="input-label" for="lpPhoto">手持照片</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="lpPhoto" value=""><span>照片正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/photo-sample.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>1.请上传本人手持身份证正面头部照片和上半身照片；</p>
							<p>2.照片为免冠，未化妆的数码照片原始图片，请勿编辑修改；</p>
							<p>3.必须看清证件信息，且证件信息不能被遮挡，持证人五官清晰可见；</p>
							<p>4.仅支持.jpg、.bmp、.png、.gif的图片格式，图片大小不超过3M；</p>
							<p>5.您提供的照片信息将予以保护，不会用于其他用途。</p>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="input-label" for="company">单位/组织</label>
					<input class="input-style" type="text" name="company" id="company" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="post">职位</label>
					<input class="input-style" type="text" name="post" id="post" value="">
				</div>
				<div class="form-group">
					<label class="input-label" for="companyDistrict">地址</label>
					<div class="input-wrapper district-select">
						<select class="myselect" name="comprovince"></select>
						<select class="myselect" name="comcity"></select>
					</div>
				</div>
				<div class="form-group">
					<label class="input-label" for="companyAddress">详细地址</label>
					<input class="input-style" type="text" name="companyAddress" id="companyAddress" value="">
				</div>
				<div class="upload-card-group" id="lpapers">
					<label class="input-label" for="lpapers">身份核实</label>
					<div class="upload-wrapper">
						<div class="col">
							<div class="file-btn"><input type="file" accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" name="lpapers" value=""><span>证件正面</span><span class="file-name">未选择任何文件</span></div>
							<div class="upload-preview"><img src="${ctx}/resources/artcle/images/photo-sample.png" alt=""></div>(必填)
						</div>
						<div class="col">
							<p>请上传职位/称号证明材料，例如：工作证明/合同/工牌等</p>
						</div>
					</div>
				</div>
				<div class="form-submit">
					<input id="companySubmit" type="button" name="submit" value="提交认证">
				</div>
			</div>
		</div>
	</div>
</div>

	</c:if>
	<c:if test="${not empty jkUserCeritifired.id}">
<h2 style="text-align: center;margin: 4em auto;">已通过审核</h2>
<h2 style="text-align: center;margin: 4em auto;">
	<a class="re-link" onclick="reRenzhen();"style="cursor:pointer;">重新认证</a>
</h2>
	</c:if>
</c:otherwise>
</c:choose>

				</div>
			</div>
		</div>
	</div>
	<!--动态包含-->
	<jsp:include page="foot.jsp" flush="true"/>

	<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
	<script src="${ctx}/resources/artcle/js/districts.js"></script>
	<script src="${ctx}/resources/artcle/js/datepicker.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
	<script>
	function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
	var alert = window.new_alert || alert;
	function new_confirm (message, func) {$.DialogBySHF.Confirm({Width: 350,Height: 200,Title: "提示信息",Content: message,ConfirmFun: func,CancelFun: function() {}});}

var surl="";
function reRenzhen(){
	new_confirm("确认重新认证吗？", function() {
		window.location.href= ctx+'/userceritifired/cancle?cid='+'${jkUserCeritifired.id}'+'&uid='+'${jkuser.id}';
	});
}

$(function() {
	$('#studentSubmit').on('click',function() {
		var idcarurl=$('#idcardFront').data("uploadid");
		var idcardBack=$('#idcardBack').data("uploadid");
		var holdphoto=$('#holdphoto').data("uploadid");
		var document = $('#papers').data("uploadid");
		var realname=$('#realname').val();
		var idcard=$('#idcard').val();
		var school=$('#school').val();
		var admissiondate=$('#admissiondate').val();
		var faculty=$('#faculty').val();
		var clubs=$('#clubs').val();
		var sno=$('#sno').val();
		var intro=$('#intro').val();
		var province=$('#province').find('option:checked').text();
		var city=$('#city').find('option:checked').text();
		var address=$('#address').val();
		var major=$('#major').val();
		var type=$("input[name='mold']:checked").val();
		if(idcarurl=='' || idcardBack=='' || holdphoto=='' ||realname=='' ||idcard==''||type=='' || admissiondate=='') {
			alert("请输入必填信息")
			return false;
		}
		$.ajax({
			url: ctx+"/userceritifired/add",
			type: "POST",
			data: {
				uid:$('#uid').val(),
				realname:realname,
				idcardPositive:idcarurl,
				idcardOpposite:idcardBack,
				idcardHold:holdphoto,
				idno:idcard,
				school:school,
				eduStarttime:admissiondate.replace(/[年月]/g,'-').replace('日',''),
				branch:faculty,
				club:clubs,
				major:major,
				profile:intro,
				location:province+','+city,
				address:address,
				document:document,
				userno:sno,
				type:type
			},
			aysnc: true,
			dataType: "json",
			success: function(data) {
				if(data==1){
					alert("提交成功");
					$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '提交成功', ConfirmFun: function(){
						window.location.href=ctx+"/login/toUser";
					} });
				} else {
					alert("提交失败");
				}
			}
		});
	});

	$("#companySubmit").on('click',function() {
		var idcarurl=$('#lpIdcardFront').data("uploadid");
		var idcardBack=$('#lpIdcardBack').data("uploadid");
		var holdphoto=$('#lpPhoto').data("uploadid");
		var document = $('#lpapers').data("uploadid");
		var comrealname=$('#lpRealname').val();
		var comidcard=$('#lpIdcard').val();
		var company=$('#company').val();
		var post=$('#post').val();
		var companyIntro=$('#companyIntro').val();
		var comprovince=$('#comprovince').find('option:checked').text();
		var comcity=$('#comcity').find('option:checked').text();
		var companyAddress=$('#companyAddress').val();
		var type=$("input[name='mold']:checked").val();

		$.ajax({
			url: ctx+"/userceritifired/add",
			type: "POST",
			data: {
				uid:$('#uid').val(),
				realname:comrealname,
				idcardPositive:idcarurl,
				idcardOpposite:idcardBack,
				idcardHold:holdphoto,
				idno:comidcard,
				profile:companyIntro,
				location:comprovince+','+comcity,
				address:companyAddress,
				document:document,
				company:company,
				position:post,
				type:type
			},
			aysnc:true,
			dataType: "json",
			success: function(data) {
				if(data==1) {
					$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: '提交成功', ConfirmFun: function(){
						window.location.href=ctx+"/login/toUser";
					}});
				}else{
					alert("提交失败");
				}
			}
		});
	});

	$('.auth-form-box .modeSelect input').on('click',function() {
		$('.'+$(this).data('name')+'-input-form').removeClass('hide').siblings().addClass('hide');
	});
	$('.upload-card-group input').on('change',function() {
		var $cardGroup = $(this).parents('.upload-card-group');
		var $preview = $(this).parents('.upload-card-group').find('.upload-preview img');
		var $fileName = $(this).parents('.upload-card-group').find('.file-name');
		var file = $(this)[0].files[0];
		var fd = new FormData();
		fd.append("file", file);
		$.ajax({
			url: ctx+"/artcle/upload",
			type: "POST",
			data: fd,
			processData: false,
			contentType: false,
			dataType: "json",
			success: function(data) {
				if(data.error==0){
					$fileName.text(file.name);
					$preview.attr('src', window.URL.createObjectURL(file));
					$cardGroup.attr('data-uploadid',data.urlList[0]);
				}else{
					alert("上传图片失败");
				}
			}
		});
	});

	$('.district-select').each(function(item,index){
		var $province = $(this).find('select').eq(0);
		var $city = $(this).find('select').eq(1);
		var code = getDistrictCode($city.attr('value'));
		provinceAndCity($province,$city,code.province,code.city);
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
