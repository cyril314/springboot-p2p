<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>借款标题</strong></td>
		<td><strong>债权本金</strong></td>
		<td><strong>剩余期数</strong></td>
		<td><strong>转让者</strong></td>
		<td><strong>我的出价</strong></td>
		<td><strong>购买成功时间</strong></td>
		<td><strong>年收益率</strong></td>
		<td><strong>下次还款日期</strong></td>
		<td><strong>操作</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size() == 0">
		<tr><td colspan="9">暂无记录</td></tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td>${borrowTitle }</td>
				<td>${recivedPrincipal}</td>
				<td>${deadline-hasDeadline }/${deadline }个月</td>
				<td>${assiUsername }</td>
				<td>${auctionHighPrice }</td>
				<td>${auctionEndTime }</td>
				<td>${annualRate }</td>
				<td>${nextrepaymentDate }</td>
				<td><a href="queryDebtDetail.do?id=${id }" target="_blank">查看</a></td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="6"	pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}">
		<s:param name="startTime">${paramMap.startTime }</s:param>
		<s:param name="endTime">${paramMap.endTime }</s:param>
		<s:param name="borrowTitle">${paramMap.borrowTitle }</s:param>
	</shove:page>
</div>
<!--分页器 结束-->