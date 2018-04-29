<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Movie.Web.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录</title>
    <style type="text/css">
        body, ol, ul, h1, h2, h3, h4, h5, h6, p, th, td, dl, dd, form, fieldset, legend, input, textarea, select {
            margin: 0;
            padding: 0;
        }

        body {
            font: 12px "宋体","Arial Narrow",HELVETICA;
            background: #fff;
            -webkit-text-size-adjust: 100%;
        }

        body {
            background: #F1F9FF url(../Content/img/loginbg.png) no-repeat center 0;
        }

        .login {
            width: 420px;
            height: 227px;
            padding-top: 194px;
            padding-left: 224px;
            margin: 0 auto;
            margin-top: 80px;
            background: url(../Content/img/login_b.png) no-repeat;
        }

            .login .input_txt {
                width: 250px;
                height: 28px;
                padding: 2px 3px 2px 34px;
                line-height: 28px;
                margin-bottom: 12px;
                border: 0 none;
                background: none;
            }

            .login .lbl_prompt {
                width: 103px;
                height: 28px;
                padding: 2px;
                border: 0 none;
                background: none;
                line-height: 28px;
            }

            .login .login_btn {
                width: 154px;
                height: 46px;
                margin-top: 16px;
                border: 0 none;
                background: none;
            }

        img {
            vertical-align: middle;
            border: 0px;
        }

        #lblStatus {
            font-size: large;
            color: red;
        }
    </style>
    <script src="../Scripts/jquery-1.10.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <p>
                <asp:TextBox ID="txtName" CssClass="input_txt" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:TextBox ID="txtPassWord" CssClass="input_txt" runat="server" TextMode="Password" />
            </p>
            <p>
                <asp:Label ID="lblStatus" runat="server" Text="" CssClass="lbl_prompt"></asp:Label>
            </p>
            <p>
                <asp:Button ID="btnLogin1" runat="server" CssClass="login_btn" Text="" OnClick="btnLogin1_Click" />

            </p>
            <br />
        </div>
    </form>
</body>
</html>
