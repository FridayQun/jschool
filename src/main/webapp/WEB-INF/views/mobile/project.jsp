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
  <title>鲸客校园</title>
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/style.css">
  <link rel="stylesheet" href="${ctx}/resources/mobile/css/project.css">
  <script>
    var ctx = '${ctx}';
  </script>  
  <style>
  	select option {
  		color: black;
  	}
  </style>
</head>

<body>
  <input type="hidden" id="initCateId" value="${firstCateId }"/>
  <input type="hidden" id="jkTagId" value="${jkTagId }"/>
  <div class="top-bar">
    <div class="search-bar">
      <form class="searchForm" action="#" method="post" id="keySubmit">
        <input type="search" name="keyWords"  id="keyWords" value="${keywords }" autocomplete="off" placeholder="请输入赞助、活动、学校等关键字">
      </form>
        <c:if test="${user_level==null||user_level==1 }">
	        <a href="#" onclick="showInfo(${user_level})" class="publish-link" style="line-height: 53px;color: white;font-size: 0.7rem;">发布</a>
        </c:if>
        <c:if test="${user_level!=null&&user_level>1 }">
		    <a href="${ctx}/mobile/login/toPublish" class="publish-link" style="line-height: 53px;color:  white;font-size: 0.7rem;">发布</a>
        </c:if>
    </div>
  </div>
  <div class="main-box">
    <div class="filter-tools">
      <div class="filter-bar">
        <div class="filter-opts"><span>筛选</span><i class="arrows"></i></div>
        <div class="filter-opts"><span>排序</span><i class="arrows"></i></div>
      </div>
      <div class="filter-select-list closed">
        <div class="select-row">
          <div class="select-col select-title">类型</div>
          <div class="select-col mode-filter">
            <span class="active">不限</span>
            <span>供给</span>
            <span>赞助</span>
          </div>
        </div>
        <div class="select-row">
          <div class="select-col select-title">地区</div>
          <div class="select-col district">
            <span style="line-height: 2.3em; vertical-align: top;" class="active">不限</span>
            <select name="province"></select>
            <select name="city"></select>
          </div>
        </div>
        <div class="select-row">
          <div class="select-col select-title">分类</div>
          <div class="select-col classify">
            <span style="line-height: 2.3em; vertical-align: top;" class="active">不限</span>
            <select name="classify1">
              <c:forEach var="firstCate" items="${firstCateList}">
	              <option value="${firstCate.id }" data-list="">${firstCate.cateName}</option>              
              </c:forEach>
            </select>
            <select name="classify2">
            	<c:forEach var="secondCate" items="${secondCateList}">
            		<c:if test="${secondCate.parentId==firstCateList[0].id }">
			          	<option value="${secondCate.id }" data-list=""  data-parentId="${secondCate.parentId}" >${secondCate.cateName}</option>              
            		</c:if>
                </c:forEach>
            </select>
            <select name="classify3" hidden>       
              <c:forEach var="secondCate" items="${secondCateList}">
		          <option value="${secondCate.id }" data-list=""  data-parentId="${secondCate.parentId}" >${secondCate.cateName}</option>              
              </c:forEach>
            </select>
          </div>
        </div>
        <div class="select-row">
          <div class="confirm-btn">完 成</div>
        </div>
      </div>
      <div class="filter-sort-list closed">
        <div class="sort-item" data-value="createTime desc">时间</div>
        <div class="sort-item" data-value="moneyNeeds desc">金额</div>
        <div class="sort-item" data-value="applycount desc">申请数</div>
      </div>
    </div>
    <ul class="project-list">
    </ul>
    <div class="load-more">点击查看更多</div>
  </div>
  <div class="tab-bar">
    <div class="tab-item "><a href="${ctx}/mobile/login/toHome"><i class="tab-icon home-icon"></i><span>首页</span></a></div>
    <div class="tab-item active"><a href="${ctx}/mobile/login/toProjectList"><i class="tab-icon project-icon"></i><span>项目</span></a></div>
    <div class="tab-item"><a href="${ctx}/mobile/login/toHeadline"><i class="tab-icon rss-icon"></i><span>资讯</span></a></div>
    <div class="tab-item">
    	<c:if test="${login_userId!=null}">
	    	<a href="${ctx}/mobileuserino/toUserIndex"><i class="tab-icon user-icon"></i><span>我的</span></a>
    	</c:if>
    	<c:if test="${login_userId==null }">
    	<c:if test="${login_openId!=null }">
	    	<a href="${ctx}/mobileuserino/tomonewdphone"><i class="tab-icon user-icon"></i><span>我的</span></a>
	    </c:if>
	    <c:if test="${login_openId==null }">
	    	<a href="${ctx}/mobile/login/toLogin"><i class="tab-icon user-icon"></i><span>我的</span></a>
	    </c:if>
    	</c:if>
    </div>
  </div>
  <script src="${ctx}/resources/mobile/js/jquery.min.js"></script>
  <script src="${ctx}/resources/mobile/js/jquery.mobile-events.min.js"></script>
  <script src="${ctx}/resources/mobile/js/districts.js"></script>
  <script src="${ctx}/resources/mobile/js/moment.js"></script>
  <script src="${ctx}/resources/mobile/js/moment-with-locales.js"></script>
  <script src="${ctx}/resources/mobile/js/common.js"></script>
  <script>
    $(function() {
      var page = 0;
      var pageSize = 10;
      
      //页面初始化条件数据
      var proj_type=null;
      var proj_location=null;
      var proj_cate=null;
      var firstCateId = null;
      var secondCateId = null;
      var orderStr = null;
      if($("#initCateId").val()!=null&&$("#initCateId").val()!='') firstCateId = $("#initCateId").val();
      var keyWords = $("#keyWords").val();
      
      var $filterList = $('.filter-select-list');
      var $projectList = $('.project-list');
	  var $filterSort = $('.filter-sort-list');
	  
	  moment.locale('zh-cn');
	  
	//省市联动
      (function districtSelect(){
        var $province = $('.district select').eq(0);
        var $city = $('.district select').eq(1);
        provinceAndCity($province,$city);
      })();
	
      function showMore(){
    	  if($('.project-list li').length >= 10){
    		  $('.load-more').removeClass('hide');
    	  }else{
    		  $('.load-more').addClass('hide');
    	  }
      }
      //渲染筛选列表
      function renderFilterList(data){
        if(data && data instanceof Array){
          var nodes = data.map(function(item,index){
            return('<li data-mark="'+item.mark+'" data-type="'+item.type+'">'+item.title+'</li>')
          });
          $filterList.empty().append(nodes.join(''));
        }
      }
      //渲染筛选结果
      function renderList(data,empty){
        function setLabel(projType){
          return '<li class="'+((projType === 0) ? 'service' : 'funds')+'">';
// 			return '<li>';
        }
        
        if(data && data instanceof Array){
          var nodeList = data.map(function(item,index){
        	var t1 = new Date(item.createTime).Format("yyyy-MM-dd hh:mm:ss");
          	var t2 = new Date().Format("yyyy-MM-dd hh:mm:ss"); 	  
          	var days = getDays(t1,t2);
        	var nodeStr = '';
        	var applyDays = diffTime(new Date(),new Date(item.applyTime));
        	var projLocation = "不限";
        	if(item.projLocation!=undefined) projLocation = item.projLocation;
//         	if(item.istop!=0)  nodeStr += '<span class="tag">置顶</span>';
            return(setLabel(item.projType)+'<a href="'+ctx+'/mobile/login/toProjectDetail?id='+item.id+'">\
                <div class="item-photo '+'" style="width: 125px;"><img style="width: 125px;" src="'+item.projPicPath+'" alt=""></div>\
                <div class="item-desc"><div class="item-title" style="width: 70%;"><div class="item-title-text" style="width: 90%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">\
                <h3">'+item.projName+'</h3>'+nodeStr+'\
                </div></div><p>\
                <span><i class="icon small-user"></i>'+item.username+'</span>\
                '+(item.gender==2?'<i class="icon gender-girl"></i>':'<i class="icon gender-boy"></i>')+'\
                <span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span>\
                <span><i class="icon clock"></i>'+(moment(item.createTime).fromNow())+'</span><br>\
                <span><i class="icon small-local"></i>'+projLocation+'</span>\
                <span>'+(item.companyName==null?item.eduName:item.companyName)+'</span>\
                </p><p><i class="icon alarm"></i><span>'+applyDays+'</span><span>后截止申请</span><strong class="cost" style=" color: orange; ">￥'+item.moneyNeeds+'</strong>'+(item.istop!=0?'<span class="tag" style="display: inline-block; vertical-align: top; padding: 0 0.3em; margin: 0 0 0 0.5em; background-color: #ff5a00; color: #fff;">置顶</span>':'')+(item.uid==1?'<span class="tag" style="display: inline-block; vertical-align: top; padding: 0 0.3em; margin: 0 0 0 0.5em; background-color: #ff5a00; color: #fff;">自营</span>':'')+'</p></div></a></li>'
            )
          });
          empty ? $projectList.empty().append(nodeList.join('')) : $projectList.append(nodeList.join('')) ;
        }
      }
      
    //计算天数差的函数，通用  
      function  getDays(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
          var  aDate,  oDate1,  oDate2,  iDays;  
          aDate  =  sDate1.split("-");  
          oDate1  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);    //转换为12-18-2006格式  
          aDate  =  sDate2.split("-");  
          oDate2  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);  
          iDays  =  parseInt((Math.abs(oDate1  -  oDate2)/3600000)/24);
          return  iDays  
      }
      //计算两个日期之间差
      function diffTime(startDate,endDate) {  
    	    var diff=endDate.getTime() - startDate.getTime();//时间差的毫秒数    	  
    	    //计算出相差天数  
    	    var days=Math.floor(diff/(24*3600*1000));  
    	    //计算出小时数  
    	    var leave1=diff%(24*3600*1000);    //计算天数后剩余的毫秒数  
    	    var hours=Math.floor(leave1/(3600*1000));  
    	    var returnStr = "已截止";
    	    if(hours>0) {  
    	    	returnStr = "";
    	        returnStr = hours + "小时" + returnStr;  
    	    }  
    	    if(days>0) {  
    	        returnStr = days + "天" + returnStr;  
    	    }  
    	    return returnStr;  
    	}
      //格式化时间
      Date.prototype.Format = function (fmt) { //author: meizz 
    	    var o = {
    	        "M+": this.getMonth()+1, //月份 
    	        "d+": this.getDate(), //日 
    	        "h+": this.getHours(), //小时 
    	        "m+": this.getMinutes(), //分 
    	        "s+": this.getSeconds(), //秒 
    	        "q+": Math.floor((this.getMonth()+3)/3), //季度 
    	        "S": this.getMilliseconds() //毫秒 
    	    };
    	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    	    for (var k in o)
    	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    	    return fmt;
      }
      
      
      //筛选切换
      $('.filter-bar .filter-opts').on('tap',function(){
        var index = $(this).index();
        $(this).toggleClass('active');
        if(index === 0) {
          $filterList.toggleClass('closed');
          $filterSort.addClass('closed');
        } else {
          $filterList.addClass('closed');
          $filterSort.toggleClass('closed');
        }
        return false;
      });

      $filterSort.find('.sort-item').on('tap',function(){
        $(this).addClass('active').siblings().removeClass('active');
        $filterSort.toggleClass('closed');
        orderStr = $(this).data('value');
        $(".project-list").empty();
		page = 0;
  	    init();
        return false;
      });
      //筛选省份选择
      $('.district select').on('change',function() {
        $(this).parents('.district').find('span').removeClass('active');
        $(this).parents('.district').find('select').addClass('active');
      });
      //排序选项
      $('.select-row span').on('tap',function(){
        $(this).addClass('active').siblings().removeClass('active');
        return false;
      });

      $('.classify select').on('change',function(){
    	var $this = $(this);
    	var $classify2 = $("select[name=classify2]");
    	var $secondCate = $("select[name=classify3] option");
    	if(this.name=='classify1') $classify2.empty();
    	$.each($secondCate,function(item){
    		if($(this).attr('data-parentid')==$this.val()){
    			$classify2.append($(this));
    		}
    	});
        $(this).parents('.classify').find('span').removeClass('active');
        $(this).parents('.classify').find('select').addClass('active');
      });

      //筛选的确认按钮
      $('.filter-select-list .confirm-btn').on('tap',function(){
        $filterList.toggleClass('closed');
        var mode = $('.mode-filter span.active').text(); //选中的类型
        var district = null;
        var classify = null;
        if($('.district span.active').length < 1){
          var province = $('.district select').eq(0).find('option:checked').text();
          var city = $('.district select').eq(1).find('option:checked').text();
          district = province +':'+ city;
        } else {
          district = '不限';
        }
        if($('.classify span.active').length < 1){
          var c1 = $('.classify select').eq(0).find('option:checked').text();
          var c2 = $('.classify select').eq(1).find('option:checked').text();
          firstCateId = $("select[name=classify1]").val();
          secondCateId = $("select[name=classify2]").val();
        }else{
          classify = '不限';
          firstCateId = null;
          secondCateId = null;
        }

        if(mode=='赞助') proj_type = 0;
        else if(mode=='供给') proj_type = 1;
        else proj_type = null;
	  	proj_location = district == '不限'?null:district;
	  	$(".project-list").empty();
	  	page = 0;
	  	init();
        return false;
      });
      
      
      
      //点击加载更多
      $('.load-more').on('tap',function(){
    	init();
        return false;
      });   
      //关键字搜索
      $('#keySubmit').on('submit',function(){
    	  keyWords = $("#keyWords").val();
    	  $(".project-list").empty();
		  page = 0;
    	  init();
    	  return false;
      });
      
		//初始化方法
		function init() {
			page = page + 1;
			$.ajax({
				type: "GET",
				url: ctx+"/project/getProjectList",
				data: {"projName":keyWords,"tags":$("#jkTagId").val(),"projType":proj_type,"projLocation":proj_location,"parentCid":firstCateId,"cid":secondCateId,"orderStr":orderStr,"page":page,"pageSize":pageSize},
				dataType: "json",
				success: function(data) {   
					if(data.newsList.length > 0) {
						renderList(data.newsList,false);
						showMore();
					}else{
						$('.load-more').addClass('hide');
					}
				}
			}); 
		}
		init();
      
    })
   	  function showInfo(userLevel){
		  if(userLevel==null)
			  alert("未登录！");
		  else if(userLevel==1)
		  	  alert("未认证，请认证！");
	  }
  </script>
<jsp:include page="wechatShare.jsp" flush="true"></jsp:include>
</body>

</html>
