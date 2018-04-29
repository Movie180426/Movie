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
            title: "用户评论列表",
            iconCls: 'icon icon-list',
            nowrap: false,
            rownumbers: true,
            width: winSize.width,
            height: winSize.height,
            frozenColumns: [[]],
            columns: [[
                { title: '序号', field: 'id', width: 150 },
                { title: '用户名', field: 'uname', width: 150 },
                { title: '电影', field: 'title', width: 150 },
                { title: '内容', field: 'contents', width: 200 },
                 { title: '日期', field: 'addtime', width: 200 },
                 {
                     title: "操作", field: 'edit', width: 200, formatter: function (value, row, index) {
                         var a = "<a href='javascript:void(0)' onclick='mygrid.gridDelet(" + row.id + ")'>【删除】</a>";
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
            url: '../Controler/grid.ashx?action=query&tableName=v_topic',
            onLoadSuccess: function (row) {//当表格成功加载时执行               
                var rowData = row.rows;
            }
        });
    },
    gridDelet: function (id) {
        $.messager.confirm('删除', '是否确认删除?', function (r) {
            if (r) {
                $.ajax({
                    type: "GET",
                    url: "../Controler/grid.ashx?action=delete&tableName=topic",
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
