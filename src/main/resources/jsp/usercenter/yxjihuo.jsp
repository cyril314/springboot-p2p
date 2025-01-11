<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>
		<!--<div class="C_zc">
        <div class="C_zc_k">
            <div class="C_zc_zj" style="margin-top: 15px;">
            	<div class="C_zc_zj_l" style="width: 750px;">-->
            	<div class="calculator" >
            	<div class="ca_content" style="min-height: 200px;">
                	<div class="inmes_top">邮箱激活</div>
                		<span id="ok" style=" display:block; font-size: 14px; margin: 40px;">
                			邮件已经放到你的邮箱,请到您的邮箱验证
							<a href="http://<%=session.getAttribute("mail")%>" target="_blank" style='color: red;font-size: 14px'>登录邮箱>></a>
                		</span>	
					</div>
					</div>
					<!--
                </div>
            </div>
        </div>
    </div>-->
<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>
