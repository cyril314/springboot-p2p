<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script><!--选项卡 js-->
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<div class="moneyall">
				
	<!--列表项 start-->
	<c:if test="pageBean.page==null || pageBean.page.size==0">
		<tr align="center"><td colspan="9">暂无数据	</td></tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="b" status="st">
			<!--列表项 start-->
			<div class="money left" onclick="window.open('financeDetail.do?id=${b.id}','_blank')">
				<div class="money-top">
					<div class="left">
						<span class="class"> 
							<img src="{ctx}/static/images/ico_<c:out value="#b.credit" default="---"/>.jpg" title="<c:out value="#b.creditrating" default="0"/>" />
						</span>
						<a title="${b.borrowTitle }" >
							<shove:sub value="#b.borrowTitle" suffix="..."size="6" /> </a>
					</div>
					<div class="right">
						<span class="type"> 
							<c:if test="#b.borrowWay==1">净</c:if>
							<s:elseif test="#b.borrowWay==3">信</s:elseif> 
							<s:elseif test="#b.borrowWay==4">实</s:elseif>
							<s:elseif test="#b.borrowWay==5">担</s:elseif> 
			  			</span>
						<span class="jiang">奖 
							<c:if test="#b.excitationType==1">	- -	</c:if>
							<s:elseif test="#b.excitationType==2">￥${b.excitationSum}</s:elseif>
							<s:elseif test="#b.excitationType==3">${b.excitationSum}%</s:elseif>
						</span>
					</div>
				</div>
				<div class="money-middle">
					<div id="bg<c:out value="#st.index"/>"></div>
					<!-- 进度圆圈 -->
					<div id="txt<c:out value="#st.index"/>" class="pertxt">
						<input type="hidden" id="qz<c:out value="#st.index"/>" value="<c:out value="#b.schedules" default="0"/>" />
					</div>
					<!-- 承载进度文字 -->
				</div>
				<div class="money-bottom">
					<div class="mes left">借款总额<br />	<strong>${b.borrowAmount}</strong></div>
					<div class="mes left m2">期限<br /><strong>${b.deadline}</strong></div>
					<div class="mes left m2">年利率<br /><strong>${b.annualRate}</strong></div>
					<div class="clear"></div>
					<c:if test="%{#b.borrowStatus == 1}">
						<a href="javascript:void(0)" class="noqtb">初审中</a>
					</c:if>
					<s:elseif test="%{#b.borrowStatus == 2}">
					<div class="bottm">
						<c:if test="%{#b.borrowShow == 2}">
							<a class="tb_btn">认购</a>
						</c:if>
						<s:else><a class="qtb">去投标</a>	</s:else>
					</div>
					</s:elseif>
					<s:elseif test="%{#b.borrowStatus == 3}">
						<a href="javascript:void(0)" class="noqtb"> 复审中 </a>
					</s:elseif>
					<s:elseif test="%{#b.borrowStatus == 4}">
						<a href="javascript:void(0)" class="noqtb"> <c:if test="%{#b.borrowShow == 2}">回购中</c:if> <s:else>还款中</s:else></a>
					</s:elseif>
					<s:elseif test="%{#b.borrowStatus == 5}">
						<a href="javascript:void(0) " class="noqtb">已还完</a>
					</s:elseif>
					<s:else><a href="javascript:void(0)" class="noqtb">流标</a></s:else>
				</div>
			</div>
			<!--列表项 end-->
		</s:iterator>
	</s:else>
	<!--列表项 end-->
	<div class="digg clear">
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<div class="page">
				<p><shove:page curPage="${pageBean.pageNum}" showPageCount="6"
						pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
						<s:param name="curPage" >${pageBean.pageNum}</s:param>
					</shove:page>
				</p>
			</div>
		</c:if>
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
	$("#jumpPage").click(function() {
		var curPage = $("#curPageText").val();
		if (isNaN(curPage)) {
			alert("输入格式不正确!");
			return;
		}
		window.location.href = "finance.do?curPage=" + curPage + "&pageSize=${pageBean.pageSize}";
	});
	window.onload = init1();
</script>