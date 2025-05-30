<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>用户管理-用户信息管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		<script type="text/javascript">
      
			
			function check(Object){  
			$(Object).hide();
			var pattern  = /^\d+(\.\d+)?$/;
			var flag = pattern.test($("#qq").val());
			 if(flag==false)
			  {
			   alert("请填写正确的QQ号码");
			   $(Object).show();
			   return false;
			   }else{
			  param['paramMap.userId'] = $("#userId").val();
			  param['paramMap.qq'] = $("#qq").val();
			  $.shovePost("updateUserqq.do",param,function(data){
			    var callBack = data.msg;
	      if(callBack == undefined || callBack == ''){
		                 $('#right').html(data);
		                 $(this).show();
		                 }
			     if(data.msg == 1){
			     	alert("操作成功");
			     	var para1 = {};
			     	window.parent.initListInfo(para1);
                    window.parent.close();//关闭弹出窗口
			        return;
			     }else{
			       	alert(data.msg);
			        return;
			     }
			  });
			  }
			}
						
		</script>
	</head>
	<body>
		<div id="right"
			style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<strong>用户信息</strong>
					<div
						style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
						
						<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
							width="100%" border="0">
							
							<tbody>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
										用户名：&nbsp;&nbsp;
										${username }
										&nbsp;&nbsp;
										<s:hidden id="wid" name="#request.wid" />
										<s:hidden id="userId" name="#request.userId" />
								  </td>
								  <td>
								    &nbsp;
								  </td>
								</tr>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
										真实姓名：&nbsp;&nbsp;
										${realName }
										&nbsp;&nbsp;
								  </td>
								  <td>
								    &nbsp;
								  </td>
								</tr>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
									网站积分：${rating }
									</td>
									<td class="f66" align="left" width="50%" height="36px">
									信用积分：${creditrating }
									</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
									注册日期：${createTime }
									</td>
									<td class="f66" align="left" width="50%" height="36px">
								          最后登录IP：${lastIP }
									</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
									邮箱：${email }
									</td>
									<td>
									&nbsp;
									</td>
								</tr>
								<tr>
									<td class="f66" align="left" width="30%" height="36px">
									绑定手机号码：${cellPhone }
									</td>
									<td class="f66" align="left" width="50%" height="36px">
									&nbsp;
									</td>
								</tr>
								
							</tbody>
						</table>
						
					</div>
					<div
					 style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
							width="100%" border="0">
					
					
					<tr>
					   <td class="f66" align="left" width="80%" height="36px">
					      QQ账号：
					      <input style="width:100px;" id="qq"  value="${qq }" />
					   &nbsp;&nbsp;
					   
					   </td>
					</tr>
					</table>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 <button id="btnSave" style="background-image: url('static/images/admin/btn_queding.jpg');width: 70px;border: 0;height: 26px" onclick="check(this);"></button>
					</div>
				</div>
			</div>
			</div>
	</body>
</html>
