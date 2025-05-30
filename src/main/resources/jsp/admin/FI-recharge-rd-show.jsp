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
</head>
<body>
	<div id="right" style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
		<div style="padding: 15px 10px 0px 10px;">
			<div>
				<h3>查看</h3>
				<div style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0" width="100%" border="0">
						<tbody>
					         <tr>
								<td class="f66" align="left" width="25%" height="36px">
									用户名&nbsp;：&nbsp;&nbsp;
									<c:out  value="paramMap.uname"></s:property>
									&nbsp;&nbsp;&nbsp;
								</td>
							 </tr>
							 <tr>
								<td class="f66" align="left" width="25%" height="36px">
									充值类型：&nbsp;&nbsp;
									<c:if test="paramMap.type==1">手动充值</c:if>
									<s:else>手动扣费</s:else>
									<c:out  value="paramMap.rechargeType"></s:property>
								</td>
							</tr>
							<tr>
								<td class="f66" align="left" width="25%" height="36px">
									操作金额：&nbsp;&nbsp;<c:out  value="paramMap.dealMoney"></s:property>
								</td>
							</tr>
							<tr>
								<td class="f66" align="left" width="25%" height="36px">
									备注：&nbsp;&nbsp;
								</td>
							</tr>
							<tr>
								<td class="f66" align="left" width="25%" height="36px">
									<s:textarea id="remark" cssStyle="margin-left:80px;" cssClass="textareash" name="paramMap.remark"  cols="30" rows="5" readonly="true"></s:textarea>
								</td>
							</tr>
							<tr>
								<td class="f66" align="left" width="25%" height="36px">
									操作人员&nbsp;：&nbsp;&nbsp;<c:out  value="paramMap.userName"></s:property>
								</td>
							</tr>
							<tr><td>&nbsp;</td></tr>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									操作时间：&nbsp;&nbsp;<c:out  value="paramMap.checkTime"></s:property>&nbsp;&nbsp;
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
