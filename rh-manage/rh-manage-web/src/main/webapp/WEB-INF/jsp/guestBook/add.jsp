<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/common/resources.jsp" %>
<link href="${ctx}/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="content-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="标题"  name="title" value="${content.title }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">链接地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="超链接地址"  name="href" value="${content.href }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list">
						<c:if test="${!empty content.pic }">
							<div id="WU_FILE_0" class="item upload-state-success">
								<div class="pic-box">
									<img src="${content.pic }" width="100" height="100"></div><div class="info">weixin.jpg</div>
									<p class="state">已上传&nbsp;&nbsp;&nbsp;
										<span class="label label-danger radius" onclick="deleteThisPic(this);">点击删除</span>
									</p><div class="progress-box" style="display: none;"><span class="progress-bar radius">
									<span class="sr-only" style="width: 100%;"></span></span></div>
									<input name="pic" value="${content.pic }" type="hidden">
							</div>
						</c:if>
					
					</div>
					<div id="filePicker">选择图片</div>
				</div>
			</div>

		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"> 内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="editor" name="content" type="text/plain" style="width:100%;height:400px;">${content.content }</script> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button type="button" class="btn btn-primary radius" onclick="addContent();"><i class="Hui-iconfont">&#xe632;</i> 
					<c:if test="${content eq null }">
						保存
					</c:if>
					<c:if test="${content ne null }">
						编辑
					</c:if>
				</button>
				<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
		<input name="categoryCode" value="${code }" type="hidden">
		<input name="id" value="${content.id }" type="hidden">
	</form>
</article>
<script type="text/javascript" src="${ctx}/lib/common.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){
	var ue = UE.getEditor('editor');
	QH.onePicUpload("pic");
	
	
});
function removeIframe(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

function addContent(){
	$.ajax({
		url : "${ctx}/content/add",
		type : "post",
		data : $("#content-add").serialize(),
		success : function(data){
			if(data.code == "0000"){
				layer.alert(data.retMsg,{icon:1},function(){
					window.parent.location.reload();
				});
			}else{
				layer.msg(data.retMsg,{icon:2,timeout:3000});
			}
		}
	})
	return false;
}
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>