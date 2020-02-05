<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/js_wzgg.css" rel="stylesheet">
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>
<!-- ##########主体########## -->


<div class="container">
	<div class="right_list fl">
		      
				<ul>
					<c:forEach items="${zyxz }" var="obj">
						<li>
							<div class="fl">
								<img src="${obj.pic }">
							</div>
							<div class="wz">
								<h4 title="${obj.title }">${obj.title }</h4>
								<p></p>
							</div> <a href="${obj.href }" class="btn_jr" target="_blank">立即下载</a> 
						</li> 
					</c:forEach>
				</ul>
			</div>
	
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
<script>
</script>
</body>
</html>
