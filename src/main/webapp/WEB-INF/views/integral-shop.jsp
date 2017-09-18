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
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/integral-shop.css">
  <link rel="stylesheet" href="${ctx}/resources/artcle/css/DialogBySHF.css">
  <script>
  var ctx = '${ctx}';
  </script>  
</head>

<body>
  <!--动态包含-->
  <jsp:include page="head.jsp" flush="true"/>
  
  <div class="integral-shop-banner"></div>
  <hr style="
    margin-bottom: 40px;
    margin-top: 30px;
">
  <div class="integral-shop-section">
    <div class="wrapper">
      <div class="integral-shop-list">
        <ul>
          <c:forEach var="product" items="${productList}" >
	          <li>
	            <div class="gift-photo"><a href="${ctx}/login/toShopDetails?id=${product.id}"><img src="${product.headPic}" alt=""></a></div>
	            <div class="gift-desc">
	              <div class="gift-name">${product.productName }</div>
	              <div class="gift-cost">
	                <small>积分：</small><strong>${product.needScore }</strong>
	                <a href="#"  class="exchange-btn" data-id="${product.id}" data-type="${product.type}">立即兑换</a>
	              </div>
	            </div>
	          </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
  
  <!--动态包含-->
  <jsp:include page="foot.jsp" flush="true"/>
  <!-- 填写的地址信息 -->
  <div id='shipping-address-container' style='display: none;'>
	<jsp:include page="shipping-address.jsp" flush="true"/>
  </div>
  <script src="${ctx}/resources/artcle/js/jquery.min.js"></script>
  <script src="${ctx}/resources/artcle/js/DialogBySHF.js"></script>
    <script>
  	$(".gift-cost a").on("click",function(){
		var id = $(this).data('id');
		var type = $(this).data('type');
		if(type == '1') {
			$.DialogBySHF.Confirm({ Width: 600, Height: 500, Title: "收货信息", Content: '<div id="shipping-address">'+$('#shipping-address-container').html()+'</div>', ConfirmFun: function() {
				var sa = $('#shipping-address');
				var name = sa.find('.name').val();
				var phone = sa.find('.phone').val();
				var code = sa.find('.code').val();
				var province = ChineseDistricts[86][sa.find('.province').val()];
				var city = ChineseDistricts[sa.find('.province').val()][sa.find('.city').val()];
				var county = ChineseDistricts[sa.find('.city').val()][sa.find('.county').val()];
				var detail = sa.find('.detail').val();
				var object = {
					name: name,
					phone: phone,
					code: code,
					province: province,
					city: city,
					county: county,
					detail: detail
				};
				$.ajax({
					type: "POST",
					url: ctx+"/mall/exchange",
					data: {
						"id": id,
						"addOn": JSON.stringify(object)
					},
					dataType: "json",
					success: function(data) {
						if(data.error==0) {
							$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "兑换成功", Content: '您已成功兑换该商品，请您等待工作人员与您联系，保持通讯畅通。', ConfirmFun: function (){} });
							window.loaction.href=ctx+"/login/toScoreMall";            		
						} else if(data.error==1) {
							$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "失败", Content: data.error_mesg, ConfirmFun: function(){} });
						}
					}
				});
			}, CancelFun: function(){} });
		} else {
			$.DialogBySHF.Confirm({
				Width: 350,
				Height: 200,
				Title: "提示信息",
				Content: '您确定使用积分兑换该商品？',
				ConfirmFun: function() {
					$.ajax({
						type: "POST",
						url: ctx+"/mall/exchange",
						data: {"id":id },
						dataType: "json",
						success: function(data){
							if(data.error==0){
								$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "兑换成功", Content: '兑换成功', ConfirmFun: function(){} });
								window.loaction.href=ctx+"/login/toScoreMall";            		
							}
							else if(data.error==1) {
								$.DialogBySHF.Alert({ Width: 350, Height: 200, Title: "失败", Content: data.error_mesg, ConfirmFun: function(){} });
							}
						}
					});
				},
				CancelFun: function() {}
			});
		}
		/*
  		if(window.confirm("确认兑换吗？")){
	  		var id = $(this).data('id');
	  		$.ajax({
	            type: "POST",
	            url: ctx+"/mall/exchange",
	            data: {"id":id },
	            dataType: "json",
	            success: function(data){
	            	if(data.error==0){
	            		alert("兑换成功");
	            		window.loaction.href=ctx+"/login/toScoreMall";            		
	            	}
	            	else if(data.error==1){
	            		alert(data.error_mesg);            		
	            	}
	            }
	        });
  		}
		*/
        return false;  			
  	})
  </script>
</body>

</html>
