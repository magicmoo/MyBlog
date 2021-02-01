<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java"  contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>博客管理</title>
  <link href="${pageContext.request.contextPath}/static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css" th:href="@{css/me.css}">
  <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>

<script>
  $(function () {
    $("#search-btn").click(function () {
      $.post("${pageContext.request.contextPath}/admin/blogs.do",{str:$("#str").val(),category: $("[name='typeId']").val(),pageNum: 1},function () {
        window.location.href = "${pageContext.request.contextPath}/admin/blogs.do?str="+$("#str").val()+"&category="+$("[name='typeId']").val()+"&pageNum=1";
      },"text")
    })
  })

  function last(e) {
    if(${pageNum == 1}) alert("当前为第一页");
    else e.href = "${pageContext.request.contextPath}/admin/blogs.do?str="+$("#str").val()+"&category="+${cid}+"&pageNum="+${pageNum-1};
  }
  function next(e) {
    if(${pageNum == pages}) alert("当前为最后一页");
    else e.href = "${pageContext.request.contextPath}/admin/blogs.do?str="+$("#str").val()+"&category="+${cid}+"&pageNum="+${pageNum+1};
  }

  function del(id) {
    if(confirm('确定要删除该文章吗？三思啊! 删了可就没了！')){
      $.post("${pageContext.request.contextPath}/admin/blog/delete.do",{id: id},function () {
        location.reload();
      },"text")
    }

  }
</script>
<body>

  <!--导航栏-->
  <nav class="ui inverted gird-header" >
    <div class="ui container">
      <div class="ui inverted secondary stackable menu">
        <h2 class="ui olive header item" style="font-family: STSong">管理后台</h2>
        <a href="${pageContext.request.contextPath}/admin/blogs.do?str=&category=0&pageNum=1" class="active m-item item m-mobile-hide"><i class="home icon"></i>文章管理</a>
        <a href="${pageContext.request.contextPath}/admin/categories.do?pageNum=1" class=" m-item item m-mobile-hide"><i class="clone outline icon"></i>分类管理</a>
        <a onclick="return alert('暂未开放...')" class=" m-item item m-mobile-hide"><i class="pencil alternate icon"></i>友链管理</a>
        <a onclick="return alert('暂未开放...')" class=" m-item item m-mobile-hide"><i class="image icon"></i>相册管理</a>
        <div class="right m-item m-mobile-hide menu">
          <div class="ui dropdown  item">
            <div class="text">
              <img class="ui avatar image" src="${pageContext.request.contextPath}/static/images/me.jpg" th:src="@{/images/me.jpg}">
              <span>oneStar</span>
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
        <a href="${pageContext.request.contextPath}/admin/blog/input.do" class="item">发布</a>
        <a href="${pageContext.request.contextPath}/admin/blogs.do?str=&category=0&pageNum=1" class="teal active item">列表</a>
      </div>
    </div>
  </div>
  </div>

  <br>
  <br>
  <br>

  <!--中间内容-->
  <div  class="">
    <div class="ui container">
      <div  class="ui secondary segment form">
        <input type="hidden" name="page" >
        <div class="inline fields">
          <div class="field">
            <input type="text" id="str" name="title" placeholder="标题" value="${str}">
          </div>
          <div class="field">
            <div class="ui labeled action input">
              <div class="ui type selection dropdown">
                <input type="hidden" name="typeId" value="${cid}">
                <i class="dropdown icon"></i>
                <div class="default text">分类</div>
                <div class="menu" id="checkbox">
                  <c:forEach items="${categories}" var="category">
                    <div class="item" data-value="${category.id}">${category.name}</div>
                  </c:forEach>
                </div>
              </div>
              <button id="clear-btn" class="ui compact button">clear</button>
            </div>

          </div>
          <!--<div class="field">-->
            <!--<div class="ui checkbox">-->
              <!--<input type="checkbox" id="recommend" name="recommend">-->
              <!--<label for="recommend">推荐</label>-->
            <!--</div>-->
          <!--</div>-->
          <div class="field">
            <button type="button" id="search-btn" class="ui mini teal basic button"><i class="search icon"></i>搜索</button>
          </div>
        </div>
      </div>
      <div id="table-container">
        <table class="ui compact teal table">
          <thead>
          <tr align="center">
            <th>ID</th>
            <th>标题</th>
            <th>类型</th>
            <th>推荐</th>
            <th>状态</th>
            <th>更新时间</th>
            <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${blogs}" var="blog" varStatus="now">
            <tr align="center">
              <td>${now.index+1}</td>
              <td>${blog.title}</td>
              <td>${blog.category}</td>
              <td>是</td>
              <td>文章</td>
              <td>${blog.createTime}</td>
              <td>
                <!--th:href="@{/admin/types/{id}/input(id=${type.id})}"-->
                <a href="${pageContext.request.contextPath}/admin/blog/edit.do?id=${blog.id}" class="ui mini teal basic button">编辑</a>
                <a href="#" id="delete" onclick="del(${blog.id})" class="ui mini red basic button">删除</a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
          <tfoot>
          <tr>
            <th colspan="7">
              <div class="ui inverted divided stackable grid">
                <div class="three wide column" align="center">
                  <a class="item" onclick="last(this)">上一页</a>
                </div>

                <div class="ten wide column" align="center">
                  <p>第 <span >${pageNum}</span> 页，共 <span>${pages}</span> 页
                </div>

                <div class="three wide column" align="center">
                  <a class="item" onclick="next(this)">下一页</a>
                </div>
              </div>
              <div align="center">
                <a href="${pageContext.request.contextPath}/admin/blog/input.do">
                  <button type="button" class="ui teal button m-mobile-wide m-margin-top"><i class="pencil icon"></i>新增</button>
                </a>
              </div>
            </th>
          </tr>
          </tfoot>
        </table>

<%--        <div class="ui success message">--%>
<%--          <i class="close icon"></i>--%>
<%--          <div class="">提示：操作成功！</div>--%>
<%--        </div>--%>

      </div>

    </div>
  </div>


  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
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

    //消息提示关闭初始化
    $('.message .close')
      .on('click', function () {
        $(this)
          .closest('.message')
          .transition('fade');
      });

    $('#clear-btn')
      .on('click', function() {
        $('.ui.type.dropdown')
          .dropdown('clear');
      });

    function page(obj) {
      $("[name='page']").val($(obj).data("page"));
      loaddata();
    }

    // $("#search-btn").click(function () {
    //   $("[name='page']").val(0);
    //   loaddata();
    // });
    // function loaddata() {
    //   $("#table-container").load(/*[[@{/admin/blogs/search}]]*/"/admin/blogs/search",{
    //     title : $("[name='title']").val(),
    //     typeId : $("[name='typeId']").val(),
    //     page : $("[name='page']").val()
    //   });
    // }

  </script>
</body>
</html>