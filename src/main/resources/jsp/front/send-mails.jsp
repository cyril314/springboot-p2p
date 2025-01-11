<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../include/taglib.jsp"%>

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td>
			<strong>标题</strong>
		</td>
		<td>
			<strong>时间</strong>
		</td>
		<td>
			<strong>收件人</strong>
		</td>
		<td>
			<strong>内容</strong>
		</td>
		<td>
			<strong>操作</strong>
		</td>		
	</tr>
<c:if test="pageBean.page!=null && pageBean.page.size>0">
				<s:iterator value="pageBean.page" id="querySendMails" var="bean">
<tr>
<td><a href="javascript:void(0);"
								onclick="showSysMailInfo(${bean.id},1)">${bean.mailTitle}&nbsp;&nbsp;&nbsp;
							</a></td>
<td><s:date name="#bean.sendTime" format="yyyy-MM-dd HH:mm:ss" /></td>
<td>${bean.reciver}</td>
<td><shove:sub size="108" value="#bean.mailContent" suffix="......"/></td>
<td><a href="javascript:void(0);"
								onclick="showSysMailInfo(${bean.id},1)">查看详情</a></td>

</tr>

</s:iterator>
			</c:if>
			<s:else>
				<tr>
					<td colspan="5" align="center">
						暂无信息
					</td>
				</tr>
			</s:else>
</table>

		<!--分页器 开始-->
	<div class="digg clear">
					<p>
						<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
							pageSize="${pageBean.pageSize }" theme="jsNumber"
							totalCount="${pageBean.totalNum}"></shove:page>
					</p>
				</div>

		<!--分页器 结束-->
