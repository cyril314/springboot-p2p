<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include page="../include/head.jsp"></jsp:include>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="${ctx}/static/css/index.css" type="text/css" />
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  > <a href="securityCenterInit.do">安全中心</a> > 短信修改交易密码</div>
			<div id="acc_tabs">							
				<!--内容 开始-->
					<div>
						<table class="updatepwd">
							<tr>
						        <td colspan="2" align="center">请保证交易密码控制在6-20个字符，建议使用字母加数字或符号的组合密码</td>
						    </tr>
							<tr>
								<td align="right" width="400"><em class="fred">* </em>新交易密码：</td>
								<td><input type="password" class="txtmail" id="newPassword"/>&nbsp;<span id="s_newpwd" class="fred"></span></td>
							</tr>
							<!--<li class="fred">
								<span>&nbsp;</span><span id="s_newpwd" style="text-align: center; width: 182px;"></span>
							</li> -->
							<tr>
								<td align="right"><em class="fred">* </em>确认新密码：</td>
								<td><input type="password" class="txtmail" id="confirmPassword"/>&nbsp;<span id="s_confirmpwd" class="fred"></span></td>
							</tr>
							<tr>
								<td align="right"><em class="fred">* </em>手机验证码：</td>
								<td><input type="text" class="txtmail left" id="code"/>
					      			<a id="clickCode" class="btn_hyzm left" href="javascript:void(0);">发送手机验证码</a>
					      			<span style="color: red; float: none;font-size: 12px;" id="code_tip" class="formtips"></span>
					      		</td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input type="button" class="update" value="立即修改" id="btn_save"/></td>
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
<script>
$(function(){
	$(" :input").blur(ajaxPwd);
	$("#btn_save").click(updateLoginPassword);
	dqzt(3,'t04');
});
//交易密码修改
function updateLoginPassword(){
	var status = ajaxPwd();
	if(status==false){
		return;
	}
	var param = {};
	param["paramMap.newPassword"] = $("#newPassword").val();
	param["paramMap.confirmPassword"] = $("#confirmPassword").val();
	param["paramMap.code"] = $("#code").val();
	param["paramMap.type"] = "deal";
	$.post("updateDealPass.do",param,function(data){
      if(data == 1){
        alert("两次密码输入不一致");
         $("#newPassword").attr("value","");
         $("#confirmPassword").attr("value","");
      }else if(data == 2){
         alert("旧密码错误");
         $("#code").attr("value","");
         $("#newPassword").attr("value","");
         $("#confirmPassword").attr("value","");
      }else if(data==3){
         alert("新密码修改失败");
         $("#code").attr("value","");
         $("#newPassword").attr("value","");
         $("#confirmPassword").attr("value","");
      }else if(data == 4){
          alert("密码长度输入错误,密码长度范围为6-20");
         $("#code").attr("value","");
         $("#newDealpwd").attr("value","");
         $("#confirmDealpwd").attr("value","");
      }else if(data == 5){
          alert("验证码信息错误,重新获取！");
          $("#code").attr("value","");
          $("#newDealpwd").attr("value","");
          $("#confirmDealpwd").attr("value","");
       }else{
		  alert("修改交易密码成功");
      	  $("#code").attr("value","");
          $("#newPassword").attr("value","");
          $("#confirmPassword").attr("value","");
      }
  });
}
//密码输入是否正确
function ajaxPwd(){
	var status = true;
    if($("#newPassword").val()=="" ){
       $("#s_newpwd").html("请填写新密码");
       status = false;
    }else if($("#newPassword").val().length<6 ||$("#newPassword").val().length >20){
       $("#s_newpwd").html("密码长度必须为6-20个字符");
       status = false;
    }else if($("#newPassword").val()==$("#oldPassword").val()){
       $("#s_newpwd").html("新密码和旧密码不能一样");
       status = false;
    }else{
       $("#s_newpwd").html("");
    }
    
    if($("#confirmPassword").val()=="" ){
       $("#s_confirmpwd").html("请再次填写新密码");
       status = false;
    }else if($("#confirmPassword").val().length<6 ||$("#confirmPassword").val().length >20){
       $("#s_confirmpwd").html("密码长度必须为6-20个字符");
       status = false;
    }else if($("#newPassword").val()!=$("#confirmPassword").val()){
       $("#s_confirmpwd").html("两次密码不一致");
       status = false;
    }else{
       $("#s_confirmpwd").html("");
    }
    
    if($("#newPassword").val()!=$("#confirmPassword").val()){
       $("#s_tip").html("两次密码不一致");
       return;
    }
    return status;
}
//======================================
//获取验证码
var timers = 180;
$(function() {
	$("#clickCode").click(function() {
		var phone=${user.cellPhone };
		if ($("#clickCode").html() == "重新发送验证码" || $("#clickCode").html() == "发送手机验证码") {
			$.post("sendSMS.do", "phone=" + phone, function(data) {
				if (data == "virtual") {
					window.location.href = "noPermission.do";
					return;
				}
				if (data == 1) {
					timers = 120;
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
</body>
</html>
