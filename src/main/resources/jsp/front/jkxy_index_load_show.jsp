<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<style type="text/css">
.nymain{ width: 1000px; margin:0 auto; color: #475058; margin-top:15px; border: 1px solid #c7c7c7; }
.nymain .lcnav { background:#35c2cb ;height: 50px; border-bottom: 1px dashed #FFF;   }
.nymain .lcnav  ul li { font-family: "微软雅黑"; font-size: 16px; line-height: 50px; color: #FFF; }
.nymain .lcnav  ul .on { line-height: 50px; color: #FFF; background:#35c2cb;padding-left: 20px; border: 0;}

.xyall{margin: 0 40px;}
.xyall h2{font-size: 20px; text-align: center; height: 50px; line-height: 50px; border-bottom: 1px solid #c7c7c7; margin-bottom: 10px;}
.xyall p{ color:#475058; line-height: 30px; font-size: 14px;}
.xytab{ border-left: 1px solid #c7c7c7; border-top: 1px solid #c7c7c7; width: 100%; }
.xytab td{ border-right: 1px solid #c7c7c7; border-bottom: 1px solid #c7c7c7; height: 40px; line-height: 40px; font-size: 14px;}
</style>
<body>
<div class="nymain">
	<div class="lcnav"><ul><li class="on">借款协议</li></ul></div>
  	<div class="xyall">
  			<h2>借款协议</h2>
			<p style="font-weight:bolder;">合同编号: <b><u>${map.DatesNumber}${map.id }</u></b></p>
			<p style="font-weight:bolder;">签约日期: <b><u>${map.DateTime}</u></b></p>
			<p style="font-weight:bolder;">协议三方定义:</p>
			<p style="font-weight:bolder;">贷出者:	
				<c:if test="#request.user_invest_map==null || #request.user_invest_map.size==0"><u>暂无贷出者</u></c:if>
				<s:else>
					<s:iterator var="mapBeans" value="#request.user_invest_map" >
						<b><u><c:if test="%{#mapBeans.realName==''}">${mapBeans.username}</c:if>
							  <s:else>${mapBeans.realName}</s:else></u></b><b><u>;</u></b>
					</s:iterator>
				</s:else>
				 ，以下称“贷出方”；
			</p>
			<p style="font-weight:bolder;">	借入者: <b><u>${map.realName}(<shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</u></b>，以下称“借入方”；</p>
			<p style="font-weight:bolder;">	管理方: <b><u>好乐易贷</u></b>，以下称“管理方”。</p>
			<p>&nbsp;</p>
			<p style="font-weight:bolder;">	郑重承诺:</p>
			<p> ${contentMap.content }</p>
			<p>&nbsp;</p>
			<p style="font-weight:bolder;">	贷出者:</p>
			<p>&nbsp;</p>
			<table cellspacing="0" cellpadding="0" class="xytab">
				<tbody>
					<tr style="background: #efefef">
						<td align="center">出借人名称</td>
						<td align="center">借出金额(人民币)</td>
						<td align="center">借款期限</td>
						<td align="center">年利率</td>
						<td align="center">借款开始日期</td>
						<td align="center">借款到期日期</td>
						<td align="center">	</td>
						<td align="center">总还款本息(人民币)</td>
					</tr>
					<c:if test="#request.investMaps==null || #request.investMaps.size==0">
					  <tr>
					    <td colspan="8" align="center">暂无数据</td>
					  </tr>
					</c:if>
					<s:else>
						<s:iterator var="mapBean" value="#request.investMaps" >
							<tr>
								<td align="center">${mapBean.username } ${bean.realName } ${bean.idNo }</td>
								<td align="center">￥${mapBean.recivedPrincipal }</td>
								<td align="center">
									${mapBean.deadline }
									<c:if test="#mapBean.isDayThe==1"> 个月</c:if>
									<c:if test="#mapBean.isDayThe==2"> 天</c:if>
								</td>
								<td align="center">${mapBean.annualRate }%</td>
								<td align="center">${mapBean.starTime}</td>
								<td align="center">${mapBean.endTime}</td>
								<td align="center"></td>
								<td align="center">￥${mapBean.sumPI }</td>
							</tr>
						</s:iterator>
					</s:else>
					<tr>
						<td align="center" style="background: #efefef">总金额：</td>
						<td align="center">￥${sumMap.sumPal }</td>
						<td align="center">
					        ${mapBean.deadline }
							<c:if test="#mapBean.isDayThe==1"> 个月</c:if>
							<c:if test="#mapBean.isDayThe==2"> 天</c:if>
						</td>
						<td align="center"></td>
						<td></td>
						<td></td>
						<td align="center"  style="background: #efefef">总还本息:</td>
						<td align="center">￥${sumMap.sumPI }</td>
					</tr>
				</tbody>
			</table>
			<p>&nbsp;</p>
			<p></p>
			<p style="font-weight:bolder;">借入者 :<u>${map.Busername}(身份证号码：
                     <shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</u></p>
			<p style="font-weight:bolder;">管理方:<u>好乐易贷</u></p>
			<p style="font-weight:bolder;">三方约定:</p>
			<p style="text-indent:2em">由管理方负责将债权人的款项划转至借款方开立的账户。</p>
			<p>&nbsp;</p>
			<p style="font-weight:bolder;">第一条 借款基本信息</p>
			<p>&nbsp;</p>
				<table cellspacing="0" cellpadding="0" class="xytab">
					<tr>
						<td align="right">借款详细用途：</td>
						<td style="padding-left: 20px;">${map.purpose}</td>
					</tr>
					<tr style="background: #efefef">
						<td align="right">借款本金数额：</td>
						<td style="padding-left: 20px;">￥${sumMap.sumPal }</td>
					</tr>
					<tr>
						<td align="right">应偿还本息数额：</td>
						<td style="padding-left: 20px;">￥${sumMap.sumPI }</td>
					</tr>
					<tr style="background: #efefef">
						<td align="right">还款分期月数：</td>
						<td style="padding-left: 20px;">
						    ${map.deadline}
							<c:if test="#request.map.isDayThe==1">个月</c:if>
							<c:if test="#request.map.isDayThe==2">天</c:if>
						</td>
					</tr>
					<tr>
						<td align="right">借款利率：</td>
						<td style="padding-left: 20px;">${map.annualRate}%</td>
					</tr>
					<tr style="background: #efefef">
						<td align="right">还款方式：</td>
						<td style="padding-left: 20px;">
							<c:if test="#request.map.paymentMode==1">按月分期</c:if>
							<s:elseif test="#request.map.paymentMode==2">按先息后本还款</s:elseif>
							<s:elseif test="#request.map.paymentMode==3">秒还</s:elseif>
							<s:elseif test="#request.map.paymentMode==4">一次性还本付息</s:elseif>
						</td>
					</tr>
					<tr>
						<td align="right">借款描述：</td>
						<td style="padding-left: 20px;">${map.detail}</td>
					</tr>
					<tr style="background: #efefef">
						<td align="right">还款日：</td>
						<td style="padding-left: 20px;">每月&nbsp;&nbsp;${map.days }&nbsp;&nbsp;日（24：00前，节假日不顺延）</td>
					</tr>
					<tr>
						<td align="right">还款起止日期：</td>
						<td style="padding-left: 20px;">&nbsp;&nbsp;${map.starTime }&nbsp;&nbsp;至&nbsp;&nbsp;  ${map.endTime }&nbsp;&nbsp;止</td>
					</tr>
			</table>
		<p>&nbsp;</p>
		<p style="font-weight:bolder;">分期还款列表</p>
			<table cellspacing="0" cellpadding="0" class="xytab">
				<tr style="background: #efefef"> 
					<td align="center">期数</td>
					<td align="center">年利率</td>
					<td align="center">应还时间</td>
					<td align="center">应还本息</td>
					<td align="center">还款本金</td>
					<td align="center">还款利息</td>
				</tr>
				<c:if test="#request.borrow_map==null || #request.borrow_map.size==0">
				<tr>
				   <td colspan="6" align="center">暂无数据</td>
				</tr>
				</c:if>
				<s:else>
					<s:iterator value="#request.borrow_map" var="bean">
						<tr>
							<td align="center">${bean.repayPeriod }</td>
							<td align="center">${bean.annualRate }%</td>
							<td align="center"><s:date name="#bean.repayDate" format="yyyy-MM-dd"/></td>
							<td align="center">${bean.isp }</td>
							<td align="center">${bean.stillPrincipal }</td>
							<td align="center">${bean.stillInterest }</td>
						</tr>
					</s:iterator>
				</s:else>
			</table>
		<p>&nbsp;</p>
		<p style="font-weight:bolder;">第二条 各方权利和义务</p>
		<p style="font-weight:bolder;">债权人的权利和义务 :</p>
		<div>${mapContent.content}</div>
		<p>（以下无正文）</p>
		<p style="font-weight:bolder;">债权人:
			<c:if test="#request.user_invest_map==null || #request.user_invest_map.size==0"><u>暂无贷出者</u></c:if>
			<s:else>
				<s:iterator var="mapBeans" value="#request.user_invest_map" >
					<b><u><c:if test="%{#mapBeans.realName==''}">${mapBeans.username}</c:if><s:else>${mapBeans.realName}</s:else></u></b>
					<b><u>;</u></b>
				</s:iterator>
			</s:else>
		</p>
		<p style="font-weight:bolder;">借款人:<b><u>${map.realName}(<shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</u></b></p>
		<p style="font-weight:bolder;">通信地址：<b><u>${sitemap.address}</u></b></p>
		<p style="font-weight:bolder;">管理方：<b><u>好乐易贷</u></b></p>
		<p>&nbsp;</p>
	</div>
</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
dqzt(2);
</script>
</body>
</html>
