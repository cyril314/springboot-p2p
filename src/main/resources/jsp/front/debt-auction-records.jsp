<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script>
	$(function() {
		var maxAuctionPrice = $("#maxAuctionPrice").val();
		var auctionCount = $("#auctionCount").val();

		//最高竞价
		if (maxAuctionPrice == "") {
			$("#span_maxAuctionPrice").html("无");
		} else {
			$("#span_maxAuctionPrice").html("￥" + maxAuctionPrice);
		}

		//参加竞拍人次
		if (auctionCount == "") {
			$("#span_auctionCount").html("0人次");
		} else {
			$("#span_auctionCount").html(auctionCount + "人次");
		}

	});
</script>

<!--投资记录-->
<table class="jl">
  <tr>
   <td>最高竞价：<span id="span_maxAuctionPrice">￥0.00</span></td>
   <td>加入人次：<span id="span_auctionCount">0人次</span></td>
  </tr>
</table>
<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
    <tr>
      <td><strong>竞拍人</strong></td><td><strong>竞拍金额</strong></td><td><strong>竞拍时间</strong></td>
    </tr>
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<s:iterator value="pageBean.page" var="debtList">
			<tr>
				<td>
					<c:out value="#debtList.username" />
				</td>
				<td>
					<c:out value="#debtList.auctionPrice" />
				</td>
				<td>
					<c:out value="#debtList.auctionTime" />
				</td>
			</tr>
		</s:iterator>
	</c:if>
	<s:else><tr><td colspan="3" align="center">没有数据</td></tr></s:else>
</table>

<!--分页器 开始-->
<div class="digg clear">
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<div class="page">
			<p>
				<shove:page curPage="${pageBean.pageNum}" showPageCount="7"
					pageSize="${pageBean.pageSize }" theme="jsNumber"
					totalCount="${pageBean.totalNum}">
				</shove:page>
			</p>
		</div>
	</c:if>
</div>
<!--分页器 结束-->

<script>
	function initListInfo(param) {
		queryAuctionRecord()
	}
</script>
