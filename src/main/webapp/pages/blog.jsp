<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.w3.org/1999/xhtml">
<%@ page isELIgnored="false" language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link href="../static/images/me.jpg" th:href="@{/images/me.jpg}" rel="icon" type="image/x-ico">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/semantic-ui/2.2.4/semantic.min.css">
  <link rel="stylesheet" href="../static/css/typo.css" th:href="@{/css/typo.css}">
  <link rel="stylesheet" href="../static/css/animate.css" th:href="@{/css/animate.css}">
  <link rel="stylesheet" href="../static/lib/prism/prism.css" th:href="@{/lib/prism/prism.css}">
  <link rel="stylesheet" href="../static/lib/tocbot/tocbot.css" th:href="@{/lib/tocbot/tocbot.css}">
  <link rel="stylesheet" href="../static/css/me.css" th:href="@{/css/me.css}">
  <link rel="stylesheet" href="../static/css/timeline.css" th:href="@{/css/timeline.css}">
  <script src="../static/js/jquery-3.3.1.min.js"></script>

  <script>
    let res = 0;
    let last_id = 0;

    function like(e) {
      e.innerHTML = "已点赞";
    }

    function reply(e,id,isResponse) {
      if(last_id == id){
        $(e).css("color","#A9A9A9")
        last_id = 0;
        res = 0;
        return;
      }
      $(e).css("color","black");
      last_id = id;
      if(isResponse == 0) res = id;
      else res = isResponse;
    }

   $(function () {
     $("#commentpost-btn").click(function () {
       let content = $("#form_content").val();
       let username = $("#form_username").val();
       if(content == null) {
         alert("请输入内容");
         return;
       }else if(username == null){
         alert("请输入名称");
         return;
       }
       $.post("${pageContext.request.contextPath}/comment/save.do",{username: username,content: content,bId: ${id},isResponse: res,id: ${id}},function (data) {
         alert("回复成功！");
         window.location.href = "${pageContext.request.contextPath}/blog/show.do?id="+${id};
       },"text");
     })
   })



  </script>
</head>
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
<div class="m-bg-type_outer" style="width: 100%;height: 50%">
  <img src="../static/images/bg.jpg" alt="" class="ui m-bg image" style="width: 100%;height: 100%">
  <div class="m-bg-class_cover">
    <div class="ui container" style="position: relative ;bottom: -540px;">
      <h2 class="m-font-size-title-large" align="center">${blog.title}</h2>
      <div class="ui container" align="center">
        <div class="ui horizontal link list" align="center">
          <div class="item">
            <div class="ui orange basic label" style="font-size: 7px">
              <c:if test="${blog.type == 1}">
                原创
              </c:if>
              <c:if test="${blog.type == 2}">
                转载
              </c:if>
              <c:if test="${blog.type == 3}">
                翻译
              </c:if>
            </div>
          </div>
          <div class="item">
            <i class="user outline outline icon m-font-size-text-mini"></i>
            <a href="#" style="color: #ffffff;font-size: 18px">MoonQuakes</a>
          </div>
          <div class="item">
            <i class="calendar icon m-font-size-text-mini"></i>
            <span class="m-font-size-text-mini">${blog.createTime}</span>
          </div>
          <div class="item">
            <i class="clone icon m-font-size-text-mini"></i>
            <a href="#" target="_blank" style="color: #ffffff;font-size: 16px">${blog.category}</a>
          </div>
          <div class="item">
            <i class="eye icon m-font-size-text-mini"></i> <span class="m-font-size-text-mini">${blog.viewNumber}</span>
          </div>
          <div class="item">
            <i class="comment outline icon m-font-size-text-mini"></i>
            <span class="m-font-size-text-mini">${blog.commentNumber}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--中间内容-->
<div id="waypoint" class="m-margin- animated fadeIn">
  <div class="ui container m-opacity box-shadow-max">
    <!--内容-->
    <div class="ui attached padded segment">


      <!--中间主要内容部分-->
      <div id="content" class="typo  typo-selection js-toc-content m-padded-lr-responsive m-padded-tb-large">
        ${blog.content}

      </div>

      <div class="ui horizontal divider">end</div>


      <!--赞赏-->
      <div >
        <div class="ui center aligned basic segment">
          <button id="payButton" class="ui orange basic circular button" onclick="like(this)">点赞</button>
        </div>

      </div>

    </div>

    <div  class="ui bottom attached segment">
      <!--评论区域列表-->
      <div id="comment-container"  class="ui teal segment">
        <div>
          <div class="ui threaded comments" style="max-width: 100%;">
            <h3 class="ui dividing header">评论</h3>
            <div class="comment">
            <c:forEach items="${mcomments}" var="comment" varStatus="status">
              <a class="avatar">
                <img src="../static/images/touxiang.jpg">
              </a>
              <div class="content">
                <a class="author" >
                  <span>${comment.username}</span>
                </a>
                <div class="text">
                  ${comment.content}
                </div>
                <div class="actions">
                  <a class="reply" href="javascript:void(0);" onclick="reply(this,${comment.id},${comment.isResponse})">回复</a>
                  <a class="delete" href="#" onclick="return confirm('没有删除权限')" th:if="${session.user}">删除</a>
                </div>
              </div>

              <div class="comments">
              <c:forEach items="${ncomments.get(status.index)}" var="comment2">
                <!--子集评论-->
                  <div class="comment">
                    <a class="avatar">
                      <img src="../static/images/touxiang.jpg">
                    </a>
                    <div class="content">
                      <a class="author" >
                        <span>${comment2.username}</span>
                      </a>
                      <div class="text">
                        ${comment2.content}
                      </div>
                      <div class="actions">
                        <a class="reply" href="javascript:void(0);" onclick="reply(this,${comment.id},${comment.isResponse})">回复</a>
                        <a class="delete" href="#" onclick="return confirm('没有删除权限')" th:if="${session.user}">删除</a>
                      </div>
                    </div>
                  </div>
              </c:forEach>
              </div>
            </c:forEach>

            </div>

          </div>
        </div>
      </div>
      <div id="comment-form" class="ui form">
        <input type="hidden" name="blogId">
        <input type="hidden" name="parentComment.id" value="-1">
        <div class="field">
          <textarea id="form_content" name="content" placeholder="请输入评论信息..."></textarea>
        </div>
        <div class="fields">
          <div class="field m-mobile-wide m-margin-bottom-small">
            <div class="ui left icon input">
              <i class="user icon"></i>
              <input id="form_username" type="text" name="nickname" placeholder="姓名">
            </div>
          </div>
          <div class="field  m-margin-bottom-small m-mobile-wide">
            <button id="commentpost-btn" type="button" class="ui teal button m-mobile-wide"><i class="edit icon"></i>发布</button>
          </div>
        </div>

      </div>
    </div>
  </div>
</div>

<div id="toolbar" class="m-padded m-fixed m-right-bottom" style="display: none">
  <div class="ui vertical icon buttons ">
    <button type="button" class="ui toc teal button" >目录</button>
    <a href="#comment-container" class="ui teal button" >评论</a>
    <div id="toTop-button" class="ui icon button" ><i class="chevron up icon"></i></div>
  </div>
</div>

<div class="ui toc-container flowing popup transition hidden" style="width: 250px!important;">
  <ol class="js-toc">

  </ol>
</div>

<div id="qrcode" class="ui wechat-qr flowing popup transition hidden "style="width: 130px !important;">
  <!--<img src="./static/images/wechat.jpg" alt="" class="ui rounded image" style="width: 120px !important;">-->
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
              热门文章： <h2 class="ui orange header m-inline-block m-margin-top-null" style="font-size:medium;"> ${info.hotNum} </h2> 条
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
<script src="//cdn.jsdelivr.net/npm/jquery.scrollto@2.1.2/jquery.scrollTo.min.js"></script>
<script src="../static/lib/qrcode/qrcode.min.js" th:src="@{/lib/qrcode/qrcode.min.js}"></script>
<script src="../static/lib/prism/prism.js" th:src="@{/lib/prism/prism.js}"></script>
<script src="../static/lib/tocbot/tocbot.min.js" th:src="@{/lib/tocbot/tocbot.min.js}"></script>
<script src="../static/lib/waypoints/jquery.waypoints.min.js" th:src="@{/lib/waypoints/jquery.waypoints.min.js}"></script>


<script th:inline="javascript">

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

    $('#payButton').popup({
        popup : $('.payQR.popup'),
        on : 'click',
        position: 'bottom center'
    });

    tocbot.init({
        // Where to render the table of contents.
        tocSelector: '.js-toc',
        // Where to grab the headings to build the table of contents.
        contentSelector: '.js-toc-content',
        // Which headings to grab inside of the contentSelector element.
        headingSelector: 'h1, h2, h3',
    });

    $('.toc.button').popup({
        popup : $('.toc-container.popup'),
        on : 'click',
        position: 'left center'
    });

    $('.wechat').popup({
        popup : $('.wechat-qr'),
        position: 'left center'
    });

    var serurl = /*[[#{blog.serurl}]]*/"127.0.0.1:8080";
    var url = /*[[@{/blog/{id}(id=${blog.id})}]]*/"";
    var qrcode = new QRCode("qrcode", {
        text: serurl+url,
        width: 110,
        height: 110,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });

    $('#toTop-button').click(function () {
        $(window).scrollTo(0,500);
    });


    var waypoint = new Waypoint({
        element: document.getElementById('waypoint'),
        handler: function(direction) {
            if (direction == 'down') {
                $('#toolbar').show(100);
            } else {
                $('#toolbar').hide(500);
            }
            console.log('Scrolled to waypoint!  ' + direction);
        }
    })


    //评论表单验证
    $('.ui.form').form({
        fields: {
            title: {
                identifier: 'content',
                rules: [{
                    type: 'empty',
                    prompt: '请输入评论内容'
                }
                ]
            },
            content: {
                identifier: 'nickname',
                rules: [{
                    type: 'empty',
                    prompt: '请输入你的大名'
                }]
            },
            type: {
                identifier: 'email',
                rules: [{
                    type: 'email',
                    prompt: '请填写正确的邮箱地址'
                }]
            }
        }
    });

    // $(function () {
    //     $("#comment-container").load(/*[[@{/comments/{id}(id=${blog.id})}]]*/"comments/6");
    // });



    // $('#commentpost-btn').click(function () {
    //     var boo = $('.ui.form').form('validate form');
    //     if (boo) {
    //         console.log('校验成功');
    //         postData();
    //     } else {
    //         console.log('校验失败');
    //     }
    // });

    // function postData() {
    //     $("#comment-container").load(/*[[@{/comments}]]*/"",{
    //         "parentComment.id" : $("[name='parentComment.id']").val(),
    //         "blogId" : $("[name='blogId']").val(),
    //         "nickname": $("[name='nickname']").val(),
    //         "email"   : $("[name='email']").val(),
    //         "content" : $("[name='content']").val()
    //     },function (responseTxt, statusTxt, xhr) {
    //         $(window).scrollTo($('#goto'),500);
    //         clearContent();
    //     });
    // }

    function clearContent() {
        $("[name='nickname']").val('');
        $("[name='email']").val('');
        $("[name='content']").val('');
        $("[name='parentComment.id']").val(-1);
        $("[name='content']").attr("placeholder", "请输入评论信息...");
    }

    // function reply(obj) {
    //     var commentId = $(obj).data('commentid');
    //     var commentNickname = $(obj).data('commentnickname');
    //     $("[name='content']").attr("placeholder", "@"+commentNickname).focus();
    //     $("[name='parentComment.id']").val(commentId);
    //     $(window).scrollTo($('#comment-form'),500);
    // }


</script>
</body>
</html>