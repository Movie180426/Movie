(function ($) {
    var _u = {};

    _u.list = {
        init: function () {
            var userid = MovieCommon.getUrlParam("userid");
            //if (userid == null || userid == "") {
            //    window.location.href = "login.html";
            //    return false;
            //}
            _u.list.getinfo(MovieCommon.getUrlParam("id"));
            _u.comment.init();
            $("#smt").unbind().on("click", function () {

                var _score = $("input[name='score']").val();
                var contents = $("#textarea").val();
                if (_score == null || _score == "") {
                    mui.toast("请选择评分~");
                    return false;
                }

                if (contents == null || contents == "") {
                    mui.toast("请填写评论~");
                    return false;
                }
                

                var btnArray = ['否', '是'];
                mui.confirm('评论和评分？', '确认', btnArray, function (e) {
                    if (e.index == 1) {
                        

                        var score = parseInt(_score) + parseInt($("#_score").val());
                        var scorenum = parseInt($("#_scorenum").val()) + 1;
                        var id = MovieCommon.getUrlParam("id");
                       
                        var userid = MovieCommon.getUrlParam("userid");
                        MovieCommon.getAjax("App.ashx?type=addscore", "json",
                            { score: score, scorenum: scorenum, id: id, contents: contents, userid: userid },
                             function (msg) {
                                 if (msg.Code == 1) {
                                     window.location.href = location.href;
                                 }
                             });

                    } else {


                    }
                })
            });

        },
        getinfo: function (id) {
            MovieCommon.getAjax("App.ashx?type=movieinfo&id=" + id,
               "json",
               null,
               function (msg) {
                   if (msg.Code == 1) {
                       $("span[name='title']").text(msg.Data["title"]);
                       if (parseInt(msg.Data["scorenum"]) > 0) {
                           $("span[name='score']").text((parseInt(msg.Data["score"]) / parseInt(msg.Data["scorenum"])).toFixed(1) + "分");
                       } else {
                           $("span[name='score']").text("0分");
                       }

                       $("#_score").val(msg.Data["score"]);
                       $("#_scorenum").val(msg.Data["scorenum"]);

                       $("span[name='contents']").text(msg.Data["contents1"]);
                       $("img[name='image']").attr("src", msg.Data["image"]);

                   }
               });
        }

    }

    _u.comment = {
        init: function () {
            _u.comment.getlist(MovieCommon.getUrlParam("id"));
        },
        getlist: function (id) {
            MovieCommon.getAjax("App.ashx?type=commentlist&id=" + id,
               "json",
               null,
               function (msg) {
                   if (msg.Code == 1) {

                       var data = msg.Data;
                       var html = '';
                       if (data.length === 0) {
                           //html += "暂无记录";
                       }
                       for (var i = 0; i < data.length; i++) {
                           html += ' <div class="mui-card">';
                           html += '  <div class="mui-card-header mui-card-media">';
                           html += ' <div class="mui-media-body">';
                           html += ' <p>用户：' + data[i]["realname"] + '</p>';
                           html += '  <p>发表于： ' + data[i]["addtime"] + '</p>';
                           html += '  </div>';
                           html += '  </div>';
                           html += ' <div class="mui-card-content" style="margin:5px">';
                           html += '     <p> ' + data[i]["contents"] + '</p>';
                           html += ' </div>';
                           html += '  </div>';
                       }
                       $("#commentlist").html(html);

                   }
               });
        }
    }

    if (!window.Comment) {
        window.Comment = {};
    }
    window.Comment = {
        Info: _u.list,
        Comment: _u.comment
    };
})(jQuery);