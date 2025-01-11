<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
				  
					<th >
						推荐人
					</th>
					<th>
						推荐的用户
					</th>
					<th>
						用户创建时间
					</th>
					<th>
					    用户成为vip时间
					</th>
				<!-- 	<th>
						详细信息
					</th> -->
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="9">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
					<s:iterator value="pageBean.page" var="bean" status="s">
						<tr class="gvItem">
							<td>
								${bean.refferee}
							</td>
							<td>
								${bean.username }
							</td>
							<td>
								${bean.createTime }
							</td>
							<td>
								 ${bean.vipCreateTime }
							</td>
						<!-- 	<td>
								<a href="friendRecommendXiangQingInit.do?refferee=${bean.refferee}&timeStart=${timeStart}&timeEnd=${timeEnd }">详情信息</a>
							</td>	 -->			
						</tr>
					</s:iterator>
				</s:else>
				 <tr class="gvItem"><td colspan="4" align="left"><font size="2">共有${totalNum }条记录</font></td></tr>
			</tbody>
		</table>
		<p />
		
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
