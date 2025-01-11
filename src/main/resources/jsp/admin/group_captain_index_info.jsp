<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 98%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col" style="width: 20px;" >
						序号
					</th>
					<th scope="col" style="width: 100px;" >
						业务机构
					</th>
					<th scope="col" style="width: 100px;" >
						负责人
					</th>
					<th style="width: 150px;" scope="col">
						身份证号码
					</th>
					<th style="width: 100px;" scope="col">
						手机号码
					</th>
					<th style="width: 260px;" scope="col">
						描述
					</th>
					<th style="width: 120px;" scope="col">
						添加时间
					</th>
					<th style="width: 60px;" scope="col">
						理财经理
					</th>
					<th style="width: 60px;" scope="col">
						会员人数
					</th>
					<th style="width: 60px;" scope="col">
						状态
					</th>
					<th style="width: 70px;" scope="col">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="9">暂无数据</td>
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
							${telphone }
						</td>
						<td>
							<shove:sub value="#bean.summary" size="50" suffix="..."/>
						</td>
						<td>
							${bean.addDate }
						</td>
						<td>
							<c:out value="#bean.level2Count" default="0"/>
						</td>
						<td>
							<c:out value="#bean.level3Count" default="0"/>
						</td>
						<td>
							${bean.enable==1?'启用':'禁用' }
						</td>
							<td>
								<a href="updateGroupCaptainInit.do?id=${bean.id }" target="main">
						编辑</a>
						
					</td></tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
