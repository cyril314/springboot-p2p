<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>

<c:if test="pageBean.page!=null || pageBean.page.size>0">
	<s:iterator value="pageBean.page" var="finance">
		<dd>
			<ul class="item">
				<li class="col1">
					<a href="dliFinanceDetail.do?id=${finance.id}" target="_blank"	class="font14" title="${finance.borrowTitle }">
						<c:if test="#finance.borrowWay==1"><img src="{ctx}/static/images/C-jin1.png" /></c:if>
						<s:elseif test="#finance.borrowWay==3"><img src="{ctx}/static/images/C_xin.jpg" /></s:elseif>
						<s:elseif test="#finance.borrowWay==4"><img src="{ctx}/static/images/C_shi.png" /></s:elseif>
						<s:elseif test="#finance.borrowWay==5"><img src="{ctx}/static/images/C_dan.png" /></s:elseif>
						<shove:sub size="8" value="#finance.borrowTitle" suffix="..." />
					</a>
				</li>
				<li class="col2">
					<!-- <img src="{ctx}/static/images/ico10.png" />-->
					<img class="tb_btn2" src="{ctx}/static/images/ico_<c:out value="#finance.credit" default="---"/>.jpg"
						title="<c:out value="#finance.creditrating" default="0"/>分" />
				</li>
				<li class="col3">
					<span class="font18"><c:out value="#finance.annualRate" default="0" />
					</span><em class="font14">%</em>
				</li>
				<li class="col4">
					<c:if test="%{#finance.excitationType ==1}"><span class="font18">- -</span></c:if>
					<s:elseif test="%{#finance.excitationType ==2}"><span class="font18">${finance.excitationSum}</span></s:elseif>
					<s:elseif test="%{#finance.excitationType ==3}"><span class="font18">${finance.excitationSum}</span>
						<em class="font14">%</em>
					</s:elseif>
				</li>
				<li class="col5">
					<span class="font18"><c:out value="#finance.borrowAmount" default="0" /></span>
					<!-- <em class="font14">元</em> -->
				</li>
				<li class="col6">
					<span class="font18"> <c:out value="#finance.deadline" default="---" /> </span>
					<em class="font14"> <c:if test="%{#finance.isDayThe ==1}">个月</c:if><s:else>天</s:else> </em>
				</li>
				<li class="col7">
					<div>
						<div class="progeos">
							<div style=" width: <c:out value="#finance.schedules" default="0"/>%; height:11px;  margin:1px; background:#ca0000;"></div>
						</div>
						<div style="float: left;">
							<span><c:out value="#finance.schedules" default="0" />%</span>
						</div>
					</div>
				</li>
				<li class="col8">
					<c:if test="%{#finance.borrowStatus == 1}">
						<a href="javascript:void(0)" class="tb_btn1">初审中</a>
					</c:if>
					<s:elseif test="%{#finance.borrowStatus == 2}">
						<c:if test="%{#finance.borrowShow == 2}"><a href="dliFinanceDetail.do?id=${finance.id}" target="_blank" class="tb_btn tb_btn2">认购</a></c:if>
						<s:else><a href="dliFinanceDetail.do?id=${finance.id}" target="_blank" class="tb_btn tb_btn2">投标</a></s:else>
					</s:elseif>
					<s:elseif test="%{#finance.borrowStatus == 3}">
						<a href="javascript:void(0)" class="tb_btn1 tb_btn2"> 复审中 </a>
					</s:elseif>
					<s:elseif test="%{#finance.borrowStatus == 4}">
						<a href="javascript:void(0)" class="tb_btn1 tb_btn2"> 
							<c:if test="%{#finance.borrowShow == 2}">回购中</c:if> <s:else>还款中</s:else>
						</a>
					</s:elseif>
					<s:elseif test="%{#finance.borrowStatus == 5}">
						<a href="javascript:void(0)" class="tb_btn1 tb_btn2">已还完</a>
					</s:elseif>
					<s:else>
						<a href="javascript:void(0)" class="tb_btn1 tb_btn2">流标</a>
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
				没有数据
			</li>
		</ul>
	</dd>
</s:else>


<div class="wrap" style="margin: 20px 0 20px 0">
	<div class="inwrap">
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<div class="page">
				<p>
					<shove:page curPage="${pageBean.pageNum}" showPageCount="7" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
				    	<s:param name="sortAnnual">${paramMap.sortAnnual}</s:param>
				    	<s:param name="sortAmount">${paramMap.sortAmount}</s:param>
				    	<s:param name="sortDeadline">${paramMap.sortDeadline}</s:param>
				    	<s:param name="sortProgress">${paramMap.sortProgress}</s:param>
					</shove:page>
				</p>
			</div>
		</c:if>
		<!-- <ul class="page">
                      <li class="p1"><a href="#">上一页</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li class="on"><a href="#">6</a></li>
                      <li><a href="#">...</a></li>
                      <li class="p1"><a href="#">下一页</a></li>
                   </ul>     -->
	</div>
</div>

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
				alert('PAGE:' + curPage);
				if (isNaN(curPage)) {
					alert("输入格式不正确!");
					return;
				}
				window.location.href = "finance.do?curPage=" + curPage
						+ "&pageSize=${pageBean.pageSize}";
			});
	//-->
</script>