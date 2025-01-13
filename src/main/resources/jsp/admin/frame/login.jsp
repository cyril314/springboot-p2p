<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>管理首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript">
        if (window != top) {
            top.location.href = location.href;
        }
        $(function () {
            switchCode();
            $(".login_code").val("");
            document.getElementById("userName").focus();
            $(window).bind('keyup', function (event) {
                if (event.keyCode == "13") {
                    validatorCodeIsExpired();
                }
            });
        });

        //初始化
        function switchCode() {
            var timenow = new Date();
            $("#codeNum").attr("src", "/captcha.do?pageId=adminlogin&d=" + timenow);
        }

        //判断验证码是否过期
        function validatorCodeIsExpired() {
            var param = {};
            param["pageId"] = "adminlogin";
            $.post("codeIsExpired.do", param, function (data) {
                if (data == 1) {
                    alert("验证码已过期");
                    switchCode();
                    return;
                }
                $("#loginForm").submit();
            });
        }
    </script>
    <style type="text/css">
        td_input {
            width: 100px;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
        }

        #btnLogin {
            background: url(/static/images/admin/login_menu.png);
            width: 100px;
            height: 32px;
            line-height: 32px;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
        }
    </style>
</head>
<body style=" background:url(/static/images/admin/login_bg.png) top;">
<form id="form1" action="adminLogin.do" method="post">
    <input type="hidden" value="adminlogin" name="pageId"/>
    <div style="width: 100%; overflow: hidden;">
        <div style="float: left; width: 100%; text-align: left; padding:120px 0px 5px 0px;">
            <strong style=" width:518px; margin:0 auto; display:block;">
                <img src="${ctx}/static/images/admin/sp2p.png" border="0"/>
                <img src="${ctx}/static/images/admin/logo.png" border="0"/>
            </strong>
        </div>
    </div>
    <div style="width:518px; margin:0px 0px 0px 0px; margin-left: auto; margin-right: auto;
            overflow: hidden;">
        <div style=" width: 518px; overflow:hidden;">
            <div style="margin-left: auto; margin-right: auto;">
                <div style="background-image: url(/static/images/admin/login_kuang_bg.png); overflow:hidden; height:259px;">
                    <table width="518" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr style="height: 40px"></tr>
                        <tr>
                            <td class="td_input" align="right">账号：</td>
                            <td width="300">
                                <input type="text" id="userName" name="userName" maxlength="25" class="login_text"/>
                            </td>
                        </tr>
                        <tr style="height: 20px">
                            <td></td>
                            <td><span style="color: red; font-size:12px;"></span></td>
                        </tr>
                        <tr>
                            <td class="td_input" align="right">密码：</td>
                            <td>
                                <input type="password" name="password" class="login_text" maxlength="20"/>
                            </td>
                        </tr>
                        <tr style="height: 20px">
                            <td></td>
                            <td><span style="color: red; font-size:12px;"></span></td>
                        </tr>
                        <tr>
                            <td class="td_input" align="right">验证码：</td>
                            <td valign="bottom">
                                <input type="text" name="code" class="login_text" style="width: 140px;"/>
                                <img width="58px" height="27px" title="点击更换验证码" onclick="javascript:switchCode()"
                                     id="codeNum" style="cursor: pointer; vertical-align:-6px; *vertical-align:-1px; margin-left:10px;"/>
                                <a href="javascript:;" onclick="switchCode()">换一换</a>
                            </td>
                        </tr>
                        <tr style="height: 20px">
                            <td></td>
                            <td><span style="color: red; font-size:12px;"></span></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding: 25px 0px 0px 0px;">
                                <input type="submit" value="确认" id="btnLogin"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>

