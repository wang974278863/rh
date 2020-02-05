<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>    
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
	<link href="/css/public.css" rel="stylesheet">
	<link href="/css/student_list.css" rel="stylesheet">
</head>

<body>
<!-- ##########页首########## -->
<%@ include file="/common/header.jsp" %>

<!-- ##########主体########## -->
<div class="container">
	<div id="cont">
			<div class="right">
				<div class="adr">
					<ul>
						<li>您的位置：</li>
						<li><a href="http://www.ms2010.com" title="返回首页">首页</a></li>
						<li>&nbsp;&gt;&nbsp;</li>
						<li><a href="/xytd">学员天地</a></li>
						<li>&nbsp;&gt;&nbsp;</li>
						<li>学员风采</li>
					</ul>
				</div><!--adr end--->
				<div class="listimg">
					<ul>
						<c:forEach items="${page.result }" var="obj">
							<li class="">
								<a href="/xyfc/${obj.id }" title="电气班第19期" target="_blank">
									<img class="lazy" src="${obj.pic }" data-original="/uploads/allimg/150801/2828-150P1141933119-lp.jpg" style="display: block;" width="170" height="115">
									<p>${obj.title }</p>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div><!--listimg end-->
				${page.html }
			</div><!--right end-->
		</div>


</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
</body>
</html>
