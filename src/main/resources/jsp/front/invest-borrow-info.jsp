<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<p class="mt10">
	购买总金额：
	<em style="color: #fc5704; font-size: 16px; padding-right: 30px;">
		￥ <c:if
			test="#request.sumMap.realAmount!=null&&#request.sumMap.realAmount>0">${sumMap.realAmount}</c:if><s:else>0.00</s:else>
	</em> 预计总收益：
	<em style="color: #fc5704; font-size: 16px;"> ￥ <c:if
			test="#request.sumMap.recivedIncome!=null&&#request.sumMap.recivedIncome>0">${sumMap.recievedInterest-sumMap.manageFee}</c:if><s:else>0.00</s:else>
	</em>
</p>
<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>借款标题</strong></td>
		<td><strong>年化收益率</strong></td>
		<td><strong>购买金额(￥)</strong></td>
		<td><strong>期限</strong></td>
		<td><strong>预计收益</strong></td>
		<td><strong>状态</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size==0">
		<tr align="center">
			<td colspan="6">
				暂无数据
			</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td>
					<a href="financeDetail.do?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}</a>
				</td>
				<td>${bean.annualRate}%</td>
				<td>${bean.realAmount}</td>
				<td>
					${bean.deadline}
					<c:if test="%{#bean.isDayThe ==1}">个月</c:if>
					<s:else>天</s:else>
				</td>
				<td>
					<!-- ${bean.recivedIncome} -->
					${bean.recievedInterest-bean.manageFee}
				</td>
				<td>${bean.borrowStatusName }</td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
			<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
				pageSize="${pageBean.pageSize }" theme="jsNumber"
				totalCount="${pageBean.totalNum}">
				<s:param name="publishTimeStart">${paramMap.publishTimeStart}</s:param>
				<s:param name="publishTimeEnd">${paramMap.publishTimeEnd}</s:param>
				<s:param name="title">${paramMap.title}</s:param>
				<s:param name="type">${paramMap.type}</s:param>
			</shove:page>
		</div>
<!--分页器 结束-->
