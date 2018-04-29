<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="listusers.aspx.cs" Inherits="Movie.Web.Admin.ListUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="grid">
    </table>
    <div id="dataadd" style="width: 430px; height: 350px; display: none;">
        <form id="addform" method="post">
            <table class="grid">
                <tr>
                    <td>用户名：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="uname" id="add_uname" /></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="pwd" id="add_pwd" /></td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="realname" id="add_realname" /></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <select class="easyui-combobox" style="width: 160px;" name="sex" id="add_sex" data-options="editable:false">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>生日：</td>
                    <td>
                        <input data-options="editable:false,required:true,width:160" type="text" class="easyui-datebox" name="birthday" id="add_birthday" /></td>
                </tr>
                <tr>
                    <td>联系方式：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="contact" id="add_contact" /></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="email" id="add_email" /></td>
                </tr>
            </table>
        </form>

    </div>
    <div id="dataedit" style="width: 430px; height: 350px; display: none;">
        <form id="editform" method="post">
            <table class="grid">
                <tr>
                    <td>用户序号：</td>
                    <td>
                        <input data-options="readonly:true,width:160" type="text" class="easyui-textbox" name="id" id="edit_id" /></td>
                    <script>
                        $(function () {
                            $('#edit_id').textbox('textbox').css('background', '#E0E0E0');
                        })
                    </script>
                </tr>
                <tr>
                    <td>用户名：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="uname" id="edit_uname" /></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="pwd" id="edit_pwd" /></td>
                </tr>
                <tr>
                    <td>真实姓名：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="realname" id="edit_realname" /></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <select class="easyui-combobox" style="width: 160px;" name="sex" id="edit_sex" data-options="editable:false">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>生日：</td>
                    <td>
                        <input data-options="editable:false,required:true,width:160" type="text" class="easyui-datebox" name="birthday" id="edit_birthday" /></td>
                </tr>
                <tr>
                    <td>联系方式：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="contact" id="edit_contact" /></td>
                </tr>
                <tr>
                    <td>邮箱：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="email" id="edit_email" /></td>
                </tr>
            </table>
        </form>

    </div>
    <script src="js/listuser.js?v=<%=Guid.NewGuid().ToString().Replace("-","") %>"></script>
</asp:Content>
