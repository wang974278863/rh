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
<!-- ##########页首（end）########## -->

<!-- ##########主体########## -->


<div class="container">
	<!-- 固定图片广告 -->
<!-- 	<div class="row"> -->
<!-- 		<img class="img-responsive model-img" src="/images/gsgk1.jpg" alt="公司概况"> -->
<!-- 	</div> -->
	
	<!-- 内容 -->
	<div class="row row-3">
		<%@ include file="/common/gywm_menu.jsp"%>
		<div class="col-md-9">
			<div style="margin-left: 25px;">
				<c:if test="${module2 eq 'aboutsUS' }">
					${gywm[0].content }
				</c:if>
				<c:if test="${module2 eq 'contactUs' }">
					${lxwm[0].content }
				</c:if>
				<c:if test="${module2 eq 'question' }">
					${obj.content }
				</c:if>
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
