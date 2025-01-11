<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><jsp:include page="../include/head.jsp"></jsp:include></head>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<body>
<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
		<!-- 引用我的帐号主页左边栏 -->
		<%@include file="../include/dun-left.jsp"%>
		<!--右 开始-->
		<div class="myhome_r clearfix">
			<!--标题 开始-->
			<div class="ny_tit">
				<ul><li class="on">安全中心</li></ul>
				<a href="securityCenterInit.do" class="h_back">返回</a>
			</div>
			<!--标题 结束-->
			<!--内容 开始-->
			<div class="rz_content clearfix">
				<p class="tips">温馨提示：为了您的安全，请绑定手机	</p>
				<ul class="inputs">
					<li>
						<span><em class="fred">* </em>现手机号码：</span> ${user.cellPhone }
					</li>
					<c:if test="#request.map!=null&&#request.map.size()>0">
						<li>
							<span><em class="fred">* </em>更换中号码：</span>
							<input type="text" class="test1" id="mobile2" maxlength="11" value="${map.mobilePhone}"
								style="width: 180px; height: 35px;" disabled="disabled"/>
						</li>
						<li class="fred">
							<span>&nbsp;</span><span id="mobile2_tip"></span>
						</li>
						<li class="fred">
							<span>&nbsp;</span>
							<input type="button" class="h_sqbtn" value="取 消" id="cancel" />
						</li>
					</c:if>
					<s:else>
						<li>
							<span><em class="fred">* </em>更换号码：</span>
							<input type="text" class="test1" id="mobile2" maxlength="11"
								style="width: 180px; height: 35px;" />
						</li>
						<li>
							<span><em class="fred">* </em>验证码：</span>
							<input type="text" class="test1" id="code2" maxlength="4"
								style="width: 180px; height: 35px;" />
							<a class="btn01" id="reClickCode_">获取验证码</a>
						</li>
						<li class="fred">
							<span>&nbsp;</span><span id="mobile2_tip"></span>
						</li>
						<li class="fred">
							<span>&nbsp;</span>
							<input type="button" class="h_sqbtn" value="绑 定" id="reBinding" />
						</li>
					</s:else>
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

	$("#cancel").click(function(){
		$.shovePost("cancelBindingMobile.do",param,function(data){
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