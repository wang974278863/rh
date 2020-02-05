<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
 <div class="col-md-3">
			<div class="model-list">
				<ul class="list-group">
					<c:if test="${module2 eq 'aboutsUS' }">
	                    <li class="list-group-item active" style="background-color: #005197;">
							<a href="/aboutsUS" style="color: #fff;">关于我们</a>
						</li>
					</c:if>
					<c:if test="${module2 ne 'aboutsUS' }">
	                    <li class="list-group-item active" >
							<a href="/aboutsUS">关于我们</a>
						</li>
					</c:if>
					<c:if test="${module2 eq 'contactUs' }">
	                    <li class="list-group-item active" style="background-color: #005197;">
							<a href="/contactUs" style="color: #fff;">联系我们</a>
						</li>
					</c:if>
					<c:if test="${module2 ne 'contactUs' }">
	                    <li class="list-group-item active" >
							<a href="/contactUs">联系我们</a>
						</li>
					</c:if>
<%-- 					<c:if test="${module2 eq 'bzzx' or module2 eq  'question' }"> --%>
<!-- 	                    <li class="list-group-item active" style="background-color: #005197;"> -->
<!-- 							<a href="/bzzx" style="color: #fff;">常见问题</a> -->
<!-- 						</li> -->
<%-- 					</c:if> --%>
<%-- 					<c:if test="${module2 ne 'bzzx' and module2 ne  'question' }"> --%>
<!-- 	                    <li class="list-group-item active" > -->
<!-- 							<a href="/bzzx">常见问题</a> -->
<!-- 						</li> -->
<%-- 					</c:if> --%>
					<c:if test="${module2 eq 'lyb' }">
	                    <li class="list-group-item active" style="background-color: #005197;">
							<a href="/guestBook/list" style="color: #fff;">留言板</a>
						</li>
					</c:if>
					<c:if test="${module2 ne 'lyb'}">
	                    <li class="list-group-item active" >
							<a href="/guestBook/list">留言板</a>
						</li>
					</c:if>
				</ul>
      
			</div>
		</div>