<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style>.btn_hyzm{display: block;background: #35c2cb; width: 100px; height:28px; line-height:28px; text-align: center; margin-left: 10px; cursor: pointer;}</style>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  >> <a href="securityCenterInit.do">安全中心</a>  >> 绑定手机号码</div>
			<div id="acc_tabs">	
				<!--内容 开始-->
				<div>
					<table class="updatepwd">
						<tr class="fred"><td>&nbsp;</td><td>温馨提示：为了您的安全，请绑定手机</td></tr>
						<tr>
							<td align="right"><span><em class="fred">* </em>手机号码：</span></td>
							<td><input type="text" class="txtmail" id="mobile" /></td>
						</tr>
						<tr>
							<td align="right"><span><em class="fred">* </em>验证码：</span></td>
							<td><input type="text" class="txtmail left"  id="code" maxlength="4"/>
								<a id="clickCode_" class="btn_hyzm left">获取验证码</a></td>
						</tr>
						<tr class="fred">
							<td>&nbsp;</td>
							<td><input type="button" class="update" value="绑 定" id="binding"/></td>
						</tr>
					</table>
				</div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
//手机号码绑定
var timers = 180;
var tipId;
$(function() {
	dqzt(3, 't04');
	$("#clickCode_").click(function() {
		var phone = $("#mobile").val();
		//验证手机号码是
			if ($("#mobile").val() == "") {
				$("#mobile_tip").attr("class", "formtips onError");
				$("#mobile_tip").html("请填写手机号码！");
			} else if ((!/^1[3-8]\d{9}$/.test($("#mobile").val()))) {
				$("#mobile_tip").attr("class", "formtips onError");
				$("#mobile_tip").html("请正确填写手机号码！");
			} else {
				$("#mobile_tip").attr("class", "formtips");
				$("#mobile_tip").html("");

				if ($("#clickCode_").html() == "重新获取验证码"
						|| $("#clickCode_").html() == "获取验证码") {

					$.post("sendSMS.do", "phone=" + phone, function(data) {
						if (data == "virtual") {
							window.location.href = "noPermission.do";
							return;
						}
						if (data == 1) {
							timers = 180;
							tipId = window.setInterval(timer_, 1000);
						} else {
							alert("手机验证码发送失败");
						}

					});
				}
			}
		});
	$("#binding").click(function() {
		if ($("#mobile").val() == "") {
			$("#mobile_tip").attr("class", "formtips onError");
			$("#mobile_tip").html("请填写手机号码！");
		} else if ((!/^1[3-8]\d{9}$/.test($("#mobile").val()))) {
			$("#mobile_tip").attr("class", "formtips onError");
			$("#mobile_tip").html("请正确填写手机号码！");
		} else if ($("#code").val() == "") {
			$("#mobile_tip").attr("class", "formtips onError");
			$("#mobile_tip").html("请正确验证码！");
		} else {
			$("#mobile_tip").attr("class", "formtips");
			$("#mobile_tip").html("");
			var param = {};
			param["paramMap.code"] = $("#code").val();
			param["paramMap.phone"] = $("#mobile").val();
			$.post("addBindingMobile.do", param, function(data) {
				alert(data.msg);
				if (data.ret == "1") {
					window.location.href = "securityCenterInit.do";
				}
				window.location.reload();
			});
		}
	});
});

//定时
function timer_() {
	if (timers >= 0) {
		$("#clickCode_").html("" + timers + "秒");
		timers--;
	} else {
		window.clearInterval(tipId);
		$("#clickCode_").html("重新获取验证码");
		$.post("removeCode.do", "", function(data) {
		});

	}
}
</script>
</body>
</html>
