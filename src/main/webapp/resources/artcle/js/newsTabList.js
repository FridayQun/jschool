/* 代码整理：懒人之家 www.lanrenzhijia.com */
$(document).ready(function(){
$("#news-tab-list span:first").addClass("current");
$("#news-tab-list .tab-bd-con:gt(0)").hide();
$("#news-tab-list>.tab-hd>span").mouseover(function(){//mouseover 改为 click 将变成点击后才显示，mouseover是滑过就显示
	$(this).addClass("current").siblings("span").removeClass("current");
	$("#news-tab-list .tab-bd-con:eq("+$(this).index()+")").show().siblings(".tab-bd-con").hide().addClass("current");
});
/*
$(".section.headlines .list-tweet >li").mouseover(function(){
	$(this).removeClass("drink-me");
	$(this).addClass("eat-me");
	$(".list-tweet >li:first").removeClass("eat-me");
	$(".list-tweet >li:first").addClass("drink-me");
});
$(".section.headlines .list-tweet >li").mouseout(function(){
	$(this).removeClass("eat-me");
	$(this).addClass("drink-me");
	$(".list-tweet >li:first").addClass("eat-me");
	$(".list-tweet >li:first").removeClass("drink-me");
});
$(".section.headlines .list-tweet >li").mouseover(function(){
	$(this).removeClass("drink-me");
	$(this).addClass("eat-me");
});*/
});
/* 代码整理：懒人之家 www.lanrenzhijia.com */
