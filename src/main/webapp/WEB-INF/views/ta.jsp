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
  <link rel="stylesheet" href="${ctx}/css/user.css">
  <script>
  var ctx = '${ctx}';
  </script>  
</head>

<body>
  <div class="top-bar">
    <div class="wrapper">
      <div class="welcome-hint">鲸客网，一站式校园活动解决专家</div>
      <div class="right-block">
        <div class="login-block logon">
          <a href="index.html">首页</a>
          <span>18368085555</span>
          <span class="separate">|</span>
          <a href="">项目管理</a>
          <a href="" class="sms-hint">消息<span class="dot">2</span></a>
        </div>
        <div class="share-block">
          <a href="" class="wq"><i class="icon wechat"></i>微信</a>
          <a href=""><i class="icon weibo"></i>微博</a>
          <a href="">退出</a>
        </div>
      </div>
    </div>
  </div>
  <div class="header">
    <div class="wrapper">
      <div class="logo">
        <a href=""><img src="${ctx}/images/logo.png" alt=""></a>
      </div>
      <div class="search-bar">
        <form action="#" method="get">
          <input type="search" name="keywords" value="" placeholder="请输入赞助、活动、学校等关键字"><input type="submit" name="submit" value="搜索">
        </form>
        <a href="#">发布需求</a>
      </div>
    </div>
  </div>
  <div class="nav-bar">
    <div class="wrapper">
      <ul class="nav-main-bar">
        <li><a href="">全部分类</a></li>
        <li><a href="">创意大赛</a></li>
        <li><a href="">红人馆</a></li>
        <li><a href="">女生专区</a></li>
        <li><a href="">大学城</a></li>
        <li><a href="">公益活动</a></li>
        <li><a href="">校园头条</a></li>
      </ul>
    </div>
  </div>
  <div class="user-section">
    <div class="wrapper">
      <div class="user-base-info">
        <div class="info-inner">
          <div class="user-head"><img src="${ctx}/images/user-head.png" alt=""></div>
          <p class="user-name">猫小白<i class="sex-icon female"></i></p>
          <p class="user-addr">浙江省 杭州市</p>
          <p>一句话介绍一下自己吧，让别人更了解你</p>
        </div>
      </div>
      <div class="user-nav ta">
        <div class="nav-col">
          <div class="col-inner"><a class="active" href="#"><span>TA的发布</span><br><span class="grey-font">5</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="#"><span>TA的攻略</span><br><span class="grey-font">20</span></a></div>
        </div>
      </div>
      <div class="user-body">
        <div class="sidebar">
          <div class="user-tags">
            <div class="tags-bar">
              <div class="col"><span>影响力 </span><span class="weight">1999</span><span class="separate">|</span></div>
              <div class="col"><span class="tags-item">音乐</span><span class="tags-item">校园赞助</span></div>
            </div>
          </div>
          <div class="user-intro">
            <p>联系方式：18368085555</p>
            <p>学校：华东政法大学</p>
            <p>学院：政治学院与公共管理学院</p>
            <p>社团：漫步协会</p>
            <p>专业：政治学与行政学</p>
            <p>入学时间：08/09/2016</p>
            <p>个人介绍：10071503</p>
            <p>认证状况：</p>
            <p><span class="badge"><img src="${ctx}/images/duanxin.png" alt=""></span><span class="badge"><img src="${ctx}/images/shiming.png" alt=""></span></p>
          </div>
          <div class="other-box">
            <div class="tab-bar">
              <a href="#" class="active">
                <span>TA的关注</span><br><span class="grey-font">70</span></a><a href="#">
                <span>TA的粉丝</span><br><span class="grey-font">20</span></a>
            </div>
            <div class="tab-content">
              <div class="content-group">
                <ul>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-1.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-2.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-3.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-4.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-5.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-6.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-1.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-2.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-3.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                </ul>
              </div>
              <div class="content-group hide">
                <ul>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-5.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-4.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-3.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-2.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-4.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-3.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-2.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-1.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                  <li>
                    <div class="user-avatar"><img src="${ctx}/images/default-avatar-6.png" alt=""></div>
                    <p>王大雷</p>
                  </li>
                </ul>
              </div>
              <div class="toggle-hint"><a href="#">更多<br><i class="icon down-arrows"></i></a></div>
            </div>
          </div>
        </div>
        <div class="main-box">
          <ul class="user-publish-list">
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo capital"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo capital"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo capital"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo capital"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
            <li>
              <div class="list-col c1">
                <div class="col-inner">
                  <div class="project-photo service"><img src="${ctx}/images/Up-photo.jpg" alt=""></div>
                </div>
              </div>
              <div class="list-col c2">
                <div class="col-inner">
                  <p class="title"><span class="orange-font">￥500.00</span><span class="blue-font">上海地区50人教室</span></p>
                  <p class="base-info"> <span><i class="icon figure"></i>张大猫</span><span><i class="icon eye"></i>10人浏览/0人申请</span><span><i class="icon clock"></i>2天前</span></p>
                  <p>131231231231</p>
                  <p class="tags"><span>教室</span><span>上海市不限</span></p>
                </div>
              </div>
              <div class="list-col c3">
                <div class="col-inner"><a href="#">查看</a></div>
              </div>
            </li>
          </ul>
          <div class="paging">
            <a href="#" class="prev">上一页</a>
            <a class="active" href="#">5</a>
            <a href="#">6</a>
            <a href="#">7</a>
            <a>......</a>
            <a href="#">60</a>
            <a href="#" class="next">下一页</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="footer">
    <div class="footer-inner">
      <div class="logo-share">
        <a href="#" class="small-icon"><img src="${ctx}/images/small-logo.png" alt=""></a>
        <a href="#" class="wechat-icon wq"></a>
        <a href="#" class="weibo-icon"></a>
      </div>
      <ul class="footer-link">
        <li><a href=""><span>关于鲸客</span><span>About us</span></a></li>
        <li><a href=""><span>诚聘英才</span><span>recruitment</span></a></li>
        <li><a href=""><span>联系我们</span><span>Contact us</span></a></li>
        <li><a href=""><span>常见问题</span><span>Common problems</span></a></li>
        <li><a href=""><span>新手指导</span><span>guidance</span></a></li>
        <li><a href=""><span>平台规则</span><span>rules</span></a></li>
      </ul>
      <div class="copyright-desc">
        <p>Copyright 2009 -2020上海丰兮信息科技有限公司. All rights reserved</p>
        <p>课程内容版权均归 鲸客网 所有 <a href="">沪ICP备16049082号</a></p>
      </div>
    </div>
  </div>
  <script src="${ctx}/js/jquery.min.js"></script>
  <script>
  $(function() {
    //我的关注和我的粉丝 tab切换
    $('.tab-bar a').on('click',function(){
      $(this).addClass('active').siblings('a').removeClass('active');
      $('.tab-content .content-group').eq($(this).index()).removeClass('hide').siblings('.content-group').addClass('hide');
      return false;
    });
    //我的关注和我的粉丝 展开更多
    $('.tab-content .toggle-hint').on('click',function(){
       $(this).parents('.tab-content').toggleClass('more');
       return false;
    });
  });
  </script>
</body>

</html>
