<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script>
	//分页
	function initListInfo(praData) {
		praData["paramMap.id"] = '${id}';
		$.post("queryfrendrecoredIndex.do", praData, initCallBack);
	}
</script>
<!--  关注好友动态  -->
<div class="reccontent" id="userDynamiclist">
	<ul>
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<s:iterator value="pageBean.page" var="finance">
				<li>
					<span>${finance.time }</span>${finance.url}
				</li>
			</s:iterator>
		</c:if>
		<s:else>
			<li style="text-align: center; background: none; border: none;">
				暂无记录
			</li>
			<div class="fenye">
				<div class="fenyemain">
				</div>
			</div>
		</s:else>
	</ul>
</div>
<div class="fenyemain" align="center">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
		pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}"></shove:page>
</div>
