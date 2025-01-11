<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="./include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8"/>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/common.js"></script>
</head>
<body>
<!--顶部状态栏 开始-->
<jsp:include page="../include/top.jsp"></jsp:include>
<!--顶部主导航 结束-->
<!--提示消息主要 开始-->
<div class="wrap" style="min-height: 400px;">
    <div class="main" style="text-align: center; width: 100%; margin-top: 130px;">
        <span style="font-size: 36px; color: #eb6100;">${title }</span>
        <br/>
        <br/>
        <a href="/index.do">返回首页</a>
    </div>
</div>
<!--底部快捷导航 开始-->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
