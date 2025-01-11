<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<script>
	//分页
	function initListInfo(praData) {
		praData["paramMap.id"] = '${id}';
		$.post("myBorrowList.do", praData, initCallBack);
	}
</script>

		<table class="item" cellpadding="0" cellspacing="0">
		  <tr>
			<th>
				借款标题/借款类型
			</th>
			<th>
				信用等级
			</th>
			<th >
				年利率
			</th>
			<th>
				网站奖励
			</th>
			<th>
				金额
			</th>
			<th>
				期限
			</th>
			<th >
				进度
			</th>
			<th>
				操作
			</th>
		  </tr>

	<c:if test="pageBean.page!=null || pageBean.page.size>0">
		<s:iterator value="pageBean.page" var="finance">
				   <tr>
					<td style="width: 200px;" align="center">
						<a href="financeDetail.do?id=${finance.id}" target="_blank"> 
						    <c:if test="#finance.borrowWay==1">
								<img src="{ctx}/static/images/C-jin1.png" />
							</c:if> <s:elseif test="#finance.borrowWay==3">
								<img src="{ctx}/static/images/C_xin.jpg" />
							</s:elseif> <s:elseif test="#finance.borrowWay==4">
								<img src="{ctx}/static/images/C_shi.png" />
							</s:elseif> <s:elseif test="#finance.borrowWay==5">
								<img src="{ctx}/static/images/C_dan.png" />
							</s:elseif> <shove:sub size="10" value="#finance.borrowTitle" suffix="..." />
						</a>
					</td>
					<td align="center">
						<!-- <img src="{ctx}/static/images/ico10.png" />-->
						<img
							src="{ctx}/static/images/ico_<c:out value="#finance.credit" default="---"/>.jpg"
							title="<c:out value="#finance.credit" default="0"/>分" />
					</td>
					<td align="center">
						<span><c:out
								value="#finance.annualRate" default="0" /> </span><em class="font14">%</em>
					</td>
					<td align="center">
						<c:if test="%{#finance.excitationType ==1}">
							<span>- -</span>
						</c:if>
						<s:elseif test="%{#finance.excitationType ==2}">
							<span>${finance.excitationSum}</span>
						</s:elseif>
						<s:elseif test="%{#finance.excitationType ==3}">
							<span>${finance.excitationSum}</span>
							<em >%</em>
						</s:elseif>
					</td>
					<td align="center">
						<span><c:out
								value="#finance.borrowAmount" default="0" /> </span>
						<!-- <em class="font14">元</em> -->
					</td>
					<td align="center">
						<span> <c:out value="#finance.deadline"
								default="---" /> </span>
						<em> <c:if test="%{#finance.isDayThe ==1}">个月</c:if>
							<s:else>天</s:else> </em>
					</td>
					<td align="center">
						<div style="width: 150px;">
							<div style="width: 73px; height: 10px;float: left; margin: 13px 3px 0 0;">
								<div style=" width: <c:out value="#finance.schedules" default="0"/>%; height:11px;  margin:1px; background:#ca0000;"></div>
							</div>
							<div style="float: left;">
								<span><c:out value="#finance.schedules" default="0" />%</span>
							</div>
						</div>
					</td>
					<td align="center">
						<c:if test="%{#finance.borrowStatus == 1}">
							<a href="javascript:void(0)" class="btnp">初审中</a>
						</c:if>
						<s:elseif test="%{#finance.borrowStatus == 2}">
							<c:if test="%{#finance.borrowShow == 2}">
								<a href="financeInvestInit.do?id=${finance.id}" class="btnp_can">认购</a>
							</c:if>
							<s:else>
								<a href="financeInvestInit.do?id=${finance.id}" class="btnp_can">投标</a>
							</s:else>
						</s:elseif>
						<s:elseif test="%{#finance.borrowStatus == 3}">
							<a href="javascript:void(0)" class="btnp"> 复审中 </a>
						</s:elseif>
						<s:elseif test="%{#finance.borrowStatus == 4}">
							<a href="javascript:void(0)" class="btnp"> <c:if
									test="%{#finance.borrowShow == 2}">回购中</c:if> <s:else>还款中</s:else>
							</a>
						</s:elseif>
						<s:elseif test="%{#finance.borrowStatus == 5}">
							<a href="javascript:void(0)" class="btnp">已还完</a>
						</s:elseif>
						<s:else>
							<a href="javascript:void(0)" class="btnp">流标</a>
						</s:else>
					</td>
				</tr>
				
		</s:iterator>
	</c:if>
	<s:else>
			<tr>
				<td colspan="8" align="center">
					没有数据
				</td>
			</tr>
	</s:else>
	</table>


	<div class="wrap" style="margin: 20px 0 20px 0">
		<div class="inwrap">
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
