<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
				  
					<th style="width: 50px;" scope="col">序号</th>
					<th style="width: 100px;" scope="col">用户名</th>
					<th style="width: 120px;" scope="col">真实姓名</th>
					<th style="width: 100px;" scope="col">总金额</th>
					<th style="width: 100px;" scope="col">可用金额</th>
					<th style="width: 100px;" scope="col">冻结金额</th>
					<th style="width: 100px;" scope="col">待收金额</th>
					<th style="width: 100px;" scope="col">待还金额</th>
					<th style="width: 100px;" scope="col">总理财金额</th>
					<th style="width: 100px;" scope="col">可用理财金额</th>
					<th style="width: 100px;" scope="col">冻结理财金额</th>
					<th style="width: 80px;" scope="col">操作</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem"><td colspan="9">暂无数据</td></tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
					<s:iterator value="pageBean.page" var="bean" status="s">
						<tr class="gvItem">
							<td align="center" style="width:100px;">
								<c:out value="#s.count+#counts"/>
							</td>
							<td>${bean.username}</td>
							<td>${bean.realName}</td>
							<td>${bean.usableSum + bean.freezeSum +bean.dueinSum }</td>
							<td>${bean.usableSum}</td>
							<td>${bean.freezeSum}</td>
							<td>${bean.dueinSum}</td>
							<td>${bean.dueoutSum}</td>
							<td>${bean.usableGold+bean.freezeGold}</td>
							<td>${bean.usableGold}</td>
							<td>${bean.freezeGold}</td>
							<td><a href="queryBackCashInit.do?userId=${bean.userId }">充值/扣费</a></td>
						</tr>
					</s:iterator>
					<tr>
						<td>总计：</td>
						<td colspan="2">可用总额：${map.usableSums }</td>
						<td colspan="2">冻结总额：${map.freezeSums }</td>
						<td colspan="2">待收总额：${map.dueinSums }</td>
						<td colspan="2">待还总额：${map.dueoutSums }</td>
					</tr>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
