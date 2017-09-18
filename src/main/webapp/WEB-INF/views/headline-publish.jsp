<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

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
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/headline.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
    <!-- 副文本编辑器 -->
    <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
    <script> var ctx = '${ctx}';</script>
</head>

<body>
<!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>

<div class="headline-section">
    <div class="wrapper">
        <div class="headline-publish">
            <form class="headlinePublishForm" action="${ctx}/artcle/publishNews" method="post">
                <input type="hidden" name="from" value="<% out.print(
        			URLEncoder.encode(
        					URLDecoder.decode(
        							request.getHeader("Referer"), "UTF-8")
        					, "utf-8")
        			); %>" >
                <input type="hidden"  name="newsPicPath"  id="picPath2" value="">
                <div class="form-group">
                    <div class="form-label inline">校园头条分类：</div>
                    <div class="form-input inline">
                        <c:forEach var="item" items="${cates}">
                            <label class="label-btn"><input type="radio" id="${item.id}" name="type" value="${item.id}"><span>${item.cateName}</span></label>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label inline">填写来源：</div>
                    <div class="form-input inline"><input class="w145" type="text" name="source" value=""></div>
                </div>
                <div class="form-group">
                    <div class="form-label inline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型：</div>
                    <div class="form-input inline">
                        <select name="sourceType">
                            <option value="1">原创</option>
                            <option value="2">转载</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label inline">头条标题：</div>
                    <div class="form-input inline"><input maxlength="42" class="w490" type="text" name="title" value="" ></div>
                </div>
                <div class="form-group">
            	<textarea name="content" id="content" rows="10" cols="80">

		        </textarea>
                    <script>
                        // Replace the <textarea id="editor1"> with a CKEditor
                        // instance, using default configuration.
                        CKEDITOR.replace('content', {
                            filebrowserBrowseUrl : '',
                            filebrowserUploadUrl : ctx+'/artcle/upload1',
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
                </div>
                <div class="form-group">
                    <div class="form-label inline">主题图片：</div>
                    <div class="form-input inline">
                        <div class="upload-preview empty"><input type="file" name="picPath1"  id="zhutiPic"  value="" ></div>
                    </div>
                </div>
                <div class="form-group" hidden>
                    <div class="form-label">设置标签：</div>
                    <div class="form-input" id="newsTags">
                    </div>
                </div>
                <div class="form-clause">
                    <p class="publish-form-clause"><span class="myCheckbox"><label><input type="checkbox" name="agree" value="agree"><span></span></label>
              </span>我已经阅读并同意<a href="javascript:window.open('/resources/publishRules.htm', '_blank', 'height=300,width=500,scrollbars=no,location=no')">《鲸客网信息发布规定》</a>
                    </p>
                    <p class="publish-form-submit">
                        <button type="submit" name="submit">立即发布</button>
                        <button id='news-preview' type="button" name="preview" style="
              width: 160px;
              height: 46px;
              outline: none;
              border: 0;
              background-color: #00acec;
              color: #fff;
              border-radius: 0.2em;
              margin: 0 1.5em 0 0;
">预览项目</button>
                        <!--               <button type="button" name="save">保存草稿箱</button> -->
                    </p>
                </div>
            </form>
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
    $(document).ready(function() {
        <c:if test="${cates != null}">
        $('#${cates[0].id}').prop('checked', 'checked');
        </c:if>

        $('#news-preview').on('click', function() {
            var source = $('input[name="source"]').val().trim();
            var title  = $('input[name="title"]').val().trim();
            var cateName = $('input[type=radio][checked=checked]').siblings('span').val();
            window.open('${ctx}/login/toNewsDetails?id=-1'
                +'&title='+title
                +'&source='+source
                +'&cateName='+cateName, '_blank');
        });
    });
    $(function() {
        var $headlineList = $('.headline-list');
        var $uploadPreview = $('.upload-preview');
        function editor() {
            var editor = new wangEditor('describe');
            editor.config.menus = ["undo", "redo", "|", "bold", "underline", "italic", "strikethrough", "eraser", "forecolor", "bgcolor"
                , "|", "quote", "head", "unorderlist", "orderlist", "alignleft", "aligncenter",
                "alignright", "|", "link", "unlink", "table", "|", "img", "|", "source", "fullscreen"
            ];
            editor.config.pasteText = true;
            editor.config.menuFixed = false;
            editor.create();
        }
        function renderList(data){
            if (data && data.length > 0) {
                var nodeList = data.map(function(item,index){
                    return (
                        '<li><a href="'+item.url+'"><div class="headline-item-photo"><div class="inner-box">\
              <div class="photo"><img src="'+item.photo+'" alt=""></div></div></div><div class="headline-item-desc">\
              <div class="inner-box"><h3>'+item.title+'</h3>\
              <p>'+item.subtitle+'</p>\
              <p class="desc-body">'+item.body+'</p>\
              <p class="desc-footer"><span>'+item.author+' '+item.local+'</span>\
              <span>影响力<strong class="red-font">'+item.influence+'</strong></span>\
              <span><i class="icon eye"></i>'+item.views+'人浏览/'+item.count+'人申请</span>\
              <span class="create-time">'+item.datetiem+'</span></p></div></div></a></li>'
                    )
                });
                $headlineList.empty().append(nodeList.join(''));
            }
        };
        //上传图片预览
        $uploadPreview.find('input').on('change', function() {
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
                $("#picPath2").val(result.urlList[0]);
                $uploadPreview.removeClass('empty').css('background-image', 'url(' + result.urlList[0] + ')');
            });

        });
        //标签列表
        $.ajax({
            type: "GET",
            url: ctx+"/tag/getAllTagList",
            data: {},
            aysnc:true,
            dataType: "json",
            success: function(data){
                var tagsList = data.tagsList;
                for(var i in tagsList){
                    $("#newsTags").append('<label class="label-btn"><input type="checkbox" name="tags" value="'+tagsList[i].id+'"><span>'+tagsList[i].tagName+'</span></label>');
                }
            }
        });

        $('.headlinePublishForm').on('submit',function(event){
            var source = $(this).find('input[name="source"]').val().trim();
            var title  = $(this).find('input[name="title"]').val().trim();
            var zhutiPic = $("#zhutiPic").val();
            var data = CKEDITOR.instances.content.getData();
            var agree = $('.myCheckbox input:checked').val();
            if(!source){
                alert("请填写来源！");
                return false;
            }else if(!title){
                alert("请填写头条标题！");
                return false;
            }else if(data ==='' || data===null || data.length <= 10){
                alert("请输入头条内容或输入的内容太少！");
                return false;
            }else if(zhutiPic === '' || zhutiPic === null){
                alert("请上传主题图片！");
                return false;
            }else if(!agree){
                alert("请同意《鲸客网信息发布规定》！");
                return false;
            }
        });
    });
</script>
</body>

</html>
