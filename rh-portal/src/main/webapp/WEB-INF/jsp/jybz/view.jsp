<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
	<link href="/css/public.css" rel="stylesheet">
	<link href="/css/student.css" rel="stylesheet">
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>
<!-- ##########主体########## -->


<div class="container">
	<div id="cont">
			<div class="cn1">
				<div class="news">
					<div class="title">
						<span style="font-size: 25px;color: #CD2626;">
							职业规划指导
						</span>
					</div><!--title end-->
					<div class="listcont">
						<dl>
							<c:forEach items="${zyghzd }" var="obj">
								<dd>
									<span>
										<fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd"/>
									</span>
									<a href="/zszx/view/${obj.id }" target="_blank" title="${obj.title }">
										${obj.title }
									</a>
								</dd>
							</c:forEach>
							<dd>
								<a style="display: block;float: right;color: #0033CC;margin-top: 20px;" href="/zszx/zyghzd" target="_blank">点击查看更多&gt;&gt;</a>
							</dd>
						</dl>
					</div><!--listcont end-->
					
				</div><!--left end-->
			</div>
			<div class="cn1">
				<div class="news">
					<div class="title">
						<span style="font-size: 25px;color: #9400D3;">
							企业招聘
						</span>
					</div><!--title end-->
					<div class="listcont">
						<dl>
							<c:forEach items="${qyzp }" var="obj">
								<dd>
									<span>
										<fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd"/>
									</span>
									<a href="/zszx/view/${obj.id }" target="_blank" title="${obj.title }">
										${obj.title }
									</a>
								</dd>
							</c:forEach>
							<dd>
								<a style="display: block;float: right;color: #0033CC;margin-top: 20px;" href="/zszx/qyzp" target="_blank">点击查看更多&gt;&gt;</a>
							</dd>
						</dl>
					</div><!--listcont end-->
				</div><!--left end-->
			</div>
			<div class="cn1">
				<div class="news">
					<div class="title">
						<span style="font-size: 25px;color: #3A5FCD;">
							学员简历及就业指导
						</span>
					</div><!--title end-->
					<div class="listcont">
						<dl>
							<c:forEach items="${xyjljjyzd }" var="obj">
								<dd>
									<span>
										<fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd"/>
									</span>
									<a href="/zszx/view/${obj.id }" target="_blank" title="${obj.title }">
										${obj.title }
									</a>
								</dd>
							</c:forEach>
							<dd>
								<a style="display: block;float: right;color: #0033CC;margin-top: 20px;" href="/zszx/xyjljjyzd" target="_blank">点击查看更多&gt;&gt;</a>
							</dd>
						</dl>
					</div><!--listcont end-->
				</div><!--left end-->
			</div>
			<div class="cn1">
				<div class="news">
					<div class="title">
						<span style="font-size: 25px;color: #DC143C;">
							成功案例
						</span>
					</div><!--title end-->
					<div class="listcont">
						<dl>
							<c:forEach items="${cgal }" var="obj">
								<dd>
									<span>
										<fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd"/>
									</span>
									<a href="/zszx/view/${obj.id }" target="_blank" title="${obj.title }">
										${obj.title }
									</a>
								</dd>
							</c:forEach>
							<dd>
								<a style="display: block;float: right;color: #0033CC;margin-top: 20px;" href="/zszx/cgal" target="_blank">点击查看更多&gt;&gt;</a>
							</dd>
						</dl>
					</div><!--listcont end-->
				</div><!--left end-->
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
