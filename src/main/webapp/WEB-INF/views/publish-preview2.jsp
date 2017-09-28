<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='fn' uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/publish-preview.css">
    <link rel="stylesheet" href="${ctx}/resources/artcle/css/luara.left.css"><link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
    <script>
        var ctx = '${ctx}';
    </script>
    <style>
        .advice {
            height: 180px;
            border: 1px solid #f4f4f4;
            margin: 4px 0;
        }
        .with-left-supply {
            position: absolute;
            left: 0px;
            top: 0px;
            padding: 40px;
            box-sizing: border-box;
        }
        .with-left-supply:before {
            position: absolute;
            top: 0;
            left: 0px;
            border-left: 70px solid orange;
            border-bottom: 70px solid transparent;
            content: '';
        }
        .with-left-supply:after {
            position: absolute;
            content: '供给';
            top: 10px;
            left: 10px;
            color: white;
        }
        .with-left-demand {
            position: absolute;
            left: 0px;
            top: 0px;
            padding: 40px;
            box-sizing: border-box;
        }
        .with-left-demand:before {
            position: absolute;
            top: 0;
            left: 0px;
            border-left: 70px solid orange;
            border-bottom: 70px solid transparent;
            content: '';
        }
        .with-left-demand:after {
            position: absolute;
            content: '赞助';
            top: 10px;
            left: 10px;
            color: white;
        }
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
    var oDom = window.opener || {document: {getElementById:function(){return '';}}};
    oDom = oDom.document;
    var session = {};
    session.projName = oDom.getElementById('projName').value;
    session.projType = decodeURIComponent(search['projType']);
    session.cateName = decodeURIComponent(search['cateName']);
    session.locaiton = decodeURIComponent(search['location']);
    session.projDesc = window.opener?window.opener.CKEDITOR.instances.projDesc.getData():'';
    session.moneyNeeds = decodeURIComponent(search['moneyNeeds']);
    session.timesNumber = decodeURIComponent(search['timesNumber']);
    session.applyTime = decodeURIComponent(search['applyTime']);
    session.startTime = decodeURIComponent(search['startTime']);
    session.endTime = decodeURIComponent(search['endTime']);
    session.tags = decodeURIComponent(search['tags']).split(',');
</script>
<!--动态包含-->
<jsp:include page="head.jsp" flush="true"/>
<div class="publish-section">
    <div class="wrapper">
        <div class="docs" style="display: flex; border: 0; background: #f4f4f4;">
            <script>
                if(session.projType == 0) {
                    document.write('<span class="tags with-left-demand"></span>');
                } else {
                    document.write('<span class="tags with-left-supply"></span>');
                }
            </script>
            <div style="width: 80%;display: inline-block;padding: 0;box-sizing: border-box;background: white;">
                <div class="publish-preview-box" style="padding: 50px 40px 50px 124px;">
                    <div class="publish-preview-title">
                        <h2 style="text-align: center;">
						<span style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">
							<script>document.write(session.projName);</script>
							<input type="hidden" id="currentProjId" value="-1">
						</span>
                            <!--               <a class="refresh" href="#"><i class="icon refresh-icon"></i>刷新</a> -->
                        </h2>
                        <div class="status-bar">
                            <div class="right-part">
                                <div class="share-tools" style="
/*		 						display: none; */
								top: 2.8em;
								right: 14.6em;
							">
                                    <div class="bshare-custom icon-medium">
                                        <div class="bsPromo bsPromo2"></div>
                                        <!-- 									<a title="分享到微信" class="bshare-weixin" href="#"></a> -->
                                        <!-- 									<a title="分享到QQ空间" class="bshare-qzone" href="#"></a> -->
                                        <!-- 									<a title="分享到新浪微博" class="bshare-sinaminiblog" href="#"></a> -->
                                        <a title="更多平台" class="bshare-more bshare-more-icon" style="width: 22px;height: 22px;margin: 4px 0;padding-left: 0 !important;
                                                background: url(${ctx}/resources/artcle/images/share-link.png) no-repeat 50% 50% / cover;"></a><span class="BSHARE_COUNT bshare-share-count">0</span>
                                    </div>
                                </div>
                                <span style=" line-height: 30px; vertical-align: top;">申请：0</span>
                                <a href="#"  class="favorite-btn"><i class="icon favorite-icon"></i>收藏</a>
                                <%-- 							<a href="#"><i class="icon eye-blue-icon"></i>0</a> --%>
                                <a href="#" class="like-btn"><i class="icon good-blue-icon"></i><span>0</span></a>
                                <!--                 <a href="#"><i class="icon share-blue-icon"></i>123</a> -->
                            </div>
                        </div>
                    </div>
                    <div class="preview-body">
                        <div class="preview-details">
                            <p><strong>项目类型：</strong><script>document.write(session.cateName);</script></p>
                            <p><strong>分类详情：</strong><script>document.write(session.cateName);</script></p>
                            <p>地域：
                                <script>document.write(session.location);</script>
                            </p>
                            <p>明确预算：<script>document.write(session.moneyNeeds);</script></p>
                            <p>场次／数量：<script>document.write(session.timesNumber);</script>次</p>
                            <p>设置申请截止日期：<script>document.write(session.applyTime);</script></p>
                            <p>活动的起止日期：<script>document.write(session.startTime);</script> ——<script>document.write(session.endTime);</script></p>
                            <p>
                                <script>document.write(session.projDesc);</script>
                            </p>
                            <%--           <p><img src="${ctx}/resources/artcle/images/pro-details.jpg" alt=""></p> --%>
                            <p><strong>标签：</strong>
                                <script>
                                    for(var i=0; i<session.tags.length; i++) {
                                        document.write('<span class="tag">'+session.tags[i]+'</span>');
                                    }
                                </script>
                            </p>
                            <p>
                                <strong>附件：</strong>
                            </p>
                        </div>
                    </div>
                    <p>
                        <a class="cooperate-link"  href="javascript:;" onclick="showInfo4()">与TA合作</a>
                    </p>
                </div>
            </div>

            <div class="preview-sidebar" style="visibility: hidden;padding: 0px 10px 10px 10px;display: inline-block;margin: 0;">
                <div class="author-info" style="width: 272px; background: white;">
                    <div class="author-ir" style="float: right; width: 190px; text-align: left;">
                        <h3 style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;font-weight: normal;margin: 0.2em 0;font-size: 14px;">姓名：${projUser.nickname}<c:if test="${projUser.gender==2 }"><i class="icon gender-girl"></i></c:if><c:if test="${projUser.gender!=2 }"><i class="icon gender-boy"></i></c:if><span style=" font-weight: normal; background: gainsboro; padding: 0 6px; border-radius: 5px; line-height: 23px; margin: 0; ">${projUser.influence }</span></h3>
                        <div class="author-other-info">
                            <c:if test="${projUser.idType==0}"><div class="pviews" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">学校/公司：${JkUserInfo.eduName }</div></c:if>
                            <c:if test="${projUser.idType==1}"><div class="pviews" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">学校/公司：${JkUserInfo.companyName }</div></c:if>
                            <div class="works-count" style="    text-overflow: ellipsis;    overflow: hidden;    white-space: nowrap;    width: 90%;">地区：${projUser.location}</div>
                        </div>
                    </div>
                    <div class="author-il" style="width: 62px; margin-left: 10px;">
                        <div class="author-avatar"><a href="${ctx}/login/toOtherUser?userid=${projUser.id}"><c:if test="${projUser.headPicPath != null && fn:startsWith(projUser.headPicPath, NORMAL_HEAD_ICON_URL)==false }"><img src="${projUser.headPicPath}" alt=""></c:if><c:if test="${projUser.headPicPath == null || fn:startsWith(projUser.headPicPath, NORMAL_HEAD_ICON_URL)==true }"><c:if test="${projUser.gender==2 }"><img src="${GIRL_HEAD_ICON_URL}" alt=""></c:if><c:if test="${projUser.gender!=2 }"><img src="${BOY_HEAD_ICON_URL}" alt=""></c:if></c:if></a></div>
                    </div>
                    <div class="author-tools-bar">

                    </div>
                </div>
                <div class="advertising" style="margin-top: 15px;">
                    <!-- <a href="${projectAd.url}"><img src="${projectAd.image}" alt=""></a> -->
                    <ul>
                        <c:if test="${projectAds != null}">
                            <c:forEach var="projectAd" items="${projectAds }">
                                <li><a href="${projectAd.url}"><img style="width: 254px;height: 162px;padding: 9px;background: white;" src="${projectAd.image}" alt="1"/></a></li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${projectAds == null}">
                            <li><a href="#"><img src="" alt="1" /></a></li>
                        </c:if>
                    </ul>
                    <ol>
                        <c:if test="${projectAds != null}">
                            <c:forEach var="projectAd" items="${projectAds }">
                                <li></li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${projectAds == null}">
                            <li></li>
                        </c:if>
                    </ol>
                </div>
                <!-- 项目推荐 -->
                <div class="project-recomment" style="margin: 16px 0 0 0; background-color: #fff; width: 272px;">
                    <div style="
					height: 45px;
					padding: 0 6px;
					line-height: 44px;
					border: 1px solid #f4f4f4;">
                        <a style="
						vertical-align: middle;
						color: black; font-weight: bold;" href="#" >项目推荐</a>
                    </div>
                </div>
                <!-- 项目推荐 END -->
            </div>
        </div>
        <div class="recommend-box" style="visibility: hidden; background: transparent; border: 0; ">
            <div class="recommend-title" style=" text-align: center; background: transparent; border: 0; font-weight: bold; ">猜你喜欢</div>
            <div id="recomment-box" style="overflow: hidden;height: 279px; position: relative;">
                <div class="icon left-arrow prev-btn" style="
					position: absolute;
					top: 110px;
					width: 30px;
					height: 60px;
					left: 0;
					cursor: pointer;
				"></div>
                <div id="recomment-box-wrapper" style="overflow-x: hidden;width: auto;height: 100%;margin: 15px;padding: 0;overflow-y: hidden;">
                    <ul class="recommend-list" style="height: 215px;box-sizing: content-box;white-space: nowrap;padding: 0;margin: 32px; overflow: visible;">
                    </ul>
                </div>
                <div class="icon right-arrow next-btn" style="
					position: absolute;
					top: 110px;
					height: 60px;
					width: 30px;
					right: 0px;
					cursor: pointer;
				"></div>
            </div>
        </div>
    </div>
</div>
<form id="downloadform" action="${ctx}/artcle/download" method="post">
    <input type="hidden" name="url" value="1"/>
    <input type="hidden" name="fileName" value="2"/>
</form>
<!--动态包含-->
<jsp:include page="foot.jsp" flush="true"/>

<script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
<script src="${ctx}/resources/artcle/js/jquery.luara.0.0.1.min.js"></script>
<script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
<script>
    function new_alert(message) {$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: message, ConfirmFun: function(){} });}
    var alert = window.new_alert || alert;
    $(function() { // < !--调用Luara示例-->
        // 轮播
        $(".advertising").luara({
            width: "272",
            height: "180",
            interval: 4500,
            selected: "seleted",
            deriction: "left"
        });

        // 滚动展示建议
        var scrollApp = {
            init : function() {
                //校园达人切换
                this.carousel({
                    el: $('#recomment-box-wrapper'),
                    next: $('#recomment-box .next-btn'),
                    prev: $('#recomment-box .prev-btn')
                });
            },
            carousel : function (args) {
                var $container = args.el;
                var $next = args.next;
                var $prev = args.prev;
                var $ul = $container.find('ul');
                var $li = $container.find('li');
                var liSize = $li.length;
                var liWidth = $li.outerWidth(true);
                var flag = true;
                $ul.width(liSize * liWidth);
                $next.on("click", function() {
                    $ul.stop(true).animate({
                        marginLeft: '-' + (liWidth) + 'px'
                    }, function() {
                        $ul.append($container.find('li:first-child'));
                        $(this).css('margin-left', 0);
                    });
                });
                $prev.on("click", function() {
                    if(flag) {
                        flag = false;
                        $ul.css('margin-left', '-' + liWidth + 'px').prepend($container.find('li:last-child'));
                        $ul.stop().animate({
                            marginLeft: '0px'
                        },function(){
                            flag = true;
                        });
                    }
                });
            }
        };
        scrollApp.init();
    });

    $(function() {
        var hasCollect = 0;
        var hasAdmire = 0;
        var hasAdmires = 0;
        var currentProjId = -1;
        var login_userId = '<%=session.getAttribute("login_userId")%>';
        if (hasCollect == '1') {
            $('.status-bar a.favorite-btn').addClass('bright');
        }
        if (hasAdmire == '1') {
            $('.status-bar a.like-btn').addClass('bright');
        }

        //联系Ta
        var $smsBox = $(".sms-box");
        var toId = null;
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
    });

    function showInfo4() {
        var userLevel = '${userLevel}';
        if(!userLevel)
            $.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "提示", Content: "请您登录后合作", ConfirmFun: function(){
                window.open("${ctx}/login/toLogin?from="+encodeURIComponent(decodeURIComponent(location.href)).replace(/%20/g, '+'), "_self");
            } });
        else if(userLevel <= 1) {
            $.DialogBySHF.Confirm({ Width: 350, Height: 200, Title: "提示", Content: "请您完成实名认证申请该项目", ConfirmFun: function(){
                window.open("${ctx}/login/toUser?item=authentication", "_self");
            } , CancelFun: function(){}});
        }
    }

</script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
</body>

</html>
