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
<!-- ##########主体########## -->


<div class="container" style="margin-top: 50px;">
	${obj.content }
	
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
<script>
</script>
</body>
</html>
