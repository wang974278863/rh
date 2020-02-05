<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx}/lib/html5shiv.js"></script>
<script type="text/javascript" src="${ctx}/lib/respond.min.js"></script>
<![endif]-->
<link href="${ctx}/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}//lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}//lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}//lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}//lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}//lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${ctx}//lib/layer/2.4/layer.js"></script>

<!--[if IE 6]>
<script type="text/javascript" src="${ctx}/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>后台登录 - 合肥锐衡教育</title>
<meta name="keywords" content="合肥锐衡教育">
<meta name="description" content="合肥锐衡教育">
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
  <div  class="loginBox">
    <form class="form form-horizontal"  id="loginForm" method="post">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8" >
          <input name="adminName" type="text" placeholder="账户" class="input-text size-L" style="width:300px;">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input name="adminPwd" type="password" placeholder="密码" class="input-text size-L" style="width:300px;">
        </div>
      </div>
      <%--<div class="row cl">--%>
        <%--<div class="formControls col-xs-8 col-xs-offset-3">--%>
          <%--<input name="captcha" class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码'}" onclick="if(this.value=='验证码'){this.value='';}"  style="width:150px;" maxlength="4">--%>
          <%--<img src="${ctx}//verify/image?<%= Math.random() %>" id="captcha"> <a id="kanbuq" href="javascript:;" onclick="changeCaptcha();">看不清，换一张</a> </div>--%>
      <%--</div>--%>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 合肥锐衡教育</div>
<script type="text/javascript">
	function changeCaptcha(){
		$("#captcha").attr("src","${ctx}/verify/image?" + Math.random());
	}
	
	$(function(){
		$("#loginForm").validate({
			rules:{
				adminName:{
					required:true,
				},
				adminPwd:{
					required:true,
					minlength:2,
					maxlength:16
				}
			},
			messages: {
				adminName: {
					required: "登录账号不能为空"
				},
				adminPwd: {
					required: "密码不能为空"
				},
				captcha: {
					required: ""
				},
			},
			onkeyup:false,
			focusCleanup:true,
			success:"valid",
			submitHandler:function(form){
				$.ajax({
					url : "${ctx}/tologin",
					type : "post",
					data : $("#loginForm").serialize(),
					success : function(data){
						if(data.code == "0000"){
							window.location.href = "${ctx}/";
						}else{
							layer.alert(data.retMsg,{icon: 2});
							changeCaptcha();
							return false;
						}
					}
				});
				return false;
			}
		});

	})
</script>
</body>
</html>