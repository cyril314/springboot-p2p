<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 98%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th style="width: 100px;" scope="col">
						序号
					</th>
					<th scope="col" style="width: 130px;" >
						业务机构
					</th>
					<th scope="col" style="width: 110px;" >
						理财经理
					</th>
					<th scope="col" style="width: 100px;" >
						发展的会员
					</th>
					<th scope="col" style="width: 100px;" >
						真实姓名
					</th>
					<th style="width: 100px;" scope="col">
						身份证
					</th>
					<th style="width: 100px;" scope="col">
						注册时间
					</th>
					<th style="width: 100px;" scope="col">
						投资总额
					</th>
					<th style="width: 100px;" scope="col">
						借款总额
					</th>
					<th style="width: 100px;" scope="col">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="10">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
				<s:iterator value="pageBean.page" var="bean" status="s">
					<tr class="gvItem">
						<td>
							<c:out value="#s.count+#counts"/>
						</td>
						<td align="center">
							<c:if test="#bean.userName1!=null&&#bean.userName1!=''">
								${userName1}<br/>
								(${realName1})
							</c:if>
						</td>
						<td align="center">
						<c:if test="#bean.userName2!=null&&#bean.userName2!=''">
							${userName2}<br/>
							(${realName2})
						</c:if>
						</td>
						<td align="center">
							${userName3}
						</td>
						<td>
							${realName3}
						</td>
						<td>
							${idNo }
						</td>
						<td>
						${bean.addDate }
						</td>
						<td>
							<c:out value="#bean.investAmount" default="0"/>
						</td>
						<td>
							<c:out value="#bean.borrowAmount" default="0"/>
						</td>
							<td>
							<span style="cursor: pointer;" class="enable" rId="${bean.id }" enable="${bean.enable }" >
							${enable==1?'解除关联':'重置关系'}
							</span>
							</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
