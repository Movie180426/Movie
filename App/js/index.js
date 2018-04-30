(function ($) {
    var _u = {};


    _u.top = {
        init: function () {
            _u.top.getListByPage();
        },
        getListByPage: function (par) {
            MovieCommon.getAjax("App.ashx?type=top",
                "json",
                null,
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

            var  username =  MovieCommon.getUrlParam("username");
            if (username == null || username == "") {
                $("#username").text("");
            }else{
                $("#username").text(username);
            }

           
        }

    }

    _u.home = {
        init: function () {
            _u.home.getCateinfo();


        },
        getCateinfo: function () {
            MovieCommon.getAjax("App.ashx?type=cate",
                "json",
                null,
                function (msg) {
                    if (msg.Code == 1) {
                        var data = msg.Data;
                        var html = '';
                        if (data.length === 0) {
                            html += "暂无记录";
                        } else {
                            for (var i = 0; i < data.length; i++) {
                                var ii = (i + 1);


                                if (i == 0) {
                                    html += '<a class="mui-control-item mui-active" data-type=' + data[i]["id"] + '>';
                                } else {
                                    html += '<a class="mui-control-item" data-type=' + data[i]["id"] + '>';
                                }

                                html += '' + data[i]["catename"] + '';
                                html += '</a>';
                            }
                            html += '  </ul>';
                        }
                        $("#segmentedControl").html(html);

                        $(".mui-control-item").unbind().click(function () {
                            _u.home.getMovieList($(this).attr("data-type"));
                        });

                        $(".mui-control-item").eq(0).click();
                    }
                });
        },
        getMovieList: function (type) {
            MovieCommon.getAjax("App.ashx?type=movielist&cateid=" + type,
                "json",
                null,
                function (msg) {

                    if (msg.Code == 1) {
                        var data = msg.Data;

                        var userid = MovieCommon.getUrlParam("userid");
                        if (userid == null)
                            userid = '';
                        var html = '<ul class="mui-table-view mui-table-view-chevron">';
                        if (data.length === 0) {
                            html += "暂无记录";
                        }
                        for (var i = 0; i < data.length; i++) {
                            html += ' <li class="mui-table-view-cell">';
                            html += ' <a class="mui-navigate-right" href="Comment.html?id=' + data[i]["id"] + '&userid=' + userid + '"> ' + data[i]["title"] + '</a>';
                            html += '</li>';
                        }
                        html += '  </ul>';
                        $("#movielist").html(html);
                    }
                    $('#scroll').scroll({
                        indicators: true //是否显示滚动条
                    });

                });
        }
    }



    if (!window.Index) {
        window.Index = {};
    }
    window.Index = {
        Top: _u.top,
        My: _u.my,
        Home: _u.home
    };
})(jQuery);