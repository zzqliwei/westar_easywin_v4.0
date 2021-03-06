<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
    <title>Zero Clipboard Test</title>
	<script type="text/javascript" src="/static/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="/static/js/qrcode/jquery.qrcode.min.js"></script>
    <script type="text/javascript"> 
    function generateQRCode(rendermethod, picwidth, picheight, url) {

        $("#qrcode").qrcode({ 
            render: rendermethod, // 渲染方式有table方式（IE兼容）和canvas方式
            width: picwidth, //宽度 
            height:picheight, //高度 
            text: utf16to8(url), //内容 
            typeNumber:-1,//计算模式
            correctLevel:2,//二维码纠错级别
            background:"#ffffff",//背景颜色
            foreground:"#000000"  //二维码颜色

        });
    }
    function init() {
        generateQRCode("table",150, 150, "${appLoadUrl}/web/appDownPage");
        //var margin = ($("#qrcode").height()-$("#codeico").height())/2;
        //$("#codeico").css("margin",margin);
    }
    //中文编码格式转换
    function utf16to8(str) {
        var out, i, len, c;
        out = "";
        len = str.length;
        for (i = 0; i < len; i++) {
            c = str.charCodeAt(i);
            if ((c >= 0x0001) && (c <= 0x007F)) {
                out += str.charAt(i);
            } else if (c > 0x07FF) {
                out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
                out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            } else {
                out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
                out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
            }
        }
        return out;
    }   

    </script>

    <style type="text/css">
        #codeico{
            position:fixed;//生成绝对定位的元素，相对于浏览器窗口进行定位。元素的位置通过 "left", "top", "right" 以及 "bottom" 
            z-index:9999999;
            width:30px; 
            height:30px;
            background:url(./1_meitu_1.png) no-repeat;
        }
    </style>
</head>
<body onLoad="init()">
    <div id="qrcode" align="center" style="margin-top:50px;">
        <div id="codeico"></div>
    </div>

</body>
</html>