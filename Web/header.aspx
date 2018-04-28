<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="header.aspx.cs" Inherits="Movie.Web.header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>

</head>
<body>
    <div>
        <div class="body-top">
            <div class="content">
                <% if (string.IsNullOrEmpty(userName))
                   { %>
欢迎您, <%= userName %> <% } %>
            </div>
        </div>
        <div class="header">
            <div class="logo">
                <img src="statics/images/v9/logo.jpg" /></div>
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
                                string sID = drX["sName"].ToString();
                        %>
                        <li class="line">|</li>
                        <li><a href="cate.aspx?id=<%=drX["catename"] %>"><span><%= drX["catename"] %> </span>
                        </a></li>
                        <% } %>
                        <% 
                            if (userName.Trim() != "")
                            { 
                        %>
                        <li class="line">|</li>
                        <li><a href="reg.php"><span>用户注册</span> </a></li>
                        <li class="line">|</li>
                        <li><a href="login.php"><span>用户登录</span> </a></li>
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
</body>
</html>
