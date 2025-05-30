<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div id="right">
		<table id="gvNews" style="width: 98%; color: #333333;" cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col" style="width: 130px;" >业务机构</th>
					<th scope="col" style="width: 100px;" >理财经理</th>
					<th scope="col" style="width: 100px;" >姓名</th>
					<th style="width: 150px;" scope="col">身份证号码</th>
					<th style="width: 100px;" scope="col">手机号码</th>
					<th style="width: 200px;" scope="col">描述</th>
					<th style="width: 120px;" scope="col">添加时间</th>
					<th style="width: 60px;" scope="col">会员人数</th>
					<th style="width: 60px;" scope="col">状态</th>
					<c:if test="%{#session.admin.roleId <2}">
						<th style="width: 100px;" scope="col">操作</th>
					</c:if>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem"><td colspan="10">暂无数据</td></tr>
				</c:if>
				<s:else>
					<s:set name="counts" value="#request.pageNum"/>
					<s:iterator value="pageBean.page" var="bean" status="st">
						<tr class="gvItem">
							<td><c:out value="#st.count+#counts"/></td>
							<td align="center">
								<c:if test="#bean.userName1!=null&&#bean.userName1!=''">
									${userName1}<br/>
									(${realName1})
								</c:if>
							</td>
							<td align="center">${userName2}</td>
							<td>${realName2}</td>
							<td>${card }</td>
							<td>${telphone }</td>
							<td><shove:sub value="#bean.summary" size="50" suffix="..."/></td>
							<td>${bean.addDate }</td>
							<td><c:out value="#bean.level3Count" default="0"/></td>
							<td>${bean.adminEnable==1?'启用':'禁用' }</td>
							<c:if test="%{#session.admin.roleId <2}">
								<td>
									<a href="updateEconomyInit.do?id=${bean.peopleId }" target="main">编辑</a>
									<span style="cursor: pointer;" class="enable" rId="${bean.id }" enable="${bean.enable }" >${enable==1?'解除关联':'重置关联' }</span>
									<c:if test="%{#session.admin.roleId ==-1">
										<br/><a style="cursor: pointer;"    onclick="relationColumn('${bean.peopleId }')">关联客户</a>
									</c:if>
								</td>
							</c:if>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
