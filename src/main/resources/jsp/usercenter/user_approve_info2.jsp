
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!--会员积分-->
<div>
	<p class="mt10">我的积分：<span style="color: #fc5704;">${userMap.rating}</span>
	</p>
	<p class="ts">用户积分规则：每登陆一次1分，每笔投资金额的5%</p>
	<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
		<tr>
			<td><strong>日期</strong></td>
			<td><strong>积分类型</strong></td>
			<td><strong>积分</strong></td>
		</tr>
		<c:if test="#pageBean.page==null || pageBean.page.size==0">
			<tr>
				<td align="center" colspan="6">暂无数据</td>
			</tr>
		</c:if>
		<s:else>
			<s:iterator value="pageBean.page" var="bean" status="sta">
				<tr>
					<td><s:date name="#bean.time" format="yyyy-MM-dd HH:mm:ss" /></td>
					<td>${remark} ${intergraltype}</td>
					<td>${changerecore}</td>
				</tr>
			</s:iterator>
		</s:else>
	</table>
<!--分页器 开始-->
<div class="digg clear">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
		pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}">
	</shove:page>		
</div>
</div>
<!--分页器 结束-->
