<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col" style="width: 200px;" >
						用户名
					</th>
						<!--<th style="width: 200px;" scope="col">
						操作表
					</th>
						--><th style="width: 100px;" scope="col">
						操作类型
					</th>
					<th style="width: 300px;" scope="col">
						操作时间
					</th>
					<th style="width: 400px;" scope="col">
						操作内容
					</th>
					<th style="width: 100px;" scope="col">
						操作金额
					</th>
				
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="8">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				
				<s:iterator value="pageBean.page" var="bean" status="st">
					<tr class="gvItem">
						<td align="center">
							${bean.operation_user }
						</td>
							<!--<td>
							${bean.operation_table }
						</td>
						--><td>
						<c:if test="#bean.operation_type==1">增加</c:if>
						<c:if test="#bean.operation_type==2">修改</c:if>
						<c:if test="#bean.operation_type==3">删除</c:if>
						<c:if test="#bean.operation_type==4">下载</c:if>
						<c:if test="#bean.operation_type==5">导出Excel</c:if>
						</td>
						<td>
							<s:date name="#bean.operation_time" format="yyyy-MM-dd HH:mm:ss" />
						</td>
				        <td>
							${bean.operation_remarks }
						</td>
						<td>
						<c:if test="#bean.operation_money == null || #bean.operation_money =='' ">0.0</c:if>
						<s:else>${bean.operation_money }</s:else>	
						</td>
					 </tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
