<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>财务管理-充值管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		<script type="text/javascript">
			$(function(){
				 var param= {};
				$("#btn_save").click(function(){	
					 $("#messageinfo").attr("style","display:block;");
					var money =$("#tb_money").val();
					if(money ==""){
						alert('请输入vip金额！');
						return false;
					}
					if(isNaN(money)){
						alert('请输入正确的vip金额！');
						return false;
					}
				    param["paramMap.vipfee"] = $("#tb_money").val();
				    param["paramMap.tb_userId"] = $("#tb_userId").val();
				   
				    	 $.post('addUserVipStatus.do?date='+new Date(),param,function(data){
						    	var callBack = data.msg.toString();
						        if(callBack==1){
						        alert('添加vip成功!');
						        window.location.href="queryUservipRecoderindex.do";
						        }else{
						        alert(data.msg.toString());
						        window.location.href="queryUservipRecoderindex.do";
						        }
						 });
					});
			});
			
			
			function cancel(){
			  $("#tb_money").attr("value","");
			  $("#money_tip").html("");
			  return false;
			}

		 
		</script>

	</head>
	<body>
	<form >
	
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
				
					<div
						style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td style="width: 120px; height: 35px;" align="right"
									class="blue12">
									用户名：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_userName" name="paramMap.userName"
										cssClass="in_text_2" cssStyle="width: 150px;height:20px;line-height: 20px;" theme="simple" readonly="true" ></s:textfield>
									<s:textfield id="tb_userId" name="paramMap.userId"
										cssClass="in_text_2" cssStyle="width: 150px;height:20px;display:none" 
										theme="simple" readonly="true" ></s:textfield>
										 	 
									</td>
							</tr>
							
							<tr>
								<td style="width: 120px; height: 35px;" align="right" class="blue12">
									VIP金额：
								</td>
								<td align="left" class="f66">
								<s:textfield id="tb_money" name="paramMap.dealMoney"
										cssClass="in_text_2" cssStyle="width: 150px;height:20px;line-height: 20px;" theme="simple" value="0"></s:textfield>
										<span id="money_tip" class="require-field">*<s:fielderror fieldName="paramMap['dealMoney']"></s:fielderror></span>
									</td>
							</tr>
							
							<tr>
							<td colspan="2">
									<button id="btn_save" 
										style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; border: 0; height: 26px" ></button>
									&nbsp;
									<button id="btn_cancel" onclick="cancel();"
										style="background-image: url('static/images/admin/btn_reback.jpg'); width: 70px; border: 0; height: 26px"></button>
									&nbsp;
							</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			</div>
			</form>
	</body>
	
	
</html>
