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
 
 <jsp:include page="head.jsp" flush="true"/>
  <div class="user-section">
    <div class="wrapper">
    
      <c:choose>
       <c:when test="${not empty jkuser.backgroundPicture}">
    	  <div class="user-base-info" style="background-image:url(${jkuser.backgroundPicture})">
        </c:when>
         <c:otherwise>
      	   <div class="user-base-info" style="background-image:url(${ctx}/resources/artcle/images/user-bg.jpg)">
       </c:otherwise>
      </c:choose>
        <div class="info-inner">
          <c:if test="${empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${ctx}/resources/artcle/images/default.png" alt=""></div>
         </c:if>
         <c:if test="${not empty jkuser.headPicPath}">
          		<div class="user-head"><img src="${jkuser.headPicPath}" alt=""><input type="file"></div>
         </c:if>
          <p class="user-name">${jkuser.nickname} 
          <c:if test="${jkuser.gender==1}">
          	 <c:out value="<i class='sex-icon male'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${jkuser.gender==2}">
          	 <c:out value="<i class='sex-icon female'></i></p>" escapeXml="false"/>
          </c:if>
          <c:if test="${empty jkuser.gender}">
          </c:if>
          </p>
          <p class="user-addr">${jkuser.location}</p>
          <p>${jkuser.slogan}</p>
        </div>
      </div>
      <div class="user-nav">
        <div class="nav-col">
          <div class="col-inner"><a  href="${ctx}/login/toUser?nav=0"><span>我的发布</span><br><span class="grey-font">${totalofproject}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/login/toUser?nav=1"><span>我的头条</span><br><span class="grey-font">${totalofnews}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/login/toUser?nav=2"><span>我的申请</span><br><span class="grey-font">${appcount}</span></a></div>
        </div>
        <div class="nav-col">
          <div class="col-inner"><a href="${ctx}/user/getUserCollect"><span>我的收藏</span><br><span class="grey-font">${collectioncount}</span></a></div>
        </div>
      </div>
      <div class="user-body">
        <div class="sidebar">
          <div class="user-tags">
            <div class="tags-bar">
              <div class="col"><span>影响力 </span><span class="weight">${jkuser.influence}</span><span class="separate">|</span></div>
                    <c:forEach var="item" items="${taglist}" varStatus="status">
              		<span class="tags-item"> 
              		${item.tagName}
              		</span>
              	
              </c:forEach>
            </div>
             <div class="modify-link"><a href="<%=request.getContextPath()%>/user/moduserinfo">编辑个人信息</a></div>
          </div>
          <div class="other-box">
             <div class="manage-nav-box">
              <p>账号管理</p>
              <p><a href="${ctx}/user/toSecurity">账号安全</a></p>
              <p><a href="${ctx}/user/toAuthentication">认证管理</a></p>
              <p><a class="active" href="${ctx}/user/toMyProject?id=${jkuser.id}">项目管理${uid}</a></p>
              <p><a href="${ctx}/user/toMyNews?id=${jkuser.id}">头条管理</a></p>
            </div>
          </div>
        </div>
        <div class="main-box">
          <div class="user-publish-box">
            <h3 class="user-publish-title">我发布的项目</h3>
            <div class="list-tool-bar">
              <div class="filter-block">
                <select id="status-filter"  class="status"       name="">
                
                  <option value="-2">全部状态</option>
                   <option value="-3">草稿箱</option>
                  <option value="-1">关闭</option>
                  <option value="0">未审核</option>
                  <option value="1">审核通过</option>
                  <option value="2">审核不通过</option>
                  <option value="3">申请中</option>
                  <option value="4">达成合作</option>
                </select>
                <select id="mode-filter" class="status" name="">
                  <option value="">全部</option>
                  <c:forEach var="item" items="${catelist}" varStatus="status">
                  		  <option value="${item.id}">${item.cateName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="search-block">
                <form action="#" method="get">
                  <input type="search" name="keywords" value="" placeholder="输入项目关键词进行搜索">
                  <input type="submit" name="submint" value="">
                </form>
              </div>
            </div>
            <div class="released-list-box">
            <ul>
            </ul>
             <div class="load-more"><a href="#">查看更多</a></div>
            </div>
          </div>
        </div>
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
  
  
    $(function() {
    	
        function fotmatter(data) {
            var date = new Date(data);
            return date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + (date.getDate());
          }
        
        function delstatus(status) {
        	if(status==-3){
              	return "草稿箱"; 
              }
        	 if(status==-2){
              	return "全部";
              }
        	 if(status==-1){
             	return "关闭";
             }
            if(status==0){
            	return "未审核";
            }
            if(status==1){
            	return "审核通过";
            }
            if(status==2){
            	return "审核不通过";
            }
            if(status==3){
            	return "申请中";
            }
            if(status==4){
            	return "达成合作";
            }
          }
    	
    	
    	var page=1;
    	var pageSize=10;
    	var uid=$('#uid').val();
      //加载表格
      $.ajax({
	              type: "GET",
	              url: url+"/project/getProjectList",
	              data: {
	            	  uid:uid,
	            	  status:-2,
	            	  page:page,
	            	  pageSize:pageSize
	              },
	              aysnc:true,
	              dataType: "json",
	              success: function(data){
	            	  console.log(data);
	            	 	renderList(data.newsList, 1);
	            	 	autoShow();
	              }
	          }); 

     function istop(istop,id,status){
    	 if(status==-3){
    		 return "";
    	 }
    	 if(istop==0&&(status==1||status==3||status==4)){
    		return  '<a class="set-top" data-id="'+id+'" href="#">置顶</a>';
    	 }else{
    		return ""
    	 }
     }
     
    function isShutDown(s,id){
    	
    	if(s==-3){
    		return '<a href="${ctx}/login/toPublish?pid='+id+'"  data-id="'+id+'" class="mod">编辑</a>';
    	}
    	if(s==-1){
    		return '<a href="#" data-status="'+s+'" data-id="'+id+'" class="shutDown off">取消关闭</a>';
    	}else if(s==1||s==3||s==4){
    		return '<a href="#" data-status="'+s+'" data-id="'+id+'" class="shutDown ">关闭</a>';
    	}
    	return "";
    }
    
   function isrefresh(id,status){
    	
    	if(status==-3){
    		return " ";
    	}
    	if(status==1||status==3||status==4){
    		 return '<a class="refresh" id="refresh" data-s="'+status+'" data-id="'+id+'" href="#">刷新</a>';
    	}
    	return "";
    }
   
   
   	function delprojtype(value){
   		if(value==1){
   			return "供给";
   		}else if(value==0){
   			return "赞助";
   		}else if(value==''||value==null){
   			return "";
   		}
   		
   	}
      //渲染列表
      function renderList(data,mode){
    	
         var $releasedList = $('.released-list-box ul');
         var nodes = data.map(function(item,index){
         var t1 = new Date(item.createTime).Format("yyyy-MM-dd hh:mm:ss");
         var t2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
           var moneyNeeds = '';
           if(item.moneyNeeds!=undefined) moneyNeeds = item.moneyNeeds;
           return ('<li><div class="released-datetime">'+fotmatter(item.createTime).substr(5)+'</div>\
              <div class="cf"><div class="col c1"><div class="col-inner">\
              <div class="project-photo"><img src="'+item.projPicPath+'" alt=""></div>\
              </div></div><div class="col c2"><div class="col-inner">\
              <h3><span>'+item.cateName+'</span><span>'+item.projName+'</span><span class="mark-label">'+delprojtype(item.projType)+'</span></h3>\
              <p><span><i class="icon figure"></i>'+item.username+'</span><span><i class="icon eye"></i>'+item.browsevolume+'人浏览/'+item.applycount+'人申请</span>\
              <span><i class="icon clock"></i>'+getDays(t1,t2)+'天前'+'</span><span>'+delstatus(item.status)+'</span></p><p><span class="orange-font">￥'+moneyNeeds+'</span></p>\
              </div></div><div class="col c3"><div class="col-inner">'+isShutDown(item.status,item.id)+'<a class="browse-link" href="${ctx}/login/toProjectDetail?id='+item.id+'">查看</a>'+isrefresh(item.id,item.status)+'\
             '+istop(item.istop,item.id,item.status)+'</div></div></div>'+(data[index+1] ? ((fotmatter(item.createTime).split('-')[1] != fotmatter(data[index+1].createTime).split('-')[1]) ?
                '<div class="datetime-separate"><span>'+fotmatter(item.createTime).split('-')[0]+'</span> <span class="dsdot"></span> <span>'+fotmatter(item.createTime).split('-')[1]+'月</span></div>' : ''
              ) :'')+'</li>'
           )
         });
         mode && $releasedList.empty();
         $releasedList.append(nodes.join('')); 
      }
      
      $('.released-list-box ul').on('click','.set-top',function(){
    	  var id = $(this).data('id');
    	  var $self = $(this);
    	  var stauts=$(this).parents('li').find('.col-inner p span').eq(3).text();
    	  if(stauts=="未审核"){
    		 alert("未审核");
    		 return  false;
    	 }
    	 if(stauts=="审核不通过"){
    		 alert("审核不通过");
    		 return  false;
    	 }
    	  
    	  $self.addClass('hide');
    	  $.ajax({
	            type: "GET",
	            url: url+"/project/topProject",
	            data: {
	          	  id:id,
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	            	
	            	if(data==1){
	          	  		$self.addClass('hide');
	          	 		 autoShow();
	            	}
	            	else if(data==0){
	            		 alert("置顶失败")
	            	}else if(data==3){
	            		 alert("积分不够50")
	            	}
	            }
	        });
    	  return false;
      });
     
      //过滤选项
      $('.filter-block select').on('change',function(){
        console.log($(this).val());
       // renderList(listData,1);//第一个为数据（数组类型），第二个为是否是关闭追加模式（布尔类型，不传为追加模式)
      });
      //搜索按钮
      $('.search-block form').on('submit',function(){
    	  page=1;
    	  pageSize=10;
        var keywords = $(this).find('input[name="keywords"]').val();
        console.log(keywords);
        var typestatus=$('#status-filter').val();
        var parentCid=$('#mode-filter').val();
	        $.ajax({
	            type: "GET",
	            url: url+"/project/getProjectList",
	            data: {
	          	  uid:uid,
	          	  status:typestatus,
	          	  parentCid:parentCid,
	          	  projName:keywords,
	          	  page:page,
	          	  pageSize:pageSize
	            },
	            aysnc:true,
	            dataType: "json",
	            success: function(data){
	          	  console.log(data.newsList);
	          	 	renderList(data.newsList, 1);
	          	 	autoShow();
	            }
	        });
        
        return false;
      });
      //加载更多
      $('.load-more a').on('click',function(){
    	  page++;
    	  pageSize=10;
    	  var keywords = $(this).find('input[name="keywords"]').val();
    	  var typestatus=$('#status-filter').val();
          var parentCid=$('#mode-filter').val();
  	        $.ajax({
  	            type: "GET",
  	            url: url+"/project/getProjectList",
  	            data: {
  	          	  uid:uid,
  	          	  status:typestatus,
  	          	  parentCid:parentCid,
  	          	  projName:keywords,
  	          	  page:page,
  	          	  pageSize:pageSize
  	            },
  	            aysnc:true,
  	            dataType: "json",
  	            success: function(data){
  	            	if(data.newsList.length>0){
  	          	 		 renderList(data.newsList, 0);
  	           		 }else{
  	            		alert("没有更过数据");
  	           		 }
  	            }
  	        });
        return false;
      });
	    //修复没数据时，显示问题
		  function autoShow(){
			  var $loadMore = $('.load-more');
			  if($('.released-list-box li').length >=10){
				  $loadMore.removeClass('hide');
			  }else{
				  $loadMore.addClass('hide');
			  }
		  }
	    
		  $('.released-list-box ul').on('click','.shutDown',function(){
			  var id = $(this).data('id');
			  var status=$(this).data('status');
			  if($(this).hasClass('off')){
				 
				  $(this).removeClass('off').text('关闭');
				  
				  //未关闭
				    var stauts=1;
			  }else{
				  if(status==0||status==2){
					  alert("项目要先通过审核");
					  return false;
					  
				  }
				  $(this).addClass('off').text('取消关闭');
				  //关闭中
				  var stauts=-1;
			  }
			  
			  $.ajax({
	  	            type: "POST",
	  	            url: url+"/project/check",
	  	            data: {
	  	            	id:id,
	  	            	status:stauts
	  	            },
	  	            aysnc:true,
	  	            dataType: "json",
	  	            success: function(data){
	  	            }
	  	        });
			  return false;
		  });
		  
		 
		  $('.released-list-box ul').on('click','.refresh',function(){
			  var id = $(this).data('id');
			  $.ajax({
	  	            type: "GET",
	  	            url: url+"/project/RefreshCreatTime",
	  	            data: {
	  	            	id:id,
	  	            },
	  	            aysnc:true,
	  	            dataType: "json",
	  	            success: function(data){
	  	            	if(data.error==0){
	  	            		alert("刷新时间成功");
	  	            	}
	  	            }
	  	        });
			  return false;
		  });
		  
		  //计算天数差的函数，通用  
	      function  getDays(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
	          var  aDate,  oDate1,  oDate2,  iDays;  
	          aDate  =  sDate1.split("-");  
	          oDate1  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);    //转换为12-18-2006格式  
	          aDate  =  sDate2.split("-");  
	          oDate2  =  new  Date(aDate[1]+'-'+aDate[2]+'-'+aDate[0]);  
	          iDays  =  parseInt(Math.abs(oDate1  -  oDate2)/3600000/24);
	          if(iDays==NaN){
	        	  return 0;
	          }
	          return  iDays  
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
	      $('#status-filter').on('change',function(){
		  	  var uid=$('#uid').val();
		  	  var typestatus=$(this).val();
		  	  var  page=1;
		  	  var pageSize=10;
		      var keywords = $(this).find('input[name="keywords"]').val();
		      console.log(keywords);
		      var parentCid=$('#mode-filter').val();
		        $.ajax({
		            type: "GET",
		            url: url+"/project/getProjectList",
		            data: {
		          	  uid:uid,
		          	  status:typestatus,
		          	  parentCid:parentCid,
		          	  projName:keywords,
		          	  page:page,
		          	  pageSize:pageSize
		            },
		            aysnc:true,
		            dataType: "json",
		            success: function(data){
		          	  console.log(data.newsList);
		          	 	renderList(data.newsList, 1);
		          	 	autoShow();
		            }
		        });    
			
		}) ;
	      
	      $('#mode-filter').on('change',function(){
		  	  var uid=$('#uid').val();
		  	  var parentCid=$(this).val();
		  	  var typestatus=$('#status-filter').val();
		  	  var  page=1;
		  	  var pageSize=10;
		      var keywords = $(this).find('input[name="keywords"]').val();
		      console.log(keywords);
		      var parentCid=$('#mode-filter').val();
		        $.ajax({
		            type: "GET",
		            url: url+"/project/getProjectList",
		            data: {
		          	  uid:uid,
		          	  status:typestatus,
		          	  parentCid:parentCid,
		          	  projName:keywords,
		          	  page:page,
		          	  pageSize:pageSize
		            },
		            aysnc:true,
		            dataType: "json",
		            success: function(data){
		          	  console.log(data.newsList);
		          	 	renderList(data.newsList, 1);
		          	 	autoShow();
		            }
		        });    
			
		}) ;
	      
	    
    });
    
	 
  </script>
</body>

</html>
