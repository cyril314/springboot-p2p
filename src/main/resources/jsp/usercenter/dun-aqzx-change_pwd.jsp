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
	<div class="ny_main1 clearfix">
		<div class="myhome_main clearfix">
			<!-- 引用我的帐号主页左边栏 -->
			<%@include file="../include/dun-left.jsp"%>
			<!--右 开始-->
			<div class="myhome_r clearfix">
				<!--标题 开始-->
				<div class="ny_tit">
					<ul>
						<li class="on">修改密码</li>
					</ul>
					<a href="securityCenterInit.do" class="h_back">返回</a>
				</div>
				<!--标题 结束-->
				<!--内容 开始-->
				<div class="rz_content clearfix">
					<p class="tips">请定期修改密码，6-20个字符，建议使用字母加数字或符号的组合密码</p>
					<ul class="inputs">
						<li>
							<span><em class="fred">* </em>当前密码：</span>
							<input type="password" class="test1" maxlength="20" id="oldPassword" /><span>&nbsp;</span>
							<span id="s_oldpwd" style="text-align: center; width: 182px;"></span>
						</li>
						<!-- <li class="fred">
							<span>&nbsp;</span><span id="s_oldpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<li>
							<span><em class="fred">* </em>新密码：</span>
							<input type="password" class="test1" maxlength="20" id="newPassword" /><span>&nbsp;</span>
							<span id="s_newpwd" style="text-align: center; width: 182px;"></span>
						</li>
						<!--<li class="fred">
							<span>&nbsp;</span><span id="s_newpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<li>
							<span><em class="fred">* </em>确认新密码：</span>
							<input type="password" class="test1" maxlength="20" id="confirmPassword" /><span>&nbsp;</span>
							<span id="s_confirmpwd" style="text-align: center; width: 182px;"></span>
						</li>
						<!--<li class="fred">
							<span>&nbsp;</span><span id="s_confirmpwd"
								style="text-align: center; width: 200px; height: 33px;"></span>
						</li> -->
						<li class="fred" style="height:8px;"><span>&nbsp;</span></li>
						<li class="fred">
							<span>&nbsp;</span>
							<input type="button" class="h_sqbtn" value="立即修改" id="btn_save" />
						</li>
					</ul>
				</div>
				<!--内容 结束-->
			</div>
			<!--右 结束-->
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
			} else if(data == 999){
	          alert("用户已锁定无法执行此操作!");
	          $("#oldDealpwd").attr("value","");
	          $("#newDealpwd").attr("value","");
	          $("#confirmDealpwd").attr("value","");
		    }else {
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
