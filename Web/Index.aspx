﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Movie.Web.Index" %>

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

    <!--#include file="header.aspx" -->
    <div class="main">
        <div class="col-left">
            <div class="news-hot">
                <%
                    //"select * from article where istop = '是' order by id desc limit 5";
                    dt = dtTop;
                    foreach (DataRow drX in dt.Rows)
                    {
                        string sID = drX["sName"].ToString();
                %>
                <div class="content">
                    <h4 class="blue">
                        <a href="context.aspx?id=<%= drX["id"].ToString() %>" target="_blank">
                            <%= drX["title"].ToString() %>
                        </a>
                    </h4>
                    <div class="bk20 hr">
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
                                dt = dtTop;
                                foreach (DataRow drX in dt.Rows)
                                {
                                    string sID = drX["sName"].ToString();%>
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
                dt = dtTop;
                int i = 0;
                foreach (DataRow drX in dt.Rows)
                { %>
            <div class="box cat-area" <%  if (i % 2 != 0)
                                          { %> style="margin-right: 10px" <% } %>>
                <h5 class="title-1">
                    <%=drX["catename"].ToString() %>
                    <a href="cate.php?id=<%= drX["id"].ToString() %>" class="more">更多>></a>
                </h5>
                <div class="content">
                    <ul class="list lh24 f14">
                        <% 
                                          string _cate = drX["id"].ToString();
                                          string str1 = "select * from article where cateid = '" + _cate + "' order by id desc limit 5";
                                          DataTable art1 = dalArticle.GetList("").Tables[0];
                                          foreach (DataRow drX1 in art1.Rows)
                                          {
                        %>
                        <li>
                            <a href="context.php?id=<%= drX1["id"].ToString() %>" target="_blank" title="">
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

                            foreach (DataRow drX in dt.Rows)
                            { %>
                        <li>
                            <a href="context.php?id=<%=drX["id"].ToString() %>>" target="_blank"><%=drX["title"].ToString() %></a>
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
                    <%--<?php require 'vote.php'; ?>--%>
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