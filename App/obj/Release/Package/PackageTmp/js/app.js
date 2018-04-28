/* 搜索验证 */
function check(Id) {
  var strings = document.getElementById(Id).value;
  if (strings.replace(/(^\s*)|(\s*$)/g, "").length == 0) {
    return false;
  }
  return true;
}

/*三种模式商品列表切换*/
var sequence = ["icon-icon-square", "icon-pailie", "icon-viewlist"];
var p_l_product = ["product-list-big", "product-list-medium", "product-list-small"];

function jSequence(obj) {
  var icon_sequence = $(obj).find("i").attr("data");
  var len = sequence.length;
  var key = icon_sequence;
  icon_sequence++;
  if (icon_sequence >= len) {
    icon_sequence = 0;
  }
  /*更换排序列表图标class*/
  $(obj).find(".iconfont").removeClass(sequence[key]).addClass(sequence[icon_sequence]);
  $(obj).find(".iconfont").attr("data", icon_sequence);
  /*更换商品列表class*/
  $(".j-product-list").removeClass(p_l_product[key]).addClass(p_l_product[icon_sequence]);
  $(".j-product-list").attr("data", icon_sequence);
}

function selectPayment(obj) {

  var checkbox_all = $(obj).find("label"); //获取值为“全部”的label
  var s_t_em_value = $(obj).parent().prev(".select-title").find(".t-jiantou em"); //获取需要改变值的em标签
  var checkbox_all_text = $(obj).find("label").text();
  if (!checkbox_all.hasClass("active")) {
    $(obj).find("label").addClass("active").parents(".ect-select").siblings().find("label").removeClass("active");
    s_t_em_value.text(checkbox_all_text); //将calss为j-checkbox-all的label的值赋值给需要改变的em标签
    $(obj).parent(".j-get-limit").prev(".select-title").find(".t-jiantou").removeClass("active");
    $(obj).parents(".j-get-limit").attr("data-istrue", "true")
  }
  $('#payment_id').val($(obj).find('input').val());
}

function selectPaymentMenu(obj) {
  $(obj).next(".j-sub-menu").slideToggle().siblings('.j-sub-menu').slideUp();
  $(obj).toggleClass("active").siblings().removeClass("active");
  var scorll_swiper = new Swiper('.swiper-scroll', {
    scrollbar: false,
    direction: 'vertical',
    slidesPerView: 'auto',
    mousewheelControl: true,
    freeMode: true
  });
}

/*商品分类页*/
$(function ($) {
  $(".ect-category-all ul li .panel-body").click(function () {
    if (!$(this).parent("li").hasClass("category-select")) {
      $(this).parent("li").addClass("category-select");
    } else {
      $(this).parent("li").removeClass("category-select");
    }
  });
});

/*商品列表页面点击显示筛选*/
$(".category-list").click(function () {
  if ($(".touchweb_mod_Filter").hasClass("show")) {
    $(".touchweb_mod_Filter").removeClass("show");
  } else {
    $(".touchweb_mod_Filter").addClass("show");
  }
});

/*商品列表页面点击隐藏筛选*/
$("#goFilter .left").click(function () {
  if ($(".touchweb_mod_Filter").hasClass("show")) {
    $(".touchweb_mod_Filter").removeClass("show");
  } else {
    $(".touchweb_mod_Filter").addClass("show");
  }
});

/*属性下拉*/
$("#goFilter .title").click(function () {

  var _find = $(this).find(".icon-right_arrow");
  var _next = $(this).next("ul");
  if (_find.hasClass('down')) {
    _find.removeClass("down");
    _next.removeClass("show");
  } else {
    _find.addClass("down");
    _next.addClass("show");
  }
});

/*商品列表页面点击隐藏下拉*/
$(".ect-pro-list,.ect-wrapper div a.select").click(function () {
  if ($(".ect-wrapper").hasClass("select")) {
    $(".ect-wrapper").removeClass("select");
  }
});

/**
 * jquery Begin
 * @returns {undefined}
 */
$(function () {
  $('.touchweb-com_listType li').click(function () {
      $(this).addClass('av-selected').siblings('li').removeClass('av-selected');
      var temp = $(this).find('a').attr('name');
      var vl = $(this).find('a').attr('value');
      $(this).parent('ul').removeClass("show");
      $(this).parent().prev().find(".icon-right_arrow").removeClass("down");
      $(this).parent().prev().find(".range").text(temp).addClass('visited');
      //价格筛选
      if (vl.indexOf('|') > 0) {
        var val_array = vl.split('|');
        $(this).parent().siblings('input[name=price_min]').val(val_array[0]);
        $(this).parent().siblings('input[name=price_max]').val(val_array[1]);
      } else {
        $(this).parent().next("input").val(vl);
        //属性
        var i = 0;
        var new_attr = new Array();
        $('.filter_attr').each(function () {
          if ($(this).hasClass('av-selected')) {
            new_attr[i] = $(this).find('a').attr('value');
            i = i + 1;
          }
        });
        var new_attr_str = new_attr.join('.');
        //属性参数具体值
        $('input[name=filter_attr]').val(new_attr_str);
      }
    })
    //显示更多
  $('.av-options').click(function () {
    if ($(this).children('a').hasClass("avo-more-down")) {
      var i = $('.filter_list li').size();
      var h = Math.round(i / 2) * 40;
      $(this).siblings('.filter_list').css('max-height', h);
      $(this).children('a').removeClass('avo-more-down').addClass('avo-more-up').html('收起更多<i></i>');
    } else {
      $(this).siblings('.filter_list').css('max-height', '');
      $(this).children('a').removeClass('avo-more-up').addClass('avo-more-down').html('查看更多<i></i>');
    }
  })

  /**
   * 商品分类页跳转页面
   */
  $('.pagenav-select').change(function () {
    $.pjax({
      url: $(this).val(),
      container: '#pjax-container'
    })
  });

  /**选择配送方式**/

  $('#selected1').click(function () {
    $('#shipping').slideToggle("fast");
  });

  $('#selected2').click(function () {
    $('#payment').slideToggle("fast");
  });
  /**
   红包
   */
  $('#selected4').click(function () {

    $('#bonus_box').slideToggle("fast");

  });
  /**
   包装
   */
  $('#selected5').click(function () {

    $('#package_box').slideToggle("fast");

  });
  /**
   祝福贺卡
   */
  $('#selected6').click(function () {

    $('#card_box').slideToggle("fast");

  });

  /**选择配送地址**/

  $('#selected7').click(function () {
    $('#address').slideToggle("fast");
  });

  /**选择余额**/

  $('#selected8').click(function () {
    $('#surplus').slideToggle("fast");
  });
  /**选择积分**/

  $('#selected9').click(function () {
    $('#integral').slideToggle("fast");
  });


  $('.modRadio').click(function () {
    if ($(".modRadio i").attr('class') == 'fr') {
      $(".modRadio i").removeClass("fr");
      $(".modRadio i").addClass("fl");
      $(".modRadio ins").html('否');
      $('#inviype_box').css('display', 'none');
      $("#ECS_NEEDINV").attr("checked", 'false')
    } else {
      $(".modRadio i").removeClass("fl");
      $(".modRadio i").addClass("fr");
      $(".modRadio ins").html('是');
      $('#inviype_box').css('display', 'block');
      $("#ECS_NEEDINV").attr("checked", 'true')
    }

  });

})

/*点击返回顶部*/
$(window).scroll(function () {
  if ($(this).scrollTop() > 50) {
    $('#scrollUp').fadeIn();
  } else {
    $('#scrollUp').fadeOut();
  }
});

function scrollUp() {
  $('#scrollUp').tooltip('hide');
  $('body,html').animate({
    scrollTop: 0
  }, 200);
}

/*商品详情页*/
$(function () {
  $('.spxq table,.spxq div').width('100%');
  //商品图片滚动自适应
  gfimg = $(".goodfocus .bd ul li img");
  wdsHeight = ($(window).height() - $(".f-h1").height()) / 1.5;
  wdsWidth = $(window).width();
  gfimg.each(function () {
    if ($(this).height() > $(this).width()) {
      if ($(this).height() > wdsHeight) {
        $(this).height(wdsHeight);
        $(this).width("auto");
      }
    } else {
      $(this).width("98%");
      $(this).height("auto");
    }
  });
  /*判断user-tab内容高度不够时撑开*/
  var user_tab_height = $(".user-tab .tab-content .tab-pane");
  var window_height = $(window).height() / 3;
  user_tab_height.css("min-height", window_height);
});


$('.menu-tab ul li').click(function () {
  $(this).addClass("selected").siblings().removeClass('selected');
  $('.menu-cont-list').hide().eq($('.menu-tab ul li').index(this)).show();
});

/*修改密码验证*/
function resetPassword() {
  var new_password = $("#new_password").val(); //获取
  var comfirm_password = $("#comfirm_password").val();
  if (new_password != comfirm_password) {
    alert('两次输入的密码不一致');
    return false;
  }
}

/*单选*/
$(".j-get-one .ect-select").click(function () {
  get_tjiantou = $(this).parent(".j-get-one").prev(".select-title").find(".t-jiantou");
  $(this).find("label").addClass("active").parent(".ect-select").siblings().find("label").removeClass("active");
  get_tjiantou.find("em").text($(this).find("label").text());
  if ($(this).hasClass("j-checkbox-all")) {
    get_tjiantou.removeClass("active");
  } else {
    get_tjiantou.addClass("active");
  }
  if ($(this).parents("show-goods-attr")) { //赋值给goods-attr
    s_get_label = $(".show-goods-attr .s-g-attr-con").find("label.active"); //获取被选中label
    var get_text = '';
    s_get_label.each(function () {
      get_text += $(this).text() + "、";
    });
    $(".j-goods-attr").find(".t-goods1").text(get_text.substring(0, get_text.length - 1));
  }
});

/*設置默認收貨地址*/
function edit_address_info(address_id, consignee_back) {
  var url = '/app/user/setDefaultConsignee';
  $.get(url, { 'id': address_id }, function (data) {
    if (1 == data.code) {
      if (consignee_back == 'o') {
        $.pjax({
          url: '/app/order/confirm',
          container: '#pjax-container'
        })
      } else if (consignee_back == 'u') {
        $.pjax({
          url: '/app/user/personaldata',
          container: '#pjax-container'
        })
      } else {
        $.pjax({
          url: 'user.html',
          container: '#pjax-container'
        })
      }
    } else {
      alert("操作失败");
    }
  }, 'json');
  return false;
}

/*設置默認收貨地址*/
function del_address_list(address_id) {
  var url = '/app/user/delconsignee';
  $.get(url, { 'id': address_id }, function (data) {
    if (1 == data.code) {
      $.pjax.reload('#pjax-container');
    } else {
      alert("删除失败");
    }
  }, 'json');
  return false;
}

/*取消订单*/
function cancel_order(order_id) {
  var url = '/app/order/cancel';
  $.get(url, { 'id': order_id }, function (data) {
    if (0 == data.code) {
      $.pjax({
        url: '/app/order/index?status=-1',
        container: '#pjax-container'
      })
    } else {
      alert("系统繁忙");
    }
  }, 'json');
  return false;
}

/*完成订单*/
function finish_order(order_id) {
  var url = '/app/order/finish';
  $.get(url, { 'id': order_id }, function (data) {
    if (0 == data.code) {
      alert("操作成功");
      $.pjax({
        url: '/app/order/index?status=1',
        container: '#pjax-container'
      })
    } else {
      alert("系统繁忙");
    }
  }, 'json');
  return false;
}

/**
 * 会员找回密码时，获取短信验证码
 */
function getVerify(obj, frmName) {
  var frm = document.forms[frmName];
  var phone = frm.elements['phone'].value;
  if (phone.length == 0) {
    alert(phone_number_empty);
  } else {
    if (!(Utils.isTel(phone))) {
      alert(phone_number_error);
    } else {
      $.get('/app/public/send_sms', { phone: phone }, function (result) {
        console.log(result);
        if (result.data == '发送成功') {
          alert('验证码已发送');
          settime(obj);
        } else {
          alert('发送失败');
        }
      });
    }
  }
}

/*验证码按钮倒计时小效果*/
var countdown = 60;

function settime(obj) {
  if (countdown == 0) {
    obj.removeAttribute("disabled");
    obj.value = "获取验证码";
    countdown = 60;
    return;
  } else {
    obj.setAttribute("disabled", true);
    obj.value = "重新发送(" + countdown + ")";
    countdown--;
  }
  setTimeout(function () {
    settime(obj)
  }, 1000);
}
