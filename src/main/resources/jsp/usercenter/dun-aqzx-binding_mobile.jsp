<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
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
							<li class="on">
								安全中心
							</li>
						</ul>
						<a href="securityCenterInit.do" class="h_back">返回</a>
					</div>
					<!--标题 结束-->
					<!--内容 开始-->
					<div class="rz_content clearfix">
						<p class="tips">
							温馨提示：为了您的安全，请绑定手机
						</p>
						<ul class="inputs">
							<li>
								<span><em class="fred">* </em>手机号码：</span>
								<input type="text" class="test1" id="mobile" maxlength="11" style="width:180px;height:35px;"/>
							</li>
							<li>
								<span><em class="fred">* </em>验证码：</span>
								<input type="text" class="test1" id="code" maxlength="4" style="width:180px;height:35px;"/>
								<a class="btn01" id="clickCode_">获取验证码</a>
							</li>
							<li class="fred">
								<span>&nbsp;</span><span id="mobile_tip"></span>
							</li>
							<li class="fred">
								<span>&nbsp;</span>
								<input type="button" class="h_sqbtn" value="绑 定" id="binding"/>
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
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>



		<script>
	//手机号码绑定
	var timers = 180;
	var tipId;

	$(function() {
    	dqzt(3,'t04');
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
		$("#binding").click(function(){
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
				var param ={};
				param["paramMap.code"] = $("#code").val();
				param["paramMap.phone"] = $("#mobile").val();
				$.post("addBindingMobile.do",param,function(data){
					alert(data.msg);
					if(data.ret=="1"){
						window.location.href="securityCenterInit.do";
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
