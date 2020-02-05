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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 留言管理 <span class="c-gray en">&gt;</span> 留言列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="3%">ID</th>
					<th width="5%">留言人姓名</th>
					<th width="10%">联系方式</th>
					<th width="20%">留言内容</th>
					<th width="9%">留言时间</th>
					<th width="5%">是否回复</th>
					<th width="15%">回复内容</th>
					<th width="9%">回复时间</th>
					<th width="5%">是否审核</th>
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
									${obj.name }
								</td>
								<td>${obj.contactWay }</td>
								<td>${obj.content }</td>
								<td><fmt:formatDate value="${obj.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:if test="${obj.isReply }">
										<span class="label label-success radius">已回复</span>
									</c:if>
									<c:if test="${!obj.isReply }">
										<span class="label label-fail radius">未回复</span>
									</c:if>
								</td>
								<td>${obj.reply }</td>
								<td><fmt:formatDate value="${obj.replyDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>
									<c:if test="${obj.isVerify }">
										<span class="label label-success radius">审核通过</span>
									</c:if>
									<c:if test="${!obj.isVerify }">
										<span class="label label-fail radius">未审核</span>
									</c:if>
								</td>
								<td class="f-14 td-manage">
								<c:if test="${obj.isVerify }">
									<a style="text-decoration:none" onClick="verify('${obj.id}','2')" href="javascript:;" title="审核不通过">审核不通过</a> 
								</c:if>
								<c:if test="${!obj.isVerify }">
									<a style="text-decoration:none" onClick="verify('${obj.id}','1')" href="javascript:;" title="审核通过">审核通过</a> 
								</c:if>
								<a style="text-decoration:none" onClick="reply('${obj.id}')" href="javascript:;" title="审核通过">
									<c:if test="${obj.isReply}">
										重新回复
									</c:if>
									<c:if test="${!obj.isReply}">
										回复
									</c:if>
								</a> 
								<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${obj.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
	<form class="form form-horizontal" id="replyForm" style="display: none">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">回复内容：</label>
			<div class="formControls col-xs-6 col-sm-6">
				<textarea name="reply" cols="" rows="" class="textarea" placeholder="说点什么...最少输入10个字符" ></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
			</div>
		</div>
		<div class="row cl">
			<div class="col-9 col-offset-2">
				<input name="id" type="hidden">
				<input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="toReply();">
			</div>
		</div>
	</form>
</div>
<!--_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">

/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${ctx}/guestBook/delete/' + id,
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
			url : "${ctx}/guestBook/verify/" + id + "?type=" + type,
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

function reply(id){
	$("textarea[name=reply]").val("");
	$("input[name=id]").val(id);
	//页面层
	layer.open({
	  type: 1,
	  skin: 'layui-layer-rim', //加上边框
	  area: ['640px', '240px'], //宽高
	  content: $("#replyForm")
	});
}

function toReply(){
	var id = $("input[name=id]").val();
	var reply = $("textarea[name=reply]").val();
	if(!reply){
		layer.alert("请输入要回复的内容！",{icon : 2});
		return false;
	}
	$.ajax({
		url : "${ctx}/guestBook/reply/" + id,
		data : {'reply' : reply},
		type : "post",
		success : function(data){
			if(data.code == "0000"){
				layer.alert("回复成功！",{icon : 1},function(){
					window.location.reload();
				});
			}else{
				layer.alert(data.retMsg,{icon : 2});
			}
		}
		
	})
}

</script> 
</body>
</html>