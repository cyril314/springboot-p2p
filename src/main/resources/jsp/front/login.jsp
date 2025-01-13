<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <style type="text/css">
        body {
            background: #eef2f2;
        }
    </style>
</head>
<body>
<!--top start-->
<div class="lo_top">
    <div class="center">
        <div class="left"><a href="/"><img src="${ctx}/static/images/logo.jpg" style="margin-top:11px;"/>
        </a></div>
        <div class="right">
            <ul>
                <li><a href="/">返回首页</a></li>
                <li><a href="callcenter.do">帮助中心</a></li>
                <li><a href="getMessageBytypeId.do?typeId=4">关于我们</a></li>
            </ul>
        </div>
    </div>
</div>
<!--top end-->
<!--center start-->
<div class="center mt50">
    <div class="left"><img src="${ctx}/static/images/lo_pic.png"/></div>
    <div class="lo_login right">
        <div class="lo_login_top">欢迎登陆好乐易贷！</div>
        <div class="login-middle">
            <form action="logining.do" method="post">
                <span id="s_email"></span>
                <span id="email_" style="display: none;"><a id="retake_email" href="javascript:reSendEmail();">发送激活邮件</a></span>
                <span id="s_password"></span>
                <span id="s_code"></span>
                <table>
                    <tr>
                        <td colspan="2">
                            <input type="text" class="txtuser" name="paramMap.email" id="email" value="手机号、邮箱或用户名"
                                   onfocus="if(value=='手机号、邮箱或用户名') {this.style.color='#000';value=''}"
                                   onblur="if (value=='') {this.style.color='#CCC';value='手机号、邮箱或用户名'}"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="password" class="txtpwd" name="paramMap.password" id="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" class="txtcod" name="paramMap.code" id="code" maxlength="4"/>
                            <img title="点击更换验证码" onclick="javascript:switchCode();" style="float: right;" id="codeNum"/>
                            <a href="javascript:;" onclick="switchCode()" style="font-size: 14px;float: right;">换一换</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="button" class="btnlogin" id="btn_login" value="立 即 登 录"
                                   onmouseover="this.className='btnloginhover'" onmouseout="this.className='btnlogin'"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left"><a href="forgetpassword.do">忘记密码？</a></td>
                        <td align="right"><span>还没有账号？<a href="reg.do">立即注册</a></span></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="clear"></div>
<!--center end-->
<!--bottom start-->
<div class="lo_bottom">
    版权所有 © 2014 好乐易贷 All rights reserved
</div>
<!--bottom end-->
<script>
    $(function () {
        $("#code").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
        $("#email").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
        $("#password").bind('keyup', function (event) {
            if (event.keyCode == "13") {
                login();
            }
        });
    })

    //初始化
    function switchCode() {
        var timenow = new Date();
        $("#codeNum").attr("src", "${ctx}/captcha?pageId=userlogin&amp;d=" + timenow);
    }

    $(document).ready(function () {
        switchCode();
        //===========input失去焦点
        $("form :input").blur(function () {
            //email
            if ($(this).is("#email")) {
                if (this.value == "") {
                    $("#s_email").attr("class", "formuser onError");
                    $("#s_email").html("*请输入用户名或邮箱地址");
                } else if (/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(this.value)) { //判断用户输入的是否是邮箱地址
                    checkRegister('email');
                } else if ((/^1[3,5,8]\d{9}$/.test(this.value))) {
                    checkRegister('cellphone');
                } else {
                    checkRegister('userName');
                    $("#s_email").attr("class", "formuser");
                }
            }
            //password
            if ($(this).attr("id") == "password") {
                pwd = this.value;
                if (this.value == "") {
                    $("#s_password").attr("class", "formpwd onError");
                    $("#s_password").html("*请輸入您的密码");
                } else if (this.value.length < 6) {
                    $("#s_password").attr("class", "formpwd onError");
                    $("#s_password").html("*密码长度为6-20个字符");
                } else {
                    $("#s_password").html("");
                    $("#s_password").attr("class", "");
                }
            }
            //验证码
            if ($(this).attr("id") == "code") {
                if (this.value == "") {
                    $("#s_code").attr("class", "formcod onError");
                    $("#s_code").html("*请输入验证码");
                } else {
                    $("#s_code").attr("class", "");
                    $("#s_code").html("");
                }
            }
        });
        getCookie();
    });

    //===验证数据
    function checkRegister(str) {
        var param = {};
        if (str == "userName") {
            param["paramMap.email"] = "";
            param["paramMap.userName"] = $("#email").val();
        } else if (str == "email") {
            param["paramMap.email"] = $("#email").val();
            param["paramMap.userName"] = "";
        } else {
            param["paramMap.email"] = "";
            param["paramMap.userName"] = "";
            param["paramMap.cellphone"] = $("#email").val();
        }
        $.post("ajaxCheckLog.do", param, function (data) {
            $("#email_").hide();
            if (data == 2 && str == "userName") {
                $("#s_email").html("*无效用户！");
            } else if (data == 3 && str == "userName") {
                $("#s_email").html("*该用户还没激活！");
                //add by houli
                $("#email_").show();
            } else if (data == 4 && str == "userName") {
                $("#s_email").attr("class", "formtips");
                $("#s_email").html("");
            }
            if (data == 0 && str == "email") {
                $("#s_email").html("*无效邮箱！");
            } else if (data == 1 && str == "email") {
                $("#s_email").html("*该邮箱用户还没激活！");
                //add by houli
                $("#email_").show();
            } else if (data == 4 && str == "email") {
                $("#s_email").attr("class", "formtips");
                $("#s_email").html("");
            }
            if (data == 5 && str == "cellphone") {
                $("#s_email").html("*用户不存在！");
            } else if (data == 4 && str == "cellphone") {
                $("#s_email").html("");
            }
        });
    }
</script>
<script>
    function login() {
        $(this).attr('disabled', true);
        if ($("#email").val() == "") {
            $("#s_email").attr("class", "formuser onError");
            $("#s_email").html("*请输用户名或邮箱地址");
        }
        if ($("#password").val() == "") {
            $("#s_password").attr("class", "formpwd onError");
            $("#s_password").html("*请输入密码");
            // $("#retake_password").hide();
        }
        //$('#btn_login').attr('value','登录中...');
        var param = {};
        param["paramMap.pageId"] = "userlogin";
        param["paramMap.email"] = $("#email").val();
        param["paramMap.password"] = $("#password").val();
        param["paramMap.code"] = $("#code").val();
        param["paramMap.afterLoginUrl"] = "${session.afterLoginUrl}";
        $.post("logining.do", param, function (data) {
            if (data == 1) {
                var afterLoginUrl = '${session.afterLoginUrl}';
                if (afterLoginUrl != '') {
                    window.location.href = '${session.afterLoginUrl}';
                } else {
                    window.location.href = 'home.do';
                }
                var checkday = $('#checkday').val();
                if (checkday > 0) {
                    var email = $('#email').val();
                    addCookie('email', email, checkday);
                }
            } else if (data == 2) {
                //$('#btn_login').attr('value','登录');
                $("#s_code").attr("class", "formcod onError");
                $("#s_code").html("*验证码错误！");
                switchCode();
                $("#btn_login").attr('disabled', false);
            } else if (data == 3) {
                //$('#btn_login').attr('value','登录');
                $("#s_email").attr("class", "formuser onError");
                $("#s_email").html("*用户名或密码错误！");
                switchCode();
                $("#btn_login").attr('disabled', false);
            } else if (data == 4) {
                // $('#btn_login').attr('value','登录');
                $("#s_email").attr("class", "formuser onError");
                switchCode();
                $("#s_email").html("*该用户已被禁用！");
                $("#btn_login").attr('disabled', false);
            }
        });
    }

    function reSendEmail() {
        if ($("#email").val() == "") {
            alert("请输入邮箱");
            return;
        }
        window.location.href = "reActivateEmail.do?email=" + $("#email").val();
    }

    $("#btn_login").click(function () {
        login();
    });

    function addCookie(objName, objValue, days) {
        var str = objName + "=" + escape(objValue);
        if (days > 0) {
            var date = new Date();
            var ms = days * 24 * 3600 * 1000;
            date.setTime(date.getTime() + ms);
            str += "; expires=" + date.toGMTString();
        }
        document.cookie = str;
    }

    function getCookie() {
        //取出cookies
        var arrStr = document.cookie.split("; ");
        for (var i = 0; i < arrStr.length; i++) {
            var temp = arrStr[i].split("=");

            if (temp[0] == 'email') {
                var userName = unescape(temp[1]);
                $('#email').val(userName);
            }
        }
    }
</script>
</body>
</html>
