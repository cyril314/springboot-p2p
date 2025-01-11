<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	<jsp:include page="../include/head.jsp"></jsp:include>
	<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<style>
		body{ margin:0; padding:0; background:#eef2f2;}
	</style>
</head>
<body>
<!--top start-->
<div class="lo_top">
  <div class="center">
    <div class="left"><a href="http://www.okleyi.com"><img src="{ctx}/static/images/logo.jpg" style="margin-top:11px;"/>
    </a></div>
    <div class="right">
      <ul>
        <li><a href="index.jsp">返回首页</a></li>
        <li><a href="callcenter.do">帮助中心</a></li>
        <li><a href="getMessageBytypeId.do?typeId=4">关于我们</a></li>
      </ul>
    </div>
  </div>`
</div>
<!--top end-->
<!--register start-->
<div class="register">
	<div class="left" style="position: relative;">
	 <form action="register.do" method="post"><s:hidden name="paramMap.param" id="param" />
	 <span id="s_userName"></span><!--账号-->
	 <span id="s_password"></span><!--登录密码-->
	 <span id="s_confirmPassword"></span><!--确认密码-->
	 <span id="s_email"></span><!--常用邮箱-->
	 <span id="s_refferee"></span><!--推荐人-->
	 <span id="s_code"></span><!--验证码-->
	  <table>
		<tr>
           <td align="right">账号：</td>
           <td><input type="text" name="paramMap.userName" id="userName" class="txtzc" /></td>
           <!--<td><span style="color: red" id="s_userName" class="formtips"></span></td>-->
        </tr>
        <tr>
          <td align="right">登录密码：</td>
          <td><input type="password" name="paramMap.password" id="password" class="txtzc" /></td>
          <!--<td><span style="color: red" id="s_password" class="formtips"></span></td>-->
        </tr>
        <tr>
          <td align="right">确认密码：</td>
          <td><input type="password" name="paramMap.confirmPassword" id="confirmPassword" class="txtzc" /></td>
          <!--<td><span style="color: red" id="s_confirmPassword" class="formtips"></span></td>-->
        </tr>
        <tr>
          <td align="right">常用邮箱：</td>
          <td><input type="text" name="paramMap.email" id="email" class="txtzc" /></td>
          <!--<td><span style="color: red" id="s_email" class="formtips"></span></td>-->
        </tr>

        <tr>
          <td align="right">推荐人：</td>
          <td><input type="text" name="paramMap.refferee" id="refferee" value="${paramMap.refferee }" class="txtzc" /></td>
          <!--<td><span id="s_refferee" class="formtips" style="color: red;"></span></td>-->
        </tr>
        <tr>
          <td align="right">验证码：</td>
          <td>
          	<input type="text" name="paramMap.code" id="code" class="txtyzm"/>
			<img src="admin/imageCode.do?pageId=userregister" title="点击更换验证码" id="codeNum" width="79" height="36" onclick="javascript:switchCode()" style="height: 33px; margin-top:10px; float: left;" /><a href="javascript:void()" onclick="switchCode()">换一换</a>
			<!--<br/><span style="color: red" id="s_code" class="formtips"></span>-->
 		  </td>
        </tr>
        <tr>
          <td></td>
          <td>
          	<input type="checkbox" style="width:12px; height:12px; vertical-align:-2px; margin-right:5px;" id="agre" checked="checked" />
			<span id="check">我已阅读并同意</span>
			<a style="cursor: pointer;" onclick="fff()">【条款信息】</a>
			<%--和<a style="cursor: pointer;" onclick="ffftip()">【隐私条款】</a>--%> 
 		  </td>
        </tr>
        <tr>
          <td></td>
          <td><input type="button" id="btn_register" class="btnre" value="立 即 注 册" onmouseover="this.className='btnrehover'" onmouseout="this.className='btnre'" /></td>
        </tr>
        <tr>
          <td></td>
          <td align="center">已有账号？<a href="login.do">去登录</a></td>
        </tr>
	  </table>
	 </form>
     </div>
     <div class="right"><img src="{ctx}/static/images/re_pic.png" /><br />
        <p>全国客服咨询热线：<span>400-6644-518</span>（工作日9:00~21:00）</p>
     </div>
<!-- <div class="C_footer_zc layout">版权所有 © 2013 深圳英迈思文化科技有限公司sp2p.demo.eimslab.cn    备案号：粤ICP备130333399号-6</div>-->
</div>
<div class="clear"></div>
<!--register end-->
<!-- 引用底部公共部分 -->
<!--bottom start-->
<div class="lo_bottom">
版权所有 © 2014 好乐易贷 All rights reserved
</div>
<!--bottom end-->
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript">
function fff(){
	jQuery.jBox.open("post:querytips.do", "使用条款", 600,400,{ buttons: { } });
}
function ffff(){
	ClosePop();
}
function ffftip(){
	 jQuery.jBox.open("post:querytip.do", "隐私条款", 600,400,{ buttons: { } });
}
function ffftips(){
	 jQuery.jBox.open("post:querytipss.do", "使用条款与隐私条款", 600,400,{ buttons: { } });
}
</script>
<script>
//初始化
function switchCode(){
	var timenow = new Date();
	$("#codeNum").attr("src","admin/imageCode.do?pageId=userregister&d="+timenow);
}
</script>
<!--<script>
//回车登录
document.onkeydown=function(e){
  if(!e)e=window.event;
  if((e.keyCode||e.which)==13){
    regg();
  }
}
</script>
--><script>
$(function(){
    //enter键焦点到下一个input
    $('input:text:first').focus(); //默认焦点在第一个input：text
	var $inp = $('input'); //取的input的元素集合
	//元素的keydown事件
	$inp.bind('keydown', function (e) { 
		var key = e.which; //取的当前按下的键值
		if (key == 13) { //如果等于13即为enter键
		e.preventDefault(); //阻止它的默认行为的发生
		var nxtIdx = $inp.index(this) + 1; //取的元素集合inp中的下一个元素索引 
		if(nxtIdx<$inp.length-2)
		{
		$(":input:eq(" + nxtIdx + ")").focus(); //定位焦点到集合的下一个元素
		//$(":input:text:eq(" + nxtIdx + ")").focus(); //定位焦点到集合的下一个type=text的元素上
		}else{
		  $("#btn_register").focus(); //否则注册按钮获取焦点
		  regg();//并执行判断注册时事件
		}
		} 
	}); 
    //样式选中
    $("#zh_hover").attr('class','nav_first');
	$('.tabmain').find('li').click(function(){
	$('.tabmain').find('li').removeClass('on');
	$(this).addClass('on');
	$('.lcmain_l').children('div').hide();
    $('.lcmain_l').children('div').eq($(this).index()).show();
	})
	})
	 $(document).ready(function(){
		 $("#check").click(function(){
			 //alert($("#agre").attr("checked"));
			 if($(agre).prop("checked")){
				 $("input[type='checkbox']").prop("checked", false);
			 }else{
				 $("input[type='checkbox']").prop("checked",true);
			 }
		 });
	//失去焦点
	$("form :input").blur(function(){ 
	//email
	if($(this).attr("id")=="email"){
		if(this.value==""){
			$("#s_email").attr("class", "formyx onError");  
	        //alert("请输入您的邮箱地址");
			$("#s_email").html("请输入邮箱地址");
		}else if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(this.value)){
			$("#s_email").attr("class", "formyx onError") 
			//alert("邮箱格式错误");
			$("#s_email").html("邮箱格式错误");
		}else{
			$("#s_email").html("");
			$("#s_email").attr("class", "");
			checkRegister('email');
		}
	}
	
	//userName
	if($(this).attr("id")=="userName"){
		if(this.value==""){
			$("#s_userName").attr("class", "formzh onError");
			//alert("请输入登录用户名");
	        $("#s_userName").html("请输入登录用户名");
		}else if(this.value.length<2){ 
			$("#s_userName").attr("class", "formzh onError");
			//alert("用户名长度为5-20个字符");
			$("#s_userName").html("用户名长度为2-20个字符"); 
	    // }else if(!/^[^@\/\'\\\"#$%&\^\*]+$/.test(this.value)){
		}else if(!/^[\u4E00-\u9FA5A-Za-z0-9_]+$/.test(this.value)){
	        $("#s_userName").attr("class", "formzh onError");
	        $("#s_userName").html("用户名不能含有特殊字符"); 
		} else{
			$("#s_userName").html(""); 
			checkRegister('userName');
			$("#s_userName").attr("class", "");
		}
	}
	//password
	if($(this).attr("id")=="password"){
		pwd=this.value; 
		if(this.value==""){
			$("#s_password").attr("class", "formmm onError");
			//alert("请设置您的密码");
	        $("#s_password").html("请设置您的密码");  
		}else if(this.value.length<6){ 
	      	$("#s_password").attr("class", "formmm onError");
			//alert("密码长度为6-20个字符");
			$("#s_password").html("密码长度为6-20个字符"); 
		}else{
			$("#s_password").html(""); 
			checkRegister('password');
	      	$("#s_password").attr("class", "");
		}
	}
	//confirmPassword
	if($(this).attr("id")=="confirmPassword"){
		if(this.value==""){
			$("#s_confirmPassword").attr("class", "formmm2 onError");
			//alert("请再次输入密码确认");
			$("#s_confirmPassword").html("请再次输入密码确认"); 
		}else if(this.value!=pwd){ 
			$("#s_confirmPassword").attr("class", "formmm2 onError");
			$("#s_confirmPassword").html("两次输入的密码不一致"); 
		}else{
			$("#s_confirmPassword").attr("class", "");
			$("#s_confirmPassword").html(""); 
		}
	}
	//验证码
	if($(this).attr("id")=="code"){
		if(this.value==""){
			$("#s_code").attr("class", "formyz onError");
			// alert("请输入验证码");
			$("#s_code").html("请输入验证码"); 
		}else{   
			$("#s_code").attr("class", "");
			$("#s_code").html(""); 
		} 
	}
      //----add by houli  推荐人 refferee
	 	 if($(this).attr("id")=="refferee"){
	     	if(this.value!=""){//如果推荐人不为null，则进行判断，判断理财经理是否有效
				$.post("queryValidRecommer.do",{refferee:this.value},function(data){
			          $("#s_refferee").html(data.msg);
			          $("#s_refferee").attr("class", "formtjr");
			     });
			} 
 		  }
	  });
	//提交
	});
    //验证数据
   	function checkRegister(str){
   	  var param = {};
   	 if(str == "userName"){
		param["paramMap.email"] = "";
		param["paramMap.userName"] = $("#userName").val();    		     	  
   	  }else if(str=="email"){
		param["paramMap.email"] = $("#email").val();
		param["paramMap.userName"] = "";
   	  }else{
   	    param["paramMap.email"] = "";
		param["paramMap.userName"] = "";
   	  }
   	  $.post("ajaxCheckRegister.do",param,function(data){
   	  if(data == 3 || data == 4){
   	     if(str=="userName"){
   	    	$("#s_userName").attr("class", "formzh onError");
   	     	$("#s_userName").html("该用户已存在");
   	     }else{
   	    	$("#s_email").attr("class", "formyx onError");
   	      	$("#s_email").html("该邮箱已注册");
   	     }
   	  }
   	  });
   	}
</script>
<script>
$("#btn_register").click(function(){
	regg();
});
</script>
<script>
	function regg(){
		var falg = true;
        if(falg){
           falg = false;
           var errornum=$("form .onError").length;
        if($("#email").val()==""){
           $("#s_email").attr("class","formyx onError");
           $("#s_email").html("请输入您的邮箱地址");
           falg = true;
           return false;
        }else if($("#userName").val()==""){
          $("#s_userName").attr("class","formzh onError");
          $("#s_userName").html("请输入登录用户名");
          falg = true;
          return false;
        }else if($("#password").val()==""){
        	$("#s_password").attr("class", "formmm onError");
        	$("#s_password").html("请设置您的密码"); 
        	falg = true;
         	return false;
        }else if($("#confirmPassword").val()==""){
        	$("#s_confirmPassword").attr("class", "formmm2 onError");
        	$("#s_confirmPassword").html("请再次输入密码确认"); 
        	falg = true;
        	return false;
        }else if($("#code").val()==""){
        	$("#s_code").attr("class", "formyz onError");
        	$("#s_code").html("请输入验证码"); 
        	falg = true;
        	return false;
        }else if(errornum > 0){   
        	alert('请正确填写注册信息');
        	falg = true;
            return false;
        }else{
        	if(!$("#agre").attr("checked")){
        		alert("请勾选我已阅读并同意《条款信息》");
        		falg = true;	
        		return false;
        	}
        }
        //$('#btn_register').attr('value','注册中...');
        var param = {};
        param["paramMap.pageId"] = "userregister";
        param["paramMap.email"] = $("#email").val();
        param["paramMap.userName"] = $("#userName").val();
        param["paramMap.password"] = $("#password").val();
        param["paramMap.confirmPassword"] = $("#confirmPassword").val();
        param["paramMap.refferee"] = $("#refferee").val();
        param["paramMap.code"] = $("#code").val();
        param["paramMap.param"] = $("#param").val();
        $.post("register.do",param,function(data){
        	if(data.mailAddress=='0'){
        		$("#s_code").attr("class", "formyz onError");
            	$("#s_code").html("验证码输入有误，请重新输入");
            	//$('#btn_register').attr('value','免费注册');
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='1'){
            	//$('#btn_register').attr('value','免费注册');
            	$("#s_confirmPassword").attr("class", "formmm2 onError");
            	$("#s_confirmPassword").html("两次输入的密码不一致"); 
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='2'){
            	//$('#btn_register').attr('value','免费注册');
            	$("#s_userName").attr("class","formzh onError");
            	$("#s_userName").html("该用户已存在");
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='3'){
            	//$('#btn_register').attr('value','免费注册');
            	$("#s_email").attr("class","formyx onError");
            	$("#s_email").html("该邮箱已注册");
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='4'){
            	alert("注册失败！");
            	// $('#btn_register').attr('value','免费注册');
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='5'){
				// $('#btn_register').attr('value','免费注册');
            	falg = true;
           		alert("推荐人填写错误！");
        	}else if(data.mailAddress=='12'){
				// $('#btn_register').attr('value','免费注册');
            	falg = true;
            	$("#s_email").attr("class","formyx onError");
            	$("#s_email").html("请输入您的邮箱地址");
            	switchCode();
			}else if(data.mailAddress=='13'){
				//  $('#btn_register').attr('value','免费注册');
            	falg = true;
            	$("#s_userName").attr("class","formzh onError");
            	$("#s_userName").html("请输入登录用户名");
            	switchCode();
			}else if(data.mailAddress=='14'){
				// $('#btn_register').attr('value','免费注册');
				$("#s_password").attr("class", "formmm onError");
            	$("#s_password").html("请设置您的密码"); 
            	falg = true;
            	switchCode();
			}else if(data.mailAddress=='15'){
				//   $('#btn_register').attr('value','免费注册');
				$("#s_confirmPassword").attr("class", "formmm2 onError");
            	$("#s_confirmPassword").html("请再次输入密码确认"); 
            	falg = true;
            	switchCode();
        	}else if(data.mailAddress=='16'){
				//  $('#btn_register').attr('value','免费注册');
            	falg = true;
            	alert("注册失败");
            	switchCode();
			}else if(data.mailAddress=='18'){
				//  $('#btn_register').attr('value','免费注册');
				$("#s_userName").attr("class","formzh onError");
            	$("#s_userName").html("用户名长度为2-20个字符"); 
            	falg = true;
            	switchCode();
			}else if(data.mailAddress=='20'){
				//  $('#btn_register').attr('value','免费注册');
				$("#s_userName").attr("class","formzh onError");
				$("#s_userName").html("用户名不能含有特殊字符"); 
            	falg = true;
            	switchCode();
			}else if(data.mailAddress=='21'){
				// $('#btn_register').attr('value','免费注册');
				$("#s_userName").attr("class","formzh onError");
            	$("#s_userName").html("用户名第一个字符不能是下划线"); 
            	falg = true;
            	switchCode();
			}else if(data.mailAddress=='123'){//邮箱发送失败
				alert("邮件发送失败");
				//   $('#btn_register').attr('value','免费注册');
				falg = true;
            	switchCode();
			}else if(data.mailAddress=='99'){
				//测试--取消邮箱验证 
				alert("注册成功");
				window.location.href="login.do";
			}else{
            	window.location.href="msgtip.do";
			}
         });
       }
	}
</script>
</body>
</html>