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
<%@ include file="/common/header.jsp" %>

<!-- ##########主体########## -->
<div class="container">
	<div id="cont">
<!-- 			<div class="cn1"> -->
<!-- 				<div class="news"> -->
<!-- 					<div class="title"> -->
<!-- 						<h2> -->
<!-- 							<img src="/images/title_1.png" width="278" height="67" alt="校园资讯"> -->
<!-- 						</h2> -->
<!-- 					</div>title end -->
<!-- 					<div class="listcont"> -->
<!-- 						<dl> -->
<%-- 							<c:forEach items="${xyzx }" var="obj"> --%>
<!-- 								<dd> -->
<!-- 									<span> -->
<%-- 										<fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd"/> --%>
<!-- 									</span> -->
<%-- 									<a href="/zszx/view/${obj.id }" target="_blank" title="${obj.title }"> --%>
<%-- 										${obj.title } --%>
<!-- 									</a> -->
<!-- 								</dd> -->
<%-- 							</c:forEach> --%>
<!-- 							<dd> -->
<!-- 								<a style="display: block;float: right;color: #0033CC;margin-top: 20px;" href="/zszx/xyzx" target="_blank">点击查看更多&gt;&gt;</a> -->
<!-- 							</dd> -->
<!-- 						</dl> -->
<!-- 					</div>listcont end -->
					
<!-- 				</div>left end -->
<!-- 				<div class="principal"> -->
<!-- 					<div class="title"> -->
<!-- 						<img src="/images/title_1_1.png" width="136" height="48" alt="校长寄语"> -->
<!-- 					</div> -->
<!-- 					<div class="text"> -->
<!-- 						<img src="/images/cn1_2.png" width="90" height="93" alt="校长"> -->
<%-- 						<b>校长：</b>${xzjy.content }</i> --%>
<!-- 					</div> -->
<!-- 				</div>principal end -->
				
<!-- 			</div> -->
			<div class="cn1">
				<div class="life">
					<div class="title">
						<img class="lazy" src="/images/title_4.png" data-original="/templets/default/images/student/title_4.png" width="278" height="67" alt="学员风采" style="display: inline;">
						<p>
							<b><font color="#ff0000">欢迎您加入合肥锐衡教育大家庭！</font></b>
						</p>
						<p>
							不用担心来到陌生的城市会手足无措，不用担心来校后会感觉孤单。这是个来自天南海北学员组成的大家庭，这里有Party、有欢笑、有丰富的实践活动，这里是你开阔眼界、广交朋友，迈向时尚殿堂的第一个台阶。
						</p>
						<a class="more" href="/xyfc/list" target="_blank">点击查看更多&gt;&gt;</a>
					</div><!--title end-->
					<div class="listimg">
						<ul>
							<c:forEach items="${xyfczs }" var="obj" varStatus="status">
								<li class="<c:if test="${((status.index + 1) % 4) eq 0 }">pr0</c:if>">
									<a href="/xyfc/${obj.id }" title="${obj.title }" target="_blank">
										<img class="lazy" src="${obj.pic }" width="170" height="115" style="display: block;">
										<p>${obj.title }</p>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div><!--listimg end-->
				</div><!--life end-->
				
				<div class="life">
					<div class="title">
						<img class="lazy" src="/images/title_5.png" data-original="/images/title_5.png" width="278" height="67" alt="学生作品" style="display: inline;">
						<p>
							永远都不要停止学习的步伐，即使你有万般理由，磨石都会伴你在平凡的人生里活出更多精彩。
						</p>
						<a class="more" href="/xszpz/list">点击查看更多&gt;&gt;</a>
					</div><!--title end-->
					<div class="listimg">
						<ul>
							<c:forEach items="${xszpz }" var="obj" varStatus="status">
								<li class="<c:if test="${((status.index + 1) % 4) eq 0 }">pr0</c:if>">
									<a href="/xyfc/${obj.id }" title="${obj.title }">
										<img class="lazy" src="${obj.pic }" data-original="${obj.pic }" width="170" height="115" style="display: block;">
										<p>${obj.title }</p>
									</a>
								</li>
							</c:forEach>
						</ul>
					</div><!--listimg end-->
				</div><!--life end-->
			</div><!--cn1 end-->
		</div>
</div>
<!-- ##########主体（end）########## -->

<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>
</body>
</html>
