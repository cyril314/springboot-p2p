<%@ page language="java" pageEncoding="utf-8" %>
<%@include file="taglib.jsp" %>
<link rel="shortcut icon" href="/favicon.ico"/>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {
            alert("检测到您的浏览器版本过低，请使用 IE7 以上版本。");
        }
    }

    function getCookie(name) {//取cookies函数
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null) return unescape(arr[2]);
        return null;
    }

    function mytopmenu(obj, num) {
        SetCookie('topmenu', 'topmenu' + num);
        window.location.href = obj;
    }

    function SetCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
        var Days = 1; //此 cookie 将被保存1 天
        var exp = new Date();    //new Date("December 31, 9998");
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }

    $(function () {
        //导航选中状态
        $("#topmenu ul li a").removeClass("on");
        var mytopmenucookie = getCookie("topmenu");
        $("#" + mytopmenucookie).addClass("on");
        var hurl = window.location.href;
        var reg = '/$|[^/]*$';
        var url = hurl.match(reg);
        if (url == '/' || url == 'index.jsp') {
            for (var i = 1; i < 6; i++) {
                if (i == 1) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'finance.do') {
            for (var i = 1; i < 6; i++) {
                if (i == 2) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'borrow.do') {
            for (var i = 1; i < 6; i++) {
                if (i == 3) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'home.do') {
            for (var i = 1; i < 6; i++) {
                if (i == 4) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'getMessageBytypeId.do?typeId=4') {
            for (var i = 1; i < 6; i++) {
                if (i == 5) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'callcenter.do') {
            for (var i = 1; i <= 6; i++) {
                if (i == 6) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        } else if (url == 'financeDebtInit_.do') {
            for (var i = 1; i < 6; i++) {
                if (i == 2) {
                    document.getElementById("topmenu" + i).className = "on";
                } else {
                    document.getElementById("topmenu" + i).className = "";
                }
            }
        }
    });
</script>
<!--顶部状态栏 开始-->
<!--top start-->
<div class="top">
    <div class="center">
        <div class="left">客服热线 <span class="top-phone">${sitemap.servicePhone }</span>
        </div>
        <div class="right">
            <c:if test="${session.user==null}">
                <a href="javascript:void(0);" onclick="mytopmenu('login.do','1');">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:void(0);" onclick="mytopmenu('reg.do','1');">注册</a>
            </c:if>
            <c:if test="${session.user!=null}">
                <span style="display: block; float: left; padding-left: 10px;">您好！ ${user.userName} </span>&nbsp;&nbsp;<a href="logout.do">退出</a>
            </c:if>
        </div>
    </div>
</div>
<div class="clear"></div>
<!--top end-->
<!--head start-->
<div class="head">
    <div class="center">
        <div class="left">
            <a href="http://www.okleyi.com"><img src="${ctx}/static/images/logo.jpg" style="margin-top:13px;"/></a>
        </div>
        <div class="right" id="topmenu">
            <ul>
                <li><a id="topmenu1" href="javascript:;" onClick="mytopmenu('/index.do','1');">首页</a></li>
                <li><a id="topmenu2" href="javascript:;" onClick="mytopmenu('/finance.do','2');">我要投资</a></li>
                <li><a id="topmenu3" href="javascript:;" onClick="mytopmenu('/borrow.do','3');">我要借款</a></li>
                <li><a id="topmenu4" href="javascript:;" onClick="mytopmenu('/home.do','4');">我的账号</a></li>
                <li><a id="topmenu5" href="javascript:;" onClick="mytopmenu('/getMessageBytypeId.do?typeId=4','5');">关于我们</a></li>
                <li><a id="topmenu6" href="javascript:;" onClick="mytopmenu('/callcenter.do','6');">帮助中心</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="clear"></div>
<!--head end-->
<!--顶部主导航 结束-->