<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="listcate.aspx.cs" Inherits="Movie.Web.Admin.listcate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <table id="grid">
    </table>
    <div id="dataadd" style="width: 430px; height: 150px; display: none;">
        <form id="addform" method="post">
            <table class="grid">
                <tr>
                    <td>电影类别：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="catename" id="add_catename" /></td>
                </tr>
            </table>
        </form>
    </div>
    <div id="dataedit" style="width: 430px; height: 283px; display: none;">
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
                    <td>电影类别：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="catename" id="edit_catename" /></td>
                </tr>
            </table>
        </form>

    </div>
    <script src="js/listcate.js?v=<%=Guid.NewGuid().ToString().Replace("-","") %>"></script>
</asp:Content>
