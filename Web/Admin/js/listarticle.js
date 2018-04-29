$(function () {
    var size = { width: $(window).width() - 210, height: $(window).height() - 160 };//获取浏览器大小 
    //var size = { width: 800, height: $(window).height()-160 };//获取浏览器大小 
    mygrid.gridDefine(size);
    mygrid.gridBind();


    $.ajax({
        type: "get",                                            // 使用post方法访问后台
        dataType: "json",                                        // 返回json格式的数据
        url: "../Controler/grid.ashx?action=query&tableName=cate",                                    // 要访问的后台地址
        success: function (result) {// result为返回的数据
            $('#add_cateid').combobox({
                data: result.rows,
                valueField: 'id',
                textField: 'catename'
            });
            $('#edit_cateid').combobox({
                data: result.rows,
                valueField: 'id',
                textField: 'catename'
            });
        }
    });
  
});


var grid;
var mygrid = {
    gridDefine: function (winSize) {
        grid = $('#grid').datagrid({
            toolbar: '#toolbar',
            title: "电影内容信息列表",
            iconCls: 'icon icon-list',
            nowrap: false,
            rownumbers: true,
            width: winSize.width,
            height: winSize.height,
            frozenColumns: [[]],
            columns: [[
                { title: '序号', field: 'id', width: 50 },
                { title: '标题', field: 'title', width: 150 },
                { title: '类别', field: 'catename', width: 80 },
                { title: '图片', field: 'image', width: 200 },
                { title: '评分', field: 'score', width: 50 },
                { title: '评分人数', field: 'scorenum', width: 80},
                { title: '是否置顶', field: 'istop', width: 80 },
                { title: '是否轮播', field: 'isimage', width: 80 },
                { title: '发布日期', field: 'addtime', width: 100 },
                 {
                     title: "操作 <a href='javascript:void(0)' onclick='mygrid.gridAdd()'>【增加】</a>", field: 'edit', width: 200, formatter: function (value, row, index) {
                         var a = "<a href='javascript:void(0)' onclick='mygrid.gridAdd()'>【增加】</a> | <a href='javascript:void(0)' onclick='mygrid.gridEdit(" + index + ")'>【编辑】</a> | <a href='javascript:void(0)' onclick='mygrid.gridDelet(" + row.id + ")'>【删除】</a>";
                         return a;
                     }
                 }

            ]],
            pagination: true,
            pageSize: 20,
            checkOnSelect: false, onClickRow: function () {
                $('#grid').datagrid('clearSelections');
            },
        });
    },
    gridBind: function (equipFilter) {
        grid.datagrid({
            url: '../Controler/grid.ashx?action=query&tableName=v_article',
            onLoadSuccess: function (row) {//当表格成功加载时执行               
                var rowData = row.rows;
            }
        });
    },
    gridAdd: function () {
        $('#addform').form('reset');
        $('#dataadd').show();
        $('#dataadd').dialog({
            collapsible: true,
            minimizable: false,
            maximizable: false,
            resizable: false,
            modal: true,
            title: '添加电影内容',
            buttons: [{
                text: '确定',
                handler: function () {
                    if (!$('#addform').form('validate'))
                        return;
                    $.ajax({
                        type: "GET",
                        url: "../Controler/article.ashx?action=AddArticle",
                        data: $('#addform').serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 'success') {
                                $('#dataadd').dialog('close');
                                mygrid.gridBind();
                            }
                            else {
                                $.messager.show({
                                    title: '添加电影内容',
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
    gridEdit: function (index) {
        var rows = $('#grid').datagrid('getRows');//获得所有行
        var row = rows[index];//根据index获得其中一行。
        $('#editform').form('reset');
        $("#edit_id").textbox('setValue', row.id);
        $("#edit_title").textbox('setValue', row.title);
        $("#edit_cateid").combobox('setValue', row.cateid);
        $("#edit_image").textbox('setValue', row.image);
        $("#edit_contents").textbox('setValue', row.contents);
        $("input:radio[name=istop][value='"+row.istop+"']").attr("checked", true);
        $("input:radio[name=isimage][value='"+row.isimage+"']").attr("checked", true);

        $('#dataedit').show();
        $('#dataedit').dialog({
            collapsible: true,
            minimizable: false,
            maximizable: false,
            resizable: false,
            modal: true,
            title: '编辑电影内容',
            buttons: [{
                text: '确定',
                handler: function () {
                    if (!$('#editform').form('validate'))
                        return;
                    $.ajax({
                        type: "GET",
                        url: "../Controler/article.ashx?action=EditArticle",
                        data: $('#editform').serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.result == 'success') {
                                $('#dataedit').dialog('close');
                                mygrid.gridBind();
                            }
                            else {
                                $.messager.show({
                                    title: '编辑电影内容',
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
    gridDelet: function (id) {
        $.messager.confirm('删除', '是否确认删除?', function (r) {
            if (r) {
                $.ajax({
                    type: "GET",
                    url: "../Controler/grid.ashx?action=delete&tableName=article",
                    data: { id: id },
                    dataType: "json",
                    success: function (data) {
                        $.messager.show({
                            title: '删除结果',
                            msg: data.result == 'success' ? "删除成功" : "删除失败，请重试",
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