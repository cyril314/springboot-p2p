<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<div >
	<table width="100%" cellpadding="0" cellspacing="0" class="zh_table" >
		<tr>
			<th colspan="4">
				信用总分：${userMsg.t_crediting}分&nbsp;
				<img src="{ctx}/static/images/ico_${userMsg.t_credit}.jpg" title="${userMsg.t_crediting}分" width="33" height="22" />
			</th>
		</tr>
		<tr>
			<th></th>
			<th>审核项目	</th>
			<th>状态	</th>
			<th>信用积分	</th>
		</tr>
		<tr>
			<th rowspan="2" align="center">基本信息</th>
			<td align="center" >个人详细信息</td>
			<td align="center">
				<c:if test="#request.userMsg.t_person_status == '通过'">	${userMsg.t_person_status}</c:if>
				<s:elseif test="#request.userMsg.t_person_status == ''">等待上传</s:elseif>
				<s:else>${userMsg.t_person_status}</s:else>
			</td>
			<td align="center">${userMsg.t_person_score}</td>
		</tr>
		<tr>
			<td align="center">工作/联系人信息</td>
			<td align="center">
				<c:if test="#request.userMsg.t_work_status == '通过'">${userMsg.t_work_status}</c:if>
				<s:elseif test="#request.userMsg.t_work_status == ''">等待上传</s:elseif>
				<s:else>${userMsg.t_work_status}</s:else>
			</td>
			<td align="center">${userMsg.t_work_score}</td>
		</tr>
		
		<tr>
			<c:if test="#pageBean.page==null || pageBean.page.size==0">
				<tr>
					<td align="center" colspan="6">暂无需要认证的资料</td>
				</tr>
			</c:if>
			<s:else>
				<s:iterator value="pageBean.page" var="bean" status="sta">
					<tr>
						<c:if test="#sta.count==1">
							<th rowspan="${pageBean.totalNum}" style="width: 100px;background:#efefef;" align="center">信用认证</th>
						</c:if>
						<td>${name }</td>
						<td>
							<c:if test="#bean.auditStatus==3"><img src="{ctx}/static/images/neiye2_44.jpg" /></c:if>
							<s:elseif test="#bean.auditStatus==2">等待审核</s:elseif>
							<s:else>等待上传</s:else>
						</td>
						<td>${criditing }</td>
					</tr>
				</s:iterator>
			</s:else>
		</tr>
		<tr>
			<th rowspan="7" style="width: 100px;">还款积分</th>
			<th align="center">项目</th>
			<th align="center">次数</th>
			<th align="center">分数</th>
		</tr>
		<tr>
			<td align="center">按时还款</td>
			<td align="center">${userMsg.t_pre_count}</td>
			<td align="center">${userMsg.t_pre_score}</td>
		</tr>
		<tr>
			<td align="center">提前还款</td>
			<td align="center">${userMsg.t_pre_16_count}</td>
			<td align="center">${userMsg.t_pre_16_score}</td>
		</tr>
		<tr>
			<td align="center">迟还款（逾期一天以上至10天以内的还款）</td>
			<td align="center">${userMsg.t_over_10_count}</td>
			<td align="center">${userMsg.t_over_10_score}</td>
		</tr>
		<tr>
			<td align="center">逾期还款（11-30天）</td>
			<td align="center">${userMsg.t_over_30_count}</td>
			<td align="center">${userMsg.t_over_30_score}</td>
		</tr>
		<tr>
			<td align="center">逾期还款（逾期31天以上至90天以内）</td>
			<td align="center">${userMsg.t_over_90_count}</td>
			<td align="center">${userMsg.t_over_90_score}</td>
		</tr>
		<tr>
			<td align="center">逾期还款（逾期90天以上的还款）</td>
			<td align="center">${userMsg.t_over_91_count}</td>
			<td align="center">${userMsg.t_over_91_score}</td>
		</tr>
	</table>
</div>
