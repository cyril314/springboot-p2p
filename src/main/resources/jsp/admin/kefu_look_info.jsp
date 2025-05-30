<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
				    <th style="width: 35px;" scope="col">
						用户名
					</th>
					<th style="width: 70px;" scope="col">
						真实姓名
					</th>
					<th style="width: 80px;" scope="col">
					    总投资金额（不包含不成功的投标）
					</th>	
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="4">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
					<s:iterator value="pageBean.page" var="bean" status="st">
						<tr class="gvItem">
						    <td>
						     ${bean.username }
							</td>
							<td>
								${bean.realName }
							</td>
							<td>
								${bean.countRealAmount}
							</td>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
