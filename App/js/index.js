(function ($) {
    var _u = {};


    _u.top = {
        init: function () {
            _u.top.getListByPage();
        },
        getListByPage: function (par) {
            MovieCommon.getAjax("App.ashx?type=top",
                "json",
                par,
                _u.top.callBack);
        },
        callBack: function (msg) {
            if (msg.Code == 1) {
                var htmls = _u.top.getModelTemplate(msg.Data);
                $("#tabbar-with-chat").html(htmls);
            }
        },
        getModelTemplate: function (data) {

            var html = '<ul class="mui-table-view mui-table-view-chevron">';
            if (data.length === 0) {
                html += "暂无记录";
            }
            for (var i = 0; i < data.length; i++) {
                html += '<li class="mui-table-view-cell mui-media">';
                //html += '<a class="mui-navigate-right">';
                html += '<img class="mui-media-object mui-pull-left" src="' + data[i]["image"] + '">';
                html += '<div class="mui-media-body">';
                html += '' + data[i]["title"] + '';
                html += '<p class="mui-ellipsis">' + data[i]["contents1"] + '</p>';
                html += ' </div>';
                html += '</a>';
                html += '</li>';
            }
            html += '  </ul>';
            return html;
        },

    }

    _u.my = {
        init: function () {
            _u.my.getinfo();
        },
        getinfo: function () {
            $("#username").text(MovieCommon.getUrlParam("username"));
        }

    }


    if (!window.Index) {
        window.Index = {};
    }
    window.Index = {
        Top: _u.top,
        My: _u.my
    };
})(jQuery);