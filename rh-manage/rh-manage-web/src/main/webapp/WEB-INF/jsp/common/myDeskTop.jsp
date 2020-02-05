<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ include file="/common/resources.jsp" %>
</head>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用合肥锐衡教育后台管理系统！</p>
	<p>登录次数：${admin.loginTimes } </p>
	<p>上次登录IP：${admin.lastLoginIp }  上次登录时间：<fmt:formatDate value="${admin.lastLoginDate }" pattern="yyyy-MM-dd HH:mm:ss"/> </p>
<!-- 	<table class="table table-border table-bordered table-bg"> -->
<!-- 		<thead> -->
<!-- 			<tr> -->
<!-- 				<th colspan="7" scope="col">信息统计</th> -->
<!-- 			</tr> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<th>统计</th> -->
<!-- 				<th>资讯库</th> -->
<!-- 				<th>图片库</th> -->
<!-- 				<th>产品库</th> -->
<!-- 				<th>用户</th> -->
<!-- 				<th>管理员</th> -->
<!-- 			</tr> -->
<!-- 		</thead> -->
<!-- 		<tbody> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<td>总数</td> -->
<!-- 				<td>92</td> -->
<!-- 				<td>9</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>8</td> -->
<!-- 				<td>20</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<td>今日</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<td>昨日</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<td>本周</td> -->
<!-- 				<td>2</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 			</tr> -->
<!-- 			<tr class="text-c"> -->
<!-- 				<td>本月</td> -->
<!-- 				<td>2</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 				<td>0</td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">服务器信息</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">服务器计算机名</th>
				<td><span id="lbServerName">${fwqjsjm }</span></td>
			</tr>
			<tr>
				<td>服务器IP地址</td>
				<td>${fwqIP }</td>
			</tr>
			<tr>
				<td>服务器域名</td>
				<td>${fwqym }</td>
			</tr>
			<tr>
				<td>服务器端口 </td>
				<td>${fwqDk }</td>
			</tr>
			<tr>
				<td>JDK版本 </td>
				<td>${javaVersion }</td>
			</tr>
			<tr>
				<td>操作系统 </td>
				<td>${czxt }-${czxtjg }-${czxtbb }</td>
			</tr>
			<tr>
				<td>服务器当前时间 </td>
				<td><fmt:formatDate value="${dqsj }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			</tr>
			<tr>
				<td>CPU 总数 </td>
				<td>${cpuNum }</td>
			</tr>
			<tr>
				<td>虚拟机内存总量 </td>
				<td>${totalMemory }</td>
			</tr>
			<tr>
				<td>虚拟机空闲内存</td>
				<td>${kxnc }</td>
			</tr>
		</tbody>
	</table>
</div>
<%@ include file="/common/footer.jsp" %>
</body>
</html>