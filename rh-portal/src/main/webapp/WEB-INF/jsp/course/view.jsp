<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/child.css" rel="stylesheet">
</head>

<body>
<!-- ##########页首########## -->
<!-- 顶部 -->
<%@ include file="/common/header.jsp" %>
<!-- ##########页首（end）########## -->

<!-- ##########主体########## -->


<div class="container">
		<c:if test="${course.type eq '1' }">
			<div class="mainbox clearfix nrpad" style="float: left;">
				<div class="video-t">
					<h3>${course.title }</h3>
					<div>
						${course.videoUrl }
					</div>
				</div>
				<div class="video-jc">
					<div class="video-jc">
						<h3>
							讲师：<span class="gray" title=""><a >${course.teacher }</a></span>
						</h3>
					</div>
					<h3>课程简介</h3>
					<div class="kcneirong">
						<p>${course.videoIntroduction }</p>
					</div>
				</div>
			</div>
		</c:if>


		<c:if test="${course.type eq '2' }">
			<div class="mainbox clearfix nrpad">
				<div class="video-t">
					<h3>${course.title }</h3>
					<div class="xq_x">
						<span class="xq_name">
							讲师：${course.teacher }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							发布时间：
							<fmt:formatDate value="${course.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
					</div>
				</div>
				<div class="video-jc">
					<div class="kcneirong">
						<p>
							${course.content }
						</p>
					</div>
				</div>
			</div>
		</c:if>
	</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
<script>
</script>
</body>
</html>
