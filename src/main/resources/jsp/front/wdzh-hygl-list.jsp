<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>


<!--推荐记录-->
<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
		<tr>
			<td>
				<strong>注册时间</strong>
			</td>
			<td>
				<strong>用户名</strong>
			</td>
			<td>
				<strong>VIP成功付费时间</strong>
			</td>
			<td>
				<strong>奖励金额</strong>
			</td>
		</tr>
		<c:if test="pageBean.page==null || pageBean.page.size==0">
			<tr align="center" class="gvItem">
				<td colspan="4">
					暂无数据
				</td>
			</tr>
		</c:if>
		<s:else>
			<s:iterator value="pageBean.page" var="bean">
				<tr>
					<td align="center">
						${bean.createTime }
					</td>
					<td align="center">
						${bean.username}
					</td>
					<td align="center">
						${bean.vipCreateTime}&nbsp;
					</td>
					<td colspan="6" align="center">
						<c:out value="#bean.money" default="0"/>元
					</td>
				</tr>
			</s:iterator>
		</s:else>
	</table>
	<!--分页器 开始-->
	
				<div class="digg clear">
					<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
						pageSize="${pageBean.pageSize }" theme="jsNumber"
						totalCount="${pageBean.totalNum}"></shove:page>
				</div>
			
	<!--分页器 结束-->






