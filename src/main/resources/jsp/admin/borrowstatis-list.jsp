<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<div class="pageDivClass">符合条件的借款管理费总额：￥&nbsp;<c:out value="%{#request.feeMap.amount}" default="0"/>&nbsp;元</div>
<div style="padding: 15px 10px 0px 10px;">
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th style="width: 35px;" scope="col">
						序号
					</th>
					<th style="width: 150px;" scope="col">
						借款用户名
					</th>
					<th style="width: 150px;" scope="col">
						借款标题
					</th>
					<th style="width: 150px;" scope="col">
						借款金额(元)
					</th>
					<th style="width: 200px;" scope="col">
						借款类型
					</th>
					<th style="width: 150px;" scope="col">
						借款期限
					</th>
					<th style="width: 150px;" scope="col">
						借款管理费
					</th>
					<th style="width: 150px;" scope="col">
						复审成功时间
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="8">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
				<s:iterator value="pageBean.page" var="bean" status="s">
					<tr class="gvItem">
						<td align="center">
							<c:out value="#s.count+#counts"/>
						</td>
						<td align="center">
							${bean.borrower}
						</td>
						<td align="center">
							${bean.borrowTitle}
						</td>
						<td align="center">
							${bean.borrowAmount}
						</td>
						<td align="center">
							<c:if test="#bean.borrowWay==1">
							净值借款
							</c:if>
							<s:elseif test="#bean.borrowWay==2">
							秒还借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==3">
							信用借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==4">
							实地考察借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==5">
							机构担保借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==6">
							流转标借款
							</s:elseif>
						</td>
						<td align="center">
							${bean.deadline}
							<c:if test="%{#bean.isDayThe ==1}">个月</c:if><s:else>天</s:else>
						</td>
						<td align="center">
							${bean.manageFee}
						</td>
						<td align="center">
							${bean.auditTime}
						</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
</div>
<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>