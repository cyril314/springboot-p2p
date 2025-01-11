<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th style="width: 50px;" scope="col">
						序号
					</th>
						<th style="width: 100px;" scope="col">
						用户名
					</th>
						<th style="width: 100px;" scope="col">
						真实姓名
					</th>
						<th style="width: 100px;" scope="col">
						申请vip时间
					</th>
						<th style="width: 100px;" scope="col">
						到期vip时间
					</th>
						<th style="width: 100px;" scope="col">
						付费状态
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="6">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
					<s:iterator value="pageBean.page" var="bean" status="s">
						<tr class="gvItem">
							<td>
								<c:out value="#s.count+#counts"/>
							</td>
							<td>
							${username }
							</td>
								<td>
							${realName }
							</td>
								<td>
							${vipCreateTime }
							</td>
								<td>
							${vip }
							</td>
								<td>
								<c:if test="#bean.feeStatus==1">未扣除</c:if>
								<c:if test="#bean.feeStatus==2">已付费</c:if>
							</td>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
<script>

</script>

	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>