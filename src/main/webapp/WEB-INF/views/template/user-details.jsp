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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap-theme.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/manage.css">
  <script>var ctx = '${ctx}';</script>
</head>

<body class="manage-box">
  <div class="manage-header clearfix">
    <div class="m-header-left">
      <div class="logo">
        <a href="#"><img src="images/small-logo.png" alt=""></a>
      </div>
      <h4>后台管理系统</h4>
    </div>
    <div class="m-header-right">
      <a href="index.html">退出登录</a>
    </div>
  </div>
  <div class="manage-main clearfix">
    <div class="manage-nav-bar">
      <ul class="nav-list">
        <li class="active">
          <a href="user.html">用户中心</a>
          <ul class="subnav-list">
            <li><a href="user.html?mode=认证用户">认证用户</a></li>
            <li><a href="user.html?mode=非认证用户">非认证用户</a></li>
            <li><a href="user.html?mode=未审核用户">未审核用户</a></li>
            <li><a href="user.html?mode=用户统计">用户统计</a></li>
          </ul>
        </li>
        <li><a href="#">项目管理</a></li>
        <li><a href="#">资讯系统</a></li>
        <li><a href="#">基础数据管理</a></li>
        <li><a href="#">积分商城</a></li>
        <li><a href="#">广告位管理</a></li>
        <li><a href="#">首页导航设置</a></li>
        <li><a href="#">后台权限管理</a></li>
        <li><a href="#">意见反馈</a></li>
        <li><a href="#">意见反馈</a></li>
        <li><a href="#">页脚管理</a></li>
      </ul>
    </div>
    <div class="manage-body">
      <div class="manage-heading">
        <ol class="breadcrumb">
          <li><a href="#">用户中心</a></li>
          <li class="active"><a href="#">个人详情</a></li>
        </ol>
      </div>
      <div class="user-details">
        <div class="user-base-info">
          <div class="user-avatar"><img src="images/user-avatar-1.png" alt=""></div>
          <p><span class="label-title">用户名</span><span>dsdsdsds</span></p>
          <p><span class="label-title">真实姓名</span><span>杜施松</span></p>
          <p><span class="label-title">绑定手机号</span><span>18368088888</span></p>
          <p><span class="label-title">学校/公司</span><span>华东政法大学</span></p>
          <p><span class="label-title">地区</span><span>上海市 普陀区</span></p>
          <p><span class="label-title">学院</span><span>政治学与公共管理学院</span></p>
          <p><span class="label-title">专业</span><span>政治学与行政学</span></p>
          <p><span class="label-title">社团</span><span>漫步协会</span></p>
          <p><span class="label-title">入学时间</span><span>2016-09-08</span></p>
          <p><span class="label-title">个人介绍</span><span>此处为个人介绍文字填充此处为个人介绍文字 填充此处为个人介绍文字填充</span></p>
          <p><span class="label-title">注册日期</span><span>2016-11-11</span></p>
          <p><span class="label-title">是否认证</span><span>是</span></p>
          <p><span class="label-title">标签</span><span>毕业季、音乐、双旦季</span></p>
        </div>
        <div class="user-project">
          <div class="type-select">
            <a class="active" href="#">TA发起的项目</a>
            <a href="#">TA申请的项目</a>
            <a href="#">TA的关注</a>
            <a href="#">TA的订阅</a>
          </div>
          <table class="table table-striped" id="userProjectTable">
            <thead>
              <tr>
                <th>项目名称</th>
                <th>类型</th>
                <th>类别</th>
                <th>发起时间</th>
                <th>申请截止时间</th>
                <th>目前申请数</th>
                <th>状态</th>
                <th>查看详情</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>毕业季场地出租</td>
                <td>供给</td>
                <td>场地</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>8</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>歌唱比赛需要一大批物资</td>
                <td>赞助</td>
                <td>赞助</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>2</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>毕业季场地出租</td>
                <td>供给</td>
                <td>场地</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>8</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>歌唱比赛需要一大批物资</td>
                <td>赞助</td>
                <td>赞助</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>2</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>毕业季场地出租</td>
                <td>供给</td>
                <td>场地</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>8</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>歌唱比赛需要一大批物资</td>
                <td>赞助</td>
                <td>赞助</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>2</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
              <tr>
                <td>毕业季场地出租</td>
                <td>供给</td>
                <td>场地</td>
                <td>2016-11-01</td>
                <td>2016-12-12</td>
                <td>8</td>
                <td>
                  <div class="select-status">
                    <div class="selected-opts">待通过</div>
                    <ul class="opts-list">
                      <li>待通过</li>
                      <li>不通过</li>
                      <li>竞标中</li>
                      <li>已结束</li>
                    </ul>
                  </div>
                </td>
                <td><a href="#">详情</a></td>
              </tr>
            </tbody>
          </table>
          <div class="pagination-bar"><ul class="pagination"></ul></div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/bootstrap-paginator.min.js"></script>
  <script src="js/common.js"></script>
  <script>
    $(function() {
      //渲染表格
      function renderTable(data){
        var $userList = $('#userProjectTable');
        var tableTitle = '<thead><tr><th>项目名称</th><th>类型</th><th>类别</th><th>发起时间</th><th>申请截止时间</th><th>目前申请数</th><th>状态</th><th>查看详情</th></tr></thead><tbody>';
        var tableFooter = '</tbody></table>';
        var nodeList  = $.map(data, function(item){
          return('<tr><td>'+item.title+'</td><td>'+item.mode+'</td><td>'+item.classes+'</td>\
                <td>'+item.startTime+'</td><td>'+item.stopTime+'</td><td>'+item.count+'</td><td>\
                <div class="select-status"><div class="selected-opts">'+item.status+'</div>\
                <ul class="opts-list"><li>待通过</li><li>不通过</li><li>竞标中</li><li>已结束</li></ul>\
                </div></td><td><a href="'+item.url+'">详情</a></td></tr>')
        });
        nodeList = tableTitle + nodeList.join('')+tableFooter;
        $userList.empty().append(nodeList);
      }
      //分类切换
      $('.type-select a').on('click',function(){
        $(this).addClass('active').siblings().removeClass('active');
        console.log($(this).text());
        //模拟渲染列表
        renderTable([
          {
            id   : 1,
            title : '毕业季场地出租',
            mode  : '供给',
            classes : '场地',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 8,
            status    : '待通过',
            url        :''
          },{
            id   : 2,
            title : '歌唱比赛需要一大批物资',
            mode  : '赞助',
            classes : '赞助',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 2,
            status    : '竞标中',
            url        :''
          },{
            id   : 3,
            title : '毕业季场地出租',
            mode  : '供给',
            classes : '场地',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 8,
            status    : '已结束',
            url        :''
          },{
            id   : 4,
            title : '歌唱比赛需要一大批物资',
            mode  : '赞助',
            classes : '赞助',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 2,
            status    : '竞标中',
            url        :''
          },{
            id   : 1,
            title : '毕业季场地出租',
            mode  : '供给',
            classes : '场地',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 8,
            status    : '待通过',
            url        :''
          },{
            id   : 2,
            title : '歌唱比赛需要一大批物资',
            mode  : '赞助',
            classes : '赞助',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 2,
            status    : '竞标中',
            url        :''
          },{
            id   : 3,
            title : '毕业季场地出租',
            mode  : '供给',
            classes : '场地',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 8,
            status    : '已结束',
            url        :''
          },{
            id   : 4,
            title : '歌唱比赛需要一大批物资',
            mode  : '赞助',
            classes : '赞助',
            startTime : '2016-11-01',
            stopTime  : '2016-12-12',
            count     : 2,
            status    : '竞标中',
            url        :''
          }
        ]);
        return false;
      });
      //打开列表状态选择
      $('#userProjectTable').on('click','.select-status .selected-opts',function(){
        var $opts = $(this).parents('.select-status').addClass('active').find('.opts-list li');
        var currText = $(this).text();
        $opts.each(function(index,item){
          ($(item).text() === currText) ? $(item).addClass('selected') : $(item).removeClass('selected');
        });
      });
      //列表状态选择
      $('#userProjectTable').on('click','.select-status .opts-list li',function(){
        $(this).parents('.select-status').removeClass('active').find('.selected-opts').text($(this).text());
        console.log($(this).text());
      });
      //分页
      $('.pagination').bootstrapPaginator({
        currentPage: 4,
        totalPages: 10,
        alignment: 'right',
        bootstrapMajorVersion: 3,
        pageUrl: function(type, page, current) {
          //设置分页链接，即a的href值
          return "http://example.com/list/page/" + page;
        },
        onPageClicked:function(e,originalEvent,type,page){
          originalEvent.preventDefault();
          //选中的页码id
          console.log(page);
        }
      });
    })
  </script>
</body>

</html>
