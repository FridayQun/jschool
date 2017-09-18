<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.chengan.business.util.Constant"%>
<% request.setAttribute("NORMAL_HEAD_ICON_URL", Constant.NORMAL_HEAD_ICON_URL); %>
<% request.setAttribute("GIRL_HEAD_ICON_URL", Constant.GIRL_HEAD_ICON_URL); %>
<% request.setAttribute("BOY_HEAD_ICON_URL", Constant.BOY_HEAD_ICON_URL); %>
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
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/headline.css">
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
    <script>
        var ctx = '${ctx}';
        var login_userId = <%=session.getAttribute("login_userId") %>
    </script>
    <style>
    </style>
</head>

<body>
<script>
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
    };

    var _search = location.search.substring(1);
    _search = _search.split('&');
    var search = {};
    for(var i=0; i<_search.length; i++) {
        var t = _search[i].split('=');
        search[t[0]] = t[1];
    }
    var session = {};
    session.title = decodeURIComponent(search['title']);
    session.source = decodeURIComponent(search['source']);
    session.cateName = decodeURIComponent(search['cateName']);
    session.content = window.opener?window.opener.CKEDITOR.instances.content.getData():'';
</script>
<!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>

<!-- 要用到的数据 -->
<input type="hidden" id="currentNewsId" value="-1">
<input type="hidden" id="hasCollect" value="0">
<input type="hidden" id="hasAdmire" value="0">

<div class="headline-section">
    <div class="wrapper">
        <div class="headline-details">
            <div class="details-body">
                <div class="content">
                    <div class="details-header">
                        <h3><script>document.write(session.title);</script></h3>
                        <p>来源：<script>document.write(session.source);</script></p>
                        <div class="header-share-box">
                            <div style="visibility: hidden;" class="bshare-custom icon-medium">
                                <div class="bsPromo bsPromo2"></div>
                                <a title="分享到微信" class="bshare-weixin" href="#"></a>
                                <a title="分享到QQ空间" class="bshare-qzone" href="#"></a>
                                <a title="分享到新浪微博" class="bshare-sinaminiblog" href="#"></a>
                                <a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
                            </div>
                            <p><small>发布时间：<script>document.write(new Date().Format('yyyy-MM-dd'));</script></small></p>
                        </div>
                    </div>
                    <div class="main-box">
                        <p>
                            <script>
                                document.write(session.content);
                            </script>
                        </p>
                        <!--               <p><img src="${ctx}/resources/artcle/images/headline-photo.png" alt=""></p> -->
                    </div>
                    <div class="details-footer">
                        <a href="javascript:;" class="tools-btn like-icon"></a>
                        <!--               <a href="#" class="tools-btn comment-icon"></a> -->
                        <a href="#" class="tools-btn favorites-icon"></a>
                    </div>
                    <div class="comment-box">
                        <div class="input-comment-box">
                            <div class="user-avatar"><img src="${ctx}/resources/artcle/images/guest-avatar.png" alt=""></div>
                            <div class="input-box">
                                <div class="message-textarea">
                                    <div class="textareaMessage" contenteditable="true" >我有话说.....</div>
                                    <div class="message-tools-bar">
                                        <div id="smilies-btn" class="smilies-btn"></div>
                                    </div>
                                </div>
                                <div class="submit-message-bar"><button style="cursor: pointer;" type="button">发 布</button></div>
                            </div>
                        </div>
                        <div class="comments-list-box">
                            <div class="comments-title">最新评论</div>
                            <div class="empty-comments">还未有评论！</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="details-sidebar">
                <div class="author-info">
                    <div class="author-il">
                        <div class="author-avatar"><a href="javascript:;" onclick="checkLogin()"><img src="${(fn:startsWith(jkUser.headPicPath,NORMAL_HEAD_ICON_URL)||jkUser.headPicPath==null)?(jkUser.gender==2?GIRL_HEAD_ICON_URL:BOY_HEAD_ICON_URL):jkUser.headPicPath}" alt=""></a></div>
                    </div>
                    <div class="author-ir">
                        <h3 style="font-weight: normal;">${jkUser.nickname}<i class="icon ${jkUser.gender==2?'gender-girl':'gender-boy' }"></i><span style="margin-left: 10px;"><i class="icon influence"></i>${jkUser.influence }</span></h3>
                        <div class="author-other-info">
                            <div class="works-count">地区：${jkUser.location }</div>
                            <c:if test="${jkUser.idType==0}"><div class="pviews">学校：${JkUserInfo.eduName }</div></c:if>
                            <c:if test="${jkUser.idType==1}"><div class="pviews">公司：${JkUserInfo.companyName }</div></c:if>
                            <div style="display: inline-block;width: 74px;line-height: 1.8em;border-radius: 0.2em;text-align: center;margin: 10px 20px 0 20px;cursor: pointer;color: #fff;box-shadow: 0px 1px 2px rgba(0,0,0,0.3);background: #fa7d3c;background: -webkit-linear-gradient(top, #fa7d3c 0%,#f55f10 100%);background: linear-gradient(top bottom, #fa7d3c 0%,#f55f10 100%);border: 1px solid #fa7d3c;" class="send-message">私信</div>
                        </div>
                    </div>
                </div>
                <c:forEach var="newsAd" items="${newsAds}" >
                    <div class="details-sidebar-ad"><a href="${newsAd.url}"><img src="${newsAd.image}" alt=""></a></div>
                </c:forEach>
                <div class="details-hot-list">
                    <div class="hot-title">热门资讯</div>
                    <ul>
                        <c:forEach var="news" items="${newsList}"  varStatus="status" begin='0' end='10'>
                            <li><a href="${ctx}/login/toNewsDetails?id=${news.id}"><i>${ status.index+1}</i>${news.title }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--动态包含-->
<jsp:include page="foot.jsp" flush="true"/>

<script src="${ctx}/resources/artcle/js/jquery.min.js"></script><script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
<script>
    function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
    var alert = window.new_alert || alert;
    $(function() {
        var $smsBox = $(".sms-box");
        var hasCollect = $("#hasCollect").val();
        var hasAdmire = $("#hasAdmire").val();
        var currentNewsId = $("#currentNewsId").val();
        var login_userId = '<%=session.getAttribute("login_userId")%>';

        $('body').on('click', '.contact-link',
            function() {
                if (login_userId == 'null') {
                    $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后私信", ConfirmFun: function(){
                        window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
                    } });
                    return false;
                } else if (login_userId == $(this).find("input").val()) {
                    alert('这是您自己的项目！');
                    return false;
                }
                toId = $(this).find("input").val();
                $smsBox.removeClass('hide');
                return false;
            });
        $smsBox.on('click',
            function(e) {
                if (e.target === $smsBox[0]) {
                    $smsBox.addClass('hide');
                }
            });

        var $commentsList = $('.comments-list');
        var $messageArea = $('.message-textarea .textareaMessage');
        function getNow() {
            var date = new Date();
            return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate()) + ' ' + (date.getHours()) + ':' + (date.getMinutes());
        }
        function escapeHtml(string) {
            var entityMap = {
                "&": "&amp;",
                "<": "&lt;",
                ">": "&gt;",
                '"': '&quot;',
                "'": '&#39;',
                "/": '&#x2F;'
            };
            return String(string).replace(/[&<>"'\/]/g, function (s) {
                return entityMap[s];
            });
        }
    });

    function checkLogin() {
        var login_userId = <%=session.getAttribute("login_userId") %>
        if(login_userId === null) {
            $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后查看", ConfirmFun: function(){
                window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
            } });
            return ;
        } else {
            window.open("${ctx}/login/toOtherUser?userid=${jkUser.id}", "_self");
        }
    }

    function format(args) {
        var res = this;
        if(arguments.length == 1 && typeof(args) != 'string') {
            for(var key in args) {
                // if(args[key] == undefined) continue;
                var reg = new RegExp("({)"+key+"(})", "g");
                if(args[key]!=undefined && args[key]!=null)
                    res = res.replace(reg, args[key]);
                else
                    res = res.replace(reg, '');
            }
        } else {
            for(var i=0; i<arguments.length; i++) {
                // if(arguments[i] == undefined) continue;
                var reg = new RegExp("({)"+i+"(})", "g");
                if(arguments[key]!=undefined && arguments[key]!=null)
                    res = res.replace(reg, arguments[i]);
                else
                    res = res.replace(reg, '');
            }
        }
        return res;
    }
    function getDate(time) {
        var date = new Date(time);
        var year = date.getFullYear();
        var month = '0'+(date.getMonth()+1);
        month = month.substr(-2);
        var day = '0'+date.getDate();
        day = day.substr(-2);
        return year+month+day;
    }
</script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
</body>

</html>
