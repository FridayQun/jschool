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
  <title>我的订阅-鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/user.css">
  <script>
    var ctx = '${ctx}';
  </script>   
</head>

<body>
  <div class="subscribe-box">
    <ul class="news-list">
      <li>
        <a href="#">
          <div class="news-title">情人节：上海大学生倡导情侣支持无烟生活</div>
          <div class="news-thumb">
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
          </div>
          <div class="news-status"><span>中青在线</span><span>刚刚</span></div>
        </a>
      </li>
      <li>
        <a href="#">
          <div class="news-title">超干货！2017出国必备的旅游英语大全</div>
          <div class="news-thumb">
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
          </div>
          <div class="news-status"><span>马蜂窝自由行</span><span>10分钟前</span></div>
        </a>
      </li>
      <li>
        <a href="#">
          <div class="news-title">有种还击叫 你觉得你妈该有辆买菜车了！</div>
          <div class="news-thumb">
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
          </div>
          <div class="news-status"><span>爱卡汽车</span><span>1小时前</span></div>
        </a>
      </li>
      <li>
        <a href="#">
          <div class="news-title">两集飙到9.5，那半分一定要忍到大结局</div>
          <div class="news-thumb">
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
            <div class="thumb-col"><img src="${ctx}/resources/mobile/images/user-new-1.jpg" alt=""></div>
          </div>
          <div class="news-status"><span>马蜂窝自由行</span><span>1.5小时前</span></div>
        </a>
      </li>
    </ul>
    <div class="load-more">点击查看更多</div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      var $newList = $('.news-list');
      //渲染列表
      function renderList(data,empty){
        var nodeList = data.map(function(item,index){
          return( '<li><a href="'+item.url+'">\
          <div class="news-title">'+item.title+'</div>\
          <div class="news-thumb">\
          <div class="thumb-col"><img src="'+item.photo[0]+'" alt=""></div>\
          <div class="thumb-col"><img src="'+item.photo[1]+'" alt=""></div>\
          <div class="thumb-col"><img src="'+item.photo[2]+'" alt=""></div>\
          </div><div class="news-status"><span>'+item.source+'</span><span>'+item.datetime+'</span></div>\
          </a></li>')
        });
        empty ? $newList.empty().append(nodeList.join('')) : $newList.append(nodeList.join(''));
      }
      //点击加载更多
      $('.load-more').on('tap',function(){
        renderList([
          {
            url : 'news-details.html',
            title : '两集飙到9.5，那半分一定要忍到大结局',
            photo : ['${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg'],
            source : '中青在线',
            datetime : '刚刚'
          },
          {
            url : 'news-details.html',
            title : '超干货！2017出国必备的旅游英语大全',
            photo : ['${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg'],
            source : '马蜂窝自由行',
            datetime : '10分钟前'
          },
          {
            url : 'news-details.html',
            title : '有种还击叫 你觉得你妈该有辆买菜车了！',
            photo : ['${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg'],
            source : '爱卡汽车',
            datetime : '1小时前'
          },{
            url : 'news-details.html',
            title : '两集飙到9.5，那半分一定要忍到大结局',
            photo : ['${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg','${ctx}/resources/mobile/images/user-new-1.jpg'],
            source : '中青在线',
            datetime : '刚刚'
          }
        ]);
        return false;
      });
    })
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
