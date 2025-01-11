<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  > <a href="securityCenterInit.do">安全中心</a>  > 修改登录密码</div>
			<div id="acc_tabs">							
				<!--内容 开始-->
				<div>
					<table class="updatepwd">
					    <tr><td colspan="2" align="center">请定期修改密码，6-20个字符，建议使用字母加数字或符号的组合密码</td></tr>
						<tr>
							<td align="right" width="350"><em class="fred">* </em>当前密码：</td>
							<td><input type="password" class="txtmail" id="oldPassword" /><span id="s_oldpwd" class="fred"></span></td>
						</tr>
						<!-- <li class="fred">
							<span>&nbsp;</span><span id="s_oldpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<tr>
							<td align="right"><em class="fred">* </em>新密码：</td>
							<td><input type="password" class="txtmail" id="newPassword" /><span id="s_newpwd" class="fred"></span></td>
						</tr>
						<!--<li class="fred">
							<span>&nbsp;</span><span id="s_newpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<tr>
							<td align="right"><em class="fred">* </em>确认新密码：</td>
							<td><input type="password" class="txtmail" id="confirmPassword" /><span id="s_confirmpwd" class="fred"></span></td>
						</tr>
						<!--<li class="fred">
							<span>&nbsp;</span><span id="s_confirmpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<tr>
							<td colspan="2" align="center"><input type="button" class="update" value="立即修改" id="btn_save" /></td>
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
<script>
	$(function() {
		$(" :input").blur(ajaxPwd);
		$("#btn_save").click(updateLoginPassword);
		dqzt(3, 't04');
	});
	function ajaxPwd() {
		var status = true;
		if ($("#oldPassword").val() == "") {
			$("#s_oldpwd").html("请填写旧密码");
			status = false;
		} else if ($("#oldPassword").val().length < 6
				|| $("#oldPassword").val().length > 20) {
			$("#s_oldpwd").html("密码长度必须为6-20个字符");
			status = false;
		} else {
			$("#s_oldpwd").html("");
		}

		if ($("#newPassword").val() == "") {
			$("#s_newpwd").html("请填写新密码");
			status = false;
		} else if ($("#newPassword").val().length < 6
				|| $("#newPassword").val().length > 20) {
			$("#s_newpwd").html("密码长度必须为6-20个字符");
			status = false;
		} else if ($("#newPassword").val() == $("#oldPassword").val()) {
			$("#s_newpwd").html("新密码和旧密码不能一样");
			status = false;
		} else {
			$("#s_newpwd").html("");
		}

		if ($("#confirmPassword").val() == "") {
			$("#s_confirmpwd").html("请再次填写新密码");
			status = false;
		} else if ($("#confirmPassword").val().length < 6
				|| $("#confirmPassword").val().length > 20) {
			$("#s_confirmpwd").html("密码长度必须为6-20个字符");
			status = false;
		} else if ($("#newPassword").val() != $("#confirmPassword").val()) {
			$("#s_confirmpwd").html("两次密码不一致");
			status = false;
		} else {
			$("#s_confirmpwd").html("");
		}

		if ($("#newPassword").val() != $("#confirmPassword").val()) {
			$("#s_tip").html("两次密码不一致");
			return;
		}
		return status;
	}
	//登录密码修改
	function updateLoginPassword() {
		var status = ajaxPwd();
		if (status == false) {
			return;
		}
		var param = {};
		param["paramMap.oldPassword"] = $("#oldPassword").val();
		param["paramMap.newPassword"] = $("#newPassword").val();
		param["paramMap.confirmPassword"] = $("#confirmPassword").val();
		param["paramMap.type"] = "login";
		$.post("updateLoginPass.do", param, function(data) {
			if (data == 1) {
				alert("两次密码输入不一致");
				$("#newPassword").attr("value", "");
				$("#confirmPassword").attr("value", "");
			} else if (data == 2) {
				alert("旧密码错误");
				$("#oldPassword").attr("value", "");
				$("#newPassword").attr("value", "");
				$("#confirmPassword").attr("value", "");
			} else if (data == 3) {
				alert("新密码修改失败");
				$("#oldPassword").attr("value", "");
				$("#newPassword").attr("value", "");
				$("#confirmPassword").attr("value", "");
			} else if (data == 4) {
				alert("密码长度输入错误,密码长度范围为6-20");
				$("#oldDealpwd").attr("value", "");
				$("#newDealpwd").attr("value", "");
				$("#confirmDealpwd").attr("value", "");
			}else if(data == 999){
		          alert("用户已锁定无法执行此操作!");
		          $("#oldDealpwd").attr("value","");
		          $("#newDealpwd").attr("value","");
		          $("#confirmDealpwd").attr("value","");
		       } else {
				alert("修改密码成功");
				$("#oldPassword").attr("value", "");
				$("#newPassword").attr("value", "");
				$("#confirmPassword").attr("value", "");
			}
		});
	}
</script>
</body>
</html>
