<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${ctx}/static/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script>
$(function(){
	$('.tabmain').find('li').click(function(){
	$('.tabmain').find('li').removeClass('on');
	$(this).addClass('on');
	$('.lcmain_l').children('div').hide();
    $('.lcmain_l').children('div').eq($(this).index()).show();
	})
	})
</script>
<script>
  $(function(){
  
    $("#send_password").click(function(){
       var param = {};
       param["paramMap.email"] = $("#email").val();
       //alert(param["paramMap.email"]);
       $.post("forgetpasswordsenEml.do",param,function(data){
        if(data.mailAddress=='0'){
          $("#s_email").html("*邮箱不能为空");
        }else if(data.mailAddress=='1'){
          $("#s_email").html("*该邮箱不存在");
        }else{
            $("#tabClass").attr("class","hide");
            $("#ok").attr("class","");
          $("#ok").html("*邮件已经发送到你的邮箱,请<a href=http://"+data.mailAddress+" style='color: green;font-size: 25px'>登录</a>到你的邮箱验证");
        }
       });
    });
  
  
  });


</script>
   <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="clear" ></div>
		<div class="account">
			<div class="acc_content">
            	<div>
            	<div class="pertop"><ul><li><a style="background: #1ca4ad;color: #FFF;">找回密码</a></li></ul></div>
            	<div class="percontent">
            		<span id="ok" class="hide" style="font-size: 20px;"></span>
            		<table style="border: none; margin-top: 50px;" cellpadding="0" cellspacing="0" id="tabClass">
           				 <tr>						
						    <td align="right" width="150">您注册时用的Email：</td>
						    <td width="210"><input type="text" class="txtmail" id="email"/></td>
						    <td><span style="color: red;" id="s_email" class="formtips">${msg }</span></td>
						  </tr>
						  <tr>
						    <td align="right">&nbsp;</td>
						    <td colspan="2">
						    	<input type="button" value="发送" class="update" id="send_password"  style="margin-top: 20px;"/>
						    </td>
						  </tr>
           			</table>
            	 </div>     
              </div>
      	
            </div>
        </div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>

<script>
$(function(){
    //样式选中
     $("#zh_hover").attr('class','nav_first');
	 $("#zh_hover div").removeClass('none');
});
</script>
</body>
</html>
