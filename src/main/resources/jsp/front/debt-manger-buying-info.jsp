<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>


<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>借款标题</strong></td>
		<td><strong>债权本金</strong></td>
		<td><strong>剩余期数/期限</strong></td>
		<td><strong>最高出价</strong></td>
		<td><strong>我的出价</strong></td>
		<td><strong>剩余购买时间</strong></td>
		<td><strong>操作</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size() == 0">
		<tr>
			<td colspan="7">暂无数据	</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td>${borrowTitle }</td>
				<td>${recivedPrincipal-hasPrincipal}</td>
				<td>${deadline-hasDeadline }/${deadline }个月</td>
				<td>${auctionHighPrice }</td>
				<td>${auctionPrice }</td>
				<td>
					<c:if test="#bean.debtStatus == 2">${remainDays } </c:if>
					<s:else>已结束</s:else>
				</td>
				<td>
					<c:if test="#bean.auctionCount<2">
						<c:if test="#bean.debtStatus == 2">
							<a href="auctingDebtInit.do?debtId=${debtId }">出价</a>
						</c:if>
					</c:if>
					<a href="queryDebtDetail.do?id=${debtId }" target="_blank"> 查看</a>
					<!--  <a class="btn_c">出价</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">查看</a> -->
				</td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
			<shove:page url="queryBuyingDebt.do" curPage="${pageBean.pageNum}"
				showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber"
				totalCount="${pageBean.totalNum}">
				<s:param name="startTime">${paramMap.startTime }</s:param>
				<s:param name="endTime">${paramMap.endTime }</s:param>
				<s:param name="borrowTitle">${paramMap.borrowTitle }</s:param>
			</shove:page>
			
</div>
<!--分页器 结束-->
