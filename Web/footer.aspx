<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="footer.aspx.cs" Inherits="Movie.Web.footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
   <div class="footer">
<p class="info"><a href="admin/index.aspx">后台管理</a></p>
</div>

<script type="text/javascript">
$(function(){
	$(".picbig").each(function(i){
		var cur = $(this).find('.img-wrap').eq(0);
		var w = cur.width();
		var h = cur.height();
	   $(this).find('.img-wrap img').LoadImage(true, w, h,'{IMG_PATH}msg_img/loading.gif');
	});
})
        </script>
</body>
</html>
