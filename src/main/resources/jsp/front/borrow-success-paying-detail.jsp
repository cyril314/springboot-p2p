<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!-- 还款明细页面 -->
<div class="biaoge2" id="biaoge2_details">
	<input type="hidden" value="${paramMap.borrowId}" id="borrowIdval" />
	<table width="100%" border="0" cellspacing="10" cellpadding="0">
		<tr height="10"></tr>
		<tr>
			<td align="left">标题：${borrowTitle }</td>
			<td align="left">借款金额：￥${borrowAmount }</td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr height="6"></tr>
		<tr>
			<td align="left">借款利率：${annualRate }%</td>
			<td align="left">借款期限：${deadline }
				<c:if test="#request.isDayThe == 1">个月</c:if>
				<s:else> 天</s:else>
			</td>
			<td align="left">&nbsp;</td>
		</tr>
		<tr height="6"></tr>
		<tr>
			<td align="left">还款方式：
				<c:if test="#request.paymentMode == 1">按月等额本息还款</c:if>
				<s:elseif test="#request.paymentMode == 2">按先息后本还款</s:elseif>
				<s:elseif test="#request.paymentMode == 3">秒还</s:elseif>
				<s:elseif test="#request.paymentMode == 4">一次性还款</s:elseif>
			</td>
			<td align="left">发布时间：${publishTime }</td>
			<td align="left">借款时间：${auditTime}</td>
		</tr>
	</table>
</div>
<!-- 列表 -->
<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
		<tr>
			<td><strong>序号</strong></td>
			<td><strong>计划还款日期</strong></td>
			<td><strong>计划还款本息</strong></td>
			<td><strong>实还日期</strong></td>
			<td><strong>逾期天数</strong></td>
			<td><strong>实还本息</strong></td>
			<td><strong>逾期罚息</strong></td>
			<td><strong>总还款金额</strong></td>
			<td><strong>状态</strong></td>
			<td><strong>操作</strong></td>
		</tr>

		<c:if test="pageBean.page==null || pageBean.page.size<=0"><tr><td align="center" colspan="11">暂无记录</td></tr></c:if>
		<s:else>
			<s:iterator value="pageBean.page" var="bean" status="sta">
				<s:set name="counts" value="#request.pageNum"/>
				<input type="hidden" value="${bean.borrowId}" id="borrow_id" />
				<tr>
					<td align="center"><c:out value="#sta.count+#counts"/></td>
					<td align="center">${bean.repayDate}</td>
					<td align="center">￥${bean.repayTotal}</td>
					<td align="center">${bean.realRepayDate}</td>
					<td align="center">${bean.lateDay }天</td>
					<td align="center">￥${bean.hasPI }</td>
					<td align="center">￥${bean.lateTotal }</td>
					<td align="center">￥${bean.total }</td>
				<c:if test="#bean.repayStatus=='已偿还'">
					<td align="center">${bean.repayStatus }</td>
					<td align="center">-</td>
				</c:if>
				<s:else>
					<td align="center">${bean.repayStatus }</td>
					<td align="center"><a href="javascript:myPay(${bean.id});">还款</a></td>
				</s:else>
				</tr>
			</s:iterator>
		</s:else>
	</table>
<!--分页器 开始-->
<div class="digg clear">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
		<param></param>
	</shove:page>
</div>
<!--分页器 结束-->
<span id="my_pay"></span>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script>
function myPay(id) {//还款
	var url = "queryMyPayData.do?payId=" + id;
	jQuery.jBox.open("post:" + url, "还款", 700, 355, {
		buttons : {}
	});
}
function initListInfo(param) {//弹出窗详情
	param["paramMap.borrowId"] = $("#borrow_id").val();
	param["paramMap.status"] = "1";
	$.shovePost("queryPayingDetails.do", param, function(data) {
		$("#borrow_details").html(data);
	});
}
</script>