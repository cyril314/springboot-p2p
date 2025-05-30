<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>帮助中心-内容维护-修改</title>
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
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/plugins/code/prettify.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/lang/zh_CN.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		
		<script type="text/javascript">
			var editor_content;
			KindEditor.ready(function(K) {
				editor_content = K.create('textarea[name="paramMap.anwer"]', {
					cssPath : '${ctx}/static/plugins/kindeditor/plugins/code/prettify.css',
					uploadJson : 'kindEditorUpload.do',
					fileManagerJson : '../kindEditorManager.do',
					allowFileManager : true
				});
			});
			
			$(function(){
				//提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#tr_content").val(editor_content.html());
					$("#updateHelpManager").submit();
					return false;
				});
			});
			
		</script>
		
	</head>
	<body>
		<!--  <form id="updateHelp" name="updateHelp" action="updateHelp.do" method="post"> -->
		<form id="updateHelpManager" name="updateHelpManager" action="updateHelpManager.do" method="post">
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28" class="xxk_all_a">
									<a href="queryHelpCategoryListPage.do">帮助中心列表</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="100" class="main_alll_h2">
									<a href="javascript:void(0);">修改内容</a>
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
							<s:hidden name="paramMap.questionId" />
									标题：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_title" name="paramMap.question"
										cssClass="in_text_250" theme="simple"></s:textfield>
									<span class="require-field">*<s:fielderror fieldName="paramMap['question']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									帮助类型：
								</td>
								<td align="left" class="f66">
									<s:select list="types" theme="simple" name="paramMap.typeId" listKey="id" listValue="helpDescribe"  />
									<span class="require-field">*<s:fielderror fieldName="paramMap['helpDescribe']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
										<input type="hidden" name="paramMap.sortId" value="1"/>
									内容：
								</td>
								<td align="left" class="f66">
									<textarea id="tr_content" name="paramMap.anwer" rows="20" class="textareash"
											style="width: 670px; padding:5px;">
										<c:out value="paramMap.anwer"/>
									</textarea>
									<span class="require-field">*<s:fielderror fieldName="paramMap['anwer']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									发布人：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_publisher" name="paramMap.publisher"
										cssClass="in_text_2" cssStyle="width: 150px" theme="simple"></s:textfield>
									<span class="require-field">*<s:fielderror fieldName="paramMap['publisher']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									发布时间：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_publishTime" name="paramMap.publishTime"
										cssClass="in_text_2" cssStyle="width: 150px" theme="simple" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})"/>
									<span class="require-field"><s:fielderror fieldName="paramMap['publishTime']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									<s:hidden name="action"></s:hidden>
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
						</table>
						<br />
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
