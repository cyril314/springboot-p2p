<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>管理首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/plugins/code/prettify.css" />
		<script type="text/javascript" language="javascript">
	    	$(function(){
				
				$("#btn_save").click(function(){
					window.history.go(-1);
				});
				
			});
		</script>

	</head>
	<body>
	<form id="editForm" action="auditDebt.do" method="post">
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28"  class="main_alll_h2">
									<span>债权转让详情</span>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					 
					<div style="width: auto; background-color: #FFF; padding: 10px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td style="width: 100px; height: 25px;" align="left"
									class="blue12" colspan="2">
									<strong>借款详情</strong>
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									借款人：
								</td>
								<td align="left" class="f66" >
									${paramMap.borrowerName }
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									有无逾期：
								</td>
								<td align="left" class="f66" >
									<c:if test="%{paramMap.isLate==1}">
								 		无 
									</c:if>
									<s:else>
										有
									</s:else>
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									借款标题：
								</td>
								<td align="left" class="f66" >
									${paramMap.borrowTitle }
								</td>
								
							</tr>
							
							<tr>
								<td style="width: 100px; height: 25px;" align="left"
									class="blue12" colspan="2">
									<strong>转让详情</strong>
								</td>
								
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									转让者：
								</td>
								<td align="left" class="f66" >
									${paramMap.alienatorName }
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									竞拍方式：
								</td>
								<td align="left" class="f66" >
									<c:if test="%{paramMap.auctionMode==1}">明拍</c:if>
									<s:else>暗拍</s:else>
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									债权金额：
								</td>
								<td align="left" class="f66" >
									${paramMap.debtSum }元
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									竞拍低价：
								</td>
								<td align="left" class="f66" >
									${paramMap.auctionBasePrice }元
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									剩余期限：
								</td>
								<td align="left" class="f66" >
									${paramMap.debtLimit }个月
								</td>
								
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									竞拍期限：
								</td>
								<td align="left" class="f66" >
									${paramMap.auctionDays }天
								</td>
								
							</tr>
							
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									转让描述：
								</td>
								<td align="left" class="f66" colspan="3">
									<s:textarea name="paramMap.details" theme="simple" cols="80" rows="5" readonly="true"></s:textarea>
									
									
								</td>
							</tr>
							<tr>
								<td height="25">
								</td>
								<td align="left" class="f66" style="color: Red;" colspan="3">
									<s:fielderror fieldName="paramMap.allError" />
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td colspan="3">
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td colspan="3">
                                <button id="btn_save" style="background-image: url('static/images/admin/btn_queding.jpg');width: 70px;border: 0;height: 26px"  />
                                <span style="color: red;">
                             	  <s:fielderror fieldName="actionMsg" theme="simple"></s:fielderror>
                                </span>
                            </td>
							</tr>
						</table>
						<br />
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
