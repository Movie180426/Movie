$(function () {
    $('#changepwd').dialog({
        collapsible: false,
        minimizable: false,
        maximizable: false,
        resizable: false,
        closable: false,
        draggable:false,
        modal: false,
        title: '修改密码',
        buttons: [{
            text: '确定',
            handler: function () {
                if (!$('#changeform').form('validate'))
                    return;

                $.ajax({
                    type: "GET",
                    url: "../Controler/admin.ashx?action=ChangePwd",
                    data: $('#changeform').serialize()+"&id="+userid,
                    dataType: "json",
                    success: function (data) {
                        if (data.result == 'success') {
                            window.location.href = 'Login.aspx';
                        }
                        else {
                            $.messager.show({
                                title: '修改密码',
                                msg: data.message,
                                timeout: 2000,
                                showType: 'slide'
                            });
                        }

                    }
                });
            }
        }]
    });
});
$.extend($.fn.validatebox.defaults.rules, {
    equals: {
        validator: function (value, param) {
            return value == $(param[0]).val();
        },
        message: '两次密码不一致，请重新输入.'
    }
});