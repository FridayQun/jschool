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
  <link rel="stylesheet" href="${ctx}/css/style.css">
  <link rel="stylesheet" href="${ctx}/css/modify.css">
  <link rel="stylesheet" href="${ctx}/css/wangEditor.min.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>  
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <div class="modify-section">
    <div class="wrapper">
      <div class="docs">
        <div class="modify-form-box">
          <form class="modifyForm" action="#" method="post">
            <div class="form-group">
              <div class="form-group-label"><strong>项目类型：</strong></div>
              <div class="form-group-content">
                <label class="label-btn"><input type="radio" checked="checked" name="mode" value="赞助"><span>赞助</span></label>
                <label class="label-btn"><input type="radio" name="mode" value="供给"><span>供给</span></label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>明确需求标题和详情：</strong></div>
              <div class="form-group-content"><label><input class="input-style" type="text" name="title" value=""></label></div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>选择类型：</strong></div>
              <div class="form-group-content">
                <label class="label-btn"><input type="radio" checked="checked" name="genre" value="校园赞助"><span>校园赞助</span></label>
                <label class="label-btn"><input type="radio" name="genre" value="校园场地"><span>校园场地</span></label>
                <label class="label-btn"><input type="radio" name="genre" value="线上媒体"><span>线上媒体</span></label>
                <label class="label-btn"><input type="radio" name="genre" value="第三方媒体"><span>第三方媒体</span></label>
                <label class="label-btn"><input type="radio" name="genre" value="技能服务"><span>技能服务</span></label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>选择需要做什么：</strong></div>
              <div class="form-group-content"><label><input class="input-style" type="text" name="" value=""></label></div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>地域：</strong></div>
              <div class="form-group-content region">
                <label class="label-btn"><input type="radio" checked="checked" name="local" value="不限地区"><span>不限地区</span></label>
                <label class="label-btn"><input type="radio" name="local" value="指定地区"><span>指定地区</span></label>
              </div>
              <div class="form-group-content hide">
                <label><select class="myselect" name="province" value="浙江省">
                </select></label>
                <label><select class="myselect" name="city" value="金华市">
                </select></label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>明确预算：</strong></div>
              <div class="form-group-content"><label><input class="input-style" type="text" name="" value=""></label></div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>场次／数量</strong></div>
              <div class="form-group-content">
                <label><input type="text" class="input-style w2" name="amount" value="" placeholder=""></label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>设置申请截止日期：</strong></div>
              <div class="form-group-content">
                <label><input class="input-style w20" data-toggle="datepicker" name="" value="2014-10-10" placeholder="截止日期"></label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>活动的起止日期：</strong></div>
              <div class="form-group-content">
                <label><input class="input-style w20" data-toggle="datepicker" name="" placeholder="活动开始日期" value="2013/10/8"></label>
                <span>-</span>
                <label><input class="input-style w20" data-toggle="datepicker" name="" placeholder="活动截止日期" value="2014/1/1"></label>
              </div>
            </div>
            <div class="form-group describe-input">
              <div class="form-group-content">
                <textarea id="describe">请输入内容...</textarea>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>主题图片：</strong></div>
              <div class="form-group-content">
                <div class="topic-photo">
                  <div class="preview-photo"><img src="${ctx}/images/desc-img.png" alt=""></div>
                  <input type="file" name="uploadPhoto" value="">
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="form-group-label"><strong>标签：</strong></div>
              <div class="form-group-content">
                <label class="label-btn"><input type="checkbox" checked="checked" name="tags" value="开学季"><span>开学季</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="毕业季"><span>毕业季</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="双旦季"><span>双旦季</span></label>
                <label class="label-btn"><input type="checkbox" checked="checked" name="tags" value="女生专区"><span>女生专区</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="大学城"><span>大学城</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="公益活动"><span>公益活动</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="音乐"><span>音乐</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="舞蹈"><span>舞蹈</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="选秀"><span>选秀</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="主题活动"><span>主题活动</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="游戏"><span>游戏</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="运动竞技"><span>运动竞技</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="综合类"><span>综合类</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="地推"><span>地推</span></label>
                <label class="label-btn"><input type="checkbox" name="tags" value="跨校"><span>跨校</span></label>
              </div>
            </div>
            <div class="form-modify-btn-bar">
              <button type="submit" name="submit">确认修改</button>
              <button type="button" name="button">删除项目</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  
  <script src="${ctx}/js/jquery.min.js"></script>
  <script src="${ctx}/js/wangEditor.min.js"></script>
  <script src="${ctx}/js/datepicker.min.js"></script>
  <script src="${ctx}/js/districts.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
  <script>
    $(function() {
      var modifyApp = {
        init: function() {
          this.editor(); //富文本编辑器启用
          this.upload(); //上传预览
          this.datepicker(); //日期选择
          this.regionSelect(); //区域的选择
        },
        editor: function() {
          var editor = new wangEditor('describe');
          editor.config.menus = ["undo", "redo", "|", "bold", "underline", "italic", "strikethrough", "eraser", "forecolor", "bgcolor", "|", "quote", "fontfamily", "fontsize", "head", "unorderlist", "orderlist", "alignleft", "aligncenter",
            "alignright", "|", "link", "unlink", "table", "|", "img", "|", "source", "fullscreen"
          ];
          editor.config.pasteText = true;
          editor.config.menuFixed = false;
          editor.create();
        },
        upload: function() {
          var $uploadPreview = $('.topic-photo');
          $uploadPreview.find('input').on('change', function() {
            var file = $(this)[0].files[0];
            $('.preview-photo img').attr('src',window.URL.createObjectURL(file));
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
          $('[data-toggle="datepicker"]').each(function(index, el) {
            $(this).datepicker({
              language: 'zh-CN',
            });
            $(this).val() && $(this).datepicker('setDate', new Date($(this).val()));
          });
        },
        regionSelect: function() {
          $('.form-group-content').each(function(index,item){
            var $province = $(this).find('select').eq(0);
            var $city = $(this).find('select').eq(1);
            var code = getDistrictCode($city.attr('value'));
            provinceAndCity($province,$city,code.province,code.city);
          });
          $('.region input').on('click', function() {
            var thisVal = $(this).val();
            var $selectBox = $(this).parents('.region').next();
            (thisVal === '指定地区') ? $selectBox.removeClass('hide'): $selectBox.addClass('hide');
          });
        }
      };
      modifyApp.init();
    });
  </script>
</body>

</html>
