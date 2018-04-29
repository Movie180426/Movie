<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Movie.Web.Index" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>电影宣传网站</title>

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
    <div class="main">
        <div class="col-left">
            <div class="news-hot">
                <%
                    //"select * from article where istop = '是' order by id desc limit 5";
                    dt = dalArticle.GetList(5, "  istop = '是'  ", "id").Tables[0];
                    foreach (DataRow drX in dt.Rows)
                    {
                        string sID = drX["id"].ToString();
                %>
                <div class="content">
                    <h4 class="blue">
                        <a href="context.aspx?id=<%= drX["id"].ToString() %>" target="_blank">
                            <%= drX["title"].ToString() %>
                        </a>
                    </h4>
                    <div class="hr">
                        <hr />
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <div class="slide">
                <div class="FocusPic">
                    <div class="content" id="main-slide">
                        <div class="changeDiv">
                            <%
                                //select * from article where isimage = '是' order by id desc limit 5";
                                dt = dalArticle.GetList(5, "  isimage = '是'  ", "id").Tables[0];
                                foreach (DataRow drX in dt.Rows)
                                {
                                    string sID = drX["id"].ToString();%>
                            <a href="context.aspx?id=<%=drX["id"].ToString() %>" target="_blank"
                                title="<%=drX["title"].ToString() %>">
                                <img src="admin/<%=drX["image"].ToString() %>"
                                    alt="<%=drX["title"].ToString() %>" width="310" height="260" />
                            </a>
                            <% }
                            %>
                        </div>
                    </div>
                </div>
                <div class="bk10">
                </div>
            </div>
            <%
                //$str="select * from cate  order by id asc";
                dt = dtCate;
                int i = 0;
                foreach (DataRow drX in dt.Rows)
                { %>
            <div class="box cat-area" <%  if (i % 2 != 0)
                                          { %>
                style="margin-right: 10px" <% } %>>
                <h5 class="title-1">
                    <%=drX["catename"].ToString() %>
                    <a href="cate.aspx?id=<%= drX["id"].ToString() %>" class="more">更多>></a>
                </h5>
                <div class="content">
                    <ul class="list lh24 f14">
                        <% 
                                          string _cate = drX["id"].ToString();

                                          DataTable art1 = dalArticle.GetList(5, " cateid = '" + _cate + "' ", "id").Tables[0];
                                          foreach (DataRow drX1 in art1.Rows)
                                          {
                        %>
                        <li>
                            <a href="context.aspx?id=<%= drX1["id"].ToString() %>" target="_blank" title="">
                                <%=drX1["title"].ToString() %>
                            </a>
                        </li>
                        <%  } %>
                    </ul>
                </div>
            </div>
            <%
                                          i++;
                }
            %>
            <div class="bk10">
            </div>
        </div>
        <div class="col-auto">
            <div class="box">
                <h5 class="title-2">公告
						<a href="" class="more">&nbsp;</a>
                </h5>
                <div class="content">
                    <ul class="list lh24 f14">
                        <li>欢迎访问本站
                        </li>
                    </ul>
                </div>
            </div>
            <div class="bk10">
            </div>
            <div class="box">
                <h5 class="title-2">最新咨询
                </h5>
                <div class="tab-content">
                    <ul class="content digg">
                        <%
                            //$str="select * from article order by id desc limit 10";
                            dt = dtTop;
                            dt = dalArticle.GetList(10, "", "id").Tables[0];
                            foreach (DataRow drX in dt.Rows)
                            { %>
                        <li>
                            <a href="context.aspx?id=<%=drX["id"].ToString() %>>" target="_blank"><%=drX["title"].ToString() %></a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
            <div class="bk10">
            </div>
            <div class="box">
                <h5 class="title-2">调查问卷
                </h5>
                <div class="tab-content">
                    <%--<?php require 'vote.aspx'; ?>--%>
                </div>
            </div>
            <div class="bk10">
            </div>
        </div>
        <div class="bk10">
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            new slide("#main-slide", "cur", 310, 260, 1);//焦点图
            new SwapTab(".SwapTab", "span", ".tab-content", "ul", "fb");//排行TAB
        })
    </script>
</body>
</html>
