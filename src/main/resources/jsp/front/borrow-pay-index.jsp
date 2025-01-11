<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<input type="hidden" id="payId" value="${payMap.id}" />
<!-- 还款详情 -->
<table id="tab" class="jlmes2" cellpadding="0" cellspacing="0"> 
	<tr>
		<td align="right" width="200"><strong>账户余额：</strong></td>
		<td style="padding-left: 20px;">${payMap.totalSum }元</td>
	</tr>
	<tr>
		<td align="right"><strong>可用余额：</strong></td>
		<td style="padding-left: 20px;">${payMap.usableSum }元 </td>
	</tr>
	<tr>
		<td align="right"><strong>还款日期：</strong></td>
		<td style="padding-left: 20px;">${payMap.repayDate }</td>
	</tr>
	<tr>
		<td align="right"><strong>待还本息：</strong></td>
		<td style="padding-left: 20px;">${payMap.forPI }元</td>
	</tr>
	<tr>
		<td align="right"><strong>逾期本息：</strong></td>
		<td style="padding-left: 20px;">${payMap.lateFI }元</td>
	</tr>
	<tr>
		<td align="right"><strong>需还总额：</strong></td>
		<td style="padding-left: 20px;">${payMap.needSum }元</td>
	</tr>
	<tr>
		<td align="right"><strong>验证码：</strong></td>
		<td style="padding-left: 20px;">
			<input type="text" class="txtmail" name="paramMap.code" id="code" />
			<img src="admin/imageCode.do?pageId=vip" title="点击更换验证码" onclick="javascript: switchCode()" style="cursor: pointer;" id="codeNum" width="46" height="18"/>
		</td >
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="btnsave" class="update" style="cursor: pointer;" value="确认还款" />
		</td>
	</tr>
</table>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script>
var flag = true;
$(function() {
	$('#btnsave').click(function() {
		param['paramMap.id'] = $("#payId").val();
		param["paramMap.code"] = $("#code").val();
		if (flag) {
			$("#btnsave").attr("disabled", true);
			$('#btnsave').attr("value", "受理中...");
			$.shovePost('submitPay.do', param, function(data) {
				var callBack = data.msg;
				if (callBack == '') {
					flag = false;
					alert("操作成功!");
					parent.location.reload();
					return false;
				}
				alert(callBack);
				switchCode();
				$("#btnsave").attr("disabled", false);
				$('#btnsave').attr("value", "确认还款");
				flag = true;
			});
		}
	});
	switchCode();
});
function switchCode() {
	var timenow = new Date();
	$('#codeNum').attr('src','admin/imageCode.do?pageId=invest&d=' + timenow);
};
</script>
</body>
</html>