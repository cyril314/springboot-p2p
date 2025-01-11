<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th style="width: 50px;" scope="col" align="center" width="50">
						序号
					</th>
					<th  scope="col" align="center" width="100">
						额度类型
					</th>
					<th  scope="col" align="center" width="100">
						标识符
					</th>
					<th scope="col"  align="center" width="100">
						标题
					</th>
					<th  scope="col" align="center" width="200">
						初始额度
					</th>
					<th  scope="col" align="center" width="100">
						状态
					</th>
					<th scope="col" align="center" width="700">
						描述
					</th>
					<th  scope="col" width="200">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="7">暂无数据</td>
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
								${name }
							</td>
							<td>
								${nid}
							</td>
							<td align="center">
						   		${title }
							</td>
							<td align="center">
						   		${init_credit }
							</td>
							<td align="center">
							<c:if test="%{status == 1}">
								开启
							</c:if>
						    <s:else>
						    	关闭
						    </s:else>
							</td>		
							
							<td align="center">
						   		<shove:sub value="#bean.description" size="255" suffix="..."/>
							</td>	
							<td>
							<a href="updatgeBorrowAmountInit.do?id=${id}">修改</a>
							</td>		
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	
<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
	