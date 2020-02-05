<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/common/resources.jsp" %>
<link rel="stylesheet" type="text/css" href="${ctx}/lib/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/lib/bootstrap/css/model.css" />
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span> 课程列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a class="btn btn-primary radius" data-title="添加课程"  onclick="content_add('添加课程','${ctx}/course/toadd')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加课程</a>
		</span> 
	 </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="5%">ID</th>
					<th width="15%">标题</th>
					<th width="5%">类型</th>
					<th width="10%">讲师</th>
					<th width="20%">缩略图</th>
					<th width="10%">创建时间</th>
					<th width="15%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(page.result) > 0}">
						<c:forEach var="obj" items="${page.result }">
							<tr class="text-c">
								<td>${obj.id }</td>
								<td class="text-l">
									${obj.title }
								</td>
								<td>
									<c:if test="${obj.type eq '1' }">视频</c:if>
									<c:if test="${obj.type eq '2' }">文字</c:if>
								</td>
								<td>${obj.teacher }</td>
								<td>
									<a href="${obj.pic }" target="${obj.pic }">
										<img alt="" src="${obj.pic }" width="250px" height="200px">
									</a>
								</td>
								<td><fmt:formatDate value="${obj.updateDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td class="f-14 td-manage">
								<a style="text-decoration:none" class="ml-5" onclick="content_add('课程编辑','${ctx}/course/toUpdate/${obj.id }')" href="javascript:;" title="编辑"><i class="Hui-iconfont"></i></a>
								<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${obj.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="text-c">
							<td colspan="9">暂无数据！</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		${page.html }
	</div>
</div>
<!--_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">


function content_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}


/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${ctx}/course/delete/' + id,
			dataType: 'json',
			success: function(data){
				if(data.code == "0000"){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
					layer.msg(data.retMsg,{icon:2,time:1000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

function verify(id,type){
	var msg;
	if(type == 1){
		msg = "确定要审核通过吗？";
	}else{
		msg = "确定要审核不通过吗？";
	}
	layer.confirm(msg,function(index){
		$.ajax({
			url : "${ctx}/course/verify/" + id + "?type=" + type,
			success : function(data){
				if(data.code == "0000"){
					layer.alert("操作成功！",{icon : 1},function(){
						window.location.reload();
					});
				}else{
					layer.msg(data.retMsg,{icon: 2,time:1000});
				}
			}
		})
	});
}


</script> 
</body>
</html>