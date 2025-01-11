<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<div id="tab0" class="tabcontent1">
	<table class="jl">
        <tr>
			<td>投标总额：<span>￥<c:out value="#request.investAmountSum" default="0.00"/></span></td>
			<td>加入人次：<span><c:out value="#request.pageBean.totalNum" default="0"/>人次</span></td>
			<td></td><td></td>
        </tr>
	</table>  
	<div class="tzlist">
		<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
        <tr>
          <td><strong>投标人</strong></td><td><strong>投标金额</strong></td><td><strong>投标时间</strong></td><td><strong>投标方式</strong></td>
        </tr>
        <tr>
          <c:if test="pageBean.page!=null || pageBean.page.size>0">
				<s:iterator value="pageBean.page" var="investList">
					<tr>
		         	 <td>
					 	<!-- <a href="userMeg.do?id=<c:out value="#investList.investor"/>" target="_blank">
					 		<c:out value="#investList.investor"/>  -->
							<c:out value="#investList.username" default="---" /> <!--   creditedStatus==2 代表该用户在转让债权 -->
							<c:if test="#investList.creditedStatus !=null && #investList.creditedStatus==2 ">
								<img src="{ctx}/static/images/zrico.jpg" width="30" height="16" />
							</c:if>
						<!-- </a> -->
					 </td>
		         	 <td>￥ <c:out value="#investList.investAmount" /></td>
		         	 <td><c:out value="#investList.investTime" /></td>
		         	 <td>
		         	 <c:if test="#investList.tInvestAutoBid!=null && #investList.tInvestAutoBid==2" >自动投标 </c:if>
		         	 <s:else>人工投标 </s:else>
		         	 </td>
		        	</tr>
				</s:iterator>
		 </c:if>
		 <s:else>
			<tr><td colspan="4">没有数据</td></tr>
		 </s:else>
        </tr>
		</table> 
	</div>   
</div>

<!--分页器 开始-->
<div class="digg clear">
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<div class="page">
			<p><shove:page curPage="${pageBean.pageNum}" showPageCount="7" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page></p>
		</div>
	</c:if>
</div>
<!--分页器 结束-->
<script>
	function initListInfo(param) {
		investListInfo(param);
	}
</script>