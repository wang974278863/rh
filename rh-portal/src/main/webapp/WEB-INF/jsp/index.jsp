<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="/common/resources.jsp" %>
    <link href="/css/style.css" rel="stylesheet">
    <style type="text/css">
        .btn {
            width: 70px;
            height: 25px;
            border: none;
            line-height: 25px;
            overflow: hidden;
            color: #fff;
            margin-right: 2px;
            cursor: pointer;
            background-color: #2890e0;
        }

        .line-limit-length {
            max-width: 110px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .life .listimg {
            float: left;
            height: auto;
            overflow: hidden;
        }

        .life .listimg li {
            float: left;
            width: 187px;
            height: 150px;
            padding-bottom: 10px;
        }

        .life .listimg .pr0 {
            padding-right: 0;
        }

        .life .listimg li a {
            display: block;
            height: 140px;
            padding-top: 6px;
            background: #f2f2f2;
            text-align: center;
            line-height: 18px;
        }

        .life .listimg li a img {
            display: block;
            margin: 0 auto;
        }

        .life .listimg div {
            height: 30px;
            clear: both;
            padding-left: 10px;
        }

        .life .listimg div a {
            color: #0033FF;
        }
    </style>
</head>

<body>
<!-- ##########页首########## -->
<%@ include file="/common/header.jsp" %>

<!-- 广告轮播 -->
<%--<div id="ad-carousel" class="carousel slide" data-ride="carousel">--%>
<%--<ol class="carousel-indicators">--%>
<%--<c:forEach items="${zylbt }" var="obj" varStatus="status">--%>
<%--<li data-target="#ad-carousel" data-slide-to="${status.index}" <c:if test="${status.index == 0 }">class="active"</c:if>></li>--%>
<%--</c:forEach>--%>
<%--</ol>--%>
<%--<div class="carousel-inner">--%>
<%--<c:forEach items="${zylbt }" var="obj" varStatus="status">--%>
<%--<div class="item <c:if test="${status.index == 0 }">active</c:if>">--%>
<%--<img src="${obj.pic }" alt="${status.index + 1} slide">--%>
<%--</div>--%>
<%--</c:forEach>--%>
<%--</div>--%>
<%--<a class="left carousel-control" href="#ad-carousel" data-slide="prev" style="margin-left: 240px;background-image: none;"><span--%>
<%--class="glyphicon glyphicon-chevron-left" ></span></a>--%>
<%--<a class="right carousel-control" href="#ad-carousel" data-slide="next" style="margin-right: 240px;background-image: none;"><span--%>
<%--class="glyphicon glyphicon-chevron-right"></span></a>--%>
<%--</div>--%>
<!-- ##########页首（end）########## -->

<!-- ##########主体########## -->
<div class="container" style="width: 1200px;">
    <!-- 栏目 -->
    <div class="row">

        <!-- 公司简介 -->
        <div class="col-md-6">
			<span class="part1">
				<a href="#">公司简介</a>
			</span>
            <span class="part1 en">
				&nbsp;&nbsp;/ About Us
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div>
                <c:if test="${gsjj[0].pic ne null}">
                    <img class="img-responsive" src="${gsjj[0].pic }">
                </c:if>
                <p class="text1">
                    ${gsjj[0].content }
                </p>
            </div>
        </div>
        <!-- 公司新闻-->
        <div class="col-md-6">
			<span class="part1">
				<a href="#">公司新闻</a>
			</span>
            <button type="button" class="btn btn-default btn-xs more-btn" onclick="window.location.href='/zszx/xyzx'">+&nbsp;MORE</button>
            <span class="part1 en">
				&nbsp;&nbsp;/ Campus Information
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div>
                <img class="img-responsive" src="images/ggxx.jpg" alt="公告信息">
                <ul class="list-unstyled list-new">
                    <c:forEach items="${xyzx }" var="obj">
                        <li>
                            <a href="/zszx/view/${obj.id }">${obj.title }</a><a href="/zszx/view/${obj.id }"
                                                                                class="public-detail">查看详情&gt;&gt;</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
    <div class="row row-2">

        <!-- 开班时间 -->
        <div class="col-md-6">
			<span class="part1">
				<a href="#">开班时间</a>
			</span>
            <button type="button" class="btn btn-default btn-xs more-btn" onclick="window.location.href='/zszx/kbsj'">+&nbsp;MORE</button>
            <span class="part1 en">
				&nbsp;&nbsp;/ Class Time
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div>
                <img class="img-responsive" src="images/ggxx.jpg" alt="开班时间">
                <c:forEach items="${kbsj }" var="obj">
                    <ul class="list-unstyled list-new">
                        <li>
                            <a href="/zszx/view/${obj.id }" title="${obj.title }">
                                <c:if test="${fn:length(obj.title)>136 }">
                                    ${fn:substring(obj.title, 0, 136)}...
                                </c:if>
                                <c:if test="${fn:length(obj.title)<=136 }">
                                    ${obj.title }
                                </c:if>
                            </a><a href="/zszx/view/${obj.id }" class="public-detail">查看详情>></a>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </div>
        <!-- 培训科目 -->
        <div class="col-md-6">
			<span class="part1">
				<a href="#">培训科目</a>
			</span>
            <button type="button" class="btn btn-default btn-xs more-btn"
                    onclick="window.location.href='${ctx}/course/list'">+&nbsp;MORE
            </button>
            <span class="part1 en">
				&nbsp;&nbsp;/ Course
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div>
                <ul class="video1 ">
                    <c:forEach items="${kcxy }" var="obj">
                        <li>
                            <a href="/course/${obj.id }" target="_blank" class="pic"><img src="${obj.pic }"
                                                                                          title=""></a>
                            <h4>
                                <a href="/course/${obj.id }" target="_blank" title="${obj.title }">${obj.title }</a>
                            </h4>
                            <p>
                                <a href="/course/${obj.id }" class="kcgmbtn" target="_blank">立即进入</a> <span
                                    class="yew" title=""> <a>${obj.teacher }</a></span>
                            </p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <div class="row row-2">

        <!-- 学员风采 -->
        <div class="col-md-12">
			<span class="part1">
				<a href="#">学员风采</a>
			</span>
            <button type="button" class="btn btn-default btn-xs more-btn" onclick="window.location.href='/xyfc/list'">+&nbsp;MORE</button>
            <span class="part1 en">
				&nbsp;&nbsp;/ Student Show
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div class="life">
                <!-- 				<img class="img-responsive" src="images/ggxx.jpg" alt="学员风采"> -->
                <div class="listimg">
                    <ul>
                        <c:forEach items="${xyfc }" var="obj" varStatus="status">
                            <li class="<c:if test="${((status.index + 1) % 4) eq 0 }">pr0</c:if>">
                                <a href="/xyfc/${obj.id }" title="${obj.title }" target="_blank">
                                    <img class="lazy" src="${obj.pic }" width="180" height="115"
                                         style="display: block;">
                                    <p>${obj.title }</p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <div class="row">

        <!-- 公司新闻 -->
        <div class="col-md-7">
			<span class="part1">
				<a href="#">留言板</a>
			</span>
            <span class="part1 en">
				&nbsp;&nbsp;/ GuestBook
			</span>
            <button type="button" class="btn btn-default btn-xs more-btn"
                    onclick="window.location.href='/guestBook/list'">+MORE
            </button>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <ul class="list-unstyled list-new">
                <c:forEach items="${guestBooks }" var="obj">
                    <li>
                        <a href="/guestBook/${obj.id}">
                            <font color="red">
                                <c:if test="${empty obj.name }">
                                    匿名同学问：
                                </c:if>
                                <c:if test="${!empty obj.name }">
                                    ${obj.name }问：
                                </c:if>
                            </font>
                                ${obj.content }</a><a href="/guestBook/${obj.id}" class="public-detail">查看详情&gt;&gt;</a>
                    </li>
                </c:forEach>
            </ul>

            <div style="margin-top: 20px">
                <a onclick="goGuestBook();"
                   style="background: #39a4dc;color: #fff;font-size: 18px;padding: 3px 6px;margin-left: 40%;">我要留言</a>
                <a href="/guestBook/list"
                   style="background: #39a4dc;color: #fff;font-size: 18px;padding: 3px 6px;float: right;"
                   target="_blank">查看更多留言</a>
            </div>
        </div>


        <!-- 校长寄语 -->
        <div class="col-md-5">
			<span class="part1">
				<a href="#">校长寄语</a>
			</span>
            <span class="part1 en">
				&nbsp;&nbsp;/ Headmaster Motto
			</span>
            <div class="line1">
                <div class="line2 theme"></div>
            </div>
            <div>
                <c:if test="${xzjy[0].pic ne null}">
                    <img class="img-responsive" src="${xzjy[0].pic }" alt="校长寄语">
                </c:if>
                <p class="text1">
                    ${xzjy[0].content }
                </p>
            </div>
        </div>
    </div>
</div>
<!-- ##########主体（end）########## -->
<br><br><br>
<!-- ##########页脚########## -->
<%@ include file="/common/footer.jsp" %>

<div id="guestBook" class="zxly_from"
     style="display:none;background-color:#B2DFEE; width: 780px;height: auto;overflow: hidden;padding-top: 30px;padding-left: 15px;">
    <b>在线留言:</b><a name="write"></a>
    <form method="post">
        <div style="float: left;width: 100%; margin: 10px 90px;">
            你的姓名：<font color="#FF0000"> </font>
            <input maxlength="10" name="name" size="57" value="" class="ipt-txt" type="text">
        </div>

        <div style="float: left;width: 100%;margin: 10px 90px;">联系方式：<font color="#FF0000"></font>
            <input maxlength="80" name="contactWay" size="57" class="ipt-txt" type="text">
        </div>


        <div style="float: left;width: 100%;margin: 10px 90px">
            <div class="d1">留言内容：<font color="#FF0000">*</font>
            </div>
            <textarea maxlength="120" placeholder="最多输入120个字" name="content" cols="55" rows="3"
                      style="margin-left: 75px;"></textarea>
        </div>
        <br>


        <!-- 			        <div style="float: left;width: 100%;margin: 10px 96px">验 证 码：<font color="#FF0000">*</font> -->
        <!-- 			    <input name="captcha" maxlength="4" class="ipt-txt" style="width:60px;" type="text">  -->
        <%-- 			          <img id="captcha" src="/verify/image?<%=Math.random() %>" align="middle" onclick="refreshPic();">        --%>
        <!-- 			           </div> -->
        <div style="float: left;width: 100%;margin: 10px 280px;">
            <input name="Submit" value="提 交" class="btn" onclick="addBook();">
            &nbsp;&nbsp;
        </div>

    </form>

</div>
<script>
    function refreshPic() {
        $("#captcha").attr("src", "/verify/image?" + Math.random());
    }

    function addBook() {
        var content = $("textarea[name=content]").val();
        if (!content) {
            layer.alert("请输入留言内容哦", {icon: 2});
            return false;
        }
        var captcha = $("input[name=captcha]").val();
        if (!content) {
            layer.alert("请输入验证码哦", {icon: 2});
            return false;
        }
        $.ajax({
            url: "${ctx}/guestBook/add",
            data: $("form").serialize(),
            type: "post",
            success: function (data) {
                if (data.code == "0000") {
                    layer.alert("留言成功，请等待管理员回复！", {icon: 1});
                    resetForm();
                    window.location.reload();
                } else {
                    layer.alert(data.retMsg, {icon: 2});
                }
                refreshPic();
            }
        })
    }

    function goGuestBook() {
        //页面层
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['640px', '440px'], //宽高
            content: $("#guestBook")
        });
    }

    function resetForm() {
        $('form')[0].reset();
    }
</script>
</body>
</html>
