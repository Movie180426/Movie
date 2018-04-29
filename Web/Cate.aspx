<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cate.aspx.cs" Inherits="Movie.Web.Cate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="statics/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="statics/css/default_blue.css" rel="stylesheet"
        type="text/css" />
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
                            System.Data.DataTable dt = dalCate.GetList("").Tables[0];
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
                        <li><a href="Register.aspx"><span>用户注册</span> </a></li>
                        <li class="line">|</li>
                        <li><a href="Login.aspx"><span>用户登录</span> </a></li>
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
    <%
        string id = Request["id"].ToString();
        string str = "select * from cate where id = '" + id + "'";
        dt = dalCate.GetList(" id = '" + id + "' ").Tables[0];
        string name = "";
        foreach (System.Data.DataRow drX in dt.Rows)
        {

            name = drX["catename"].ToString();
        }
    %>
    <div class="main">
        <div class="col-left" style="width: 700px">
            <div class="box cat-area" style="width: 700px">
                <h5 class="title-1"><%=name %></h5>
                <div class="content">
                    <ul class="list  lh24 f14">
                        <%

                            str = "select * from article where cateid = '" + id + "' order by id desc";
                            dt = null;
                            dt = dalArticle.GetList(50, " cateid = '" + id + "' ", "id").Tables[0];
                            foreach (System.Data.DataRow drX in dt.Rows)
                            {
                        %>
                        <li><a href="context.aspx?id=<%=drX["id"].ToString() %>" target="_blank"><%=drX["title"].ToString() %></a></li>
                        <hr />
                        <%  } %>
                    </ul>
                </div>
            </div>
            <div class="bk10"></div>
        </div>
        <div class="col-auto">
            <div class="box">
                <h5 class="title-2">点击排行</h5>
                <ul class="content digg">
                    <%
                        str = "select * from article where cateid = '" + id + "' order by id desc";
                        dt = dalArticle.GetList(10, " cateid = '" + id + "' ", "id").Tables[0];
                        foreach (System.Data.DataRow drX in dt.Rows)
                        {
                    %>
                    <li><a href="context.aspx?id=<%=drX["id"].ToString() %>" target="_blank"><%=drX["title"].ToString() %></a></li>
                    <hr />
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ChannelSlide(Name, Class) {
            $(Name + ' ul.photo li').sGallery({
                titleObj: Name + ' div.title p',
                thumbObj: Name + ' .thumb li',
                thumbNowClass: Class
            });
        }
        new ChannelSlide(".channel-slide", "on", 311, 260);
    </script>
   
</body>
</html>
