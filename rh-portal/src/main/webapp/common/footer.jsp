<%@page import="com.qihang.listener.QHServletContextListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="hp" style="font-size: 12px;color: #333;">
	<a name="weixH"></a>
	<div class="hb center">
		<div class="tw">
			<ul>
				<li>
					<img src="/images/weixin2.png" alt="锐衡教育官方微信" width="140">合肥锐衡教育微信二维码<br>微信号：HFQHDQ
				</li>
				<li>
					<img src="/images/weixin.png" alt="锐衡教育二维码" width="140"> 合肥锐衡教育QQ官方群二维码<br>QQ群号：593221831
				</li>
			</ul>
		</div>
		<!--tw end-->
		<div class="htt">
			<div class="htttitle">
				<b>如何报名付费？</b>
			</div>
			<ul>
				<li><a
					href="/question/119"
					target="_blank">1、报名方式</a></li>
				<li><a
					href="/question/120"
					target="_blank">2、支付宝网银支付</a></li>
				<li><a
					href="/question/121"
					target="_blank">3、学费可以分期付款吗？</a></li>
			</ul>
		</div>
		<div class="htt">
			<div class="htttitle">
				<b>如何签订入学协议？</b>
			</div>
			<ul>
				<li><a
					href="/question/122"
					target="_blank">1、报名须知</a></li>
				<li><a
					href="/question/123"
					target="_blank">2、毕业后拿什么技能证书或文凭？</a></li>
			</ul>
		</div>
		<div class="htt">
			<div class="htttitle">
				<b>如何选择培训班？</b>
			</div>
			<ul>
				<li><a
					href="/question/124"
					target="_blank">1、为什么选择合肥锐衡教育？</a></li>
				<li><a
					href="/question/125"
					target="_blank">2、为什么要区分初、中、高班？</a></li>
				<li><a
					href="/question/126"
					target="_blank">3、合肥锐衡教育的入学要求是什么？</a></li>
			</ul>
		</div>
		<div class="htt">
			<div class="htttitle">
				<b>其他常见问题？</b>
			</div>
			<ul>
				<li>1、<a href="/question/127">合肥锐衡教育教学平台突出的？</a></li>
				<li>2、<a href="/question/128">在学校里到底学习什么？</a></li>
				<li>3、<a href="/question/129">学校教学水平如何？</a></li>
			</ul>
		</div>
	</div>
	<div class="yl center">
	<div class="yltitle">
		<b>友情链接：</b>（<a href="tencent://message/?uin=16653162&Site=合肥锐衡教育&Menu=yes" target="_blank">申请友链</a>）
	</div>
	<ul>
		<li>
			<a href="about:blank" target="_blank">友情链接1</a> 
		</li>
		<li>
			<a href="about:blank" target="_blank">友情链接2</a>
		</li>
		<li>
			<a href="about:blank" target="_blank">友情链接3</a>
	    </li>
	</ul>
</div>
	
	<!--links end-->
	<!--ending-->
	<div class="msend center w980">
		<br> 合肥锐衡教育：合肥区总部 Copyright @ 2020 &nbsp;All rights
		reserved<br> TEL：400-6600-246 EMAIL：mscnedu@163.com<br>
		地址：安徽省合肥市经济技术开发区蓬莱花园小区23栋（安徽建筑大学南区北门西100米）<br><span style="font-weight: bold;font-size:14px; color: #009EE5;">当天游客访问量：<%=QHServletContextListener.totalAccessNum %>  </span><br>
	</div>
</div>
<script>

	/*导航条标题点击事件*/
	$(".dropdown-toggle").click(function(){
		
		if($(this).attr('href')){
			window.location = $(this).attr('href');
		}

	});

	/*广告轮播*/
    $(function () {
        $('#ad-carousel').carousel();
        $('#menu-nav .navbar-collapse a').click(function (e) {
            var href = $(this).attr('href');
            var tabId = $(this).attr('data-tab');
            if ('#' !== href) {
                e.preventDefault();
                $(document).scrollTop($(href).offset().top - 70);
                if (tabId) {
                    $('#feature-tab a[href=#' + tabId + ']').tab('show');
                }
            }
        });
    });


    /*导航条*/
    $(function () {
	    $(".dropdown").mouseover(function () {
	        $(this).addClass("open");
	    });
	    $(".dropdown").mouseleave(function(){
	        $(this).removeClass("open");
	    });
	});

</script>
