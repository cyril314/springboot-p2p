<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style>.btn_hyzm{display: block;background: #35c2cb; height:28px; line-height:28px; text-align: center; margin-left: 10px; cursor: pointer; padding-left: 10px;padding-right: 10px;}</style>
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
		<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  &#8250; <a href="securityCenterInit.do">安全中心</a>  &#8250; 变更手机号码</div>
		<div id="acc_tabs">	
			<!--内容 开始-->
			<div>
				<table class="updatepwd">
				    <tr class="fred"><td>&nbsp;</td><td>温馨提示：为了您的安全，请绑定手机</td></tr>
					<tr>
						<td align="right" width="400"><span><em class="fred">* </em>现手机号码：</span></td>
						<td>${user.cellPhone }</td>
					</tr>
					<c:if test="#request.map!=null&&#request.map.size()>0">
						<tr>
							<td align="right"><span><em class="fred">* </em>更换中号码：</span></td>
							<td><input type="text" class="txtmail" id="mobile2" value="${map.mobilePhone}"
								disabled="disabled"/></td>
						</tr>
						<tr class="fred">
						    <td></td>
							<td><span id="mobile2_tip"></span></td>
						</tr>
						<tr >
							<td>&nbsp;</td>
							<td><input type="button" class="update" value="取 消" id="cancel" /></td>
						</tr>
					</c:if>
					<s:else>
						<tr>
							<td align="right"><em class="fred">* </em>更换号码：</td>
							<td><input type="text" class="txtmail" id="mobile2" /><span id="mobile2_tip" style="color: #F00;font-size: 12px;"></span></td>
						</tr>
						<tr>
							<td align="right"><em class="fred">* </em>验证码：</td>
							<td><input type="text" class="txtmail left" id="code2"/>
							<a id="reClickCode_" class="btn_hyzm left">获取验证码</a></td>
						</tr>
						<tr class="fred">
							<td>&nbsp;</td>
							<td><input type="button" class="update" value="绑 定" id="reBinding" /></td>
						</tr>
					</s:else>
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
//手机号码变更
var rtimers = 180;
var rtipId;
$(function() {
	$("#reClickCode_").click(function() {
		var phone = $("#mobile2").val();
		//验证手机号码是
			if ($("#mobile2").val() == "") {
				$("#mobile2_tip").attr("class", "formtips onError");
				$("#mobile2_tip").html("请填写手机号码！");
			} else if ((!/^1[3,5,8]\d{9}$/.test($("#mobile2").val()))) {
				$("#mobile2_tip").attr("class", "formtips onError");
				$("#mobile2_tip").html("请正确填写手机号码！");
			} else {
				$("#mobile2_tip").attr("class", "formtips");
				$("#mobile2_tip").html("");

				if ($("#reClickCode_").html() == "重新获取验证码"
						|| $("#reClickCode_").html() == "获取验证码") {
					$.post("sendSMS.do", "phone=" + phone, function(data) {
						if (data == "virtual") {
							window.location.href = "noPermission.do";
							return;
						}
						if (data == 1) {
							rtimers = 180;
							rtipId = window.setInterval(rtimer_, 1000);
						} else {
							alert("手机验证码发送失败");
						}

					});
				}
			}
		});

	$("#reBinding").click(function() {
		if ($("#mobile2").val() == "") {
			$("#mobile2_tip").html("手机号码不能为空");
			return;
		} else if ($("#code2").val() == "") {
			$("#mobile2_tip").html("验证码不能为空");
			return;
		} else if ($("#content2").val() == "") {
			$("#mobile2_tip").html("变更原因不能为空");
			return;
		} else {
			$("#mobile2_tip").html("");
		}
		param["paramMap.mobile"] = $("#mobile2").val();
		param["paramMap.code"] = $("#code2").val();
		param["paramMap.content"] = "当填写手机号码变更绑定时绑定手机";
		$.shovePost("addChangeBindingMobile.do", param, function(data) {
			alert(data.msg);
			if (data.ret == 1) {
				window.location.href = "securityCenterInit.do";
				return;
			}
			window.location.reload();
		});
	});

	$("#cancel").click(function() {
		$.shovePost("cancelBindingMobile.do", param, function(data) {
			alert(data.msg);
			if (data.ret == 1) {
				window.location.href = "securityCenterInit.do";
				return;
			}
			window.location.reload();
		});
	});
});

//定时
function rtimer_() {
	if (rtimers >= 0) {
		$("#reClickCode_").html("验证码获取：" + rtimers + "秒");
		rtimers--;
	} else {
		window.clearInterval(rtipId);
		$("#reClickCode_").html("重新获取验证码");
		$.post("removeCode.do", "", function(data) {
		});
	}
}
</script>
</body>
</html>
