<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0">
	<tr>
		<td><strong>
			借款人
		</strong></td>
		<td><strong>
			标题
		</strong></td>
		<td><strong>
			类型
		</strong></td>
		<td><strong>
			合同协议
		</strong></td>
		<td><strong>
			年利率
		</strong></td>
		<td><strong>
			期限
		</strong></td>
		<td><strong>
			投资金额
		</strong></td>
		<td><strong>
			已收金额
		</strong></td>
		<td><strong>
			操作
		</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size==0">
		<tr align="center">
			<td colspan="10">
				暂无数据
			</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td align="center">
					${bean.borrower}
				</td>
				<td align="center">
					<a href="financeDetail.do?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}<c:if
							test="#bean.isDebt==2">
							<br />(转让)</c:if> </a>
				</td>
				<td align="center">
					<c:if test="#bean.borrowWay ==1">净值借款</c:if>
					<s:elseif test="#bean.borrowWay ==2"> 秒还借款</s:elseif>
					<s:elseif test="#bean.borrowWay ==3">信用借款</s:elseif>
					<s:elseif test="#bean.borrowWay ==4">实地考察借款</s:elseif>
					<s:elseif test="#bean.borrowWay ==5">机构担保借款</s:elseif>
					<s:elseif test="#bean.borrowWay ==6">流转标借款</s:elseif>
				</td>
				<td align="center">
					<a
						href="protocol.do?typeId=1&&borrowId=${bean.borrowId }&&investId=${bean.bid }&&styles=1"
						target="_blank">合同协议</a>
				</td>
				<td align="center">
					${bean.annualRate}%
				</td>
				<td align="center">
					${bean.deadline}
					<c:if test="%{#bean.isDayThe ==1}">个月</c:if>
					<s:else>天</s:else>
				</td>
				<td align="center">
					${bean.realAmount}
				</td>
				<td align="center">
					${bean.forTotalSum}
				</td>
				<td align="center">
					<a href="javascript:viewDetail('${bean.borrowId}','${bean.bid }');">查看详情</a>
				</td>
			</tr>
		</s:iterator>
	</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
			<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
				pageSize="${pageBean.pageSize }" theme="jsNumber"
				totalCount="${pageBean.totalNum}">
				<s:param name="title">${paramMap.title}</s:param>
				<s:param name="type">${paramMap.type}</s:param>
			</shove:page>
		</div>
	
<!--分页器 结束-->
