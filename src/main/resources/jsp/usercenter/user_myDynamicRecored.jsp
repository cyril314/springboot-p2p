<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script>
	//分页
	function initListInfo(praData) {
		praData["paramMap.id"] = '${id}';
		$.post("queryUserRecoreIndex.do", praData, initCallBack);
	}
</script>
<!--  用户最近动态列表 -->
<div id="Dynamiclist" class="reccontent">
	<ul>
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<s:iterator value="pageBean.page" var="finance">
				<li><span><s:date name="#finance.time" format="yyyy-MM-dd HH:mm:ss" /> </span>${finance.url}</li>
			</s:iterator>
		</c:if>
		<s:else><li style="text-align: center;">没有数据	</li>
		</s:else>
	</ul>
</div>
<div class="fenyemain" align="center">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
		pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}"></shove:page>
</div>