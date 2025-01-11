<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>

<jsp:include page="../include/top.jsp"></jsp:include>

<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
		<!-- left.jsp -->
		 <%@include file="../include/dun-left.jsp" %>
    	<!--右 开始-->
        <div class="myhome_r clearfix">
        	<!--标题 开始-->
		    <div class="ny_tit">
            	<ul>
                	<li class="on"  onclick="jumpUrl('withdrawLoad.do');">充值提现</li>
                </ul>
                <a href="javascript:history.go(-1);" class="h_back">返回</a>
            </div>
            <!--标题 结束-->
            <!--内容 开始-->	
            <div class="rz_content clearfix">
				 <ul class="items01 clearfix">
                    <li class="ico01">持卡人</li>
                    <li class="ico02"><c:out value="#request.realName" default="---" ></s:property></li>
                 </ul>
                 
                 <ul class="items01 clearfix">
                    <li class="ico01">提现至银行卡</li>
                    <li class="ico02">
                        <dl class="hhh_tx clearfix">
                        <c:if test="#request.banks!=null && #request.banks.size>0">
					       <s:iterator value="#request.banks"  var="bean" status="sta">
						      <!-- 并且银行卡的状态为绑定状态 -->
						      <c:if test="#bean.cardStatus==1">
	                            <dd id="${sta.count }" >
							       	${bean.bankName}&nbsp;&nbsp;<span>${bean.branchBankName}</span>
	                                	 <em   class="${bean.cardDefault==1?"ico03":"" }"><span style="float: right;padding-top: 14px;color: #FFFFFF;">${ bean.id}</span></em>
	                            </dd>
                           	   </c:if>
                            	   <c:if test="#request.banks.size<2">
                            	   	<dt><a href="yhbound.do" class="add1 btn_c">添加提现银行卡</a></dt>
                            	   </c:if>
							</s:iterator>
						</c:if>
						<s:else>
						    <!--   暂未设置提现银行，请先进行设置 -->
						     <dt><a href="yhbound.do" class="add1 btn_c">添加提现银行卡</a></dt>
						</s:else>
                           
                        </dl>
                    </li>
                 </ul>
                 <ul class="items01 clearfix">
                    <li class="ico01">可提现金额</li>
                    <li class="ico02 fyellow">￥<c:out value="#request.usableSum" default="0.00" ></s:property></li>
                 </ul>
                 <ul class="items01 clearfix">
                    <li class="ico01">&nbsp;&nbsp;&nbsp;提现金额</li>
                    <li class="ico02 fyellow">
                    	<input type="text" class="test" id="dealMoney"  style="height:40px"/>
    					<span style="color: red; float: none;" id="money_tip" class="formtips"></span>
    				</li>
                 </ul>
                 <ul class="items01 clearfix">
                    <li class="ico01">&nbsp;&nbsp;&nbsp;交易密码</li>
                    <li class="ico02 fyellow">
                    	<input type="password" class="test" id="dealpwd" style="height:40px"/>
    					<span style="color: red; float: none;" id="pwd_tip" class="formtips"></span>
    				</li>
                 </ul>
                 <ul class="items01 clearfix">
                    <li class="ico01">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;验证码</li>
                    <li class="ico02 fyellow">
                    	<input type="text" class="test" id="code"/ style="height:40px">
					      <a id="clickCode"   class="yzmbtn" href="javascript:void(0);">发送手机验证码</a>
					      <input id="type" name="type" value="drawcash" type="hidden"/>
					      <span style="color: red; float: none;" id="code_tip" class="formtips">
					      	<c:if test="#request.ISDEMO==1">* 不发送短信</c:if>
					      </span>
    				</li>
                 </ul>
                 <p class="tips">警告：禁止信用卡套现、虚假交易等行为，一经确认，将终止该账户的使用。</p>
                 <div class="inputs clearfix">
                    <ul class="clearfix">
                        <li><span style="padding-left: 70px;">&nbsp;</Span><input id="btn_submit" type="button" value="确定提交" class="h_sqbtn" /></li>
                    </ul>
                 </div>
                 <div class="tips">
                  温馨提示<br />
                    1.好乐易贷平台充值未投标的用户，15天以内提现收取本金0.5%，15天以后提现免费；<br />
                    2.请输入您要取出金额,我们将在1至3个工作日(国家节假日除外)之内将钱转入您网站上填写的银行账；<br />
                    3.如你急需要把钱转到你的账号或者24小时之内网站未将钱转入到你的银行账号,请联系客服中心；<br />
                    4.确保您的银行账号的姓名和您的网站上的真实姓名一致；<br />
                    5.在钱打到您账号时会发一封站内信通知你；<br />
                    6.每笔提现金额至少为100元以上；<br />
                    7.每笔提现金额最高不能超过10万元；<br />
                 </div>	  
            </div>
            <!--内容 结束-->
        </div>
        <!--右 结束-->
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
		var phone = $ {
			request.bindingPhone
		};
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
		$("#money_tip").html("请输入正确的提现金额，必须为大于0的数字");
	} else if ($("#dealMoney").val() <= 100) {
		$("#money_tip").html("提现金额不得低于100");
	} else if ($("#dealMoney").val() > ${usableSum}) {
		//alert(${usableSum});
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
	param["paramMap.bankId"] = $("#bankId").val();
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