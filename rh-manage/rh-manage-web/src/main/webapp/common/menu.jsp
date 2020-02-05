<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
<%-- 		<c:if test="${admin.adminName eq 'admin' }"> --%>
<!-- 			<dl id="menu-article"> -->
<!-- 					<dt><i class="Hui-iconfont">&#xe616;</i> 新闻管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt> -->
<!-- 					<dd> -->
<!-- 						<ul> -->
<!-- 							<li><a data-href="/news/list" data-title="新闻管理" href="javascript:void(0)">新闻管理</a></li> -->
<!-- 					</ul> -->
<!-- 				</dd> -->
<!-- 			</dl> -->
<!-- 			<dl id="menu-article"> -->
<!-- 			<dt><i class="Hui-iconfont">&#xe613;</i> 网站配置<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt> -->
<!-- 					<dd> -->
<!-- 						<ul> -->
<!-- 							<li><a data-href="/category/list" data-title="分类管理" href="javascript:void(0)">分类管理</a></li> -->
<!-- 					</ul> -->
<!-- 				</dd> -->
<!-- 			</dl> -->
<%-- 		</c:if> --%>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 首页<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/content/list/logo" data-title="logo" href="javascript:void(0)">logo</a></li>
					<li><a data-href="${ctx}/content/list/zylbt" data-title="轮播图" href="javascript:void(0)">轮播图</a></li>
					<li><a data-href="${ctx}/content/list/gsjj" data-title="公司简介" href="javascript:void(0)">公司简介</a></li>
					<li><a data-href="${ctx}/content/list/xyzx" data-title="公司新闻" href="javascript:void(0)">公司新闻</a></li>
					<li><a data-href="${ctx}/content/list/xzjy" data-title="校长寄语" href="javascript:void(0)">校长寄语</a></li>
					<li><a data-href="${ctx}/content/list/kbsj" data-title="开班时间" href="javascript:void(0)">开班时间</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-article">
				<dt><i class="Hui-iconfont">&#xe613;</i> 招生在线<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a data-href="${ctx}/content/list/kbsj" data-title="开班时间" href="javascript:void(0)">开班时间</a></li>
						<li><a data-href="${ctx}/content/list/jydl" data-title="结业典礼" href="javascript:void(0)">结业典礼</a></li>
						<li><a data-href="${ctx}/content/list/kcdg" data-title="课程大纲" href="javascript:void(0)">课程大纲</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 学员天地<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/content/list/xyfczs" data-title="学员风采展示" href="javascript:void(0)">学员风采</a></li>
					<li><a data-href="${ctx}/content/list/xszpz" data-title="学生作品" href="javascript:void(0)">学生作品</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 就业保障<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/content/list/zyghzd" data-title="职业规划指导 " href="javascript:void(0)">职业规划指导 </a></li>
					<li><a data-href="${ctx}/content/list/qyzp" data-title="企业招聘 " href="javascript:void(0)">企业招聘 </a></li>
					<li><a data-href="${ctx}/content/list/xyjljjyzd" data-title="学员简历及就业指导 " href="javascript:void(0)">学员简历及就业指导</a></li>
					<li><a data-href="${ctx}/content/list/cgal" data-title="成功案例 " href="javascript:void(0)">成功案例</a></li>
			</ul>
		</dd>
	</dl>
<!-- 		<dl id="menu-article"> -->
<!-- 			<dt><i class="Hui-iconfont">&#xe613;</i> 内部教材<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt> -->
<!-- 			<dd> -->
<!-- 				<ul> -->
<!-- 					<li><a data-href="${ctx}/content/list/nbjc" data-title="内部教材" href="javascript:void(0)">内部教材</a></li> -->
<!-- 			</ul> -->
<!-- 		</dd> -->
<!-- 	</dl> -->
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 培训科目<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/course/list" data-title="锐衡学堂" href="javascript:void(0)">锐衡学堂</a></li>
					<li><a data-href="${ctx}/content/list/xynr" data-title="培训科目" href="javascript:void(0)">学习内容</a></li>
					<li><a data-href="${ctx}/content/list/zyxz" data-title="资源下载" href="javascript:void(0)">资源下载</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 关于锐衡教育<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/content/list/gywm" data-title="关于我们" href="javascript:void(0)">关于我们</a></li>
					<li><a data-href="${ctx}/content/list/lxwm" data-title="联系我们" href="javascript:void(0)">联系我们</a></li>
			</ul>
		</dd>
	</dl>
			<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 留言管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/guestBook/list" data-title="留言管理" href="javascript:void(0)">留言管理</a></li>
			</ul>
		</dd>
	</dl>
	<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe613;</i> 问题答疑<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="${ctx}/content/list/bzzx" data-title="问题答疑" href="javascript:void(0)">问题答疑</a></li>
			</ul>
		</dd>
	</dl>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>