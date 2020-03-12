<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 <script>
$(function(){
	$('#close_im').bind('click',function(){
		$('#main-im').css("height","0");
		$('#im_main').hide();
		$('#open_im').show();
	});
	$('#open_im').bind('click',function(e){
		$('#main-im').css("height","272");
		$('#im_main').show();
		$(this).hide();
	});
	$('.go-top').bind('click',function(){
		$(window).scrollTop(0);
	});
	$(".weixing-container").bind('mouseenter',function(){
		$('.weixing-show').show();
	})
	$(".weixing-container").bind('mouseleave',function(){        
		$('.weixing-show').hide();
	});
});
</script>
<style type="text/css">
	.nav>li{
		display: inline-block;
	}
	.nav>li.active {
		background-color: #005197;
	}
	.nav>li.active>a:hover {
		background-color: #005197!important;
	}
	.nav>li.active>a {
		color: #fff;
	}
</style>
<!-- 代码部分 begin -->
<div class="main-im">
	<div id="open_im" class="open-im">&nbsp;</div>  
	<div class="im_main" id="im_main">
		<div id="close_im" class="close-im"><a href="javascript:void(0);" title="点击关闭">&nbsp;</a></div>
		<a href="tencent://message/?uin=16653162&Site=合肥锐衡教育&Menu=yes" target="_blank" class="im-qq qq-a" title="在线QQ客服">
			<div class="qq-container"></div>
			<div class="qq-hover-c"><img class="img-qq" src="http://demo.lanrenzhijia.com/2015/service0119/images/qq.png"></div>
			<span> QQ在线咨询</span>
		</a>
		<div class="im-tel">
			<div>微信咨询</div>
			<div class="tel-num">HFQHDQ</div>
			<div>报名咨询热线</div>
			<div class="tel-num">18155193210</div>
		</div>
		<div class="im-footer" style="position:relative">
<!-- 			<div class="weixing-container"> -->
<!-- 				<div class="weixing-show"> -->
<!-- 					<img class="weixing-ma" src="/images/weixin.png"> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="go-top"><a href="javascript:;" title="返回顶部"></a> </div>
			<div style="clear:both"></div>
		</div>
	</div>
</div>
<!-- 顶部 -->

<!-- 公司logo -->
<div class="container title-logo" style="width: 100%; max-width: 1170px; margin: 0 auto 15px auto;">
	<div class="row">
        <div style="text-align:center;">
			<a href="/">
				<img src="${logo[0].pic }" alt="网站logo" width="100%">
			</a>
        </div>
    </div>
</div>

<nav class="navbar" role="navigation">
	<div class="container" style="padding-left: 0px;padding-right: 0px;background-color: #f8f8f8;border-bottom: 3px solid #005197;">
			<ul class="nav" style="width:100%;">
				<li class="<c:if test="${module eq 'index' }">active</c:if> nav-top">
					<a href="/">首页</a>
				</li>

				<li class="<c:if test="${module eq 'jybz' }">active</c:if> dropdown nav-top">
					<a href="/jybz" class="dropdown-toggle on" data-toggle="dropdown">业务范围</a>
				</li>

				<li class="<c:if test="${module eq 'zszx' }">active</c:if> dropdown nav-top">
					<a href="/zszx/kbsj" class="dropdown-toggle on" data-toggle="dropdown">招生在线</a>
					<ul class="dropdown-menu">
						<li><a href="/zszx/kbsj">开班时间及结业典礼</a></li>
					</ul>
				</li>
				
				<li class="<c:if test="${module eq 'xytd' }">active</c:if> nav-top">
					<a href="/xytd">学员天地</a>
				</li>
				

				<li class="<c:if test="${module eq 'kcxy' }">active</c:if> dropdown nav-top">
					<a href="/course/list" class="dropdown-toggle on" data-toggle="dropdown">培训科目</a>
					<ul class="dropdown-menu">
						<li><a href="/course/list">锐衡学堂</a></li>
						<%--<li><a href="/kcxy/xynr">学习内容</a></li>--%>
						<li><a href="/kcxy/zyxz">资源下载</a></li>
					</ul>
				</li>
				
				<li class="<c:if test="${module eq 'aboutsUS' }">active</c:if> nav-top">
					<a href="/aboutsUS">关于锐衡</a>
				</li>
				
			</ul>
	</div>
</nav>
