<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="queryBuyingDebtInit.do">债权购买</a>  > 已成功购买的债权</div>
			<div id="acc_tabs">
				<div class="title">
					<a onclick="goUrl('queryBuyingDebtInit.do')">参与购买的债权</a>
					<a class="on" onclick="goUrl('querySucessBuyedDebtInit.do')">已成功购买的债权</a>
				</div>				
				<!--内容 开始-->
				<div class="rz_content clearfix tab_content" id="showContent">
				</div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>

<script>
	$(function(){
		//默认选中样式
		dqzt(15,'t10');
		var param = {};
		initListInfo(param);
	});


	function goUrl(url){
	   	   window.location.href = url;
	   }	
	function initListInfo(param){
		$.post("querySucessBuyedDebt.do",param,function(data){
			$("#showContent").html(data);
		});
		tab();
	}
		function tab(){
   $("#tab tbody tr:odd").addClass("t2");
   $("#tab tbody tr:even").addClass("t1");
   }
</script>
	
</body>
</html>
