<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/index.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>

<%--<c:if test="pageBean.page!=null || pageBean.page.size>0">
	<s:iterator value="pageBean.page" var="bean">
		<dd>
			<ul class="item">
				<li class="col2">
					<span class="font14"><a href="userMeg.do?id=${alienatorId}"
						target="_blank">${alienatorName}</a> </span>
				</li>
				<li class="col1">
					<a href="queryDebtDetail.do?id=${id}" target="_blank" class="font14" title="${borrowTitle}"><shove:sub size="8" value="#request.borrowTitle" suffix="..." /></a>
				</li>
				<li class="col3">
					<em class="font14">${isLate }</em>
				</li>
				<li class="col4">
					<span class="font14">${debtSum}</span><em class="font14">元</em>
				</li>
				<li class="col5">
					<span class="font14">${auctionBasePrice}</span><em class="font14">元</em>
				</li>
				<li class="col6">
					<span class="font14">${annualRate}</span><em class="font14">%</em>
				</li>
				<li class="col7">
					<span class="font14">${remainDays}</span>
				</li>
				<li class="col8">
					<c:if test="#bean.debtStatus ==1">
						<a href="queryDebtDetail.do?id=${id}" class="tb_btn">申请中</a>
					</c:if>
					<s:elseif test="#bean.debtStatus==2">
						<a href="queryDebtDetail.do?id=${id}" target="_blank"
							class="tb_btn">竞标中</a>
					</s:elseif>
					<s:elseif test="#bean.debtStatus==3">
						<a href="queryDebtDetail.do?id=${id}" class="tb_btn">成功</a>
					</s:elseif>
					<s:else>
						<a href="queryDebtDetail.do?id=${id}" class="tb_btn">结束</a>
					</s:else>
				</li>
			</ul>
		</dd>
	</s:iterator>
</c:if>
<s:else>
	<dd>
		<ul class="item">
			<li class="colall">
				暂无记录
			</li>
		</ul>
	</dd>
</s:else>

<!--分页器 开始-->

<div class="wrap" style="margin: 20px 0 20px 0">
	<div class="inwrap">
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<div class="page">
				<p>
				<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
					pageSize="${pageBean.pageSize }" theme="jsNumber"
					totalCount="${pageBean.totalNum}">
				</shove:page>
				</p>
			</div>
		</c:if>

	</div>
</div>
--%><!--分页器 结束-->

	<c:if test="pageBean.page!=null || pageBean.page.size>0">
	<s:iterator value="pageBean.page" var="bean">
    <div id="acc_tabs">
      <div id="tab0" class="tabcontent" style="display:block">
        	<tr>
		        <td><a href="userMeg.do?id=${alienatorId}"target="_blank">${alienatorName}</a></td>
				<td><a href="queryDebtDetail.do?id=${id}" target="_blank" class="font14" title="${borrowTitle}"><shove:sub size="8" value="#request.borrowTitle" suffix="..." /></a></td>
				<td>${isLate}</td>
		        <td>${debtSum}元</td>
		        <td>${auctionBasePrice}元</td>
		        <td>${annualRate}%</td>
		        <td>${remainDays}</td>
		        <td>
		        	<c:if test="#bean.debtStatus ==1">
						<a href="queryDebtDetail.do?id=${id}">申请中</a>
					</c:if>
					<s:elseif test="#bean.debtStatus==2">
						<a href="queryDebtDetail.do?id=${id}">竞标中</a>
					</s:elseif>
					<s:elseif test="#bean.debtStatus==3">
						<a href="queryDebtDetail.do?id=${id}">成功</a>
					</s:elseif>
					<s:else>
						<a href="queryDebtDetail.do?id=${id}" >结束</a>
					</s:else>
				</td>
        	</tr>
      </div>
    </div>

</s:iterator>
</c:if>
<s:else>
		 <div id="tab1" class="tabcontent" style="display:none">暂无消息</div>
</s:else>

<script type="text/javascript">
	$("span#tit").each(function() {
		if ($(this).text().length > 6) {
			$(this).text($(this).text().substring(0, 6) + "..");
		}
	})

	$("#jumpPage").attr("href", "javascript:void(null)");
	$("#curPageText").attr("class", "cpage");
	$("#jumpPage").click(
			function() {
				var curPage = $("#curPageText").val();

				if (isNaN(curPage)) {
					alert("输入格式不正确!");
					return;
				}
				window.location.href = "finance.do?curPage=" + curPage
						+ "&pageSize=${pageBean.pageSize}";
			});
	//-->
</script>