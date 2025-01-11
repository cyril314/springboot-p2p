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
				<div class="acc_all">
  <div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a> > 通知设置</div>
  <div class="acc_top"> &nbsp;&nbsp;通知设置：
  <input type="checkbox" class="check" id="mail"
							<c:if test="#request.noticeMap.mailNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(1)">站内信通知</em>
    
    <input type="checkbox"
							class="check" id="email"
							<c:if test="#request.noticeMap.emailNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(2)">邮箱通知</em>
    <input type="checkbox" class="check" id="note"
							<c:if test="#request.noticeMap.noteNoticeEnable==2">checked="checked"</c:if> />
						<em onclick="check(3)">手机短信通知</em>
    <input type="button" value="确认" class="btnsure" onmouseover="this.className='btnsurehover'" id="btn_save" onmouseout="this.className='btnsure'" />
    <br />
    <span>&nbsp;&nbsp;注：尊敬的用户，您在好乐易贷网的相关操作， 好乐易贷网会用以上三种方式通知您，请您选择适合自己的通知方式！	(系统默认以站内信通知)短信通知每条0.1元。</span> </div>
    <div id="acc_tabs">
      <div class="title"> 
          <a href="#" id="sysMails" class="on">系统消息</a> 
          <a href="#" id="receiveMails" >收件箱</a> 
          <a href="#" id="sendMails" >发件箱</a>
          <input type="button" class="btnwrite" onmouseover="this.className='btnwritehover'" id="sendMail" onmouseout="this.className='btnwrite'" onclick="show('drag')" />
      </div>
      <div id="showContent" class="tabcontent">
        
      </div>
          
    </div>
</div>

</div>
				
</div>
<jsp:include page="wdzh-znx-sendMail.jsp"></jsp:include> 
<div id="fade"></div>		

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>

		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript"src="${ctx}/static/js/popup.js"></script>
				<script>
					$(document).keydown(function(event){ 
						if(event.keyCode==27){
							$("#pop2").hide();
							$(".tanchu").hide();
						}
					}); 
					$(function() {
					    //发送信息弹出层
						var oDrag = document.getElementById("drag");
						var oTitle = document.getElementById("title");
					
						drag(oDrag, oTitle);
						oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
						oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
						//发送信息弹出层
						dqzt(4,'t04');
						sysMailsList();
						tab();
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
							tab();
						});
						$("#receiveMails").click(function() {
							$("#sysMails").removeClass();
							$("#receiveMails").addClass("on");
							$("#sendMails").removeClass();
							receiveMailsList();
							tab();
						});
						$("#sendMails").click(function() {
							$("#sysMails").removeClass();
							$("#receiveMails").removeClass();
							$("#sendMails").addClass("on");
							sendMailsList();
							tab();
						});
						$("#sendMail").click(function(){
							$("#pop2").show();
							$(".tanchu").show();
							tab();
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
						$(".tanchu").hide();
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
			
			<!--表格隔行换色 js--> 
function tab() {
   $("#tab tbody tr:odd").addClass("t2");
   $("#tab tbody tr:even").addClass("t1");
}
		</script>
	</body>
</html>
