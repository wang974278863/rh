<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
	<link href="/css/public.css" rel="stylesheet">
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>


<div class="container">
	<div class="boxstyle clearfix">
			<div class="gktit">
				<h3>锐衡学堂</h3>
			</div>
			<ul class="video1 clr">
				<c:forEach items="${page.result }" var="obj">
					<li>
						<a href="/course/${obj.id }" target="_blank" class="pic"><img
							src="${obj.pic }"
							title=""></a>
						<h4>
							<a href="/course/${obj.id }" target="_blank" title="${obj.title }">${obj.title }</a>
						</h4>
						<p>
							<a href="/course/${obj.id }" class="kcgmbtn" target="_blank">立即进入</a>
							讲师： <span class="yew" title=""> <a>${obj.teacher }</a>
							</span>
						</p>
				</li>
				
				
				</c:forEach>
				
			</ul>
		</div>
		${page.html }
	</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
<script>
</script>
</body>
</html>
