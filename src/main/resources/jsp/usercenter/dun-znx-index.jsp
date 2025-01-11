<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>

		<div class="ny_main1 clearfix">
			<div class="myhome_main clearfix">
				<%@include file="../include/dun-left.jsp"%>
				<!--右 开始-->
				<div class="myhome_r clearfix">
					<!--标题 开始-->
					<div class="ny_tit tab_meun">
						<ul>
							<li class="on" id="sysMails">
								系统消息
							</li>
						</ul>
					</div>
					<!--标题 结束-->
					<!--内容 开始-->
					<span id="showContent"></span>
					<!--内容 结束-->
				</div>
				<p class="myhome_r clearfix tips">
					<span style="font-size: 14px; color: red; padding: 0 50px 0 0">通知设置</span>
					<span><input type="checkbox" class="check" id="mail"
							<c:if test="#request.noticeMap.mailNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(1)">站内信通知</em></span>
					<span style="padding: 0 30px"><input type="checkbox"
							class="check" id="email"
							<c:if test="#request.noticeMap.emailNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(2)">邮箱通知</em></span>
					<span><input type="checkbox" class="check" id="note"
							<c:if test="#request.noticeMap.noteNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(3)">手机短信通知</em></span>
					<span style="margin-left: 30px;"><a
						href="javascript:void(0);" class="myhome_btn" id="btn_save">确
							认</a>
					</span>
				</p>
				<p class="myhome_r clearfix tips">
					注：尊敬的用户，您在好乐易贷网的相关操作， 好乐易贷网会用以上三种方式通知您，请您选择适合自己的通知方式！
					(系统默认以站内信通知)短信通知每条0.1元。
				</p>
				<!--右 结束-->
			</div>
		</div>

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>


		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
				<script>
					$(document).keydown(function(event){ 
						if(event.keyCode==27){
							$("#pop2").hide();
						}
					}); 
					$(function() {
						dqzt(4,'t04');
						sysMailsList();
						$("#btn_save").click(function() {
							//站内信
								param["paramMap.mail"] = $("#mail").attr("checked");
								//邮件
								param["paramMap.email"] = $("#email").attr("checked");
								//短信
								param["paramMap.note"] = $("#note").attr("checked");
								$.post("addNotesSetting.do", param, function(data) {
									if (data == 1) {
										alert("通知设置失败");
										window.location.reload();
									} else if (data == 3) {
										alert("未绑定邮箱,通知设置失败");
									} else {
										alert("通知设置成功");
									}
								});
							});
						$("#sysMails").click(function() {
							$("#sysMails").attr("class", "on");
							$("#receiveMails").attr("class", "");
							$("#sendMails").attr("class", "");
							sysMailsList();
						});
						$("#receiveMails").click(function() {
							$("#sysMails").removeClass();
							$("#receiveMails").addClass("on");
							$("#sendMails").removeClass();
							receiveMailsList();
						});
						$("#sendMails").click(function() {
							$("#sysMails").removeClass();
							$("#receiveMails").removeClass();
							$("#sendMails").addClass("on");
							sendMailsList();
						});
						$("#sendMail").click(function(){
							$("#pop2").show();
						});
						
						 $("input[name='sendText']").blur(function(){
					     	if($("#receiver").val()==""){
						       $("#s_receiver").html("*收件人不能为空");
						       $("#btnSave").attr("disabled",false);
						       return;
						     }else{
						     	$("#s_receiver").html("");
						     }
						     if($("#title_s").val()==""){
						       $("#s_title").html("*标题不能为空");
						       $("#btnSave").attr("disabled",false);
						       return;
						     }else{
						     	$("#s_title").html("");
						     }
						     if($("#content").val()==""){
						       $("#s_content").html("*内容不能为空");
						       $("#btnSave").attr("disabled",false);
						       return;
						     }else{
						     	$("#s_content").html("");
						     }
						     if($("#code").val()==""){
						       $("#s_code").html("*验证码不能为空");
						       $("#btnSave").attr("disabled",false);
						       return;
						     }else{
						     	$("#s_code").html("");
						     }
						 });
						 $("input[name='sendText']").keydown(function(event){
					     	if(event.keyCode==13){
					     		addMail();
					     	}
						 });
					});
					function sysMailsList() {
						$.shovePost("querySysMailsInit.do", null, mainCallback);
					}
					function receiveMailsList(){
						$.shovePost("queryReceiveMailsInit.do", null, mainCallback);
					}
					function sendMailsList(){
						$.shovePost("querySendMailsInit.do", null, mainCallback);
					}
					function mainCallback(data) {
						$("#showContent").html(data);
					}
					
					function closeMsg(){
						$("#pop2").hide();
					}
					
		     function addMail(){
		        $("#btnSave").attr("disabled",true);
		     	param["paramMap.receiver"] = $("#receiver").val();
		     	param["paramMap.title"] = $("#title_s").val();
		     	param["paramMap.content"] = $("#content").val();
		     	param["paramMap.code"] = $("#code").val();
		     	param["paramMap.pageId"] = "userlogin";
		     	if($("#receiver").val()==""){
			       $("#s_receiver").html("*收件人不能为空");
			       $("#btnSave").attr("disabled",false);
			       return;
			     }
			     if($("#title_s").val()==""){
			       $("#s_title").html("*标题不能为空");
			       $("#btnSave").attr("disabled",false);
			       return;
			     }
			     if($("#content").val()==""){
			       $("#s_content").html("*内容不能为空");
			       $("#btnSave").attr("disabled",false);
			       return;
			     }
			     if($("#code").val()==""){
			       $("#s_code").html("*验证码不能为空");
			       $("#btnSave").attr("disabled",false);
			       return;
			     }
			     //有错误提示的时候不提交
			     if($("#s_receiver").text()!="" || $("#s_title").text()!="" ||$("#s_content").text()!=""
			       ||$("#s_code").text()!=""){
			          return;
			       }
		     	$.shovePost("addMail.do",param,function(data){
		     	   if(data == 5){
		     	     $("#s_code").html("验证码错误");
		     	     $("#btnSave").attr("disabled",false);
		     	     return;
		     	   }else if(data == 1){
		     	     alert("邮件发送失败，请重新发送");
		     	     $("#btnSave").attr("disabled",false);
		     	     return;
		     	   }else if(data == 8){
		     	     alert("你是黑名单用户不能发生站内信");
		     	     $("#btnSave").attr("disabled",false);
		     	     return;
		     	   }else if(data == 9){
		     	     alert("不能发送站内信给自己");
		     	     $("#btnSave").attr("disabled",false);
		     	     return;
		     	   }else if(data == 12){
		     	   	 alert("不存在该用户！");
		     	     $("#btnSave").attr("disabled",false);
		     	     return;	
		     	   }else{
		     	   	 
		     	   	 alert("邮件发送成功");
		     	   	 $("#title_s").attr("value","");
		     	   	 $("#code").attr("value","");
		     	   	 $("#receiver").attr("value","");
		     	   	 $("#content").attr("value","");
		     	   	 $("#btnSave").attr("disabled",false);
		     	   	 switchCode();	//更换验证码	   	 
		     	   }
		     	});
		     }
			function switchCode(){
				var timenow = new Date();
				$("#codeNum").attr("src","admin/imageCode.do?pageId=userlogin&d="+timenow);
			}
			function check(id){
				if(id==1){
					 if($("#mail").prop("checked")){
						 $("#mail").prop("checked", false);
					 }else{
						 $("#mail").prop("checked",true);
					 }
				}else if(id==2){
					 if($("#email").prop("checked")){
						 $("#email").prop("checked", false);
					 }else{
						 $("#email").prop("checked",true);
					 }
				}else if(id==3){
					 if($("#note").prop("checked")){
						 $("#note").prop("checked", false);
					 }else{
						 $("#note").prop("checked",true);
					 }
				}
			}
		</script>
	</body>
</html>
