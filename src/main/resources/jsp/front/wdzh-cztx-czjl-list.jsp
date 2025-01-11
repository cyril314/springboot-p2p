<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0" onload="tab()"> 
	<tr>
		<td>
			<strong>时间</strong>
		</td>
		<td>
			<strong>交易类型</strong>
		</td>
		<td>
			<strong>备注</strong>
		</td>
		<td>
			<strong>金额(￥)</strong>
		</td>
		<td>
			<strong>处理结果</strong>
		</td>
	</tr>

	<c:if test="pageBean.page!=null && pageBean.page.size>0">
		<s:set name="counts" value="#request.pageNum" />
		<s:iterator value="pageBean.page" var="bean" status="s">
			<tr>
				<td>
					<s:date name="#bean.rechargeTime" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>
					${bean.rechargeType }
				</td>
				<td>
					<c:out value="#bean.remark" default="--" />
				</td>
				<td>
					<c:if test="#bean.rechargeMoney==0">?</c:if>
					<s:else>${bean.rechargeMoney }</s:else>
				</td>
				<td>
					${bean.result }
				</td>
			</tr>
		</s:iterator>
	</c:if>
	<s:else>
		<tr>
			<td colspan="11" align="center">
				暂无信息
			</td>
		</tr>
	</s:else>
</table>

<!--分页器 开始-->
<div class="digg clear">
	<p>
		<shove:page curPage="${pageBean.pageNum}" showPageCount="6"
			pageSize="${pageBean.pageSize }" theme="jsNumber"
			totalCount="${pageBean.totalNum}"></shove:page>

	</p>
</div>

<script>
	function initListInfo(param){
		$.shovePost("queryRechargeRecordList.do",param,initCallBack);
	}
	var Ptr=document.getElementById("tab").getElementsByTagName("tr");
function tab() {
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
	
}
  window.onload=tab;
	
</script>
