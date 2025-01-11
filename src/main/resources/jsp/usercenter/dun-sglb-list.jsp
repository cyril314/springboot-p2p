<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<table width="100%" cellpadding="0" cellspacing="0" class="zh_table">
	<tr>
		<th>
			序号
		</th>
		<th>
			借款标题
		</th>
		<th>
			期限
		</th>
		<th>
			债权总额(￥)
		</th>
		<th>
			我的出价(￥)
		</th>
		<th>
			预计收益
		</th>
		<th>
			状态
		</th>
		<th>
			收购完成率
		</th>
	</tr>
	<c:if test="pageBean.page!=null && pageBean.page.size>0">
		<s:set name="counts" value="#request.pageNum" />
		<s:iterator value="pageBean.page" var="bean" status="s">
			<tr>
				<td>
					<c:out value="#s.count+#counts" />
				</td>
				<td>
					<s:date name="#bean.recordTime" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
				<td>
				</td>
			</tr>
		</s:iterator>
	</c:if>
<s:else>
	<tr>
		<td colspan="12" align="center">
			暂无信息
		</td>
	</tr>
</s:else>
</table>
<!--分页器 开始-->
<div class="wrap" align="center" style="margin: 20px 0 20px 0">
	<p>
		<shove:page curPage="${pageBean.pageNum}" showPageCount="6"
			pageSize="${pageBean.pageSize }" theme="jsNumber"
			totalCount="${pageBean.totalNum}"></shove:page>

	</p>
</div>
