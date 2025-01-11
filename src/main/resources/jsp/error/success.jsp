<%@ page language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!--顶部状态栏 开始-->
<jsp:include page="../include/top.jsp"></jsp:include>
<!--顶部主导航 结束-->
<div class="error__container">
    <div class="error__code">
        <p>2</p>
        <p>0</p>
        <p>0</p>
    </div>
    <div class="error__title">操作成功</div>
    <div class="error__description"> 请稍后再试!</div>
    <button class="action" onclick="javascript:window.history.go(-1);">返回</button>
</div>
<!-- 引用底部公共部分 -->
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