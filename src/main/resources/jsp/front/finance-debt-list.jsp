<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<link rel="stylesheet" href="${ctx}/static/css/index.css" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<!--列表项 start-->
  <c:if test="pageBean.page!=null || pageBean.page.size>0">
	<s:iterator value="pageBean.page" var="bean">
		<div class="money1 left" onclick="window.open('queryDebtDetail.do?id=${id}&uId=${alienatorId}&uName=${alienatorName}','_blank')">
			<div class="money-top1">
				<div class="left"><span>转让描述：</span><a ><shove:sub size="10" value="#request.details" suffix="..." /></a></div>
			</div>
			<div class="mon-middle1">
				转让人：<a href="userMeg.do?id=${alienatorId}" target="_blank">${alienatorName}</a><br />
				是否逾期：${isLate }<br />
				剩余时间：${remainDays}
			</div>
			<div class="money-bottom1">
				<div class="mes left">债券总额<br /><strong>${debtSum}元</strong></div>
				<div class="mes left m2">转让价格<br /><strong>${auctionBasePrice}</strong></div>
				<div class="mes left m2">年利率<br /><strong>${annualRate}%</strong></div>
				<c:if test="#bean.debtStatus ==1"><a class="zq">申请中</a></c:if>
				<s:elseif test="#bean.debtStatus==2"><a class="zq">竞标中</a></s:elseif>
				<s:elseif test="#bean.debtStatus==3"><a class="nozq">成功</a></s:elseif>
				<s:else><a class="nozq">结束</a>	</s:else>
			</div>
		</div>
    </s:iterator>
  </c:if>
  <s:else><ul><li>暂无记录</li></ul></s:else>
<!--列表项 end-->
<!--分页器 开始-->
<div class="digg clear">
	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<div class="page">
			<p>
			<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
			</shove:page>
			</p>
		</div>
	</c:if>
</div>
<!--分页器 结束-->
<script type="text/javascript">
$("span#tit").each(function() {
	if ($(this).text().length > 6) {
		$(this).text($(this).text().substring(0, 6) + "..");
	}
})

$("#jumpPage").attr("href", "javascript:void(null)");
$("#curPageText").attr("class", "cpage");
$("#jumpPage").click(
	function(){
		var curPage = $("#curPageText").val();
		if (isNaN(curPage)) {
			alert("输入格式不正确!");
			return;
		}
		window.location.href = "finance.do?curPage=" + curPage + "&pageSize=${pageBean.pageSize}";
	});
</script>