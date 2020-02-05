<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/common/resources.jsp" %>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 网站配置<span class="c-gray en">&gt;</span> 内容分类列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="deleteAll()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	<c:if test="${admin.adminName eq 'admin' }">
		<a class="btn btn-primary radius" data-title="添加分类" data-href="article-add.html" onclick="category_add('添加分类','/category/toadd.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加内容分类</a>
	</c:if>
	</span>  </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="10%"><input type="checkbox" name="" value=""></th>
					<th width="10%">ID</th>
					<th width="10%">分类名称</th>
					<th width="10%">分类编码</th>
					<th width="40%">说明</th>
					<th width="20%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
						<c:forEach var="obj" items="${list }">
							<tr class="text-c">
								<td><input type="checkbox" name="id" value="${obj.id }"></td>
								<td>${obj.id }</td>
								<td class="text-l">
									${obj.name }
								</td>
								<td>${obj.code }</td>
								<td>${obj.remark }</td>
								<td class="f-14 td-manage">
									<c:if test="${obj.isParent }">
										<a href="/category/list?parentId=${obj.id}">查看子类</a>
									</c:if>
									<c:if test="${!obj.isParent }">
										<a href="/content/list/${obj.code}">查看内容</a>
									</c:if>
									<a style="text-decoration:none" class="ml-5" onClick="category_del(this,'${obj.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="text-c">
							<td colspan="6">暂无数据！</td>
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


/*资讯-添加*/
function category_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		area: ['640px', '615px'],
		content: url
	});
}
/*资讯-编辑*/
function category_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*批量删除*/
function deleteAll(){
	var checkboxs = $("input[name='id']:checked");
	if(checkboxs.length == 0){
		layer.alert("请至少选择一条！",{icon:2});
		return false;
	}
	layer.confirm("是否要批量删除？",function(){
		var array = new Array;
		$("input[name='id']:checked").each(function(){ 
			array.push($(this).val());
		}); 
		$.ajax({
			url : "${ctx}/category/batchDelete",
			type : "post",
			data : JSON.stringify(array),
			contentType:"application/json",
			success :function(data){
				if(data.code == "0000"){
					layer.alert("删除成功！",{icon:1},function(){
						window.location.reload();
					});
				}else{
					layer.alert(data.retMsg,{icon:2});
				}
			}
		})
		
		
	})
	
}



function category_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${ctx}/category/delete/' + id,
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

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
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
			url : "${ctx}/news/verify/" + id + "?type=" + type,
			success : function(data){
				if(data.code == "0000"){
					layer.msg('操作成功!',{icon: 5,time:1000});
					window.location.reload();
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