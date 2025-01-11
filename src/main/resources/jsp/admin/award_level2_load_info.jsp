<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col" style="width: 50px;">
						序号
					</th>
					<th scope="col" style="width: 130px;">
						理财经理账号
					</th>
					<th scope="col">
						真实姓名
					</th>
					<th scope="col">
						身份证
					</th>
					<th scope="col">
					奖励提成
					</th>
					<th scope="col">
					操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="8">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
				<s:iterator value="pageBean.page" var="bean" status="st">
				<tr class="gvItem">
				<td align="center">
					 <c:out value="#st.count+#counts"/>
						</td>
						<td align="center">
					   ${userName}
						</td>
						<td>
						${realName}
						</td>
						<td>
						${card }
						</td>
						<td>
							${level2money }
						</td>
						<td>
						<a href="queryAwardLevel23Init.do?level2userId=${id }">查看</a>
						</td>
					</tr>
				</s:iterator>
				</s:else>
				<tr >
				<td  colspan="3"><strong>合计项</strong>
				&nbsp;&nbsp;奖励总合计:
				￥<c:if test="%{paramMap.sumLeve2Money==''}">0</c:if><s:else>
					<c:out value="paramMap.sumLeve2Money" default="0"/></s:else></td>
				<td colspan="1" align="right" >当前页的经济人奖励合计:</td>
				<td  align="center" ><fmt:formatNumber value="${sumLeve2M}" type="currency" pattern="￥.00"/></td>			
				</tr>
			</tbody>
		</table>
	</div>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
