<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="editpwd.aspx.cs" Inherits="Movie.Web.Admin.editpwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="changepwd" style="width: 430px; height: 283px;">
        <form id="changeform" method="post">
            <table class="grid">
                <tr>
                    <td>原始密码：</td>
                    <td>
                        <input data-options="required:true,width:160" type="password" class="easyui-textbox" name="oldpwd" id="oldpwd" /></td>
                </tr>
                <tr>
                    <td>新密码：</td>
                    <td>
                        <input id="pwd" name="pwd" type="password" class="easyui-textbox" data-options="required:true,width:160" />
                    </td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td>
                        <input id="repeatpwd" name="repeatpwd" type="password" class="easyui-textbox" data-options="width:160" required="required" validtype="equals['#pwd']" />
                    </td>
                </tr>
                <%-- <tr>
                    <td>新密码：</td>
                    <td>
                        <input data-options="required:true,width:160" type="password" class="easyui-textbox" name="pwd" id="pwd" /></td>
                </tr>
                <tr>
                    <td>确认密码：</td>
                    <td>
                        <input data-options="required:true,width:160" type="password" class="easyui-textbox" id="repeatpwd" onblur="repeat()" /></td>
                </tr>--%>
            </table>
        </form>

    </div>
    <script src="js/editpwd.js"></script>
</asp:Content>
