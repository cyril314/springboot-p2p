<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>借款标题</strong></td>
		<td><strong>投资金额</strong></td>
		<td><strong>债权本金(￥)</strong></td>
		<td><strong>转让价</strong></td>
		<%--<td><strong>最高价格</strong></td>--%>
		<td><strong>剩余购买时间</strong></td>
		<td><strong>年收益率</strong></td>
		<td><strong>操作</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size() == 0">
		<tr>
			<td align="center" colspan="7">
				暂无记录
			</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td><a href="financeDetail.do?id=${borrowId}" target="_blank">${borrowTitle}</a></td>
				<td><fmt:formatNumber  value='${realAmount }'type="currency"  pattern="0.00" /></td>
				<td>${recivedPrincipal-hasPrincipal}</td>
				<td>${auctionBasePrice }</td>
				<%--<td>
					<c:if test="#bean.auctionHighPrice!=null">${auctionHighPrice}</c:if>
					<s:else>无</s:else>
				</td>
				--%>
				<td>${remainDays }</td>
				<td>${annualRate }</td>
				<td>
					<c:if test="#bean.auctionHighPrice!=null">
						<a href="auctingWebDebtEnd.do?debtId=${debtId}">成交</a>
					</c:if>
					<s:else></s:else>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="queryDebtDetail.do?id=${debtId }&uId=${alienatorId}&uName=${alienatorName}" target="_blank">查看</a>
				</td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
			<shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber"
				totalCount="${pageBean.totalNum}">
				<s:param name="borrowerName">${paramMap.borrowerName }</s:param>
				<s:param name="borrowTitle">${paramMap.borrowTitle }</s:param>
			</shove:page>			
</div>
<!--分页器 结束-->