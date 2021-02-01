<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java"  contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>博文发布</title>
  <link href="${pageContext.request.contextPath}/static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/editormd/css/editormd.min.css" th:href="@{/lib/editormd/css/editormd.min.css}">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css" th:href="@{/css/me.css}">
  <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>
<script>
  $(function () {
    $("#content").val("${blog.content}");
    $("#desc").val("${blog.desc}");
  })
</script>
<body>

  <!--导航-->
  <nav class="ui inverted gird-header" >
    <div class="ui container">
      <div class="ui inverted secondary stackable menu">
        <h2 class="ui olive header item" style="font-family: STSong">管理后台</h2>
        <a href="${pageContext.request.contextPath}/admin/blogs.do?str=&category=0&pageNum=1" class="active m-item item m-mobile-hide"><i class="home icon"></i>文章管理</a>
        <a href="${pageContext.request.contextPath}/admin/categories.do?pageNum=1" class=" m-item item m-mobile-hide"><i class="clone outline icon"></i>分类管理</a>
        <a onclick="return alert('暂未开放...')" class=" m-item item m-mobile-hide"><i class="pencil alternate icon"></i>友链管理</a>
        <a onclick="return alert('暂未开放...')" class=" m-item item m-mobile-hide"><i class="image icon"></i>相册管理</a>
        <div class="right m-item m-mobile-hide menu">
          <div class="ui dropdown item">
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
  <div class="m-padded-tb-hugex">
  <div class="ui attached pointing menu">
    <div class="ui container">
      <div class="right menu">
        <a href="${pageContext.request.contextPath}/admin/blog/input.do" class="teal active item">发布</a>
        <a href="${pageContext.request.contextPath}/admin/blogs.do?str=&category=0&pageNum=1" class="item">列表</a>
      </div>
    </div>
  </div>
  </div>

  <!--中间内容-->
  <div  class="">
    <div class="ui container">
      <form id="blog-form" action="#" method="post" class="ui form">
        <input type="hidden" name="viewNumber" value="${blog.viewNumber}">
        <input type="hidden" name="commentNumber" value="${blog.commentNumber}">
        <input type="hidden" name="createTime" value="${blog.createTime}">
<%--        <input type="hidden" name="published">--%>
        <input type="hidden" name="id" value="${blog.id}">

        <div class="required field">
          <div class="ui left labeled input">
            <div class="ui selection compact teal basic dropdown label">
              <input type="hidden" value="${blog.type?blog.type:1}" name="type">
              <i class="dropdown icon"></i>
              <div class="text">原创</div>
              <div class="menu">
                <div class="item" data-value="1">原创</div>
                <div class="item" data-value="2">转载</div>
                <div class="item" data-value="3">翻译</div>
              </div>
            </div>
            <input type="text" name="title" placeholder="标题" value="${blog.title}">
          </div>
        </div>

        <div class="required field">
          <div class="" id="md-content" style="z-index: 1 !important;">
            <textarea id="content" placeholder="博客内容" name="content" style="display: none" ></textarea>
          </div>
        </div>

        <div class="two fields">
          <div class="required field">
            <div class="ui left labeled action input">
              <label class="ui compact teal basic label">分类</label>
              <div class="ui fluid selection dropdown">
                <input type="hidden" name="category" value="${blog.category}">
                <i class="dropdown icon"></i>
                <div class="default text">分类</div>
                <div class="menu">
                  <c:forEach items="${categories}" var="category">
                    <div class="item" data-value="${category.name}">${category.name}</div>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>

          <div class="required field">
            <div class="ui left labeled input">
              <label class="ui teal basic label">首图</label>
              <input type="text" name="img" placeholder="首图引用地址" value="${blog.img}">
            </div>
          </div>
        </div>

        <div class="required field">
          <textarea name="desc" placeholder="博客描述..." maxlength="200" id="desc"></textarea>
        </div>

<%--        下方复选框--%>
<%--        <div class="inline fields">--%>
<%--          <div class="field">--%>
<%--            <div class="ui checkbox">--%>
<%--              <input type="checkbox" id="recommend" name="recommend" checked class="hidden">--%>
<%--              <label for="recommend">推荐</label>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="field">--%>
<%--            <div class="ui checkbox">--%>
<%--              <input type="checkbox" id="shareStatement" name="shareStatement" class="hidden">--%>
<%--              <label for="shareStatement">转载声明</label>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="field">--%>
<%--            <div class="ui checkbox">--%>
<%--              <input type="checkbox" id="appreciation" name="appreciation" class="hidden">--%>
<%--              <label for="appreciation">赞赏</label>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="field">--%>
<%--            <div class="ui checkbox">--%>
<%--              <input type="checkbox" id="commentabled" name="commentabled" class="hidden">--%>
<%--              <label for="commentabled">评论</label>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

        <div class="ui error message"></div>

        <div class="ui right aligned container">
          <button type="button" class="ui button" onclick="window.history.go(-1)" >返回</button>
          <c:if test="${type == 1}"> <button type="button" id="save-btn" class="ui secondary button">保存</button> </c:if>
          <c:if test="${type == 2}"> <button type="button" id="publish-btn" class="ui teal button">发布</button> </c:if>
        </div>

      </form>
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
  <script src="${pageContext.request.contextPath}/static/lib/editormd/editormd.min.js" th:src="@{/lib/editormd/editormd.min.js}"></script>


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


    //初始化Markdown编辑器
    var contentEditor;
    $(function() {
      contentEditor = editormd("md-content", {
        width   : "100%",
        height  : 640,
        syncScrolling : "single",
//        path    : "../static/lib/editormd/lib/"
          path    : "${pageContext.request.contextPath}/static/lib/editormd/lib/"
      });
    });
    $('.menu.toggle').click(function () {
      $('.m-item').toggleClass('m-mobile-hide');
    });

    $('.ui.dropdown').dropdown({
      on : 'hover'
    });
      function zeroFill(i){
        if (i >= 0 && i <= 9) {
          return '0' + i;
        } else {
          return i;
        }
      }

    $('#save-btn').click(function () {
      $("#blog-form").attr("action","${pageContext.request.contextPath}/admin/blog/update.do");
      var date = new Date();
      var month = zeroFill(date.getMonth() + 1);//月
      var day = zeroFill(date.getDate());//日
      var curTime = date.getFullYear() + '-' + month + '-' + day;
      $('[name="createTime"]').val(curTime);
      $('#blog-form').submit();
    });


    $('#publish-btn').click(function () {
      $("#blog-form").attr("action","${pageContext.request.contextPath}/admin/blog/save.do");
      var date = new Date();
      var month = zeroFill(date.getMonth() + 1);//月
      var day = zeroFill(date.getDate());//日
      var curTime = date.getFullYear() + '-' + month + '-' + day;
      $('[name="createTime"]').val(curTime);
      $('[name="viewNumber"]').val(0);
      $('[name="commentNumber"]').val(0);
      $('#blog-form').submit();
    });



    $('.ui form').form({
      fields : {
        title : {
          identifier: 'title',
          rules: [{
            type : 'empty',
            prompt: '标题：请输入博客标题'
          }]
        },
        content : {
          identifier: 'content',
          rules: [{
            type : 'empty',
            prompt: '标题：请输入博客内容'
          }]
        },
        typeId : {
          identifier: 'category',
          rules: [{
            type : 'empty',
            prompt: '标题：请输入博客分类'
          }]
        },
        firstPicture : {
          identifier: 'img',
          rules: [{
            type : 'empty',
            prompt: '标题：请输入博客首图'
          }]
        },
        description : {
          identifier: 'desc',
          rules: [{
            type : 'empty',
            prompt: '标题：请输入博客描述'
          }]
        }
      }
    });

  </script>
</body>
</html>