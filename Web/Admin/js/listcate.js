$(function () {
    var size = { width: $(window).width() - 210, height: $(window).height() - 160 };//获取浏览器大小 
    //var size = { width: 800, height: $(window).height()-160 };//获取浏览器大小 
    mygrid.gridDefine(size);
    mygrid.gridBind();
});


var grid;
var mygrid = {
    gridDefine: function (winSize) {
        grid = $('#grid').datagrid({
            toolbar: '#toolbar',
            title: "电影类别列表",
            iconCls: 'icon icon-list',
            nowrap: false,
            rownumbers: true,
            width: winSize.width,
            height: winSize.height,
            frozenColumns: [[]],
            columns: [[
                { title: '序号', field: 'id', width: 200 },
                { title: '电影类别', field: 'catename', width: 300 },
                {
                    title: "操作 <a href='javascript:void(0)' onclick='mygrid.gridAdd()'>【增加】</a>", field: 'edit', width: 200, formatter: function (value, row, index) {
                        var a = "<a href='javascript:void(0)' onclick='mygrid.gridAdd()'>【增加】</a> | <a href='javascript:void(0)' onclick='mygrid.gridEdit(" + index + ")'>【编辑】</a> | <a href='javascript:void(0)' onclick='mygrid.gridDelet(" + row.id + ")'>【删除】</a>";
                        return a;
                    }
                }

            ]],
            pagination: true,
            pageSize: 20,
            checkOnSelect: false,
            onClickRow: function () {
                $('#grid').datagrid('clearSelections');
            },
        });
    },
    gridBind: function (equipFilter) {
        grid.datagrid({
            url: '../Controler/grid.ashx?action=query&tableName=cate',
            onLoadSuccess: function (row) {//当表格成功加载时执行               
                var rowData = row.rows;
            }
        });
    },
    gridAdd: function ()
    {
        $('#addform').form('reset');
        $('#dataadd').show();
        $('#dataadd').dialog({
            collapsible: true,
            minimizable: false,
            maximizable: false,
            resizable: false,
            modal: true,
            title: '添加电影类别',
            buttons: [{
                text: '确定',
                handler: function () {
                    if (!$('#addform').form('validate'))
                        return;
                    $.ajax({
                        type: "GET",
                        url: "../Controler/cate.ashx?action=AddCate",
                        data: $('#addform').serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 'success') {
                                $('#dataadd').dialog('close');
                                mygrid.gridBind();
                            }
                            else {
                                $.messager.show({
                                    title: '添加电影类别',
                                    msg: data.message,
                                    timeout: 2000,
                                    showType: 'slide'
                                });
                            }

                        }
                    });
                }
            },
            {
                text: '取消',
                handler: function () {
                    $('#dataadd').dialog('close');
                }
            }]
        });
    },
    gridEdit: function (index)
    {
        var rows = $('#grid').datagrid('getRows');//获得所有行
        var row = rows[index];//根据index获得其中一行。
        $('#editform').form('reset');
        $("#edit_id").textbox('setValue', row.id);
        $("#edit_catename").textbox('setValue', row.catename);


        $('#dataedit').show();
        $('#dataedit').dialog({
            collapsible: true,
            minimizable: false,
            maximizable: false,
            resizable: false,
            modal: true,
            title: '编辑电影类别',
            buttons: [{
                text: '确定',
                handler: function () {
                    if (!$('#editform').form('validate'))
                        return;
                    $.ajax({
                        type: "GET",
                        url: "../Controler/cate.ashx?action=EditCate",
                        data: $('#editform').serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 'success') {
                                $('#dataedit').dialog('close');
                                mygrid.gridBind();
                            }
                            else {
                                $.messager.show({
                                    title: '编辑电影类别',
                                    msg: data.message,
                                    timeout: 2000,
                                    showType: 'slide'
                                });
                            }

                        }
                    });
                }
            },
            {
                text: '取消',
                handler: function () {
                    $('#dataedit').dialog('close');
                }
            }]
        });
    },
    gridDelet: function (id)
    {
        $.messager.confirm('删除', '是否确认删除?', function (r) {
            if (r) {
                $.ajax({
                    type: "GET",
                    url: "../Controler/grid.ashx?action=delete&tableName=cate",
                    data: { id: id },
                    dataType: "json",
                    success: function (data) {
                        $.messager.show({
                            title: '删除结果',
                            msg: data.result=='success' ? "删除成功" : "删除失败，请重试",
                            timeout: 2000,
                            showType: 'slide'
                        });
                        mygrid.gridBind();
                    }
                });
            }
        });
    }
}
