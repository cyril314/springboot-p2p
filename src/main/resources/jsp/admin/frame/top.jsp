﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>管理首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.2.6.pack.js"></script>
    <script type="text/javascript">
        function loginOut() {
            if (confirm("是否确定要退出？")) {
                window.parent.location = "adminLoginOut.do";
            }
        }

        $(function () {
            $(".daohang_all ul li").click(function () {
                $(".daohang_all ul li").attr("class", "");
                $(this).attr("class", "daohang");
            })
        });
    </script>
</head>
<body>
<div style="width: 100%; overflow: hidden; height:80px; background: url(/static/images/admin/navbg.gif) repeat-x; overflow: hidden; border-top:3px solid #3ca1d6;">
    <div class="white14" style="float: left; width:180px; text-align: left; height:40px; overflow: hidden;">
        <a href="../index.jsp" target="_blank">
            <img src="${ctx}/static/images/admin/logo.png" border="0" style="margin-top:5px;"/>
        </a>
    </div>
    <div class="daohang_all">
        <ul>
            <c:forEach items="${adminRoleMenuList}" var="bean" varStatus="sta">
                <c:if test="${bean.rightsId<0}">
                    <c:choose>
                        <c:when test="${bean.rightsId == -11}"></c:when>
                        <c:otherwise>
                            <li><a href="showsubmenu.do?index=${bean.rightsId }" target="left">${bean.summary }</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div style="width:100%; float:left; margin-top:5px;">
        <div class="white12" style="float: left; width: 380px; overflow: hidden; margin-left:15px;">
            <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
            <script type="text/javascript">
                today = new Date();

                function initArray() {
                    this.length = initArray.arguments.length
                    for (var i = 0; i < this.length; i++)
                        this[i + 1] = initArray.arguments[i]
                }

                var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                var year = today.getYear();
                if ($.browser.mozilla) {
                    year = year + 1990;
                }
                document.write("", year, "年", today.getMonth() + 1, "月", today.getDate(), "日   ", d[today.getDay() + 1], "");
                document.write("&nbsp;");
            </script>
        </div>
        <div class="white16" style="float: right; width: 300px; height:40px; text-align:right; margin-right:15px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td height="16" width="300px;" class="black12">
                        <img src="${ctx}/static/images/admin/icon_tx.gif" height="16" style="vertical-align:-3px;"/>
                        欢迎您：${sessionScope.admin.userName }&nbsp;<span style="color:#999;	">|</span>&nbsp;
                        [<a id="lbtnLogout" href="javascript:loginOut();" class="top_aa">安全退出</a>]
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>