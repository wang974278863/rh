<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
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

<!-- ##########主体########## -->
<div class="container">
	<!-- 固定图片广告 -->
	<%--<div class="row">--%>
		<%--<img class="img-responsive model-img" src="/images/newsCenter.jpg" alt="新闻中心">--%>
	<%--</div>--%>
	
	<!-- 内容 -->
	<div class="row row-3">
		<div class="col-md-9" style="width: 100%;">
			<div class="model-details-title">
			</div>
			<div >
				<div>
					<div class="news_dateil_t"><h3>${obj.title }</h3></div>
					<div class="news_dateil_m">
						<div class="news_size">作者：admin 发布于：<fmt:formatDate value="${obj.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/> 
						</div>
						<div class="news_p" id="description">
							<p>${obj.content }</p>
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
</script>
</body>
</html>
