<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script>
	//分页
	function initListInfo(praData) {
		praData["paramMap.id"] = '${id}';
		praData["paramMap.attention"] = '${attention}';
		$.post("userFrends.do", praData, initCallBack);
	}
</script>

<div class="reccontent">
	<ul>
		<c:if test="pageBean.page==null || pageBean.page.size==0">
			<div class="fenye">
				<div style="width: 100%; height: 50px; text-align: center">
					<br />
					<span style="font-size: 12px;margin: 30px 0;">该用户还没关注的好友</span>
				</div>
			</div>


		</c:if>
		<s:else>
			<s:iterator value="pageBean.page" var="bean">
				<li >
					<a href="userMeg.do?id=${tcmoduleId}"> <shove:img
							src="${personalHead}" width="62" height="62"
							defaulImg="images/default-img.jpg">
						</shove:img> </a>
					<br />
					<a href="userMeg.do?id=${tcmoduleId}">${aausername }</a>
				</li>
			</s:iterator>
		</s:else>
	</ul>
</div>
<div class="fenyemain" align="center">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
		pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}"></shove:page>
</div>