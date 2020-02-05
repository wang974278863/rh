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
	<form class="form form-horizontal" id="course-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="标题"  name="title" value="${course.title }">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">课程类型：</label>
				<div class="radio-box">
					<input name="type" value="1" type="radio" onclick="changeFormType('1');" checked="checked"><label for="sex-1">视频</label>&nbsp;&nbsp;&nbsp;
					<input name="type" value="2" type="radio" onclick="changeFormType('2');"><label for="sex-1">文字</label>
				</div>
			</div>
		<div class="row cl" lang="1">
			<label class="form-label col-xs-4 col-sm-2">讲师：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" placeholder="讲师姓名，如：栾老师"  name="teacher" value="${course.teacher }">
			</div>
		</div>
			<div class="row cl"  lang="1">
				<label class="form-label col-xs-4 col-sm-2">视频地址：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" placeholder="优酷等网站的视频分享地址"  name="videoUrl" value="${course.videoUrl }">
				</div>
			</div>
 		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">缩略图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<div id="fileList" class="uploader-list">
						<c:if test="${!empty course.pic }">
							<div id="WU_FILE_0" class="item upload-state-success">
								<div class="pic-box">
									<img src="${course.pic }" width="100" height="100"></div><div class="info">weixin.jpg</div>
									<p class="state">已上传&nbsp;&nbsp;&nbsp;
										<span class="label label-danger radius" onclick="deleteThisPic(this);">点击删除</span>
									</p><div class="progress-box" style="display: none;"><span class="progress-bar radius">
									<span class="sr-only" style="width: 100%;"></span></span></div>
									<input name="pic" value="${course.pic }" type="hidden">
							</div>
						</c:if>
					
					</div>
					<div id="filePicker">选择图片</div>
				</div>
			</div>

		</div>
		<div class="row cl" lang="2" style="display: none;">
			<label class="form-label col-xs-4 col-sm-2"> 内容：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="content" name="content" type="text/plain" style="width:100%;height:400px;">${course.content }</script> 
			</div>
		</div>
		<div class="row cl"  lang="1" style="display: none;">
			<label class="form-label col-xs-4 col-sm-2"> 视频简介：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="videoIntroduction" name="videoIntroduction" type="text/plain" style="width:100%;height:400px;">${course.videoIntroduction }</script> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button type="submit" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe632;</i> 
					<c:if test="${course eq null }">
						保存
					</c:if>
					<c:if test="${course ne null }">
						编辑
					</c:if>
				</button>
				<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
		<input name="id" value="${course.id }" type="hidden">
	</form>
</article>
<script type="text/javascript" src="${ctx}/lib/common.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${ctx}/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${ctx}/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/lib/jquery.validation/1.14.0/messages_zh.js"></script>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
$(function(){
	var ue = UE.getEditor('content');
	var ue2 = UE.getEditor('videoIntroduction');
	QH.onePicUpload("pic");
	 var type = '${course.type}';
	 if(type != ''){
		 $(":radio[name='type'][value='" + type +"']").prop("checked", "checked");	
		 var type2 = "1";
		 if(type == "1"){
			 type2 = "2";
		 }
		 $(":radio[name='type'][value='" + type2 +"']").prop("disabled","disabled");	
		 changeFormType(type);
		 
	 }else{
		$(":radio[name='type'][value='1']").prop("checked", "checked");
		changeFormType('1');
	 }
	
	//表单验证
	$("#course-add").validate({
		rules:{
			title:{
				required:true,
			},
			teacher:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var id = $("input[name=id]").val();
			var url = "/course/add";
			if(id){
				url = "/course/update";
			}
			$.ajax({
				url : url,
				type : "post",
				data : $("#course-add").serialize(),
				success : function(data){
					if(data.code == "0000"){
						layer.alert("添加成功！",{icon:1});
						window.parent.location.reload();
					}else{
						layer.msg(data.retMsg,{icon:2});
					}
				}
			})
		}
	});
});
function removeIframe(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

function changeFormType(type){
	if(type == '1'){
		$("div[lang='1']").show();
		$("div[lang='2']").hide();
	}else{
		$("div[lang='2']").show();
		$("div[lang='1']").hide();
	}
}
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>