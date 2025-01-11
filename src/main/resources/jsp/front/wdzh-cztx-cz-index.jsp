<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
		<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />

	</head>

	<body>

		<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="rechargePageInit.do">充值提现</a>  > 充值</div>
			<div id="acc_tabs">						
				<!--内容 开始-->
				<div class="banklist">
                	<table>
                	  <tr>
                	    <td>充值金额：</td>
                	    <td><input id="money" type="text" class="txtmail" /> 元 </td>
                	    <td><span id="money_tip" class="fred"></span></td>
                	  </tr>
                	</table>
             	   <dl>
                   	    <dt style="color:red;">请选择支付方式</dt>
							<c:if test="#request.gopay==2">
								<dd>
									<input type="radio" name="bankType" value="ICBC"
										id="ICBC" onclick="check1('ICBC',1)" />
									<img src="{ctx}/static/images/bank_icbc.gif" width="128"
										height="33" onclick="check1('ICBC',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CMB" id="CMB" onclick="check1('CMB',1)" />
									<img src="{ctx}/static/images/bank_cmb.gif" width="128"
										height="33" onclick="check1('CMB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CCB" id="CCB" onclick="check1('CCB',1)"/>
									<img src="{ctx}/static/images/bank_ccb.gif" width="128"
										height="33" onclick="check1('CCB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="ABC" id="ABC" onclick="check1('ABC',1)"/>
									<img src="{ctx}/static/images/bank_abc.gif" width="128"
										height="33" onclick="check1('ABC',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="BOC" id="BOC" onclick="check1('BOC',1)"/>
									<img src="{ctx}/static/images/bank_bcl.gif" width="128"
										height="33" onclick="check1('BOC',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="SPDB"
										id="SPDB" onclick="check1('SPDB',1)"/>
									<img src="{ctx}/static/images/banks/bank_06.png" width="128"
										height="33" onclick="check1('SPDB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="SDB" id="SDB" onclick="check1('SDB',1)"/>
									<img src="{ctx}/static/images/banks/bank_07.png" width="128"
										height="33" onclick="check1('SDB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CIB" id="CIB" onclick="check1('CIB',1)"/>
									<img src="{ctx}/static/images/bank_cib.gif" width="128"
										height="33" onclick="check1('CIB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="BOBJ"
										id="BOBJ" onclick="check1('BOBJ',1)"/>
									<img src="{ctx}/static/images/bank_bob.gif" width="128"
										height="33" onclick="check1('BOBJ',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CEB" id="CEB" onclick="check1('CEB',1)"/>
									<img src="{ctx}/static/images/bank_ceb.gif" width="128"
										height="33" onclick="check1('CEB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="BOCOM"
										id="BOCOM" onclick="check1('BOCOM',1)"/>
									<img src="{ctx}/static/images/bank_bcom.gif" width="128"
										height="33" onclick="check1('BOCOM',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CMBC"
										id="CMBC" onclick="check1('CMBC',1)"/>
									<img src="{ctx}/static/images/banks/bank_12.png" width="128"
										height="33" onclick="check1('CMBC',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="CITIC"
										id="CITIC" onclick="check1('CITIC',1)"/>
									<img src="{ctx}/static/images/banks/bank_13.png" width="128"
										height="33" onclick="check1('CITIC',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="GDB" id="GDB" onclick="check1('GDB',1)" />
									<img src="{ctx}/static/images/banks/bank_14.png" width="128"
										height="33" onclick="check1('GDB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="PAB" id="PAB" onclick="check1('PAB',1)"/>
									<img src="{ctx}/static/images/banks/bank_15.png" width="128"
										height="33" onclick="check1('PAB',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="PSBC"
										id="PSBC" onclick="check1('PSBC',1)"/>
									<img src="{ctx}/static/images/banks/bank_16.png" width="128"
										height="33" onclick="check1('PSBC',1)" />
								</dd>

								<!--<dd>
									<input type="radio" name="bankType" value="SRCB"
										id="SRCB" onclick="check1('SRCB',1)"/>
									<img src="{ctx}/static/images/banks/bank_18.png" width="128"
										height="33" onclick="check1('SRCB',1)" />
								</dd>
								--><dd>
									<input type="radio" name="bankType" value="BOS" id="BOS" onclick="check1('BOS',1)"/>
									<img src="{ctx}/static/images/banks/bank_19.png" width="128"
										height="33" onclick="check1('BOS',1)" />
								</dd>
								<dd>
									<input type="radio" name="bankType" value="HXBC"
										id="HXBC"onclick="check1('HXBC',1)"/>
									<img src="{ctx}/static/images/banks/bank_20.png" width="128"
										height="33" onclick="check1('HXBC',1)" />
								</dd>
							</c:if>
                   </dl>
				 <c:if test="#request.IPS==2">
                   <dl class="clearfix C_clerfix"   >
						<dd>
							<input type="radio" name="bankType" value="01"
								id="rd_ipay_jieji" onclick="check1('rd_ipay_jieji',2)"/>
							<em onclick="check1('rd_ipay_jieji',2)">&nbsp;&nbsp;人民币借记卡</em>
						</dd>
						<dd>
							<input type="radio" name="bankType" value="128"
								id="xykzf" onclick="check1('xykzf',2)"/>
							<em onclick="check1('xykzf',2)">&nbsp;&nbsp;信用卡支付</em>
						</dd>
						<dd>
							<input type="radio" name="bankType" value="04" id="ips" onclick="check1('ips',2)"/>
							<em onclick="check1('ips',2)">&nbsp;&nbsp;IPS账户支付</em>
						</dd>
						<dd>
							<input type="radio" name="bankType" value="16" id="dhzf" onclick="check1('dhzf',2)"/>
							<em onclick="check1('dhzf',2)">&nbsp;&nbsp;电话支付</em>
						</dd>
						<dd>
							<input type="radio" name="bankType" value="32" id="sjzf" onclick="check1('sjzf',2)"/>
							<em onclick="check1('sjzf',2)">&nbsp;&nbsp;手机支付</em>
						</dd>
						<dd>
							<input type="radio" name="bankType" value="1024" onclick="check1('yyzf',2)"
								id="yyzf" />
							<em onclick="check1('yyzf',2)">&nbsp;&nbsp;手机语音支付</em>
						</dd>
                   </dl>
				</c:if>
				<c:if test="#request.offline==2">
                   <dl class="clearfix C_clerfix">
                        <dd><input type="radio" name="bankType" class="C_xxcz" id="xxcz"/><em onclick="check1('xxcz',3)">&nbsp;&nbsp;&nbsp;线下充值</em></dd>
                   </dl>
                   <div id="xxcz_info" class="C_tanchu_2_nr2">
            	<table cellpadding="0" cellspacing="0" style="width:710px; font-family:'宋体'; font-size:12px; text-align:center;">
                	<tr style="background:#fffcf7;">
                    	<td style="width:50px;"></td>
                        <td style="width:284px;">银行</td>
                        <td style="width:120px;">账号</td>
                        <td style="width:120px;">开户人</td>
                        <td style="width:120px;">开户行</td>
                    </tr>
														<s:iterator value="#request.banksList" var="bank"
															status="count">
															<tr>
																<td>
																	<input type="radio" value="${bank.bankname }" id="xxbank_${bank.id }"
																		name="paramMap.banks" style="float: none;"
																		<c:if test="#count.count == 1">checked="checked"</c:if> />
																</td>
																<td>
																	<img src="${bank.bankimage }" onclick="check1('xxbank_${bank.id}',4)"
																		style="width:130px;height:60px;" />
																</td>
																<td>
																	${bank.Account }
																</td>
																<td>
																	${bank.accountname }
																</td>
																<td>
																	${bank.accountbank }
																</td>
															</tr>
														</s:iterator>
                    <tr>
                    	<td>交易编号</td>
                        <td><input style="width:150px; height:24px; border:1px solid #ddd; margin-left:50px;" id="rechargeNumber_text" /></td>
                        <td colspan="3"  style="width:360px;">填写网上交易流水号或ATM机汇款交易号或其他号码，只供查询用</td>
                       
                        
                    </tr>
                    <tr>
                    	<td>充值备注</td>
                        <td><input id="remark_text" style="width:150px; height:24px; border:1px solid #ddd; margin-left:50px; "/></td>
                        <td colspan="3" style="width:360px; padding:5px 0;">请注明您的用户名，转账银行卡和转账流水号，以及转账时间</td>
                       
                        
                    </tr>
                </table>
               
            </div></c:if>
            <input value="1" type="hidden" id="payType"/>
            <div id="btn_submit" style=" width:120px; margin: 0 auto;"><a href="javascript:void();" id="addrecharge" class="update">立即充值</a></div>
              </div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>
		

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script type="text/javascript" src=".${ctx}/static/script/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
		<script>
	//添加线下充值
	function addRechargeoutline(name) {
		var param = {};
		param["paramMap.realname"] = name;
		param["paramMap.bankName"] = $("input[name='paramMap.banks']:checked").val();
		param["paramMap.money"] = $("#money").val();
		param["paramMap.rechargeNumber"] = $("#rechargeNumber_text").val();
		param["paramMap.remark"] = $("#remark_text").val();
		$.post("addRechargeoutline.do", param, function(data) {
			if (data.msg == '提交成功') {
				alert(data.msg);
				window.location.href = "rechargeInit.do";
			} else {
				alert(data.msg);
			}
		});
	}
</script>
		<script>
	$(function() {
		$("#zh_hover").attr('class', 'nav_first');
		check1('ICBC',1)
		dqzt(6, 't06');
		//线下充值
		$("#xxcz").click(function() {
			check1('xxcz',3);
		});
		$("#addrecharge").click(function() {
			addRechargeInfo();
		});
	});

	function initListInfo(praData) {

		$.shovePost("queryRechargeInfo.do", praData, initCallBack);
	}
	function initCallBack(data) {
		$("#rechargeInfo").html(data);
	}

	function addRechargeInfo() {
		if ($("#money").val() == "") {
			alert("请输入充值金额");
			$("#money_tip").html("请输入充值金额");
			return;
		} else if (!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/
				.test($("#money").val())) {
			alert("请输入正确的提现金额，必须为大于0的数字");
			$("#money_tip").html("请输入正确的提现金额，必须为大于0的数字");
			return;
		} else if ($("#money").val() < 0.01) {
			alert("最小金额不能低于0.01");
			$("#money_tip").html("最小金额不能低于0.01");
			return;
		} else {
			$("#money_tip").html("");
		}
		
		var payType = -1;
		payType = $("#payType").val();
		if (payType !=1 && payType !=2 && payType != 3) {
			alert("请选择充值类型");
			return;
		}
		var bankType = "";

		bankType = $("input[name='bankType']:checked").val();

		if (bankType == "" || bankType == undefined) {
			alert("请选择银行类型");
			return;
		}

		if (!window.confirm("确定进行帐户充值")) {
			return;
		} else {
			$("#addrecharge").attr("disabled", true);
		}
		var money = $("#money").val();
		var type = "";
		if (payType==2) {
			window.open("ipayPayment.do?divType=li_2&money=" + money
					+ "&gatewayType=" + bankType);
		} else if (payType==1) {
			window.open("gopayPayment.do?divType=li_2&money=" + money
					+ "&bankCode=" + bankType);
		} else if(payType==3){
			if($("#rechargeNumber_text").val()=="" || $("#remark_text").val() == undefined){
				alert("请输入交易编号");
				$("#addrecharge").attr("disabled", false);
				return;
			}
			if($("#remark_text").val()=="" || $("#remark_text").val() == undefined){
				alert("请输入充值备注");
				$("#addrecharge").attr("disabled", false);
				return;
			}
			xxczInit();
		} else {
			alert("请选择充值类型!");
		}
		$("#addrecharge").attr("disabled", false);
	}

	function jumpUrl(obj) {
		window.location.href = obj;
	}
	function xxczInfoShow(type){
		if(type == 1){
			$("input[name='paramMap.banks']").attr("disabled", false);
			$("#rechargeNumber_text").attr("disabled", false);
			$("#remark_text").attr("disabled", false);
		}else{
			$("input[name='paramMap.banks']").attr("disabled", true);
			$("#rechargeNumber_text").attr("disabled", true);
			$("#remark_text").attr("disabled", true);
		}
	}
	function xxczInit(){
		jQuery.jBox.open("post:queryRechartips.do", "充值委托书", 600, 400, {
			buttons : {}
		});
	}
	function check1(value,payType) {
		if(payType!=4){
			$("#payType").val(payType);
		}else{
			payType = $("#payType").val();
		}
		if(payType==3){
			xxczInfoShow(1);
		}else{
			xxczInfoShow(2);
		}
		$("#" + value).prop("checked", true);
	}
</script>
	</body>
</html>
