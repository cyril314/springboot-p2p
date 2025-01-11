<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0">
	<tr>
		<td><strong>
			借款标题
		</strong></td>
		<td><strong>
			协议
		</strong></td>
		<td><strong>
			借款金额(￥)
		</strong></td>
		<td><strong>
			利率
		</strong></td>
		<td><strong>
			应还金额
		</strong></td>
		<td><strong>
			未还金额
		</strong></td>
		<td><strong>
			状态
		</strong></td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size<=0">
		<tr>
			<td align="center" colspan="11">
				暂无记录
			</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td align="center">
					<a href="financeDetail.do?id=${bean.borrowId}" target="_blank">${bean.borrowTitle
						}</a>
				</td>
				<td align="center">
					<%--<a href="javascript:showAgree('${bean.borrowId}');">查看协议</a>
							      --%>
					<a href="protocol.do?typeId=15&&borrowId=${bean.borrowId}"
						target="_blank">查看协议</a>
				</td>
				<td align="center">
					${bean.borrowAmount }元
				</td>
				<td align="center">
					${bean.annualRate }%
				</td>
				<td align="center">
					￥${bean.stillTotalSum }
				</td>
				<td align="center">
					￥${bean.hasSum }
				</td>
				<td align="center">
					${bean.borrowStatus }
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
				<s:param name="startTime">${paramMap.startTime}</s:param>
				<s:param name="endTime">${paramMap.endTime}</s:param>
				<s:param name="title">${paramMap.title}</s:param>
			</shove:page>
		</div>
<!--分页器 结束-->
