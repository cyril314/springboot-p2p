
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>

<!--会员积分-->
<div>
<p style="line-height: 26px;">我的积分：<span style="color: #fc5704;">${userMap.rating}</span></p>
<p style="line-height: 26px;">用户积分规则：每登陆一次1分，每笔投资金额的5%</p>
<table width="100%" cellpadding="0" cellspacing="0" border="0" class="zh_table" style="margin-top: 15px;">
	<tr>
		<th>日期	</th>
		<th>积分类型</th>
		<th>积分	</th>
	</tr>
	<c:if test="#pageBean.page==null || pageBean.page.size==0">
		<tr><td align="center" colspan="6">暂无数据</td></tr>
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
<div class="wrap" style="margin: 20px 0 20px 0;" align="center">
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber"
		totalCount="${pageBean.totalNum}">
	</shove:page>
	<!--<div class="inwrap" align="center">
		  <ul class="page">
              <li class="p1"><a href="#">上一页</a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li class="on"><a href="#">6</a></li>
              <li><a href="#">...</a></li>
              <li class="p1"><a href="#">下一页</a></li>
          </ul> -->
	</div>
</div>
<!--分页器 结束-->
