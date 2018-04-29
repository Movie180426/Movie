<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="listvote.aspx.cs" Inherits="Movie.Web.Admin.listvote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="grid">
    </table>
    <div id="dataadd" style="width: 430px; height: 150px; display: none;">
        <form id="addform" method="post">
            <table class="grid">
                <tr>
                    <td>选项：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="title" id="add_title" /></td>
                </tr>
            </table>
        </form>

    </div>
    <div id="dataedit" style="width: 430px; height: 150px; display: none;">
        <form id="editform" method="post">
            <table class="grid">
                <tr>
                    <td>序号：</td>
                    <td>
                        <input data-options="readonly:true,width:160" type="text" class="easyui-textbox" name="id" id="edit_id" /></td>
                    <script>
                        $(function () {
                            $('#edit_id').textbox('textbox').css('background', '#E0E0E0');
                        })
                    </script>
                </tr>
                <tr>
                    <td>选项：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="title" id="edit_title" /></td>
                </tr>
            </table>
        </form>

    </div>
    <script src="js/listvote.js"></script>
</asp:Content>
