<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>借款产品参数</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popup.js"></script>
		
	

		
	</head>
	<body>
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td  width="20%" height="28"  class="xxk_all_a">
									<a href="emailAndMessageindex.do">邮件设置</a>
								</td>
								<td width="2px;"></td>
								<td width="20%"  class="main_alll_h2">
									<a href="findSMSList.do">短信接口设置</a>
								</td>
								<td width="80">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					<div id="showcontent" style="width: auto; background-color: #FFF; padding: 10px;">
						<!-- 内容显示位置 -->
						
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
						 <tr>
						   <td><h3></h3></td>
						   <td><h3></h3></td>
						 </tr>
						<tr>
						
						
						<s:iterator value="listSMS" var="bean">
						  <td>
						<form action="updateSMS.do" method="post" id="updateSMS">
						   <input type="hidden" name="paramMap.id" value="${bean.id}"/>
						<table  border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td  align="right"
									class="blue12">
									是否开启：
								</td>
								<td align="left" class="f66">
								 是:<input type="radio" name="paramMap.status_${bean.id}" value="1"
								 	<c:if test='#bean.status==1'>checked="checked"</c:if>
											<s:else></s:else>
								 />&nbsp;&nbsp;
								 否：<input type="radio" name="paramMap.status_${bean.id}" value="2"
								 	<c:if test='#bean.status==2'>checked="checked"</c:if>
											<s:else></s:else>
								 />
									<span class="require-field">*</span>
								</td>
							</tr>	
							<tr>
                                 <td  align="right"
									class="blue12">
									账号：
								</td>
								<td align="left" class="f66">			
									<input id="general_${bean.id}" style="width: 150px;" type="text" class="in_text_250" name="paramMap.UserID" value="${bean.UserID}"/>
									<span class="require-field">*<s:fielderror fieldName="paramMap['UserID']"></s:fielderror></span>
								</td> 							
							
							</tr>
							<tr>
							       <td  align="right"
									class="blue12">
									子账号：
								</td>
								<td align="left" class="f66">
										<input id="general_${bean.id}" style="width: 150px;" type="text" class="in_text_250" name="paramMap.Account" value="${bean.Account}"/>
									<span class="require-field">*<s:fielderror fieldName="paramMap['Account']"></s:fielderror></span>
								</td> 	
							
							</tr>
							
								<tr>
							       <td align="right"
									class="blue12">
									 密码：
								</td>
								<td align="left" class="f66">
										<input id="general_${bean.id}" style="width: 150px;" type="password" class="in_text_250" name="paramMap.Password" value="${bean.Password}"/>
									<span class="require-field">*<s:fielderror fieldName="paramMap['Password']"></s:fielderror></span>
								</td> 	
							
							</tr>
							
								
							
							<tr>
							       <td  align="right"
									class="blue12">
									短信接口地址：
								</td>
								<td align="left" class="f66">
									<textarea rows="5" cols="30" name="paramMap.url">${bean.url}</textarea>
									<span class="require-field">*<s:fielderror fieldName="paramMap['url']"></s:fielderror></span>
								</td> 	
							
							</tr>
							
							
							<tr>
								<td height="36" align="right" class="blue12">
									<s:hidden name="action"></s:hidden>
									&nbsp;
								</td>
								<td>
									
									<input type="button"  value=" "  id="btn_save"
										style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; height: 26px; border: 0px"/>
									&nbsp; &nbsp;
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<img id="img" src="${ctx}/static/images/NoImg.GIF"
										style="display: none; width: 100px; height: 100px;" />
								</td>
							</tr>
						</table>
						</form>
						 </td>
						</s:iterator>
						  </tr>
						</table>
						
						
						<br />
					</div>
				</div>
			</div>
		<script>
			
		  $(function(){
		     if(${message!=null}){
		       alert('${request.message}');
		      }
		      
		      //提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#updateSMS").submit();
					return false;
				});
		  });
		</script>
	</body>
</html>
