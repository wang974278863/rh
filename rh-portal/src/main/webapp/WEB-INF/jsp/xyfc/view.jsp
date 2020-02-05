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
	<div style="text-align: center;margin-top: 20px;">
		${content.content }
	</div>
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
</body>
</html>
