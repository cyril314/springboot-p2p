<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>

	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
				    <th style="width: 100px;" scope="col">
						序号
					</th>
					<th style="width: 100px;" scope="col">
						举报人
					</th>
					<th style="width: 100px;" scope="col">
					    被举报人
					</th>
					<th style="width: 100px;" scope="col">
					    举报类型
					</th>
					<th style="width: 100px;" scope="col">
					    内容
					</th>	
					<th style="width: 100px;" scope="col">
					   举报时间
					</th>									
					<th style="width: 100px;" scope="col">
						状态	
					</th>				
					<th style="width: 100px;" scope="col">
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
					<s:iterator value="pageBean.page" var="bean" status="s">
						<tr class="gvItem">
						    
							<td>
								<c:out value="#s.count+#counts"/>
							</td>
							<td>
								${bean.user}
							</td>
							<td>
								${bean.reporter}
							</td>
							<td>
							   <c:if test="#bean.reportType==1">
							     违约 
							   </c:if>
							   <s:else>
							     其他
							   </s:else>
								
							</td>
							<td height="30" width="200" style="overflow: hidden;">
								${bean.reportContent}...
							</td>
							<td>
								${bean.reportTime}
							</td>
							<td>
							  <c:if test="#bean.status==1">
							    等待处理
							  </c:if>
							  <s:elseif test="#bean.status==2">
							    举报成功
							  </s:elseif>
							  <s:elseif test="#bean.status==3">
							    举报失败
							  </s:elseif>
								
							</td>
							<td>
							    <c:if test="#bean.status==1">
							    <a href="javascript:updates(${bean.id})" >
								    处理
								</a>
							    </c:if>
							    <s:else>
							      --
							    </s:else>
								
								&nbsp;&nbsp;
								<a href="javascript:del(${bean.id})" >
								    删除
								</a>
							</td>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	<table style="border-collapse: collapse; border-color: #cccccc"
		cellspacing="1" cellpadding="3" width="100%" align="center" border="1">
		<tbody>
			
		</tbody>
	</table>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
