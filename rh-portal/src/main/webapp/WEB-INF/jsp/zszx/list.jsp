<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>

<div class="container">
	<!-- 固定图片广告 -->
	<%--<div class="row">--%>
		<%--<img class="img-responsive model-img" src="/images/newsCenter.jpg" alt="新闻中心">--%>
	<%--</div>--%>
	<%----%>
	<!-- 内容 -->
	<div class="row row-3">
		<div class="col-md-9" style="width: 100%;">
			<div class="model-details-title">
				${category.name }
			</div>
			<div class="model-details">
				<c:forEach items="${page.result }" var="obj">
					<div class="news-model">
						<a href="/zszx/view/${obj.id }"><b>${obj.title }</b></a><span>【<fmt:formatDate value="${obj.updateDate }" pattern="yyyy-MM-dd"/> 】</span>
						<p>
<!-- 						由常州市人民政府主办，新纶科技股份有限公司（以下简称“新纶科技”）、深圳市启赋资本管理有限公司（以下简称“启赋资本”）协办的“2016常州新材料产融高峰论坛暨启赋新纶新材料并购基金启动仪式”于12月9日在常州... -->
						</p>
					</div>
				</c:forEach>
				${page.html }
			</div>
		</div>
	</div>
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
<script>
</script>
</body>
</html>
