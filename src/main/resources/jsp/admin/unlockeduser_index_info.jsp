<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th style="width: 35px;" scope="col">
						选中
					</th>
					<th scope="col">序号</th>
					<th scope="col">帐号</th>
				    <th scope="col">真实姓名</th>
				    <th scope="col">手机</th>
				    <th scope="col">身份证</th>
				    <th scope="col">注册时间</th>
				    <th scope="col">操作</th>
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
							<input id="gvNews_ctl02_cbID" class="adminId" type="checkbox"
								value="${bean.id }" name="gvNews$ctl02$cbID" />
						</td>
						 <td align="center"><c:out value="#s.count+#counts"/></td>
						 <td align="center">${username }</td>
					    <td align="center">${realName }</td>
					
					    <td align="center">${cellPhone }</td>
					    <td align="center">${idNo }</td>
					        <td align="center">${createTime }</td>
					   
			    	
							<td>
							
							<a id="gvNews_ctl02_lbDelete" style="cursor: pointer;"
										onclick="deleteById(${bean.id })">确认禁用</a>
							<a  href="queryUserManageBaseInfoinner.do?i=${id }" target="main">查看</a>
						
					</td></tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	<table style="border-collapse: collapse; border-color: #cccccc"
		cellspacing="1" cellpadding="3" width="100%" align="center" border="1">
		<tbody>
			<tr>
				<td class="blue12" style="padding-left: 8px" align="left">
					<input id="chkAll" onclick="checkAll(this); " type="checkbox"
						value="checkbox" name="chkAll" />
					全选 &nbsp;&nbsp;&nbsp;&nbsp;
					<input id="btnDel" onclick="deleteAll();" type="button"
						value="锁定选中记录" name="btnDel" />
				</td>
			</tr>
		</tbody>
	</table>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
