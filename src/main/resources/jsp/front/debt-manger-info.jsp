<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>借款标题</strong></td>
		<td><strong>投资金额</strong></td>
		<td><strong>债权总额(￥)</strong></td>
		<td><strong>期限	</strong></td>
		<td><strong>剩余期限</strong></td>
		<td><strong>状态	</strong></td>
		<td><strong>操作	</strong></td>
	</tr>   
	<c:if test="pageBean.page==null || pageBean.page.size() == 0">
		<tr><td align="center" colspan="7">暂无记录</td></tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td><a href="financeDetail.do?id=${borrowId}" target="_blank">${borrowTitle	}</a></td>
				<td><c:out value="#bean.realAmount" default="0" /></td>
				<td><c:out value="%{#bean.recievedPI-#bean.hasPI}" default="0" /></td>
				<td>${deadline }个月	</td>
				<td>
					<c:if test="#bean.remainBorrowLimit!=null">${remainBorrowLimit }个月	</c:if>
					<s:else>--</s:else>
				</td>
				<td>
					<c:if test="#bean.debtStatus==1">审核中</c:if>
					<s:elseif test="#bean.debtStatus==2">竞拍中</s:elseif>
					<s:elseif test="#bean.debtStatus==3">转让成功</s:elseif>
					<s:elseif test="#bean.debtStatus==4">竞拍失败</s:elseif>
					<s:elseif test="#bean.debtStatus==5">撤销</s:elseif>
					<s:elseif test="#bean.debtStatus==6">审核失败</s:elseif>
					<s:elseif test="#bean.debtStatus==7">提前还款</s:elseif>
					<s:else>待申请</s:else>
				</td>
				<td class="btn_c">
					<c:if test="#bean.debtStatus==null||#bean.debtStatus ==4||#bean.debtStatus ==5||#bean.debtStatus ==6||#bean.debtStatus ==7">
						<a href="javascript:void(0)" onclick="addAssignmentDebt('${borrowId}','${recievedPI -hasPI}','${deadline}','${investId}','${recivedPrincipal - hasPrincipal}','${recievedInterest - hasInterest}','${remainDay }','${hasInterest}','${annualRate}','${remainBorrowLimit}')">
							债权转让</a>
					</c:if>
					<s:elseif test="#bean.debtStatus==1"><a href="cancelApplyDebt.do?debtId=${debtId}">撤回</a></s:elseif>
				</td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
	<shove:page	curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
		<s:param name="borrowerName">${paramMap.borrowerName }</s:param>
		<s:param name="borrowTitle">${paramMap.borrowTitle }</s:param>
	</shove:page>	
</div>
<!--分页器 结束-->
