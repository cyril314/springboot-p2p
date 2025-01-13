<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>管理首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${ctx}/static/css/admin/admin_css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script>
        var URL = "";
        var time = 5; //倒计时的秒数   
        $(function () {
            var obj = $("#msg-link li").first();
            URL = $(obj).find("a").attr("href");
            Load();
        });

        function Load() {
            for (var i = time; i >= 0; i--) {
                window.setTimeout("doUpdate(" + i + ")", (time - i) * 1000);
            }
        }

        function jump() {
            window.location = URL;
        }

        function doUpdate(num) {
            $("#times").html(num)
            if (num == 0) {
                jump();
            }
        }
    </script>
</head>
<body>
<div id="right" style="background-position: top; background-repeat: repeat-x;">
    <div style="padding: 15px 10px 0px 10px;">
        <div style="width: auto; padding: 10px; text-align: center;">
            <table align="center" width="400">
                <tr>
                    <td width="50" valign="top">
                        <c:if test="${helpMessage==null}">
                            <img src="{ctx}/static/images/admin/warning.gif" width="32" height="32" border="0"
                                 alt="warning"/>
                        </c:if>
                        <c:if test="${helpMessage!=null}">
                            <c:choose>
                                <c:when test="${helpMessage.msg_type==0}">
                                    <img src="{ctx}/static/images/admin/information.gif" width="32" height="32"
                                         border="0" alt="information"/>
                                </c:when>
                                <c:when test="${helpMessage.msg_type==1}">
                                    <img src="{ctx}/static/images/admin/warning.gif" width="32" height="32" border="0"
                                         alt="warning"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="{ctx}/static/images/admin/confirm.gif" width="32" height="32" border="0"
                                         alt="confirm"/>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                    <td style="font-size: 14px; font-weight: bold">
                        ${helpMessage==null?'页面已过期':helpMessage.title}
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td id="redirectionMsg">如果您不做出选择，将在<span id="times"></span>秒后为你跳转到第一个连接</td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <ul style="margin: 0; padding: 0 10px" class="msg-link" id="msg-link">
                            <c:if test="${helpMessage==null}">
                                <li><a href="default.do">返回主页</a></li>
                            </c:if>
                            <c:if test="${helpMessage!=null}">
                                <c:forEach items="${helpMessage.msg}" var="c" varStatus="sta">
                                    <li>
                                        <a href="${helpMessage.url[sta.index]}">${c}</a>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </td>
                </tr>
            </table>
            <br/>
        </div>
    </div>
</div>
</body>
</html>
