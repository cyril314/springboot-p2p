<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好乐易贷-最专注安全和服务的网络金融信息服务平台</title>
<link rel="stylesheet" href="${ctx}/static/css/index.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<style type="text/css">
body{ margin:0; padding:0; background:#eef2f2;}
</style>
</head>
<body>
<!--top start-->
<div class="lo_top">
  <div class="center">
    <div class="left"><a href="http://www.okleyi.com"><img src="{ctx}/static/images/logo.jpg" style="margin-top:11px;"/></a></div>
    <div class="right">
      <ul></ul>
    </div>
  </div>
</div>
<!--top end-->
<!--center start-->
<div class="center mt50">
  <div class="left"><img src="{ctx}/static/images/lo_pic.png" /></div>
  <div class="lo_login right">
    <div class="lo_login_top">欢迎登陆好乐易贷！</div>
    <div class="login-middle">
       <form action="dliLogining.do" method="post">
       <span id="s_email"></span>
       <span id="s_password"></span>
       <span id="s_code"></span>	  
	    <table>
	      <tr>
	        <td colspan="2">
	        	<input type="text" class="txtuser" name="paramMap.email" id="email" value="手机号、邮箱或用户名" onfocus="if(value=='手机号、邮箱或用户名') {this.style.color='#000';value=''}" onblur="if (value=='') {this.style.color='#CCC';value='手机号、邮箱或用户名'}"/>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="2">
	        	<input type="text" class="txtpwd" name="paramMap.password" id="password"  value="平台登录密码" style="color:#CCC" />
	        </td>
	      </tr>
	      <tr>
			<td colspan="2">
				<input type="text" class="txtuser" name="paramMap.dluser" id="dluser" value="操盘手账户" onfocus="if(value=='操盘手账户') {this.style.color='#000';value=''}" onblur="if (value=='') {this.style.color='#CCC';value='操盘手账户'}"/>
	        </td>     
	      </tr>
	      <tr>
			<td colspan="2">
				<input type="text" class="txtpwd" name="paramMap.dlpassword" id="dlpassword"  value="操盘手登录密码" style="color:#CCC" />
	        </td>     
	      </tr>
	      <tr>
	      	<td colspan="2">
	      		<input type="button" class="btnlogin" id="btn_login" value="立 即 登 录" onmouseover="this.className='btnloginhover'" onmouseout="this.className='btnlogin'" />
	      	</td>
	      </tr>
	    </table>
      </form>
    </div>
  </div>
</div>
<div class="clear"></div>
<!--center end-->
<!--bottom start-->
<div class="lo_bottom">
版权所有 © 2014 好乐易贷 All rights reserved
</div>
<!--bottom end-->
<script>
	$(function(){
		(4);
		$("#dlpassword").bind('keyup', function(event){
			if (event.keyCode=="13"){
				login();  
			}
		});
		$("#dluser").bind('keyup', function(event){
			if (event.keyCode=="13"){
				return;  
			}
		});	
		$("#email").bind('keyup', function(event){
			if (event.keyCode=="13"){
				return;  
			}
		});	
		$("#password").bind('keyup', function(event){
			if (event.keyCode=="13"){
				return;   
			}
		});	
		//登录密码背景颜色	
	　　var input=document.getElementById('password');
	　　input.onfocus=function(){
	　　　　if(this.value=='平台登录密码'){
				this.value='';
				this.type='password';
				this.style.color="#000";
	　　　　};
	　　};
		input.onblur=function(){
	　　　　if(!this.value){
				this.type = 'text';
				this.value = '平台登录密码';
				this.style.color="#CCC";
	　　　　};
	　　};
	var inputd=document.getElementById('dlpassword');
	　　inputd.onfocus=function(){
	　　　　if(this.value=='操盘手登录密码'){
				this.value='';
				this.type='password';
				this.style.color="#000";
	　　　　};
	　　};
		inputd.onblur=function(){
	　　　　if(!this.value){
				this.type = 'text';
				this.value = '操盘手登录密码';
				this.style.color="#CCC";
	　　　　};
	　　};　
	})
</script>
<script>
	function login(){
		$(this).attr('disabled',true);
		if($("#email").val()==""){   
			$("#s_email").attr("class", "formuser onError");
			$("#s_email").html("*请输用户名或邮箱地址");
		}
        if($("#password").val()==""){   
			$("#s_password").attr("class", "formpwd onError");
			$("#s_password").html("*请输入密码");   
			// $("#retake_password").hide();
		}  
		//$('#btn_login').attr('value','登录中...');
        var param = {};
		param["paramMap.pageId"] = "userlogin";
		param["paramMap.email"] = $("#email").val();
		param["paramMap.password"] = $("#password").val();
		param["paramMap.dluser"] = $("#dluser").val();
		param["paramMap.dlpassword"] = $("#dlpassword").val();		
        $.post("dliLogining.do",param,function(data){
      		if(data == 1){
      	        var afterLoginUrl='${session.afterLoginUrl}';
      	        if(afterLoginUrl != ''){
				   window.location.href='${session.afterLoginUrl}';
      	        }else{
				   window.location.href='dliFinance.do';
      	        }
      	        var checkday = $('#checkday').val();
      	        if(checkday > 0){
      	          var email = $('#email').val();
      	          addCookie('email',email,checkday);
      	        }
			}else if (data == 2) {
			     //$('#btn_login').attr('value','登录');
				$("#s_code").attr("class", "formcod onError");
                $("#s_code").html("*操盘手账户错误！"); 
                 $("#btn_login").attr('disabled',false); 
			} else if (data == 3) {
			 //$('#btn_login').attr('value','登录');
				$("#s_email").attr("class", "formuser onError");
                $("#s_email").html("*用户名或密码错误！"); 
                 $("#btn_login").attr('disabled',false); 
			} else if (data == 4) {
			// $('#btn_login').attr('value','登录');
				$("#s_email").attr("class", "formuser onError");
                $("#s_email").html("*该用户已被禁用！"); 
                 $("#btn_login").attr('disabled',false); 
			}
       });
	}
		
	$("#btn_login").click(function(){
		login();  
	});
		
	function addCookie(objName,objValue,days){
		var str = objName + "=" + escape(objValue);
		if(days > 0){
			var date = new Date();
			var ms = days*24*3600*1000;
			date.setTime(date.getTime() + ms);
			str += "; expires=" + date.toGMTString();
		}
		document.cookie = str;
	}
	
	function getCookie(){
		//取出cookies
		var arrStr = document.cookie.split("; ");
		for(var i = 0;i < arrStr.length;i ++){
			var temp = arrStr[i].split("=");
				
			if(temp[0] == 'email'){
					var userName=unescape(temp[1]);
					$('#email').val(userName);
			}
		}
	}
</script>
</body>
</html>
