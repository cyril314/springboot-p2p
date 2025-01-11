<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<div class="tabcontent1">
<table cellpadding="0" cellspacing="0" class="jlmes">
	<tr>
		<td><strong>周期</strong></td>
		<td><strong>还款日期</strong></td>
		<td><strong>已还本息</strong></td>
		<td><strong>待还本息</strong></td>
		<td><strong>已付罚息</strong></td>
		<td><strong>待还罚息</strong></td>
		<td><strong>状态</strong></td>
	</tr>

	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<s:iterator value="pageBean.page" var="bean">
			<tr height="38">
				<td align="center">${bean.repayPeriod}</td>
				<td align="center">${bean.repayDate}</td>
				<td align="center">${bean.hasPI}</td>
				<td align="center">${bean.stillPI}</td>
				<td align="center">${bean.hasFI}</td>
				<td align="center"><c:if test="#bean.hasFI>0">0.00</c:if><s:else>${bean.lateFI}</s:else> </td>
				<td align="center">
					<c:if test="#bean.repayStatus == 1">未偿还</c:if>
					<s:elseif test="#bean.repayStatus == 2">已偿还</s:elseif>
					<s:elseif test="#bean.repayStatus == 3">偿还中</s:elseif>
				</td>
			</tr>
		</s:iterator>
	</c:if>
	<s:else><tr height="38"><td colspan="7" align="center">没有数据</td></tr></s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<div class="page" style="padding-top: 20px;">
			<p class="p1">
				<shove:page curPage="${pageBean.pageNum}" showPageCount="6"
					pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
					<s:param name="paramMap.id">${message.modeId}</s:param>
				</shove:page>
			</p>
		</div>
	</c:if>
</div>
<!--分页器 结束-->
</div>
<script>
	function initListInfo(param) {
		repaymentListInfo(param);
	}
</script>