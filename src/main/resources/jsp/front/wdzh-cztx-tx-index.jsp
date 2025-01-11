<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/index.css"  rel="stylesheet" type="text/css" />
<style>
.btn_hyzm{display: block;background: #35c2cb; height:30px; line-height:30px; text-align: center; margin-left: 10px; cursor: pointer; width:120px; float: left; border-radius:2px;}
.btn_hyzm:hover{display: block;background: #1aaeb8; height:30px; line-height:30px; text-align: center; margin-left: 10px; cursor: pointer; width:120px; float: left; border-radius:2px;}

.tabtx td{ height: 40px; line-height: 40px;}
.tabtx td span{ padding-left: 5px;}
</style>
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="rechargePageInit.do">充值提现</a>  > 提现</div>
			<div id="acc_tabs">						
				<!--内容 开始-->
				<div>
				<table cellpadding="0" cellspacing="0" class="tabtx">
				 <tr>
                    <td align="right" width="100">持卡人：</td>
                    <td><c:out value="#request.realName" default="---" ></s:property><span id="phone" style="display: none"><c:out value="#request.bindingPhone" ></s:property></span></td>
                    <td rowspan="8" width="400" style="border-left: 1px solid #c7c7c7">
                    <span class="FF0">================ 温馨提示  ===============</span>
                    <p>1.好乐易贷平台充值未投标的用户，15天以内提现平台加收本金的0.5%，15天以后平台不再加收此费用；</p> 
                    <p>2.请输入您要取出金额,我们将在1至3个工作日之内将钱转入您网站上填写的银行账号；</p> 
                    <p>3.确保您的银行账号的姓名和您的网站上的真实姓名一致；</p> 
                    <p>4.在钱打到您账号时会发一封站内信通知你；</p> 
                    <p>5.每笔提现金额至少为100元以上；</p> 
                    <p>6.每笔提现金额最高不能超过10万元；</p> 
                    </td>
                 </tr>
                 <tr>
                    <td align="right">提现至银行卡:</td>
                    <td>
                        <dl>
                        <c:if test="#request.banks!=null && #request.banks.size>0">
					       <s:iterator value="#request.banks"  var="bean" status="sta">
						      <!-- 并且银行卡的状态为绑定状态 -->
						      <c:if test="#bean.cardStatus==1">
	                            <dd id="${sta.count }" >
							       	${bean.bankName}&nbsp;&nbsp;<span>${bean.branchBankName}</span>
							       <em   class="${bean.cardDefault==1?"ico03":"" }">
							       		<span style="float: right;padding-top: 14px;color: #FFFFFF;">${bean.id}</span>
							       </em>
	                            </dd>
                           	   </c:if>
                            	   <c:if test="#request.banks.size<2">
                            	   	<dt><a href="yhbound.do" class="btn_hyzm">添加提现银行卡</a></dt>
                            	   </c:if>
							</s:iterator>
						</c:if>
						<s:else>
						    <!--   暂未设置提现银行，请先进行设置 -->
						     <dt><a href="yhbound.do" class="btn_hyzm">添加提现银行卡</a></dt>
						</s:else>
                           
                        </dl>
                    </td>
                 </tr>
                 <tr>
                    <td align="right">可提现金额：</td>
                    <td>￥<c:out value="#request.usableSum" default="0.00" ></s:property></td>
                 </tr>
                 <tr>
                    <td align="right">提现金额：</td>
                    <td>
                    	<input type="text" class="txtmail" id="dealMoney" />
    				<span style="color: red; float: none; font-size: 12px;" id="money_tip" class="formtips"></span></td>
                 </tr>
                 <tr >
                    <td align="right">交易密码：</td>
                    <td>
                    	<input type="password" class="txtmail" id="dealpwd"/>
    				<span style="color: red; float: none;font-size: 12px;" id="pwd_tip" class="formtips"></span></td>
                 </tr>
                 <tr>
                    <td align="right">验证码：</td>
                    <td>
                    	<input type="text" class="txtmail" style="width:120px;float:left"  id="code"/>
					      <a id="clickCode" class="btn_hyzm" href="javascript:void(0);">发送手机验证码</a>
    				  <span style="color: red; float: none;font-size: 12px;" id="code_tip" class="formtips">
					      	<c:if test="#request.ISDEMO==1">* 不发送短信</c:if>
					      </span>
    				</td>
    				 <input id="type" name="type" value="drawcash" type="hidden"/>
                 </tr>
                 <tr>
                 <td colspan="2"><span class="fred">警告：禁止信用卡套现、虚假交易等行为，一经确认，将终止该账户的使用。</span></td>
                 </tr>
                    <tr>
                        <td colspan="2" align="center"><input id="btn_submit" type="button" value="确定提交" class="update" /></td>
                    </tr>
                 </table>	  
            </div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>
<input id="bankId" type="hidden" />
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script>
var flags = false;
//手机号码绑定
var timers = 60;
var tipId;
$(function() {
	$("#clickCode").click(function() {
		var phone=$("#phone").html();
		if ($("#clickCode").html() == "重新发送验证码" || $("#clickCode").html() == "发送手机验证码") {
			$.post("sendSMS.do", "phone=" + phone, function(data) {
				if (data == "virtual") {
					window.location.href = "noPermission.do";
					return;
				}
				if (data == 1) {
					timers = 60;
					tipId = window.setInterval(timer, 1000);
				} else {
					alert("手机验证码发送失败");
				}
			});
		}
	});
});

//定时
function timer() {
	if (timers >= 0) {
		$("#clickCode").html("验证码获取：" + timers + "秒");
		timers--;
	} else {
		window.clearInterval(tipId);
		$("#clickCode").html("重新发送验证码");
		$.post("removeCode.do", "", function(data) {});
	}
}
</script>
<script type="text/javascript">
var flag = false;
$(function() {
	$("#zh_hover").attr('class', 'nav_first');
	dqzt(6, 't06');
	$('.tabmain').find('li').click(function() {
		$('.tabmain').find('li').removeClass('on');

	});
	param["pageBean.pageNum"] = 1;
	initListInfo(param);

	$("#bankId").val($(".ico03").text());
	$("#1").click(function() {
		$("em").removeClass('ico03');
		$(this).children("em").addClass('ico03');
		var a = $(this).children("em").text();
		$("#bankId").val(a);
	});

	$("#2").click(function() {
		$("em").removeClass('ico03');
		$(this).children("em").addClass('ico03');
		var a = $(this).children("em").text();
		$("#bankId").val(a);
	});

});

function emcheck(count, id) {
	alert(count + "---" + id);
	$(".hhh_tx clearfix > dd > em").eq(count).addClass("ico03");
}

function initListInfo(praData) {
	$.shovePost("queryWithdrawList.do", praData, initCallBack);
}

function initCallBack(data) {
	$("#withdraw").html(data);
}

function jumpUrl(obj) {
	window.location.href = obj;
}

$("#dealpwd").blur(function() {
	if ($("#dealpwd").val() == "") {
		$("#pwd_tip").html("交易密码不能为空");
	} else {
		$("#pwd_tip").html("");
	}
});

$("#dealMoney").blur(function() {
	if ($("#dealMoney").val() == "") {
		$("#money_tip").html("提现金额不能为空");
	} else if (!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#dealMoney").val())) {
		$("#money_tip").html("请输入大于0的数字");
	} else if ($("#dealMoney").val() < 100) {
		$("#money_tip").html("提现金额不得低于100");
	} else if ($("#dealMoney").val() > ${usableSum}) {
		$("#money_tip").html("提现金额不能大于可用余额");
	} else {
		$("#money_tip").html("");
	}
});

$("#code").blur(function() {
	if ($("#code").val() == "") {
		$("#code_tip").html("验证码不能为空");
	} else {
		$("#code_tip").html("");
	}
});

$("#btn_submit").click(function() {
	addWithdraw();
});

function addWithdraw() {
	if ($("#bankId").val() == "") {
		alert("请设置或者选择提现银行卡信息");
		window.location.href = "yhbound.do";
		return;
	} else if ($("#dealpwd").val() == "") {
		alert("请填写交易密码");
		return;
	} else if ($("#dealMoney").val() == "") {
		alert("请填写提现金额");
		return;
	}
	if ($("#money_tip").text() != "") {
		alert("请填写正确的金额");
		$("#dealMoney").attr("value", "")
		return;
	}

	if (!window.confirm("确定添加提现记录")) {
		return;
	} else {
		$("#btn_submit").attr("disabled", true);
	}

	param["paramMap.dealpwd"] = $("#dealpwd").val();
	param["paramMap.money"] = $("#dealMoney").val();
	param["paramMap.cellPhone"] = '${bindingPhone}';
	param["paramMap.code"] = $("#code").val();
	param["paramMap.bankId"] = $.trim($("#bankId").val());
	param["paramMap.type"] = $("#type").val();
	if (flag) return;
	$.shovePost("addWithdraw.do", param, function(data) {
		flag = false;
		if (data.msg == 1) {
			flag = true;
			window.clearInterval(tipId);
			$("#clickCode").html("发送手机验证码");
			alert("申请提现成功");
			jumpUrl('withdrawLoad.do');
		} else {
			$("#btn_submit").attr("disabled", false);
			alert(data.msg);
		}
	});
}

$("#send_phoneCode").click(function() {
	var param = {
		"type": "drawcash"
	};
	$.shovePost("sendPhoneCode.do", param, function(data) {
		if (data == 1) {
			alert("发送成功");
		}
		alert("验证码：" + data);
	});
});
</script>
</body>
</html>