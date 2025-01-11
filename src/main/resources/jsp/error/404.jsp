<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${ctx}/static/css/error.css" type="text/css"/>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- END引用头部公共部分 -->
<div class="error__container">
    <div class="error__code">
        <p>4</p>
        <p>0</p>
        <p>4</p>
    </div>
    <div class="error__title">访问的页面不存在</div>
    <div class="error__description"> 请检查访问地址.</div>
    <button class="action" onclick="javascript:window.history.go(-1);">返回</button>
</div>
<div class="clear"></div>
<!-- 引用底部公共部分-->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/nav.js"></script>
<script type="text/javascript">
    $(function () {
        $("#sy_hover").attr('class', 'nav_first');
        $("#sy_hover div").removeClass('none');
    });
</script>
</body>
</html>