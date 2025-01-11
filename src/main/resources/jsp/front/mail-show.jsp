<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
		<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	</head>

	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a> > <a href="mailNoticeInit.do">通知设置</a> > 站内信详情</div>
			<div id="acc_tabs">							
				<!--内容 开始-->
			<div>
			  <table class="znx_mail">
			      <tr>
			        <td colspan="3" align="center">
			          <strong>${title}</strong>
			        </td>
			      </tr>
                  <tr style="color: #868686">
                    <td align=left>发件人：${sender}</td>
                    <td align="center">收件人：${receiver}</td>
                    <td align="right">时间：${date }</td>
                  </tr>
                  <tr>
                    <td colspan="3">${content}</td>
                  </tr>
                 <tr>
                    <td colspan="3" align="center"><input type="button" value="返回" onclick="javascript:history.go(-1);" class="update"/></td>
                 </tr>
              </table>	
           </div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>

<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
