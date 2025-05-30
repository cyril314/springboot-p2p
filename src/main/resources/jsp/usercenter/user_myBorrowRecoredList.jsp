<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
	//分页

	function initListInfo(praData) {
		praData["paramMap.id"] = '${id}';
		$.post("queryBorrowRecode.do", praData, initCallBack);
	}
</script>

<table width="100%" cellpadding="0" cellspacing="0" border="0"
	class="zh_table" style="margin-top: 20px;">
	<tr>
		<th>
			标题
		</th>
		<th>
			投标金额
		</th>
		<th>
			投标时间
		</th>
		<th>
			状态
		</th>
	</tr>
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<s:iterator value="pageBean.page" var="finance">
			<tr>
				<td align="center">
					<a href="financeDetail.do?id=${finance.id}">${finance.borrowTitle}</a>
				</td>
				<td align="center">
					${finance.investAmount}
				</td>
				<td align="center">



					${finance.investTime}

				</td>
				<!-- 状态 -->
				<c:if test="#finance.borrowStatus ==1">
					<td align="center">
						正在审核中
					</td>
				</c:if>
				<s:elseif test="#finance.borrowStatus ==2">

					<td align="center">
						正在招标中
					</td>

				</s:elseif>
				<s:elseif test="#finance.borrowStatus ==3">

					<td align="center">
						已满标
					</td>

				</s:elseif>
				<s:elseif test="#finance.borrowStatus ==4">
					<td align="center">
						还款中
					</td>
				</s:elseif>
				<s:elseif test="#finance.borrowStatus ==5">
					<td align="center">
						已还完
					</td>
				</s:elseif>
				<s:elseif test="#finance.borrowStatus ==6">
					<td align="center">
						流标
					</td>
				</s:elseif>


			</tr>
		</s:iterator>
	</c:if>
	<s:else>
		<tr>
			<td colspan="4" align="center">
				<a style="text-align: center;">没有数据</a>
			</td>
		</tr>
	</s:else>
</table>
<div class="fenyemain" align="center">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
		pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}"></shove:page>
</div>
