<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td><strong>序号</strong></td>
		<td><strong>记录时间</strong></td>
		<td><strong>类型	</strong></td>
		<td><strong>备注信息</strong></td>
		<td><strong>收入</strong></td>
		<td><strong>支出</strong></td>
		<td><strong>可用余额</strong></td>
		<td><strong>冻结金额</strong></td>
		 <td><strong>可用理财余额</strong></td>
		<td><strong>冻结理财金额</strong></td>
		<td><strong>待收本金</strong></td>
		<td><strong>总金额</strong></td>
	</tr>
	<c:if test="pageBean.page!=null && pageBean.page.size>0">
		<s:set name="counts" value="#request.pageNum" />
		<s:iterator value="pageBean.page" var="bean" status="s">
			<tr>
				<td width="40"><c:out value="#s.count+#counts" /></td>
				<td><s:date name="#bean.recordTime" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${bean.fundMode }</td>
				<td>
					<div style="width: 160px; height:14px; overflow: hidden; margin: 0 auto;text-overflow: ellipsis;">${bean.remarks }</div>
				</td>
				<td>
					<c:if test="#bean.income==0"></c:if>
					<s:else>${bean.income }</s:else>
				</td>
				<td>
					<c:if test="#bean.spending==0"></c:if>
					<s:else>${bean.spending }</s:else>
				</td>
				<td>${bean.usableSum }</td>
				<td>${bean.freezeSum }</td>
				<td>${bean.usableGold }</td>
				<td>${bean.freezeGold }</td>
				<td>${bean.dueinSum }</td>
				<td>${bean.sum }</td>
			</tr>
		</s:iterator>
		<tr>
			<td colspan="12" style="padding: 10px 0; background: #f4f4f4;">
				<p>
					总收入：
					<span class="fblur" style="font-size: 16px;">￥${paramMap.SumincomeSum
						}</span> &nbsp;&nbsp;&nbsp;&nbsp;总支出：
					<span class="fblur" style="font-size: 16px;">￥${paramMap.SumspendingSum
						}</span> &nbsp;&nbsp;&nbsp;&nbsp;可用金额合计：
					<span class="fblur" style="font-size: 16px;">￥${paramMap.SumusableSum
						}</span>
				</p>
			</td>
		</tr>
	</c:if>
<s:else>
	<tr><td colspan="12" align="center">暂无信息</td></tr>
</s:else>
</table>
<!--分页器 开始-->
<div class="digg clear">
	<p>
		<shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber"
			totalCount="${pageBean.totalNum}"></shove:page>
	</p>
</div>