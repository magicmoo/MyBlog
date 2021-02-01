<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java"  contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>博客管理</title>
  <link href="../../static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../../static/css/me.css" th:href="@{/css/me.css}">
</head>
<body>

<!--导航栏-->
<nav class="ui inverted gird-header" >
  <div class="ui container">
    <div class="ui inverted secondary stackable menu">
      <h2 class="ui olive header item" style="font-family: STSong">管理后台</h2>
      <a href="${pageContext.request.contextPath}/admin/blogs.do?str=&category=0&pageNum=1" class="m-item item m-mobile-hide"><i class="home icon"></i>文章管理</a>
      <a href="#" class="m-item item m-mobile-hide"><i class="clone outline icon"></i>分类管理</a>
      <a onclick="return alert('暂未开放...')" class="m-item item m-mobile-hide"><i class="pencil alternate icon"></i>友链管理</a>
      <a onclick="return alert('暂未开放...')" class=" m-item item m-mobile-hide"><i class="image icon"></i>相册管理</a>
      <div class="right m-item m-mobile-hide menu">
        <div class="ui dropdown  item">
          <div class="text">
            <img class="ui avatar image" src="${pageContext.request.contextPath}/static/images/me.jpg">
            <span>MoonQuakes</span>
          </div>
          <i class="dropdown icon"></i>
          <div class="menu">
            <a href="#" class="item">注销</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
    <i class="sidebar icon"></i>
  </a>
</nav>

<br>
<br>
<br>

  <!--中间内容-->
  <div  class="m-padded-tb-massivex">
    <div class="ui container">
      <div class="ui success large  message">
        <p align="center">念念不忘，必有回响</p>
      </div>

      <img src="${pageContext.request.contextPath}/static/images/backimg0.jpg" alt="" class="ui rounded bordered fluid image">
    </div>
  </div>

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
            <img src="${pageContext.request.contextPath}/static/images/oneStar.jpg" th:src="@{/images/oneStar.jpg}"  class="ui m-margin-top rounded image" alt="" style="width: 110px">
          </div>
        </div>
      </div>

      <div class="four wide column">
        <div class="ui inverted link list">
          <div class="item">
            <!--微信二维码-->
            <div style="font-size: large;font-weight: bold" class="ui inverted m-text-thin m-text-spaced " >问题交流（QQ群）</div>
            <img src="${pageContext.request.contextPath}/static/images/QQ-question.jpg" th:src="@{/images/QQ-question.jpg}"  class="ui m-margin-top rounded image" alt="" style="width: 110px">
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
              文章总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> 14 </h2> 篇
            </div>
            <div class="m-text-thin" style="text-align: left;margin-left: 75px">
              访问总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> 14 </h2> 次
            </div>
            <div class="m-text-thin" style="text-align: left;margin-left: 75px">
              评论总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> 14 </h2> 条
            </div>
            <div class="m-text-thin" style="text-align: left;margin-left: 75px">
              留言总数： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> 14 </h2> 条
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
          var create_time = Math.round(new Date(Date.UTC(2021, 01, 25, 15, 15, 15)).getTime() / 1000);
          var timestamp = Math.round((new Date().getTime() + 8 * 60 * 60 * 1000) / 1000);
          currentTime = secondToDate((timestamp - create_time));
          currentTimeHtml = currentTime[0] + '年' + currentTime[1] + '天'
              + currentTime[2] + '时' + currentTime[3] + '分' + currentTime[4]
              + '秒';
          document.getElementById("htmer_time").innerHTML = currentTimeHtml;
      }
      setInterval(setTime, 1000);

    $('.menu.toggle').click(function () {
      $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
      on : 'hover'
    });

  </script>
</body>
</html>