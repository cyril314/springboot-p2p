<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/index.css"  rel="stylesheet" type="text/css" />
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="queryCanAssignmentDebtInit.do">债权转让</a>  > 可转让的债权</div>
			<div id="acc_tabs">
				<div class="title">
					<a class="on" onclick="goUrl('queryCanAssignmentDebtInit.do');">可转让的债权</a>
					<a onclick="goUrl('queryAuctingDebtInit.do');">转让中的债权</a>
					<a onclick="goUrl('queryAuctedDebtInit.do');">转让结束的债权</a>
					<a onclick="goUrl('queryAuctionFailDebtInit.do');">转让失败的债权</a>
				</div>				
				<!--内容 开始-->
				<div id="showContent"><div align="center"><img src="{ctx}/static/images/load.gif"/></div></div>
				<!--内容 结束-->
				<!--弹出层 开始-->
				<div id="pop_box"></div>
				<div id="zrzq_div"> <!--  style="display: none;" -->
					<s:include value="debt-manger-add.jsp"></s:include>
				</div>
				<!--弹出层结束-->
			</div>
		</div>
	</div>
</div>
<div id="fade"></div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script type="text/javascript"src="${ctx}/static/js/popup.js"></script>
<script>
	$(function() {
		//默认选中样式
		dqzt(14, 't10');
		var param = {};
		initListInfo(param);

		//债权转让弹出层拖拽以及默认位置
		var pop2 = document.getElementById("pop2");
		var title = document.getElementById("title");

		drag(pop2, title);
		pop2.style.left = (document.documentElement.clientWidth - pop2.offsetWidth)/ 2 + "px";
		pop2.style.top = (document.documentElement.clientHeight - pop2.offsetHeight)/ 2 + "px";
	});
	//债权转让(借款标ID，债权总额，债权期限)子页传参
	function addAssignmentDebt(borrowId, debtSum, debtLimit, investId,remainingPrincipal,expectedEarnings,remainingDays,hasInterest,annualRate,remainBorrowLimit) {
		show('pop2');
		$("#zrzq_div").attr("style", "");
		$("#debtSum").val(debtSum);
		$("#span_debtSum").html(debtSum);

		$("#borrowId").val(borrowId);
		$("#debtLimit").val(debtLimit);
		$("#span_debtLimit").html(remainBorrowLimit+"/"+debtLimit);
		$("#investId").val(investId);
		$("#remainingPrincipal").val(remainingPrincipal);
		$("#span_remainingPrincipal").html(remainingPrincipal);
		$("#expectedEarnings").val(expectedEarnings);
		$("#span_expectedEarnings").html(expectedEarnings);
		$("#remainingDays").val(remainingDays);
		$("#span_remainingDays").html(remainingDays);
		//后加 by gengl 2014-12-23 09:47:25 
		$("#hasInterest").val(hasInterest);
		$("#span_hasInterest").html(hasInterest); //已收利息
		$("#annualRate").val(annualRate);//年利率
		$("#span_annualRate").html(annualRate);//年利率
		$("#remainBorrowLimit").val(remainBorrowLimit);//剩余期限
	}
	function goUrl(url) {
		window.location.href = url;
	}
	//初始化可转让的债权
	function initListInfo(param) {
		$.post("queryCanAssignmentDebt.do", param, function(data) {
			$("#showContent").html(data);
		});
		tab();
	}
	function tab() {
		$("#tab tbody tr:odd").addClass("t2");
		$("#tab tbody tr:even").addClass("t1");
	}
</script>	   
</body>
</html>
