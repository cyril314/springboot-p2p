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
						业务机构账号
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
						${level1money }
						</td>
						<td>
						<a href="queryAwardLevel1Init.do?level1userId=${id }">查看</a>
						</td>
					</tr>
				</s:iterator>
				</s:else>
				<tr >
				<td  colspan="3"><strong>合计项</strong>&nbsp;&nbsp;&nbsp;提成总合计:
				￥<c:if test="%{paramMap.level1moneySum==''}">0</c:if><s:else>
					<c:out value="paramMap.level1moneySum" default="0"/></s:else></td>
				<td colspan="1" align="right" >当前页的业务机构提成总合计:</td>
				<td  align="center" ><fmt:formatNumber value="${leve1moeneySum}" type="currency" pattern="￥0.00"/></td>			
				</tr>
			</tbody>
		</table>
	</div>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
