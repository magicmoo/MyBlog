<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ONESTAR-搜索结果</title>
  <link href="../static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
  <script src="../static/js/jquery-3.3.1.min.js"></script>
</head>

<script>
  function last(e) {
    if(${pageNum == 1}) alert("当前为第一页");
    else e.href = "${pageContext.request.contextPath}/blog/search?pageNum=${pageNum-1}&str=${str}";
  }
  function next(e) {
    if(${pageNum == pages}) alert("当前为最后一页");
    else e.href = "${pageContext.request.contextPath}/blog/search?pageNum=${pageNum+1}&str=${str}";
  }
</script>
<body>

<!--导航-->
<nav class="gird-header">
  <div class="ui container">
    <div class="ui inverted secondary stackable menu">
      <h2 class="ui olive header item" style="font-family: STSong">MoonQuakes</h2>
      <!--<div class="right m-item item m-mobile-hide">-->
        <a href="${pageContext.request.contextPath}/blog/list.do?pageNum=1" class="m-item item m-mobile-hide "><i class="home icon"></i>首页</a>
        <a href="${pageContext.request.contextPath}/category/list.do?id=0&pageNum=1" class="m-item item m-mobile-hide"><i class="clone outline icon"></i>分类</a>
      <!--</div>-->
      <div class="right m-item item m-mobile-hide">
        <form name="search" action="${pageContext.request.contextPath}/blog/search.do?pageNum=1" method="post" target="_blank">
          <div class="ui icon transparent input m-margin-tb-tiny" style="color: white">
            <input style="color: white" type="text" name="str" placeholder="Search....">
            <i onclick="document.forms['search'].submit()" class="search link icon"></i>
          </div>
        </form>
      </div>
    </div>
  </div>
  <a href="#" class="ui menu toggle black icon button m-right-top m-mobile-show">
    <i class="sidebar icon"></i>
  </a>
</nav>


<!--顶部图片-->
<div class="m-bg-type_outer" style="width: 100%;height: 40%">
  <img src="../static/images/typebg.jpg" th:src="@{/images/typebg.jpg}" alt="" class="ui m-bg image" style="width: 100%;height: 100%">
  <div class="m-bg-class_cover">
    <div class="ui container" style="position: relative ;bottom: -540px;">
      <div class="m-font-size-title m-right-bottom" align="center" style="font-family:'STXingkai'">搜索结果</div>
      <div class="m-font-size-text-init-title m-margin-top" align="center">人生，就是一个不断寻找的过程</div>
    </div>
  </div>
</div>

  <!--中间内容-->
  <div  class="m-margin-">
    <div class="ui container">
      <!--header-->
      <div class="ui top attached segment">
        <div class="ui middle aligned two column grid">
          <div class="column">
            <h3 class="ui teal header">搜索结果</h3>
          </div>
          <div class="right aligned column">
            共 <h2 class="ui orange header m-inline-block m-text-thin"> 14 </h2> 个
          </div>
        </div>
      </div>

      <c:forEach items="${blogs}" var="blog">
        <div class="ui top attached teal m-opacity segment">
          <div class="ui padded vertical segment m-padded-tb-large">
            <div class="ui middle aligned mobile reversed stackable grid" >
              <div class="eleven wide column">
                <h3 class="ui header" ><a href="${pageContext.request.contextPath}/blog/show.do?id=${blog.id}">${blog.title}</a></h3>
                <p class="m-text">${blog.desc}</p>
                <div class="ui grid">
                  <div class="eleven wide column">
                    <div class="ui mini horizontal link list">
                      <div class="item">
                        <img src="../static/images/me.jpg"  alt="" class="ui avatar image">
                        <div class="content"><a href="#" target="_blank" class="header">MoonQuakes</a></div>
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

              <div class="five wide column">
                <a href="#" target="_blank">
                  <img src="${blog.img}" alt="" class="ui rounded image">
                </a>
              </div>

            </div>
          </div>
        </div>
      </c:forEach>

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
      $('.m-item').toggleClass('m-mobile-hide');
    });

  </script>
</body>
</html>