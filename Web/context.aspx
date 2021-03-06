﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="context.aspx.cs" Inherits="Movie.Web.context" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="statics/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="statics/css/default_blue.css" rel="stylesheet"
        type="text/css" />
    <link href="admin/css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="statics/js/jquery.min.js"></script>
    <script type="text/javascript" src="statics/js/jquery.sgallery.js"></script>
    <script type="text/javascript" src="statics/js/search_common.js"></script>
</head>

<body>
    <div>
        <div class="body-top">
            <div class="content">
               <% if (user != null)
                   { %>
欢迎您: <%= user.uname %> <% } %>
            </div>
        </div>
        <div class="header">
            <div class="logo">
                <img src="statics/images/v9/logo.jpg" />
            </div>
            <div class="banner"></div>
            <div class="bk3"></div>
            <div class="nav-bar">
                <map>
                    <ul class="nav-site">
                        <li><a href="index.aspx"><span>首页</span> </a></li>
                        <%
                            System.Data.DataTable dt = dtCate;
                            foreach (System.Data.DataRow drX in dt.Rows)
                            {
                                string sID = drX["id"].ToString();
                        %>
                        <li class="line">|</li>
                        <li><a href="cate.aspx?id=<%=drX["id"] %>"><span><%= drX["catename"] %> </span>
                        </a></li>
                        <% } %>
                        <% 
                            if (user == null)
                            { 
                        %>
                        <li class="line">|</li>
                        <li><a href="register.aspx"><span>用户注册</span> </a></li>
                        <li class="line">|</li>
                        <li><a href="login.aspx"><span>用户登录</span> </a></li>
                        <% }
                            else
                            { 
                        %>
                        <li class="line">|</li>
                        <li><a href="exit.aspx"><span>退出系统</span> </a></li>
                        <%} %>
                    </ul>
                </map>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="col-left">
            <div class="crumbs">
                <a href="index.aspx">首页</a><span> &gt; </span>分类 >>正文
            </div>
            <%
                string id = Request["id"].ToString();
                dt = dalArticle.GetList(" id = '" + id + "' ").Tables[0];
                foreach (System.Data.DataRow drX in dt.Rows)
                {
            %>
            <div id="Article">
                <h1><%=drX["title"].ToString() %><br />
                    <span>日期：<%=drX["addtime"] %>&nbsp;&nbsp;&nbsp;</span></h1>
                <% if (drX["title"].ToString() != "")
                   { %>
                <div class="summary">
                    <%  if (drX["image"].ToString() != "")
                        { %>
                    <div align="center">
                        <img src="admin/<%=drX["image"].ToString() %>" alt=""
                            title="" width="310" height="260" />
                    </div>
                    <% } %>
                </div>
                <% } %>
                <div class="content"><%=drX["contents"].ToString() %></div>
                <div id="pages" class="text-c"></div>
                <div class="bk15"></div>
            </div>
            <%
                }
            %>
            <div class="Article-Toolx">
                <div align="left">
                    <table class="table" cellspacing="1" cellpadding="2" width="99%"
                        align="center" border="0">
                        <%
                            //str = "select * from topic where articleid = '" + id + "'";
                            dt = dalTopic.GetList(" articleid = '" + id + "' ").Tables[0];
                            foreach (System.Data.DataRow drX in dt.Rows)
                            {
                        %>
                        <tr>
                            <td class="td_bg" align="center" height="23"><%=drX["contents"].ToString() %></td>
                            <td class="td_bg" align="center" height="23"><%=drX["addtime"].ToString() %></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
            <%   
                if (user != null)
                 { %>
            <div class="Article-Toolx">
                <div align="left">
                    <form action="TopicHandler.ashx?Mth=InsertTopic" method="post">
                        <input type="hidden"
                            name="usersid" value="<%=user.id %>" />
                        <input
                            type="hidden" name="articleid" value="<%=id %>" />
                        在线评论
                        <textarea
                            rows="" cols="" name="contents"></textarea>
                        <input type="submit"
                            value="确定" />
                    </form>
                </div>
                <div class="bk10"></div>
                <div class="bk10"></div>

                <br />
                <br />
                <br />
            </div>
            <% } %>
            <div class="bk10"></div>
            <div class="bk10"></div>
            <div class="bk10"></div>
            <div class="Article-Tool">
                分享到：
                <img
                    src="http://v.t.qq.com/share/images/s/weiboicon16.png"
                    style="padding-bottom: 3px;" onclick="postToWb();" class="cu"
                    title="分享到腾讯微博" />
                <script type="text/javascript">
                    function postToWb() {
                        var _t = encodeURI(document.title);
                        var _url = encodeURIComponent(document.location);
                        var _appkey = encodeURI("cba3558104094dbaa4148d8caa436a0b");
                        var _pic = encodeURI('{$thumb}');
                        var _site = '';
                        var _u = 'http://v.t.qq.com/share/share.php?url=' + _url + '&appkey=' + _appkey + '&site=' + _site + '&pic=' + _pic + '&title=' + _t;
                        window.open(_u, '', 'width=700, height=680, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, location=yes, resizable=no, status=no');
                    }
                </script>
                <script type="text/javascript">document.write('<a href="http://v.t.sina.com.cn/share/share.php?url=' + encodeURIComponent(location.href) + '&appkey=3172366919&title=' + encodeURIComponent('{new_addslashes($title)}') + '" title="分享到新浪微博" class="t1" target="_blank">&nbsp;</a>');</script>

                <script type="text/javascript">document.write('<a href="http://www.douban.com/recommend/?url=' + encodeURIComponent(location.href) + '&title=' + encodeURIComponent('{new_addslashes($title)}') + '" title="分享到豆瓣" class="t2" target="_blank">&nbsp;</a>');</script>

                <script type="text/javascript">document.write('<a href="http://share.renren.com/share/buttonshare.do?link=' + encodeURIComponent(location.href) + '&title=' + encodeURIComponent('{new_addslashes($title)}') + '" title="分享到人人" class="t3" target="_blank">&nbsp;</a>');</script>

                <script type="text/javascript">document.write('<a href="http://www.kaixin001.com/repaste/share.php?rtitle=' + encodeURIComponent('{new_addslashes($title)}') + '&rurl=' + encodeURIComponent(location.href) + '&rcontent=" title="分享到开心网" class="t4" target="_blank">&nbsp;</a>');</script>

                <script type="text/javascript">document.write('<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + encodeURIComponent(location.href) + '" title="分享到QQ空间" class="t5" target="_blank">&nbsp;</a>');</script>

            </div>
            <div class="bk10"></div>
        </div>
        <div class="col-auto">
            <div class="box">
                <h5 class="title-2">点击排行</h5>
                <ul class="content digg">
                    <%
                       // str = "select * from article order by id desc limit 10";
                        dt = dalArticle.GetList(10, "", "id").Tables[0];
                        foreach (System.Data.DataRow drX in dt.Rows)
                        {
                    %>
                    <li><a href="context.aspx?id=<%=drX["id"].ToString() %>" target="_blank"><%=drX["title"].ToString() %></a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer">
        <p class="info"><a href="admin/index.aspx">后台管理</a></p>
    </div>

    <script type="text/javascript">
        $(function () {
            $(".picbig").each(function (i) {
                var cur = $(this).find('.img-wrap').eq(0);
                var w = cur.width();
                var h = cur.height();
                $(this).find('.img-wrap img').LoadImage(true, w, h, '{IMG_PATH}msg_img/loading.gif');
            });
        })
    </script>
</body>
</html>
