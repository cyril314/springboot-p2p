<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>借款管理-初审</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
	<link href="${ctx}/static/css/admin/admin_custom_css.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="right">
	<div style="padding: 15px 10px 0px 10px;">
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100" height="28" class="main_alll_h2">
						借款审核初审
					</td>
					<td width="2">&nbsp;</td>
					<td width="100" align="center"  class="white12"></td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		 
		<div class="tab">
			<table cellspacing="1" cellpadding="3">
				<tr>
					<td class="blue12 left">用户名：${borrowMFADetail.username}</td>
					<td class="f66 leftp200">真实姓名：${borrowMFADetail.realName}</td>
				</tr>
				<tr>
					<td colspan="2" class="blue12 left">标的标题：${borrowMFADetail.borrowTitle}</td>
				</tr>
				<tr>
				    <td class="blue12 left">借款金额：${borrowMFADetail.borrowAmount}&nbsp;元</td>
					<td class="f66 leftp200">年利率：${borrowMFADetail.annualRate}%</td>
				</tr>
				<tr>
					<td class="blue12 left">借款期限：${borrowMFADetail.deadline}
						<c:if test="%{borrowMFADetail.isDayThe ==1}">个月</c:if><s:else>天</s:else>
					</td>
					<td class="f66 leftp200">借款目的：${borrowMFADetail.purpose}</td>
				</tr>
				<tr>
					<td class="blue12 left">还款方式：
						<c:if test="%{borrowMFADetail.paymentMode ==1}">按月分期还款</c:if>
						<s:elseif test="%{borrowMFADetail.paymentMode ==2}">按月付息,到期还本</s:elseif>
						<s:elseif test="%{borrowMFADetail.paymentMode ==3}">秒还</s:elseif>　
						<s:elseif test="%{borrowMFADetail.paymentMode ==4}">一次性还款</s:elseif>　
					</td>
					<td class="f66 leftp200">标的类型：
						<c:if test="%{borrowMFADetail.borrowWay==1}">净值借款</c:if>
						<s:elseif test="%{borrowMFADetail.borrowWay==2}">秒还借款</s:elseif>
						<s:elseif test="%{borrowMFADetail.borrowWay==3}">信用借款</s:elseif>
						<s:elseif test="%{borrowMFADetail.borrowWay==4}">实地考察借款</s:elseif>
						<s:elseif test="%{borrowMFADetail.borrowWay==5}">机构担保借款</s:elseif>
						<s:elseif test="%{borrowMFADetail.borrowWay==6}">流转标借款</s:elseif>
					</td>
				</tr>
				<c:if test="#request.subscribes==1">
					<tr>
						<td class="blue12 left">最小认购金额：${borrowMFADetail.smallestFlowUnit}元</td>
						<td class="f66 leftp200">认购总份数：${borrowMFADetail.circulationNumber}份</td>
					</tr>
				</c:if>
				<s:elseif test="%{borrowMFADetail.borrowShow==2}">
					<tr>
						<td class="blue12 left">最小认购金额：${borrowMFADetail.smallestFlowUnit}元</td>
						<td class="f66 leftp200">认购总份数：${borrowMFADetail.circulationNumber}份</td>
					</tr>
				</s:elseif>
				<s:else>
					<tr>
						<td class="blue12 left">最低投标金额：${borrowMFADetail.minTenderedSum}元</td>
						<td class="f66 leftp200">最高投标金额：
                                  <c:if test="%{borrowMFADetail.maxTenderedSum==-1}">没有限制</c:if>
					        <s:else>${borrowMFADetail.maxTenderedSum}元</s:else>                                                            
						</td>
					</tr>
				</s:else>
				<tr>
					<td class="blue12 left">投标奖励:  
						<c:if test="%{borrowMFADetail.excitationType ==2}">按 固定金额,${borrowMFADetail.excitationSum}元</c:if>
						<s:elseif test="%{borrowMFADetail.excitationType ==3}">按借款金额比例,${borrowMFADetail.excitationSum}%</s:elseif>
						<s:else>无</s:else>
					</td>
					<td align="left" class="f66"></td>
				</tr>
				<tr>
					<td class="blue12 left">投标密码：
						<c:if test="%{borrowMFADetail.hasPWD ==1}">有</c:if>
						<s:else>无</s:else>
					</td>
					<td class="f66 leftp200"></td>
				</tr>
				<c:if test="%{borrowMFADetail.borrowShow==1}">
					<tr>
						<td colspan="2" class="blue12 left">借款详情：${borrowMFADetail.detail}</td>
					</tr>
				</c:if>
				<s:else>
					<tr>
						<td colspan="2" class="blue12 left">借款方商业概述：${borrowMFADetail.businessDetail}</td>
					</tr>
					<tr>
						<td colspan="2" class="blue12 left">借款方资产情况：${borrowMFADetail.assets}</td>
					</tr>
					<tr>
						<td colspan="2" class="blue12 left">借款方资金用途：${borrowMFADetail.moneyPurposes}</td>
					</tr>
				</s:else>
				<tr>
					<td colspan="2" class="blue12 left">添加时间：${borrowMFADetail.publishTime}/IP: ${borrowMFADetail.publishIP}</td>
				</tr>
				<tr>
					<td colspan="2" class="blue12 left">
						借款人认证审核查看：<a href="queryPerUserCreditAction.do?userId=${borrowMFADetail.userId}" target="_blank" style="color: blue;"><strong>申请人认证详情查看</strong></a>
					</td>
				</tr>
			</table>
			<div id="content">
				<table>
					<tr>
						<td colspan="2" class="blue12 left">
							审核状态：<span class="require-field">*</span>
							<s:radio name="paramMap.status" list="#{2:'审核通过',6:'审核不通过'}" value="%{borrowMFADetail.borrowStatus}"></s:radio>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="blue12 left">
							站内信通知：<span class="require-field">*&nbsp;</span>
							<br/><s:textarea cssStyle="margin-left:80px;" name="paramMap.msg" value="%{borrowMFADetail.mailContent}"  cols="30" rows="5"></s:textarea>
						</td>
						<td align="center" class="f66">
						</td>
					</tr>
					<tr>
					    <td colspan="2" class="blue12 left">
							风控意见：<span class="require-field">*&nbsp;</span>
							<br/><s:textarea cssStyle="margin-left:80px;" name="paramMap.auditOpinion" value="%{borrowMFADetail.auditOpinion}" cols="30" rows="10"></s:textarea>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="left" style="padding-left: 30px;">
							<button id="btn_save" style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; border: 0; height: 26px" ></button>
						</td>
					</tr>
				</table>
			</div>
			<s:hidden name="id" value="%{borrowMFADetail.id}"></s:hidden>
			<s:hidden name="uid" value="%{borrowMFADetail.userId}"></s:hidden>
			<br />
		</div>
	</div>
</div>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
var falg = false;
	$(function(){
	  //提交表单
   	  $('#btn_save').click(function(){
   	  $('#btn_save').attr('style',"background-image: url('static/images/admin/btn_chulz.jpg'); width: 70px; border: 0; height: 26px");
   	  $('#btn_save').attr('disabled',true);
	     param['paramMap.id'] = $('#id').val();
	     param['paramMap.reciver'] = $('#uid').val();
	     param['paramMap.status'] = $("input[name='paramMap.status']:checked").val();
	     param['paramMap.msg'] = $('#paramMap_msg').val();
	     param['paramMap.auditOpinion'] = $('#paramMap_auditOpinion').val();
	     if(falg) return ;
	     $.shovePost('updateBorrowF.do',param,function(data){
		 	var callBack = data.msg;
		 	if(callBack == undefined || callBack == ''){
		       $('#content').html(data);
		       $("#btn_save").attr('disabled',false); 
		       falg = false;
		 	}else{
		    	if(callBack == 1){
		        	alert("操作成功!");
		        	window.location.href="borrowf.do";
		        	falg = true;
		        	return false;
		     	}
		    	alert(callBack);
		    	$('#btn_save').attr('style',"background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; border: 0; height: 26px");
		    	falg = false;
		   		$("#btn_save").attr('disabled',false); 
		   }
		 });
	 });
	});
</script>
	</body>	
</html>