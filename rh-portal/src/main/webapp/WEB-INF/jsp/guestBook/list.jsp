<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <style type="text/css">
*{
margin:0;padding:0;
-webkit-touch-callout: none; /* prevent callout to copy image, etc when tap to hold */
-webkit-text-size-adjust: none; /* prevent webkit from resizing text to fit */
-webkit-tap-highlight-color: rgba(210,210,210,0.35); /* make transparent link selection, adjust last value opacity 0 to 1.0 */
-webkit-user-select: none; /* prevent copy paste, to allow, change 'none' to 'text' */
}
.lyb{font-family:"微软雅黑";font-size:12px;}
ul,li{list-style:none;}
.ylcon{width:100%;min-width:320px;}
.tit{height:26px;line-height:26px;padding:0px 15px;position:relative;font-size:15px;color:#aaa;border-bottom:1px solid rgba(0, 0, 0, 0.15);}
 
.story{border-bottom:1px dashed #cecece;padding:0 15px 3px;position:relative;}
.story_t{font-size:1.2em;color:rgba(0,0,0,1);padding-top:5px;padding-bottom:2px;}
.story_m{color:rgba(110,110,110,1);line-height:21px;word-break:break-all;word-wrap:break-word;overflow:hidden;font-size:1.2em;padding:2px 0;}
.story_time{color:rgba(154,154,154,1);padding:2px 0;}
.story_hf{background:rgb(245,245,245);font-size:1.2em;border:1px solid rgba(204,204,204,0.2);border-radius:2px;color:rgba(110,110,110,1);padding:4px;margin-bottom:5px;}
.opbtn{position:absolute;top: 0;right: 0;}
</style>  
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
			<div class="model-details-title">
				留言板
			</div>
			<div style="margin-left: 25px;" class="lyb">
				<c:choose>
					<c:when test="${page ne null }">
						<c:forEach items="${page.result}" var="obj">
							<div class="story">
								<div class="opbtn"></div>
								<p class="story_t">
									<c:choose>
										<c:when test="${empty obj.name }">
											匿名网友
										</c:when>
										<c:otherwise>
											${obj.name}
										</c:otherwise>
									</c:choose>
									【留言】
								</p>
								<p class="story_time"><fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
								<p class="story_m">${obj.content }</p>
								<p class="story_hf"><font color="#919191">管理员回复:</font><font color="#CD0000">${obj.reply }</font></p>
							</div>	
						</c:forEach>
						${page.html }
					</c:when>
					<c:otherwise>
						<div class="story">
							<div class="opbtn"></div>
							<p class="story_t">
								<c:choose>
									<c:when test="${empty guestBook.name }">
										匿名网友
									</c:when>
									<c:otherwise>
										${guestBook.name}
									</c:otherwise>
								</c:choose>
								【留言】
							</p>
							<p class="story_time"><fmt:formatDate value="${guestBook.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
							<p class="story_m">${guestBook.content }</p>
							<p class="story_hf"><font color="#919191">管理员回复:</font><font color="#CD0000">${guestBook.reply }</font></p>
						</div>	
					</c:otherwise>
					
				</c:choose>
				
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
