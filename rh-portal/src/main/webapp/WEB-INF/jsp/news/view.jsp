<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/base.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>
<!-- ##########页首（end）########## -->

<!-- ##########主体########## -->
<div class="container">
	<!-- 固定图片广告 -->
	<%--<div class="row">--%>
		<%--<img class="img-responsive model-img" src="/images/newsCenter.jpg" alt="新闻中心">--%>
	<%--</div>--%>
	
	<!-- 内容 -->
	<div class="row row-3">
		<div class="col-md-3">
			<div class="model-title theme">
				新闻详情
			</div>
<!-- 			<div class="model-list"> -->
<!-- 				<ul class="list-group"> -->
<!--                     <li class="list-group-item"> -->
<!-- 						<a href="#">公司要闻</a> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item"> -->
<!-- 						<a href="#">行业新闻</a> -->
<!-- 					</li> -->
<!-- 					<li class="list-group-item"> -->
<!-- 						<a href="#">展会与活动</a> -->
<!-- 					</li> -->
					
<!-- 				</ul> -->
      
<!-- 			</div> -->
		</div>
		<div class="col-md-9">
			<div class="model-details-title">
			</div>
			<div class="news-model">
			<div class="news_dateil">
				<div class="news_dateil_t"><h3>${news.title }</h3></div>
				<div class="news_dateil_m">
				<div class="news_size">作者：${news.creater } 发布于：<fmt:formatDate value="${news.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/> <span class="fontResizer" id="font">浏览次数：${news.views }</span>
				</div>
				<div class="news_p" id="description">
				<p>${news.content }</p>
				</div>
				</div>
				</div>
		</div>
		</div>
	</div>
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>


<script>

    /*导航条*/
    $(function () {
	    $(".dropdown").mouseover(function () {
	    	
	        $(this).addClass("open");
	    });

	    $(".dropdown").mouseleave(function(){

	        $(this).removeClass("open");
	    })
	})

	/*导航条标题点击事件*/
	$(".dropdown-toggle").click(function(){
		
		if($(this).attr('href')){
			window.location = $(this).attr('href');
		}

	});
</script>
</body>
</html>
