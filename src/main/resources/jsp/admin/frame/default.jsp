<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/jsp/include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>管理首页</title>
    <title>好乐易贷后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
</head>
<frameset frameborder="0" rows="78,*" cols="*" border="0" framespacing="0">
    <frame name="top" src="/admin/top.do" scrolling="no" cols="20"/>
    <frameset cols="158,*" border="0" framespacing="0">
        <div style="width: 160px;" align="left">
            <frame name="left" src="/admin/menu.do" scrolling="no" target="main"/>
        </div>
        <frame name="main" src="/admin/main.do"/>
    </frameset>
    <noframes>
        <body>
        <p>此网页使用了框架，但您的浏览器不支持框架。</p>
        </body>
    </noframes>
</frameset>
</html>
