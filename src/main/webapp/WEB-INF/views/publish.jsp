<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
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
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/publish.css">
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/jquery.validator.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
    <!-- 富文本编辑器 -->
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <script>
        var ctx = '${ctx}';
    </script>
</head>
<body>
<!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
<div class="publish-section">
    <div class="wrapper">
        <form class="publishForm" id="publishForm" action="${ctx}/project/publishProject" method="post">
            <input type="hidden"  name="draftId" id="draftId"  value="">
            <input type="hidden"  name="uid" value="${login_userId}">
            <input type="hidden"  name="projPicPath"  id="projPicPath" value="">
            <input type="hidden"  id="filePath" value="">
            <input type="hidden"  id="fileName" value="">
            <input type="hidden"  name="isDraft"  id="isDraft" value="0">
            <input type="hidden"  name="from"  value="<% out.print(
					URLEncoder.encode(
							URLDecoder.decode(
									request.getHeader("Referer"), "UTF-8")
							, "utf-8")
					); %>">
            <div class="docs" style="border-bottom: 0;">
                <div class="publish-form-box">
                    <div class="form-group">
                        <div class="form-group-label ib"><strong>项目类型：</strong></div>
                        <div class="form-group-content ib">
                            <label class="label-btn"><input type="radio" checked="checked" name="projType" value="0"><span>我有赞助</span></label>
                            <label class="label-btn"><input type="radio" name="projType" value="1"><span>我有供给</span></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>明确需求标题和详情：</strong></div>
                        <div class="form-group-content"><label><input maxlength="25" class="input-style" type="text" name="projName" id="projName" value="" ></label></div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>选择类型：</strong></div>
                        <div class="form-group-content"  id="firstCateList"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>选择类目：</strong></div>
                        <div class="form-group-content" id="secondCateList"></div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>地域：</strong></div>
                        <div class="form-group-content region">
                            <label class="label-btn"><input type="radio" checked="checked" name="local" value="不限地区"><span>不限地区</span></label>
                            <label class="label-btn"><input type="radio" name="local" value="指定地区"><span>指定地区</span></label>
                        </div>
                        <div class="form-group-content hide" id="detailLocation">
                            <label><select class="myselect" name="province">
                            </select></label>
                            <label><select class="myselect" name="projLocation">
                            </select></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>明确预算：</strong></div>
                        <div class="form-group-content">
                            <label>
                                <input type="number" max="600000" min="0" class="input-style w2" name="moneyNeeds"  id="moneyNeeds" value="" placeholder="选填" >
                                <select class="reserve-select" onchange="this.previousElementSibling.value=this.value">
                                    <option value="100">100</option>
                                    <option value="500">500</option>
                                    <option value="1000"> 1000</option>
                                    <option value="2000"> 2000</option>
                                    <option value="5000"> 5000</option>
                                    <option value="10000"> 10000</option>
                                </select>
                                <span> /可议价</span>
                            </label>
                            <!-- <label><input type="text" class="input-style w2" name="moneyNeeds" value="" placeholder="选填"> /可议价</label> -->
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>场次／数量</strong></div>
                        <div class="form-group-content">
                            <label><input type="number" class="input-style w2" name="timesNumber"  id="timesNumber" value="" placeholder="" ></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>设置申请截止日期：</strong></div>
                        <div class="form-group-content">
                            <label><input class="input-style w20" data-toggle="datepicker" name="applyTime" id="applyTime"  placeholder="截止日期" ></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label"><strong>活动的起止日期：</strong></div>
                        <div class="form-group-content">
                            <label><input class="input-style w20" data-toggle="datepicker" name="startTime" id="startTime" placeholder="活动开始日期" ></label>
                            <span>-</span>
                            <label><input class="input-style w20" data-toggle="datepicker" name="endTime" id="endTime" placeholder="活动结束日期" ></label>
                        </div>
                    </div>
                    <textarea name="projDesc" id="projDesc" rows="10" cols="80">初始化内容</textarea>
                    <script>
                        CKEDITOR.replace('projDesc', {
                            filebrowserBrowseUrl : '',
                            filebrowserUploadUrl : ctx+'/artcle/Copyupload',
                            toolbar: [
                                ['Undo', 'Redo', '-', 'RemoveFormat', "Image"],
                                ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
                                ['Maximize'],
                                // '/',
                                // ['Format', 'Font', 'FontSize'],
                                ['TextColor', 'BGColor'],
                                ['Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript']
                            ]
                        });
                    </script>
                    <br/>
                    <div class="form-group">
                        <div class="form-group-label ib" style='display: flex;'><strong>上传附件(最大上传20M)：</strong></div>

                        <!-- 添加的文件 -->
                        <div id='show-file-label' style='display: block; width: 100%; height: auto; margin: 0; padding: 0; border: 0;'>
                            <!--
                                <div style="display: inline-flex;"><input value="showme" name="fileName" readonly="" style="
                                    margin-left: 170px;
                                    width: 376px;
                                "><input type="hidden" value="filePath" name="filePath"><input type="button" value="删除"></div>
                            -->
                        </div>

                        <div class="form-group-content upload-file" style='padding-left: 170px;'>
                            <input type="file" name="attachment" value="" id="fujianFile" accept=".jpg,.pdf,.doc,.docx,.xls,.xlsx,.pdf"/>
                            <span style="color:#999;">(附件大小应小于20M)</span>
                        </div>
                    </div>
                    <div class='progress-bar' id='progress-bar' style='visibility: hidden;display: flex;height: 25px;margin-left: 170px;width: 420px;justify-content: center;align-items: center;'>
                        <div class='progress-bar-inner'></div><span class='progress-bar-data'>0%</span>
                    </div>
                    <div class="form-group">
                        <div class="form-group-label ib"><strong>主题图片：</strong></div>
                        <div class="form-group-content upload-photo-group">
                            <div class="upload-preview empty"><input type="file" name="upload" id="zhutiPic" accept=".jpg,.png,jpeg,.bmp,.gif" value="" ></div>
                            <span>建议上传尺寸为450*450像素，大小不超过3M，显示效果更佳</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="form-group-label"><strong>设置标签：</strong><font style="color:grey">(选择标签不得超过5个)</font></div>
                        <div class="form-group-content"  id="projTags"></div>
                    </div>
                    <div class="form-group">
                    </div>

                </div>
            </div>
            <div class="docs gap" style="margin-top: 0; border-top: 0;">
                <div class="publish-form-box">
                    <p class="publish-form-clause"><span class="myCheckbox"><label><input type="checkbox" name="agree" id="publishagree" value=""><span></span></label>
			  </span>我已经阅读并同意<a href="javascript:window.open('${ctx }/resources/publishRules.htm', '_blank', 'height=300,width=500,scrollbars=no,location=no')">《鲸客网信息发布规定》</a></p>
                    <p class="publish-form-submit">
                        <button type="button" name="pub" id="publishSubmit">立即发布</button>
                        <button type="button" name="preview" id="publishPreview" style="
					width: 160px;
					height: 36px;
					outline: none;
					border: 0;
					background-color: #00acec;
					color: #fff;
					border-radius: 0.2em;
					margin: 0 1.5em 0 0;
				">预览项目</button>
                        <button type="button" name="save" id="saveDraft">保存到草稿</button>
                    </p>
                </div>
            </div>
        </form>
    </div>
</div>
<!--动态包含-->
<jsp:include page="foot.jsp" flush="true"/>

<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script src="${ctx}/resources/artcle/js/datepicker.min.js"></script>
<script src="${ctx}/resources/artcle/js/districts.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
<script>
    function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
    var alert = window.new_alert || alert;
    $(function() {

        var publishApp = {
            init: function() {
                this.upload(); //上传预览
                this.uploadFile();
                this.datepicker(); //日期选择
                this.regionSelect();//区域的选择
            },
            uploadFile: function() {
                //上传附件
                $('#fujianFile').on('change', function() {
                    $('#progress-bar').css('visibility', 'visible');
                    $('#progress-bar').children('.progress-bar-inner').css('width', '0');
                    $('#progress-bar').children('.progress-bar-data').html('0%');
                    $('#fujianFile').prop('disabled', 'disabled');
                    var file = $(this)[0].files[0];
                    if(!file) {
                        return;
                    }
                    var fd = new FormData();
                    fd.append("file", file);
                    if(Math.floor(file.size/1024/1024) <= 20){
                        $.ajax({
                            url: ctx+"/artcle/upload",
                            type: "POST",
                            data: fd,
                            processData: false,
                            contentType: false,
                            xhr: (function(fun) {
                                var This = arguments.callee;
                                This.onprogress = fun;
                                return function() {
                                    var xhr = $.ajaxSettings.xhr();
                                    if(typeof This.onprogress !== 'function') {
                                        return xhr;
                                    }
                                    if(This.onprogress && xhr.upload) {
                                        xhr.upload.onprogress = This.onprogress;
                                    }
                                    return xhr;
                                }
                            })(function(e) {
                                var percent = (e.loaded / e.total).toFixed(2);
                                console.log(percent);
                                $('#progress-bar').children('.progress-bar-inner').css('width', (percent*100)+'%');
                                $('#progress-bar').children('.progress-bar-data').html((percent*100)+'%');
                            }),
                            success:function() {
                                // alert("上传完成");
                            }
                        }).done(function (result) {
                            console.log(result);
                            // $("#filePath").val(result.urlList[0]);
                            // $("#fileName").val(result.urlList[1]);
                            var displayArea = $('<div style="display: inline-flex;"><input value="showme" name="fileName" readonly="" style=" margin-left: 170px; width: 376px; "><input type="hidden" value="filePath" name="filePath"></div>');
                            var delBtn = $('<input type="button" value="删除">');
                            displayArea.append(delBtn);
                            displayArea.children('input[name=fileName]').val(result.urlList[1]);
                            displayArea.children('input[name=filePath]').val(result.urlList[0]);
                            delBtn.on('click', function() {
                                $(this).parent().remove();
                            });
                            $('#show-file-label').append(displayArea);
                            $('#fujianFile').val('');
                            $('#progress-bar').children('.progress-bar-inner').css('width', '0%');
                            $('#progress-bar').children('.progress-bar-data').html('0%');
                            $('#fujianFile').prop('disabled', '');
                            $('#progress-bar').css('visibility', 'hidden');
                        });
                    }else{
                        alert('文件太大了！');
                        $('#fujianFile').val('');
                        $('#progress-bar').children('.progress-bar-inner').css('width', '0%');
                        $('#progress-bar').children('.progress-bar-data').html('0%');
                        $('#fujianFile').prop('disabled', '');
                        $('#progress-bar').css('visibility', 'hidden');
                    }

                });
            },
            upload: function() {
                var $uploadPreview = $('.upload-preview');
                //上传主题图片
                $uploadPreview.find('input').on('change', function() {
                    var file = $(this)[0].files[0];
                    var fd = new FormData();
                    fd.append("file", file);
                    if(Math.floor(file.size/1024) <= 4000){
                        $.ajax({
                            url: ctx+"/artcle/upload",
                            type: "POST",
                            data: fd,
                            processData: false,
                            contentType: false
                        }).done(function (result) {
                            $uploadPreview.removeClass('empty').css('background-image', 'url(' + window.URL.createObjectURL(file) + ')');
                            $("#projPicPath").val(result.urlList[0]);
                        });
                    }else{
                        alert('文件太大了！请重新上传！');
                    }
                });
            },
            datepicker: function() {
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
            },
            regionSelect: function() {
                $('.region input').on('click',function(){
                    var thisVal = $(this).val();
                    var $selectBox = $(this).parents('.region').next();
                    var $provinceSelect = $selectBox.find('select[name="province"]');
                    var $citySelect = $selectBox.find('select[name="projLocation"]');
                    var provinceListNodes = '';
                    var provinceKey = null;
                    if(thisVal ==='指定地区') {
                        $selectBox.removeClass('hide') ;
                        $selectBox.find('select').removeAttr('disabled');
                    }else{
                        $selectBox.addClass('hide');
                        $selectBox.find('select').attr('disabled','disabled');
                    }
                    for (provinceKey in districtData['100000']){
                        provinceListNodes += '<option value="'+districtData['100000'][provinceKey]+'" data-key="'+provinceKey+'">'+districtData['100000'][provinceKey]+'</option>';
                    }
                    $citySelect.empty().append('<option value="'+districtData['110000']['110100']+'" data-key="'+districtData['110000']+'">'+districtData['110000']['110100']+'</option>');
                    $provinceSelect.empty().append(provinceListNodes).on('change',function(){
                        var cityKey = null;
                        var cityListNodes = '';
                        var provinceKey = $(this).find('option:checked').attr('data-key');
                        for(cityKey in districtData[provinceKey]){
                            cityListNodes += '<option value="'+districtData[provinceKey][cityKey]+'" data-key="'+cityKey+'">'+districtData[provinceKey][cityKey]+'</option>';
                        }
                        $citySelect.empty().append(cityListNodes);
                        cityKey = null;
                        cityListNodes = '';
                    });
                });
            }
        };
        publishApp.init();
    });

    //动态设置类目
    $.ajax({
        type: "GET",
        url: ctx+"/projectcate/getFirstAndSecondCateList",
        data: {},
        aysnc:true,
        dataType: "json",
        success: function(data){
            var firstCateList = data.firstCateList;
            var secondCateList = data.secondCateList;
            for(var index in firstCateList ){
                if(index==0){
                    $("#firstCateList").append('<label class="label-btn"><input type="radio" checked="checked" name="genre" value="'+firstCateList[index].id+'"><span onclick="getSecondCateList('+firstCateList[index].id+');">'+firstCateList[index].cateName+'</span></label>');
                }else{
                    $("#firstCateList").append('<label class="label-btn"><input type="radio" name="genre" value="'+firstCateList[index].id+'"><span onclick="getSecondCateList('+firstCateList[index].id+');">'+firstCateList[index].cateName+'</span></label>');
                }
            }
            for(var index in secondCateList){
                if(index==0){
                    $("#secondCateList").append('<label class="label-btn"><input type="radio" checked="checked" name="cid" value="'+secondCateList[index].id+'"><span>'+secondCateList[index].cateName+'</span></label>');
                }else{
                    $("#secondCateList").append('<label class="label-btn"><input type="radio" name="cid" value="'+secondCateList[index].id+'"><span>'+secondCateList[index].cateName+'</span></label>');
                }
            }
            //草稿箱初始化
            var dreaftCate = '${dreaftCate}';
            if(dreaftCate!=''){
                console.log(dreaftCate);//si//shenmegui

                dreaftCate = eval('(' + dreaftCate + ')');
                $("#firstCateList").empty();
                $("#secondCateList").empty();
                for(var index in firstCateList ){
                    if(firstCateList[index].id==dreaftCate.parentId){
                        $("#firstCateList").append('<label class="label-btn"><input type="radio" checked="checked" name="genre" value="'+firstCateList[index].id+'"><span onclick="getSecondCateList('+firstCateList[index].id+');">'+firstCateList[index].cateName+'</span></label>');
                    }else{
                        $("#firstCateList").append('<label class="label-btn"><input type="radio" name="genre" value="'+firstCateList[index].id+'"><span onclick="getSecondCateList('+firstCateList[index].id+');">'+firstCateList[index].cateName+'</span></label>');
                    }
                }
                $.ajax({
                    type: "GET",
                    url: ctx+"/projectcate/getSecondCateList",
                    data: {"parentId":dreaftCate.parentId},
                    aysnc:true,
                    dataType: "json",
                    success: function(data){
                        $("#secondCateList").empty();
                        for(var index in data){
                            if(dreaftCate.id==data[index].id)
                                $("#secondCateList").append('<label class="label-btn"><input type="radio" checked="checked" name="cid" value="'+data[index].id+'"><span>'+data[index].cateName+'</span></label>');
                            else
                                $("#secondCateList").append('<label class="label-btn"><input type="radio" name="cid" value="'+data[index].id+'"><span>'+data[index].cateName+'</span></label>');
                        }
                    }
                });
            }
        }
    });
    //设置二级类目
    function getSecondCateList(parentId){
        $.ajax({
            type: "GET",
            url: ctx+"/projectcate/getSecondCateList",
            data: {"parentId":parentId},
            aysnc:true,
            dataType: "json",
            success: function(data){
                $("#secondCateList").empty();
                for(var index in data){
                    if(index==0)
                        $("#secondCateList").append('<label class="label-btn"><input type="radio" checked="checked" name="cid" value="'+data[index].id+'"><span>'+data[index].cateName+'</span></label>');
                    else
                        $("#secondCateList").append('<label class="label-btn"><input type="radio" name="cid" value="'+data[index].id+'"><span>'+data[index].cateName+'</span></label>');
                }
            }
        });
    }
    //标签列表
    $.ajax({
        type: "GET",
        url: ctx+"/tag/getAllTagList",
        data: {tagType:1},
        aysnc:true,
        dataType: "json",
        success: function(data){
            var tagsList = data.tagsList;
            var dreaftTagList = '${dreaftTagList}';
            if(dreaftTagList!=''){
                dreaftTagList = eval('(' + dreaftTagList + ')');
                dreaftTagList.forEach(function(item,index){
                    tagsList.forEach(function(si,idx){
                        (item.id === si.id) && (si.checked = true)
                    })
                });
            }
            var nodes = tagsList.map(function(item,index){
                return ('<label class="label-btn"><input type="checkbox" name="tags" value="'+item.id+'" '+(item.checked ? 'checked="checked"':'')+'><span>'+item.tagName+'</span></label>')
            });
            $("#projTags").append(nodes.join(''));
            (function () {
                var flag = 0;
                $("#projTags").find('input').on("change", function() {
                    if($(this).prop("checked") == true && flag < 5){
                        flag++;
                    }else if($(this).prop('checked') == false){
                        flag--;
                    } else{
                        $(this).prop('checked', false);
                    }
                });
            })();

        }
    });
    //发布项目
    $("#publishSubmit").on("click",function(){
        var obj = $("#publishagree")[0];
        if(!obj.checked){
            alert("您必须阅读并同意鲸客网信息发布规定！");
            return false;
        }
        $("#isDraft").val("0");
        $("#publishForm").trigger('submit');
    });
    $('#publishPreview').on('click', function() {
        var projType = $("input:radio[name='projType']").eq(0).attr("checked")?0:1;
        var cateName = $($('input[type=radio][name=cid][checked=checked]')).siblings('span').html();
        var location = $($('input[type=radio][name=local][checked=checked]')).siblings('span').html();
        if(location == '指定地区') {
            var $selectBox = $("#detailLocation");
            var $provinceSelect = $selectBox.find('select[name="province"]');
            var $citySelect = $selectBox.find('select[name="projLocation"]');
            var p = $provinceSelect.val();
            var c = $citySelect.val();
            location = p+','+c;
        }
        var moneyNeeds = $("#moneyNeeds").val();
        var timesNumber = $("#timesNumber").val();
        var applyTime = $("#applyTime").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        var tags = [];
        if(true) {
            var tagDoms = $('input[type=checkbox][name=tags][checked=checked]').siblings('span');
            for(var i=0; i<tagDoms.length; i++) {
                tags.push(tagDoms.innerHTML);
            }
        }
        window.open("${ctx}/login/toProjectDetail?id=-1&projType="+projType+"&cateName="+cateName+"&location="+location
            +"&moneyNeeds="+moneyNeeds
            +"&timesNumber="+timesNumber
            +"&applyTime="+applyTime
            +"&startTime="+startTime
            +"&endTime="+endTime
            +"&tags="+tags.join(','), "_blank");
    });
    //保存到草稿箱
    $("#saveDraft").on("click",function(){
        $("#isDraft").val("1");
        $("#publishForm").trigger('submit');
    });

    Date.prototype.Format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3),
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    //草稿初始化
    var dreaftProj = '${dreaftProj}';

    if(dreaftProj!=''){
        console.log("<><><><><><><><><><><><><><><><><><><><><><><><><>");
        console.log(dreaftProj);
        // dreaftProj = dreaftProj.replace("\"","\\\"");
        //console.log(dreaftProj);
        dreaftProj = eval('(' + dreaftProj + ')');
        $("#draftId").val(dreaftProj.id);
        $("#projPicPath").val(dreaftProj.projPicPath);
        $('.upload-preview').removeClass('empty').css('background-image', 'url(' + dreaftProj.projPicPath + ')');
        $("#filePath").val(dreaftProj.filePath);
        $("#fujianFile").val(dreaftProj.filePath);
        if(dreaftProj.projType==0){
            $("input:radio[name='projType']").eq(0).attr("checked",'checked');
            $("input:radio[name='projType']").eq(1).attr("checked",false);
        }else if(dreaftProj.projType==1){
            $("input:radio[name='projType']").eq(0).attr("checked",false);
            $("input:radio[name='projType']").eq(1).attr("checked",'checked');
        }
        $("#fileName").val(dreaftProj.fileName);
        $("#projName").val(dreaftProj.projName);
        if(dreaftProj.projLocation!=''){
            $("input:radio[name='local']").eq(0).attr("checked",false);
            $("input:radio[name='local']").eq(1).attr("checked",'checked');
            var strs= new Array();
            strs=dreaftProj.projLocation.split(":");
            var $selectBox = $("#detailLocation");
            var $provinceSelect = $selectBox.find('select[name="province"]');
            var $citySelect = $selectBox.find('select[name="projLocation"]');
            var provinceListNodes = '';
            var provinceKey = null;
            $selectBox.removeClass('hide') ;
            $selectBox.find('select').removeAttr('disabled');
            for (provinceKey in districtData['100000']){
                provinceListNodes += '<option value="'+districtData['100000'][provinceKey]+'" data-key="'+provinceKey+'">'+districtData['100000'][provinceKey]+'</option>';
            }
            $citySelect.empty().append('<option value="'+districtData['110000']['110100']+'" data-key="'+districtData['110000']+'">'+districtData['110000']['110100']+'</option>');
            $provinceSelect.empty().append(provinceListNodes).on('change',function(){
                var cityKey = null;
                var cityListNodes = '';
                var provinceKey = $(this).find('option:checked').attr('data-key');
                for(cityKey in districtData[provinceKey]){
                    cityListNodes += '<option value="'+districtData[provinceKey][cityKey]+'" data-key="'+cityKey+'">'+districtData[provinceKey][cityKey]+'</option>';
                }
                $citySelect.empty().append(cityListNodes);
                cityKey = null;
                cityListNodes = '';
            });
            $("select[name='province']").val(strs[0]);
            $("select[name='province']").change();
            $("select[name='projLocation']").val(strs[1]);
        }else{
            $("input:radio[name='local']").eq(0).attr("checked",'checked');
            $("input:radio[name='local']").eq(1).attr("checked",false);
        }
        $("#moneyNeeds").val(dreaftProj.moneyNeeds);
        //由于这变有""所以需要处理一下
        $("#projDesc").val(dreaftProj.projDesc);
        //var vv = dreaftProj.projDesc.replaceChild("\"","\\\"");
        //console.log("----------------------------------------------------");
       // console.log(vv);
        $("#projDesc").val(dreaftProj.projDesc);

        $("#timesNumber").val(dreaftProj.timesNumber);
        $("#applyTime").val(dreaftProj.applyTime==null?null:new Date(dreaftProj.applyTime.time).Format("yyyy年MM月dd日"));
        $("#startTime").val(dreaftProj.startTime==null?null:new Date(dreaftProj.startTime.time).Format("yyyy年MM月dd日"));
        $("#endTime").val(dreaftProj.endTime==null?null:new Date(dreaftProj.endTime.time).Format("yyyy年MM月dd日"));
    }
    function  getDays(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式
        var  aDate,  oDate1,  oDate2,  iDays;
        aDate  =  sDate1.split("-");
        oDate1  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);    //转换为12-18-2006格式
        aDate  =  sDate2.split("-");
        oDate2  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);
        iDays  =  parseInt(Math.abs(oDate1  -  oDate2) / 3600000 / 24);
        return  iDays
    }

    $('.publishForm').on('submit',function(){
        if($("#isDraft").val()=="0"){
            var projName = $('#projName').val();
            var moneyNeeds = $('#moneyNeeds').val();
            var timesNumber = $("#timesNumber").val();
            var applyTime = $("#applyTime").val();
            var startTime   = $("#startTime").val();
            var endTime  = $("#endTime").val();
            var projPicPath  = $("#projPicPath").val();
            var projDesc = CKEDITOR.instances.projDesc.getData();
            /**
             * 我们在这里输出一下projDesc
             */
            console.log("projDesc");
            console.log(projDesc);
            if(!projName){
                alert('请输入项目标题！');
                return false;
            }else if(!applyTime){
                alert('请选择项目申请截止日期！');
                return false;
            }else if(!startTime){
                alert('请选择项目开始日期！');
                return false;
            }else if(!endTime){
                alert('请选择项目截止日期！');
                return false;
            }else if(!moneyNeeds){
                alert('请输入价格！');
                return false;
            }else if(!timesNumber){
                alert('请输入场次！');
                return false;
            }else if(!projDesc){
                alert('请输入内容！');
                return false;
            }else if(!projPicPath){
                alert('请选择主题图片！');
                return false;
            }
        }

    });
</script>
</body>

</html>
