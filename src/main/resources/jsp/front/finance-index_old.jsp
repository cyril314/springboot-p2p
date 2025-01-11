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

		<!--我要投资 开始-->
		<div class="ny_main clearfix">
			<div class="h_wytz clearfix">
				<div class="tit1">
					<ul class="zq_tit">
						<li class="ico01 on1" id="borrow">
							<span>所有借款</span>
						</li>
						<li class="ico02" id="debt">
							<span>债权转让</span>
						</li>
					</ul>
					<ul class="zq_tit2">
						<li class="h_jsq">
							<a href="voteCalculator.do">收益计算器</a>
						</li>
						<li class="h_help1">
							<a href="callcenter.do">去帮助中心</a>
						</li>
					</ul>
				</div>
				<div id="showIncome"></div>
			</div>
		</div>
		<!--我要投资 结束-->


		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>

		<script>
	$(function() {
		var param = {};
		var flag = '${flag}';
		if(flag){
			$("#borrow").attr("class", "ico02");
			$("#debt").attr("class", "ico01 on1");
			debtInitInfo(param);
		}else{
			borrowInit(param);
		}
		$("#borrow").click(function() {
			$("#borrow").attr("class", "ico01 on1");
			$("#debt").attr("class", "ico02");
			borrowInit(param);
		});
		$("#debt").click(function() {
			$("#borrow").attr("class", "ico02");
			$("#debt").attr("class", "ico01 on1");
			debtInitInfo(param);
		});
	});
	function borrowInit(param) {
		$.post("financeBorrowInit.do", param, function(data) {
			$("#showIncome").html(data);
		});
	}
	function debtInitInfo(param) {
		$.post("financeDebtInit.do", param, function(data) {
			$("#showIncome").html(data);
		});
	}

</script>
	</body>
</html>
