<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<script type="text/javascript">
	$(function() {

	})
	function deleteFriend(userId, attentionId) {
		if (window.confirm("你确定要删除该好友吗？")) {
			var param = {};
			param["paramMap.userId"] = userId;
			param["paramMap.attentionId"] = attentionId;
			$.post("deleteuserFrend.do", param, function(data) {
				if (data == "virtual") {
					window.location.href = "noPermission.do";
					return;
				}
				$("#userfrends").html(data);
			});
		}

	}
</script>


<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
	<tr>
		<td>
			<strong>用户名</strong>
		</td>
		<td>
			<strong>关注时间</strong>
		</td>
		<td>
			<strong>操作</strong>
		</td>
	</tr>
	<c:if test="pageBean.page==null || pageBean.page.size==0">
		<tr align="center" class="gvItem">
			<td colspan="3">
				该用户还没关注的好友
			</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean">
			<tr>
				<td>
					${aausername }
				</td>
				<td>
					${concernTime }
				</td>
				<td>
					<a href="userMeg.do?id=${tcmoduleId}">查看</a>&nbsp;
					<a onclick="deleteFriend('${user.id}','${tcmoduleId}')" class="sc">删除</a>
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



