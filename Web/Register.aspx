﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Movie.Web.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>PHP基于MySQL的CMS门户网站</title>
		<script type="text/javascript" src="statics/js/jquery.min.js"></script>

		<script type="text/javascript" src="statics/js/member_common.js"></script>

		<script type="text/javascript" src="statics/js/formvalidator.js"
			charset="UTF-8"></script>

		<script type="text/javascript" src="statics/js/formvalidatorregex.js"
			charset="UTF-8"></script>

		<script type="text/javascript" src="statics/js/dialog.js"></script>

		<link href="statics/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="statics/css/dialog_simp.css" rel="stylesheet"
			type="text/css" />
<script lang="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"
        charset="utf-8"></script>


		<link href="statics/css/table_form.css" rel="stylesheet"
			type="text/css" />
		<style type="text/css">
        .submit, .pass-logo a, .form-login .input label, .item span, #content h2 span em
        {
            display: inline-block;
            display: -moz-inline-stack;
            zoom: 1; *display:inline;}
        .blue, .blue a
        {
            color: #377abe;
        }

        .submit input
        {
            cursor: hand;
        }
        .log
        {
            line-height: 24px;
            height: 24px;
            float: right;
            font-size: 12px;
        }
        .log span
        {
            color: #ced9e7;
        }
        .log a
        {
            color: #049;
            text-decoration: none;
        }
        .log a:hover
        {
            text-decoration: underline;
        }
        #header
        {
            height: 94px;
            background: url(statics/images/member/h.png) repeat-x;
        }
        #header .logo
        {
            padding-right: 100px;
            float: left;
            background: url(statics/images/member/login-logo.png) no-repeat right 2px;
        }
        #header .content
        {
            width: 920px;
            margin: auto;
            height: 60px;
            padding: 10px 0 0 0;
        }
        #content
        {
            width: 920px;
            margin: auto;
            padding: 20px 0 0 0;
            overflow: auto;
        }
        .form-login
        {
            width: 420px;
            padding-left: 40px;
        }
        #content h2
        {
            font-size: 25px;
            color: #494949;
            border-bottom: 1px dashed #CCC;
            padding-bottom: 3px;
            margin-bottom: 10px;
        }
        #content h2 span
        {
            font-size: 12px;
            font-weight: normal;
        }
        #content h2 span em
        {
            background: url(statics/images/member/order.png) no-repeat 0px -16px;
            width: 15px;
            height: 15px;
            line-height: 15px;
            text-align: center;
            margin-right: 5px;
            color: #FFF;
        }
        #content h2 span.on
        {
            color: #333;
            font-weight: 700;
        }
        #content h2 span.on em
        {
            background-position: 0px 0px;
        }
        .form-login .input
        {
            padding: 7px 0;
            overflow: hidden;
            clear: both;
        }
        .form-login .input label
        {
            width: 84px;
            font-size: 14px;
            color: #8c8686;
            text-align: right;
            float: left;
        }
        .form-login .input .form
        {
            width: 560px;
            float: left;
        }
        .take, .reg
        {
            padding: 0 0 0 84px;
        }
        .take .submit
        {
            margin-top: 10px;
        }
        .form-login .hr
        {
            background: url(statics/images/member/line.png) no-repeat left center;
            height: 50px;
        }
        .form-login .hr hr
        {
            display: none;
        }
        .form-reg
        {
            padding: 10px 0 0 14px;
            width: 700px;
            border-right: 1px solid #ccc;
        }
        .form-reg .input label
        {
            width: 120px;
        }
        .form-reg .input label.type
        {
            width: auto;
            color: #000;
            padding-right: 10px;
        }
        .form-reg .reg
        {
            padding: 10px 0 0 120px;
        }
        .form-reg .reg .submit
        {
            margin-bottom: 5px;
        }
        .submit
        {
            padding-left: 3px;
        }
        .submit, .submit input
        {
            background: url(statics/images/member/but.png) no-repeat;
            height: 29px;
            width: auto;
            _width: 0;
            overflow: visible !ie;
        }
        .submit input
        {
            background-position: right top;
            border: none;
            padding: 0 10px 0 7px;
            font-size: 14px;
        }
        .reg
        {
            color: #666;
            line-height: 24px;
        }
        .reg .submit
        {
            background-position: left -35px;
            height: 35px;
        }
        .reg .submit input
        {
            background-position: right -35px;
            font-weight: 700;
            color: #fff;
            height: 35px;
        }
        .reg-auto
        {
            padding: 10px 0 0 20px;
        }
        .reg-auto p
        {
            margin-bottom: 10px;
            color: #666;
        }
        .col-1
        {
            position: relative;
            float: right;
            border: 1px solid #c4d5df;
            zoom: 1;
            background: url(statics/images/member/member_title.png) repeat-x;
            width: 310px;
            margin: auto;
            height: 304px;
        }
        .col-1 span.o1, .col-1 span.o2, .col-1 span.o3, .col-1 span.o4
        {
            position: absolute;
            width: 3px;
            height: 3px;
            background: url(statics/images/fillet.png) no-repeat;
        }
        .col-1 span.o1
        {
            background-position: left -6px;
            top: -1px;
            left: -1px;
        }
        .col-1 span.o2
        {
            background-position: right -6px;
            top: -1px;
            right: -1px;
        }
        .col-1 span.o3
        {
            background-position: left bottom;
            bottom: -1px;
            left: -1px;
        }
        .col-1 span.o4
        {
            background-position: right bottom;
            bottom: -1px;
            right: -1px;
        }
        .col-1 .title
        {
            color: #386ea8;
            padding: 5px 10px 3px;
        }
        .col-1 div.content
        {
            padding: 0px 10px 10px;
        }
        .col-1 div.content h5
        {
            background: url(statics/images/member/ext-title.png) no-repeat 2px 10px;
            height: 34px;
        }
        .col-1 div.content h5 strong
        {
            visibility: hidden;
        }
        .pass-logo
        {
            margin: auto;
            width: 261px;
            padding-top: 15px;
        }
        .pass-logo a img
        {
            border: 1px solid #ddd;
        }
        .pass-logo a
        {
            border: 3px solid #fff;
        }
        .pass-logo a.logo, .pass-logo a:hover
        {
            border: 3px solid #e8f1f1;
        }
        .pass-logo p
        {
            border-top: 1px solid #e1e4e8;
            padding-top: 15px;
        }
        .item
        {
            padding: 10px 0;
            vertical-align: middle;
            margin-bottom: 10px;
        }
        .item span
        {
            color: #8c8686;
        }
        #footer
        {
            color: #666;
            line-height: 24px;
            width: 920px;
            margin: auto;
            text-align: center;
            padding: 12px 0;
            margin-top: 52px;
            border-top: 1px solid #e5e5e5;
        }
        #footer a
        {
            color: #666;
        }
        .point
        {
            border: 1px solid #ffbf7a;
            background: #fffced;
            margin-bottom: 10px;
            margin-right: 100px;
            margin-left: 50px;
            position: relative;
        }
        .point .content
        {
            padding: 8px 10px;
        }
        .point .content .title
        {
            color: #ff8400;
        }
        .point .content p
        {
            color: #777;
            text-indent: 20px;
        }
        .point span.o1, .point span.o2, .point span.o3, .point span.o4
        {
            position: absolute;
            width: 3px;
            height: 3px;
            background: url(statics/images/fillet.png) no-repeat;
            overflow: hidden;
        }
        .point span.o1
        {
            background-position: left top;
            top: -1px;
            left: -1px;
        }
        .point span.o2
        {
            background-position: right top;
            top: -1px;
            right: -1px;
        }
        .point span.o3
        {
            background-position: left -3px;
            bottom: -1px;
            left: -1px;
        }
        .point span.o4
        {
            background-position: right -3px;
            bottom: -1px;
            right: -1px;
        }
        .submit button.hqyz
        {
            margin: 0px;
            padding: 0px;
            border: none;
            cursor: pointer;
        }
        .submit button.hqyz
        {
            background-position: 100% 0%;
            border: medium none;
            font-size: 12px;
            padding: 0 10px 0 7px;
        }
        .submit button.hqyz
        {
            background: url("statics/images/member/but.png" ) no-repeat 100% 0px;
            height: 29px;
            width: auto;
        }
        #mobile_div input
        { *margin-bottom:12px;*_padding:0px0px6px0px}</style>
		<script type="text/javascript" src="admin/js/date.js"></script>
		<script type="text/javascript">
			function reg(){
				if(document.myform.uname.value==""){
					alert("请输入用户名");
					return false;
				}
				else if(document.myform.pwd.value==""){
					alert("请输入密码");
					return false;
				}
				else if(document.myform.repassword.value==""){
					alert("请输入确认密码");
					return false;
				}else if(document.myform.pwd.value!=document.myform.repassword.value){
					alert("二次输入密码不一致");
					return false;
				}
			}
		</script>
	</head>
	<body>
		<div id="header">
			<div class="content">
				<div class="logo">
					<img src="statics/images/v9/logo.jpg" />
				</div>
				<span class="log"></span>
			</div>
		</div>
		<div id="content">
			<h2>
				用户注册
			</h2>
			<form action="userfunc.aspx?method=save" method="post" name="myform"
				onsubmit="return reg();">
				<div class="col-left form-login form-reg">
					<!--是否开启选择会员模型选项-->
					<div class="point">
					</div>
					<div class="input">
						<label>
							用户名：
						</label>
						<input type="text" name="uname" style="width:160px"
							id="username" />
					</div>
					<div class="input">
						<label>
							密码：
						</label>
						<input type="password" name="pwd" style="width:160px"
							id="password" />
					</div>
					<div class="input">
						<label>
							确认密码：
						</label>
						<input type="password" name="repassword" style="width:160px"
							id="repassword" />
					</div>
					<div class="input">
						<label>
							姓名：
						</label>
						<input type="text" name="realname" style="width:160px"
							id="realname" />
					</div>
					<div class="input">
						<label>
							性别：
						</label>
						<input type="radio" name="sex" value="0" checked />
						男
						<input type="radio" name="sex" value="1" />
						女
					</div>
					<div class="input">
						<label>
							出生日期：
						</label>
						<input type="text" name="birthday" style="width:160px"
							id="birthday" onclick="WdatePicker()" />
					</div>
					<div class="input">
						<label>
							联系方式：
						</label>
						<input type="text" name="contact" style="width:160px"
							id="contact" />
					</div>
					<div class="input">
						<label>
							电子邮件：
						</label>
						<input type="text" name="email" style="width:160px"
							id="email" />
					</div>
					<div class="reg">
						<div class="submit">
							<input type="submit" value=" 确  定 " />
						</div>
						<br />
						<a href="index.aspx">返回首页</a>
					</div>
				</div>
			</form>
			<div class="col-auto reg-auto">
				<p class="f14">
				</p>
				<div class="submit">
				</div>
			</div>
		</div>
	</body></html>