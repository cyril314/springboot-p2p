<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<div style="padding: 15px 10px 0px 10px;">
		<table id="gvNews" style="width: 100%; color: #333333;" cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col">
						序号
					</th>
					<th scope="col">
						用户名
					</th>
					<th scope="col">
						真实姓名
					</th>
					<th scope="col">
						借款标题
					</th>
					<th scope="col">
						期数
					</th>
					<th scope="col">
						类型
					</th>
					<th scope="col">
						到期时间
					</th>
						<th scope="col">
						应还金额
					</th>
						<th scope="col">
						还款时间
					</th>
						<th scope="col">
					    跟踪客服
					</th>
						<th scope="col">
					    是否已还款
					</th>
						<th scope="col">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="12">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
				<s:set name="counts" value="#request.pageNum"/>
				<s:iterator value="pageBean.page" var="bean" status="s">
					<tr class="gvItem">
						<td>
							<c:out value="#s.count+#counts"/>
						</td>
						<td align="center">
							${username}
						</td>
						<td>
							${realName}
						</td>
						<td>
						   <a href="${basePath}/financeDetail.do?id=${bean.borrowId}" target="_blank">${bean.borrowTitle}</a>
						</td>
						<td>
						${repayPeriod}
					    </td>
						<td>
							<c:if test="#bean.borrowWay==1">
							净值借款
							</c:if>
							<s:elseif test="#bean.borrowWay==2">
							秒还借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==3">
							信用借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==4">
							实地考察借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==5">
							机构担保借款
							</s:elseif>
							<s:elseif test="#bean.borrowWay==6">
							流转标借款
							</s:elseif>
						</td>
						
						<td>
							${repayDate}
					</td>
						<td>
							￥${totalSum}
					</td>
						<td>
							${realRepayDate}
					</td>
						<td>
							<c:if test="#bean.servier==null">
								未分配
							</c:if>
							<s:else>
								${servier }
							</s:else>
					</td>
					<td>
							<c:if test="#bean.repayStatus==1">
							   未偿还
							</c:if>
							<s:elseif test="#bean.repayStatus==2">
							  已偿还
							</s:elseif>
							<s:elseif test="#bean.repayStatus==3">
							  偿还中
							</s:elseif>
					</td>
					<td>
						 <a href="javascript:noticedetail(${id});">查看</a> 
					</td>
					</tr>
				</s:iterator>
				</s:else>
				<tr >
				<td  colspan="2"><strong>合计项</strong></td>
				<td colspan="2" align="right" >还款总金额合计:</td>
				<td  colspan="2" >￥<c:if test="%{#request.repaymentMap.amount==''}">0</c:if><s:else>
		                <c:out value="#request.repaymentMap.amount" default="0"/></s:else></td>
				<td colspan="3" align="right" >当前页的还款金额合计:</td>
				<td  align="center" >￥${currentAmount}</td>			
				</tr>
			</tbody>
		</table>
	<p/>	
<!--<span class="require-field">当前页的还款金额合计:￥${currentAmount}元</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="require-field">还款总金额:￥<c:if test="%{#request.repaymentMap.amount==''}">0</c:if><s:else>
		<c:out value="#request.repaymentMap.amount" default="0"/></s:else>元</span>
--></div>
<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
