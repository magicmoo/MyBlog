<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head >
    <meta charset="UTF-8">
    <meta name="viewport" content="width=de vice-width, initial-scale=1.0">
    <title>ONESTAR-首页</title>

    <link href="../static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
    <link rel="stylesheet" href="../../static/lib/editormd/css/editormd.min.css" th:href="@{/lib/editormd/css/editormd.min.css}">
    <link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
    <script>
        function last(e) {
            if(${pageNum == 1}) alert("当前为第一页");
            else e.href = "${pageContext.request.contextPath}/blog/list.do?pageNum=${pageNum-1}";
        }
        function next(e) {
            if(${pageNum == pages}) alert("当前为最后一页");
            else e.href = "${pageContext.request.contextPath}/blog/list.do?pageNum=${pageNum+1}";
        }
    </script>
</head>
<body>


<!--顶部图片-->
<div class="m-bg-class_outer" style="width: 100%;height: 750px">
    <img src="../static/images/bg.jpg" th:src="@{/images/bg.jpg}" alt="" class="ui m-bg image" style="width: 100%;height: 100%">
    <div class="m-bg-class_cover" align="center">
        <div class="m-margin-top-maxx" align="center">
            <img class="ui circular image" align="center" src="../static/images/me.jpg" th:src="@{/images/me.jpg}" style="width: 150px;height: 150px;">
        </div>
        <div class="m-font-size-title-large" align="center">MoonQuakes</div>

        <div class="" align="center">
            <a href="#" class="ui wechat circular icon button"><i class="weixin icon"></i></a>
            <a href="#" class="ui qq circular icon button" data-content="316392836" data-position="bottom center"><i class="qq icon"></i></a>
            <a href="https://github.com/magicmoo/" target="_blank" class="ui github circular icon button" data-content="点击跳转GitHub" data-position="bottom center"><i class="github icon"></i></a>
            <a href="https://blog.csdn.net/qq_45929432" target="_blank" class="ui csdn circular icon button" data-content="点击跳转CSDN" data-position="bottom center"><i class="copyright outline icon"></i></a>
            <a href="#" class="ui email circular icon button" data-content="moonquakes121@qq.com" data-position="bottom center"><i class="envelope  icon"></i></a>
        </div>


        <div class="ui wechat-qr flowing popup transition hidden">
            <img src="../static/images/wechat.jpg" th:src="@{/images/wechat.jpg}" alt="" class="ui rounded image" style="width: 110px">
            <div align="center">微信</div>
        </div>
        <div class="ui qq-qr flowing popup transition hidden">
            <img src="../static/images/qq.jpg" th:src="@{/images/qq.jpg}" alt="" class="ui rounded image" style="width: 110px">
            <div align="center">QQ</div>
        </div>

        <h3 class="m-font-size-text" align="center">欢迎来到我的客栈，我是一颗星，夜空中最亮的那颗</h3>
        <hr style="width: 30%">
        <h5 class="m-font-size-text-init-title m-margin-top-large">”听说遥远的月亮每年都会发生几千次月震“</h5>
        <h5 class="m-font-size-text-init-title">”月亮轻颤，地球上的人却浑然不知“</h5>
        <h5 class="m-font-size-text-init-title">”就像当你站在我的面前，我的心也在颤动“</h5>
        <h5 class="m-font-size-text-init-title">”只是那心跳你永远不会知道“</h5>

        <div class="hiddenDiv"></div>
    </div>

</div>


<!--中间内容-->
<div class="m-padded-tb-big animated fadeIn">
    <div class="ui container">
        <div class="ui stackable grid">
            <!--博客内容-->
            <div class="ui vertical segment">
                <div class="ui m-container-small m-opacity">
                    <div class="ui secondary segment " align="center">
                        <i class="bookmark icon"></i>最新文章
                    </div>
                </div>
                <!--博文列表-->
                <c:forEach items="${blogs}" var="blog">
                    <div class="ui padded segment m-padded-tb-large m-opacity">
                        <div class="ui large aligned mobile reversed stackable grid">
                            <!--博文信息-->
                            <div class="eleven wide column ">
                                <h3 class="ui header" ><a href="${pageContext.request.contextPath}/blog/show.do?id=${blog.id}" target="_blank" class="m-black">${blog.title}</a></h3>
                                <p class="m-text m-margin-top-max">${blog.desc}</p>
                                <div class="ui m-margin-top-max grid">
                                    <div class="eleven wide column">
                                        <div class="ui mini horizontal link list">
                                            <div class="item">
                                                <img src="../static/images/me.jpg"  alt="" class="ui avatar image">
                                                <div class="content"><a href="#" target="_blank" class="header" >MoonQuakes</a></div>
                                            </div>
                                            <div class="item">
                                                <i class="calendar icon"></i><span>${blog.createTime}</span>
                                            </div>
                                            <div class="item">
                                                <i class="eye icon"></i> <span>${blog.viewNumber}</span>
                                            </div>
                                            <div class="item">
                                                <i class="comment outline icon"></i> <span>${blog.commentNumber}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="right aligned five wide column">
                                        <a href="#" target="_blank" class="ui teal basic label m-padded-tiny m-text-thin">${blog.category}</a>
                                    </div>
                                </div>
                            </div>
                            <!--博文图片-->
                            <div class="five wide column">
                                <a href="#" target="_blank">
                                    <img src="${blog.img}" alt="" class="ui rounded image">
                                </a>
                            </div>

                        </div>
                    </div>
                </c:forEach>

            </div>
            <!--分页-->
            <div class="ui bottom attached segment m-opacity stackable grid">
                <div class="three wide column" align="center">
                    <a class="item" onclick="last(this)">上一页</a>
                </div>

                <div class="ten wide column" align="center">
                    <p> <span></span> / <span></span> </p>
                </div>

                <div class="three wide column" align="center">
                    <a class="item" onclick="next(this)">下一页</a>
                </div>
            </div>

        </div>
    </div>

</div>


<!--置顶图标-->
<div class="m-padded-tb-large m-fixed m-right-bottom">
    <a href="#" class="ui icon button"><i class="chevron up icon"></i> </a>
</div>



<br>
<br>
<br>
<!--底部栏-->
<footer class="ui inverted vertical segment m-padded-tb-massive m-opacity">
    <!--容器-->
    <div class="ui center aligned container">
        <div class="ui inverted divided stackable grid">
            <div class="four wide column">
                <div style="font-size: large;font-weight: bold" class="ui inverted m-text-thin m-text-spaced m-margin-top-max" >联系我</div>
                <div class="ui inverted link list">
                    <div href="#" class="m-text-thin">Email：moonquakes121@qq.com</div>
                    <div href="#" class="m-text-thin">QQ：2321507398</div>
                </div>
            </div>

            <div class="four wide column" >
                <div class="ui inverted link list">
                    <div class="item">
                        <!--微信二维码-->
                        <div style="font-size: large;font-weight: bold" class="ui inverted m-text-thin m-text-spaced " >关注公众号</div>
                        <img src="../static/images/oneStar.jpg" th:src="@{/images/oneStar.jpg}"  class="ui m-margin-top rounded image" alt="" style="width: 110px">
                    </div>
                </div>
            </div>

            <div class="four wide column">
                <div class="ui inverted link list">
                    <div class="item">
                        <!--微信二维码-->
                        <div style="font-size: large;font-weight: bold" class="ui inverted m-text-thin m-text-spaced " >问题交流（QQ群）</div>
                        <img src="../static/images/QQ-question.jpg" th:src="@{/images/QQ-question.jpg}"  class="ui m-margin-top rounded image" alt="" style="width: 110px">
                    </div>
                </div>
            </div>
            <!--博客运行时间统计-->
            <div class="four wide column">
                <div style="font-size: large;font-weight: bold" class="ui inverted  m-text-thin m-text-spaced m-margin-top">客栈信息</div>
                <!--<p id="htmer_time" class="item m-text-thin"></p>-->
                <div id="blog-message">
                    <div class="ui inverted link list" style="align-content: center;margin-top: 10px">
                        <div class="m-text-thin" style="text-align: left;margin-left: 75px;">
                            文章总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> ${info.articleNum} </h2> 篇
                        </div>
                        <div class="m-text-thin" style="text-align: left;margin-left: 75px">
                            访问总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> ${info.accessNum} </h2> 次
                        </div>
                        <div class="m-text-thin" style="text-align: left;margin-left: 75px">
                            评论总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> ${info.commentNum} </h2> 条
                        </div>
                        <div class="m-text-thin" style="text-align: left;margin-left: 75px">
                            热门文章： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> ${info.hotNum} </h2> 篇
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui inverted section divider"></div>
        <div style="color: #F08047;margin-top: -18px" class="ui inverted m-text-thin m-text-spaced">我的客栈已营业：<span id="htmer_time" class="item m-text-thin"></span> (*๓´╰╯`๓)</div>
        <a rel="nofollow" href="http://www.beian.miit.gov.cn" target="_blank">赣ICP备20004408号-1</a>
    </div>
    </div>

</footer>



<script src="https://cdn.jsdelivr.net/npm/jquery@3.2/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.js"></script>
<script src="../static/lib/waypoints/jquery.waypoints.min.js" th:src="@{/lib/waypoints/jquery.waypoints.min.js}"></script>

<script>

    // $('#newblog-container').load(/*[[@{/footer/newblog}]]*/"/footer/newblog");


    // 运行时间统计
    function secondToDate(second) {
        if (!second) {
            return 0;
        }
        var time = new Array(0, 0, 0, 0, 0);
        if (second >= 365 * 24 * 3600) {
            time[0] = parseInt(second / (365 * 24 * 3600));
            second %= 365 * 24 * 3600;
        }
        if (second >= 24 * 3600) {
            time[1] = parseInt(second / (24 * 3600));
            second %= 24 * 3600;
        }
        if (second >= 3600) {
            time[2] = parseInt(second / 3600);
            second %= 3600;
        }
        if (second >= 60) {
            time[3] = parseInt(second / 60);
            second %= 60;
        }
        if (second > 0) {
            time[4] = second;
        }
        return time;
    }
    function setTime() {
        /*此处为网站的创建时间*/
        var create_time = Math.round(new Date(Date.UTC(2020, 01, 25, 15, 15, 15)).getTime() / 1000);
        var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
        currentTime = secondToDate((timestamp - create_time));
        currentTimeHtml = currentTime[0] + '年' + currentTime[1] + '天'
            + currentTime[2] + '时' + currentTime[3] + '分' + currentTime[4]
            + '秒';
        document.getElementById("htmer_time").innerHTML = currentTimeHtml;
    }
    setInterval(setTime, 1000);


    $('.menu.toggle').click(function () {
        $('.m-item').toggleClass('m-mobile-show');

    });

    // 显示公众号
    $('.tencent').popup({
        popup : $('.tencent-qr'),
        position: 'bottom center'
    });

    // 显示微信
    $('.wechat').popup({
        popup : $('.wechat-qr'),
        position: 'bottom center'
    });

    // 显示QQ
    $('.qq').popup({
        popup : $('.qq-qr'),
        position: 'bottom center'
    });

    // 显示邮箱
    $('.email').popup();

    // 显示CSDN
    $('.csdn').popup();

    // 显示github
    $('.github').popup();

    // 导航栏显示
    var waypoint = new Waypoint({
        element: document.getElementById('waypoint'),
        handler: function(direction) {
            if (direction == 'down') {
                $('#nav').show(500);
            } else {
                $('#nav').hide(500);
            }
            console.log('Scrolled to waypoint!  ' + direction);
        }
    })
</script>
</body>
</html>