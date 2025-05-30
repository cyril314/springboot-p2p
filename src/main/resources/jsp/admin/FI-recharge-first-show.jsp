<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>财务管理-用户银行卡管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#remark").attr("value","自动");
			});	
		</script>
	</head>
	<body>
		<div id="right"
			style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					
					<div
						style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
						<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
							width="100%" border="0">
							<tbody>
							
						         <tr>
									<td class="f66" align="left" width="25%" height="36px">
										用户名&nbsp;：&nbsp;&nbsp;
										<c:out  value="paramMap.username"></s:property>
										&nbsp;&nbsp;&nbsp;
										真实姓名&nbsp;：
										<c:out  value="paramMap.realName"></s:property>
									</td>
								 </tr>
								 <tr>
									<td class="f66" align="left" width="25%" height="36px">
										充值类型：&nbsp;&nbsp;
								   		<c:if test="%{paramMap.rechargeType==1}">支付宝支付</c:if>
								   		<c:if test="%{paramMap.rechargeType==2}">环迅支付</c:if>
								   		<c:if test="%{paramMap.rechargeType==3}">国付宝</c:if>
								   		<c:if test="%{paramMap.rechargeType==4}">线下充值</c:if>
								   		<c:if test="%{paramMap.rechargeType==5}">手工充值</c:if>
								   		<c:if test="%{paramMap.rechargeType==6}">虚拟充值</c:if>
								   		<c:if test="%{paramMap.rechargeType==7}">奖励充值</c:if>
									</td>
								</tr>
								
								<tr>
									<td class="f66" align="left" width="25%" height="36px">
										充值银行：&nbsp;&nbsp;
										<c:out  value="paramMap.bankName"></s:property>
									</td>
								</tr>
								
								<tr>
									<td class="f66" align="left" width="25%" height="36px">
										流水号：&nbsp;&nbsp;
										  <c:out  value="paramMap.rechargeNumber"></s:property>
										
									</td>
								</tr>
								
								<tr>
									<td class="f66" align="left" width="25%" height="36px">
										添加时间/IP&nbsp;：&nbsp;&nbsp;
										<c:out  value="paramMap.rechargeTime"></s:property>
										/<c:out  value="paramMap.ipAddress"></s:property>
									</td>
								</tr>
								<tr>
								<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										充值总额：&nbsp;&nbsp;
										<c:out  value="paramMap.rechargeMoney"></s:property>
										&nbsp;&nbsp;&nbsp;&nbsp;
										费率：&nbsp;&nbsp;
										<c:out  value="paramMap.cost"></s:property>
									</td>
								</tr>
								
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										实际到账：&nbsp;&nbsp;
										<c:out  value="paramMap.realMoney"></s:property>
									</td>
								</tr>
								
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										状&nbsp;&nbsp;态：&nbsp;&nbsp;
										自动
									</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										审核时间：&nbsp;&nbsp;
										<c:out  value="paramMap.rechargeTime"></s:property>
									</td>
								</tr>  
								<tr>
								  <td>&nbsp;</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										审核备注：&nbsp;&nbsp;
										
									</td>
								</tr>   
								<tr>
								<td class="f66" align="left" width="50%" height="36px">
								<s:textarea id="remark" cssStyle="margin-left:80px;" 
										name="paramMap.remark" value="" cols="30" rows="5" readonly="true"></s:textarea>
								</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>
	</body>
</html>
