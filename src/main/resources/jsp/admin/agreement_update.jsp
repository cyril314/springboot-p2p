<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>资料下载-添加</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<link href="${ctx}/static/css/admin/admin_custom_css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popup.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		
		<script>
		  var editor_content;
			KindEditor.ready(function(K) {
				editor_content = K.create('textarea[name="paramMap.content"]', {
					cssPath : '${ctx}/static/plugins/kindeditor/plugins/code/prettify.css',
					uploadJson : 'kindEditorUpload.do',
					fileManagerJson : 'kindEditorManager.do',
					allowFileManager : true
				});
			});
			
		  $(function(){
		     
		     if(${request.message!=null}){
		        alert('${request.message}');
		     }
		      
		      //提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#tr_content").val(editor_content.html());
					$("#addTeam").submit();
					return false;
				});
				
			
		  });
		 
		
			
	
		
			
		</script>
		
	</head>
	<body>
		<form id="addTeam" name="addTeam" action="updateAgreement.do" method="post">
		    <s:hidden name="paramMap.agreementType"></s:hidden>
		    <s:hidden name="paramMap.provisionType"></s:hidden>
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="150px" height="28" <c:if test="#request.type==1 || #request.type==''">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else>
									>
									<a href="AgreementInit.do?agreementType=2&provisionType=1&type=1">债权转让使用条款</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="120" <c:if test="#request.type==2">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else> >
									<a href="AgreementInit.do?agreementType=2&provisionType=2&type=2">债权转让隐私条款</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="120" height="28"<c:if test="#request.type==3">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else>
									>
									<a href="AgreementInit.do?agreementType=1&provisionType=1&type=3">借款使用条款</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="120" <c:if test="#request.type==4">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else>  >
									<a href="AgreementInit.do?agreementType=1&provisionType=2&type=4">借款隐私条款</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="120" height="28" <c:if test="#request.type==5">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else>
									>
									<a href="AgreementInit.do?agreementType=4&provisionType=1&type=5">本金保障使用条款</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="120" <c:if test="#request.type==6">class="main_alll_h2"</c:if><s:else>class="xxk_all_a"</s:else>   >
									<a href="AgreementInit.do?agreementType=4&provisionType=2&type=6">本金保障隐私条款</a>
								</td>
							
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					 
					<div style="width: auto; background-color: #FFF; padding: 10px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									标题：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_title" name="paramMap.title"
										cssClass="in_text_250" theme="simple" value="%{paramMap.title}"></s:textfield>
									<span class="require-field">*<s:fielderror fieldName="paramMap['title']"></s:fielderror></span>
								</td>
							</tr>
							
							
							
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									内容：
								</td>
								<td align="left" class="f66">
									<textarea id="tr_content" name="paramMap.content" rows="20" class="textareash"
											style="width: 670px; padding:5px;">
										<c:out value="paramMap.content"/>
									</textarea>
									<span class="require-field"><s:fielderror fieldName="paramMap['content']"></s:fielderror></span>
								</td>
							</tr>
							

							<tr>
								<td height="36" align="right" class="blue12">
									<s:hidden name="action"></s:hidden>
									<input name="type" value="${type}"  type="hidden"/>
									&nbsp;
								</td>
								<td>
									<button id="btn_save"
										style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; border: 0; height: 26px"></button>
									&nbsp;
									<button type="reset"
										style="background-image: url('static/images/admin/btn_chongtian.jpg'); width: 70px; height: 26px; border: 0px"></button>
									&nbsp; &nbsp;
									<span class="require-field"><s:fielderror fieldName="actionMsg" theme="simple"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<img id="img" src="${ctx}/static/images/NoImg.GIF"
										style="display: none; width: 100px; height: 100px;" />
								</td>
							</tr>
						</table>
						<br />
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
