<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="listarticle.aspx.cs" Inherits="Movie.Web.Admin.listarticle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script src="../Scripts/Ueditor/ueditor.config.js"></script>
    <script src="../Scripts/Ueditor/ueditor.all.min.js"></script>
    <script src="../Scripts/Ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="../Scripts/Ueditor/ueditor.parse.min.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table id="grid">
    </table>
    <div id="dataadd" style="width: 800px; height: 500px; display: none;">
        <form id="addform" method="post">
            <table class="grid">
                <tr>
                    <td>标题：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="title" id="add_title" /></td>
                </tr>
                <tr>
                    <td>类别：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-combobox" name="cateid" id="add_cateid" /></td>
                </tr>
                <tr>
                    <td>图片：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="image" id="add_image" /></td>
                </tr>
                <tr>
                    <td>内容：</td>
                    <td>
                        <input class="easyui-textbox"  style="width:680px;height:300px" data-options="multiline:true"  name="contents" id="add_contents" />
                    </td>
                </tr>
                <tr>
                    <td>是否置顶：</td>
                    <td>
                        <input type="radio" name="istop" id="add_toped" value="是"/><label for="add_toped">是</label>
                        <input type="radio" name="istop" id="add_notop" value="否" /><label for="add_notop">否</label>
                    </td>
                </tr>

                <tr>
                    <td>是否轮播：</td>
                    <td>
                        <input type="radio" name="isimage" id="add_imaged" value="是"/><label for="add_imaged">是</label>
                        <input type="radio" name="isimage" id="add_noimaged" value="否"/><label for="add_noimaged">否</label>
                    </td>

                </tr>
            </table>
        </form>

    </div>
    <div id="dataedit" style="width: 800px; height: 500px; display: none;">
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
                    <td>标题：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="title" id="edit_title" /></td>
                </tr>
                <tr>
                    <td>类别：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-combobox" name="cateid" id="edit_cateid" /></td>
                </tr>
                <tr>
                    <td>图片：</td>
                    <td>
                        <input data-options="required:true,width:160" type="text" class="easyui-textbox" name="image" id="edit_image" /></td>
                </tr>
                <tr>
                    <td>内容：</td>
                    <td>
                        <input class="easyui-textbox"  style="width:680px;height:300px" data-options="multiline:true" name="contents" id="edit_contents"/>
                    </td>
                </tr>
                <tr>
                    <td>是否置顶：</td>
                    <td>
                        <input type="radio" name="istop" id="edit_toped" value="是"/><label for="edit_toped">是</label>
                        <input type="radio" name="istop" id="edit_notop" value="否" /><label for="edit_notop">否</label>
                    </td>
                </tr>

                <tr>
                    <td>是否轮播：</td>
                    <td>
                        <input type="radio" name="isimage" id="edit_imaged" value="是"/><label for="edit_imaged">是</label>
                        <input type="radio" name="isimage" id="edit_noimaged" value="否"/><label for="edit_noimaged">否</label>
                    </td>

                </tr>
            </table>
        </form>

    </div>
    <script src="js/listarticle.js"></script>
</asp:Content>
