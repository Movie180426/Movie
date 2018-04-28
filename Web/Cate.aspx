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
    <!--#include file="header.asp" -->
    <%
        string id = Request["id"].ToString();
        string str = "select * from cate where id = '" + id + "'";
        System.Data.DataTable dt = null;
        string name = "";
        foreach (System.Data.DataRow drX in dt.Rows)
        {

            name = drX["name"].ToString();
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

                            foreach (System.Data.DataRow drX in dt.Rows)
                            {
                        %>
                        <li><a href="context.php?id=<%=drX["id"].ToString() %>" target="_blank"><%=drX["title"].ToString() %></a></li>
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
                        dt = null;

                        foreach (System.Data.DataRow drX in dt.Rows)
                        {
                    %>
                    <li><a href="context.php?id=<%=drX["id"].ToString() %>" target="_blank"><%=drX["title"].ToString() %></a></li>
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
    <!--#include file="footer.asp" -->
</body>
</html>
