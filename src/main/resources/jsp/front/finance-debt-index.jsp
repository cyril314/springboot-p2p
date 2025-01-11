<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<!--债权转让-->
<div class="moneyall">
	<input type="hidden" value="${order}" id="norder"/>
	<div id="showList"></div>
</div>
   
<script type="text/javascript">
$(function() {
	var param = {};
	initListInfo(param);
	$("#order a").click(function() {
		if ($(this).attr("class") == "up") {
			$(this).attr("class", "drop");
			$(this).val(2);
		} else if ($(this).attr("class") == "drop") {
			$(this).attr("class", "up");
			$(this).val(1);
		} else {
			return;
		}
		$("#norder").val($(this).attr("id"));
		var praData = {};
		initListInfo(praData);
	});
});
function initListInfo(param) {
	param["paramMap.order"] = $("#norder").val();
	param["paramMap.orderAmount"] = $("#10").val();
	param["paramMap.orderHasInvestAmount"] = $("#11").val();
	param["paramMap.orderRate"] = $("#12").val();
	param["paramMap.orderDeadline"] = $("#13").val();

	$.post("financeDebtList.do", param, function(data) {
		$("#showList").html("");
		$("#showList").html(data);
	});
};
</script>