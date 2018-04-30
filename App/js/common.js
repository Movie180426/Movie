//À©Õ¹mui.showLoading
(function ($, window) {
    //ÏÔÊ¾¼ÓÔØ¿ò
    $.showLoading = function (message, type) {
        if ($.os.plus && type !== 'div') {
            $.plusReady(function () {
                plus.nativeUI.showWaiting(message);
            });
        } else {
            var html = '';
            html += '<i class="mui-spinner mui-spinner-white"></i>';
            html += '<p class="text">' + (message || "loading ...") + '</p>';

            //ÕÚÕÖ²ã
            var mask = document.getElementsByClassName("mui-show-loading-mask");
            if (mask.length == 0) {
                mask = document.createElement('div');
                mask.classList.add("mui-show-loading-mask");
                document.body.appendChild(mask);
                mask.addEventListener("touchmove", function (e) { e.stopPropagation(); e.preventDefault(); });
            } else {
                mask[0].classList.remove("mui-show-loading-mask-hidden");
            }
            //¼ÓÔØ¿ò
            var toast = document.getElementsByClassName("mui-show-loading");
            if (toast.length == 0) {
                toast = document.createElement('div');
                toast.classList.add("mui-show-loading");
                toast.classList.add('loading-visible');
                document.body.appendChild(toast);
                toast.innerHTML = html;
                toast.addEventListener("touchmove", function (e) { e.stopPropagation(); e.preventDefault(); });
            } else {
                toast[0].innerHTML = html;
                toast[0].classList.add("loading-visible");
            }
        }
    };

    //Òþ²Ø¼ÓÔØ¿ò
    $.hideLoading = function (callback) {
        if ($.os.plus) {
            $.plusReady(function () {
                plus.nativeUI.closeWaiting();
            });
        }
        var mask = document.getElementsByClassName("mui-show-loading-mask");
        var toast = document.getElementsByClassName("mui-show-loading");
        if (mask.length > 0) {
            mask[0].classList.add("mui-show-loading-mask-hidden");
        }
        if (toast.length > 0) {
            toast[0].classList.remove("loading-visible");
            callback && callback();
        }
    }
})(mui, window);

(function ($) {
    var _u = {};
    _u.Loading = {
        Show: function () {
            mui.showLoading("loading ...", "div");
        },
        Hide: function () {
            mui.hideLoading(function () { });//Òþ²ØºóµÄ»Øµ÷º¯Êý
        }
    };
    _u.webapilocalhost = "/Ajax/";
    _u.getAjax = function (url, dataType, postData, callBack) {
        _u.Loading.Show();
        $.ajax({
            type: 'post',
            dataType: dataType,
            url: _u.webapilocalhost + url,
            data: postData,
            cache: false,
            success: function (data) {
                _u.Loading.Hide();
                callBack(data, postData);
            },
            error: function (data) {
                _u.Loading.Hide();
                alert("error:" + JSON.stringify(data));
            }
        });
    }

    _u.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null)
            return unescape(r[2]);
        else {
            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
            if (arr = document.cookie.match(reg))
                return unescape(arr[2]);
        }
        return null;
    }


    if (!window.MovieCommon) {
        window.MovieCommon = {};
    }
    window.MovieCommon = _u;
})(jQuery);


