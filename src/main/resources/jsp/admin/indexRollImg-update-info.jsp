<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>首页图片修改</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/themes/default/default.css" />
		<link rel="stylesheet" href="${ctx}/static/plugins/kindeditor/plugins/code/prettify.css" />
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/kindeditor.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="${ctx}/static/plugins/kindeditor/plugins/code/prettify.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		
		<script type="text/javascript">
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
				//提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#tr_content").val(editor_content.html());
					$("#updateLinks").submit();
					return false;
				});
				
				//上传图片
				$("#btnUpImg").click(function(){
					var dir = getDirNum();
					var json = "{'fileType':'JPG,BMP,GIF,TIF,PNG','fileSource':'lists/"+dir+"','fileLimitSize':0.5,'title':'上传图片','cfn':'uploadCall','cp':'img'}";
					json = encodeURIComponent(json);
					window.showModalDialog("uploadFileAction.do?obj="+json,window,"dialogWidth=500px;dialogHeight=400px");
				});
				if("${paramMap.companyImg}"!=""){
					$("#img").attr("src","../${paramMap.companyImg}");
				}
				
			  });
			
			function uploadCall(basepath,fileName,cp){
		  		if(cp == "img"){
		  			var path = "upload/"+basepath+"/"+fileName;
		  			$("#companyImg").val(path);
					$("#img").attr("src","../"+path);
		  		}
			}
			
			function getDirNum(){
		      var date = new Date();
		 	  var m = date.getMonth()+1;
		 	  var d = date.getDate();
		 	  if(m<10){
		 	  	m = "0"+m;
		 	  }
		 	  if(d<10){
		 	  	d = "0"+d;
		 	  }
		 	  var dirName = date.getFullYear()+""+m+""+d;
		 	  return dirName; 
			}
			
		</script>		
	</head>
	<body>
		<form id="updateLinks" name="updateLinks" action="updateIndexRollImgInfo.do" method="post">
			<s:hidden id="id" name="paramMap.id" />
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table  border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28"  class="xxk_all_a">
									<a href="queryIndexRollImgInit.do">图片管理</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="100"  class="main_alll_h2">
									<a href="javascript:void(0);">修改图片</a>
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
								<td style="height: 25px;" align="right" class="blue12">
									图片：
								</td>		
								<td align="left" class="f66">
									 <img id="img" src="${ctx}/static/images/NoImg.GIF" style="width: 100px;height: 100px;"/>
								     <s:hidden id="companyImg" name="paramMap.companyImg" />
									 <input id="btnUpImg" value="浏览..." type="button"/>
									 <span class="require-field">*<s:fielderror fieldName="paramMap['companyImg']"></s:fielderror></span>
									</td>
							</tr>
							<!-- <tr>
								<td style="height: 25px;" align="right" class="blue12">
									链接地址：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tr_content" name="paramMap.companyURL" 
											cssClass="in_text_2" cssStyle="width: 150px" theme="simple"></s:textfield>
									<span class="require-field">*<s:fielderror fieldName="paramMap['companyURL']"></s:fielderror></span>
								</td>
							</tr>-->
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									序号：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_id" name="paramMap.serialCount" 
										cssClass="in_text_2" cssStyle="width: 150px" theme="simple" readonly="true" ></s:textfield>
									<span class="require-field"><s:fielderror fieldName="paramMap['serialCount']"></s:fielderror></span>
								</td>
							</tr>
							
							<!-- 排序 -->
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									排序：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_id" name="paramMap.ordershort" 
										cssClass="in_text_2" cssStyle="width: 150px" theme="simple"  ></s:textfield>
										<span class="require-field"><s:fielderror fieldName="paramMap['ordershort']"></s:fielderror></span>
									</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									发布时间：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.publishTime" cssClass="in_text_2" cssStyle="width: 150px" theme="simple"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})" ></s:textfield>
									<!-- <s:date name="paramMap.publishTime" format="dd/MM/yyyy" /> -->
									<span class="require-field">*<s:fielderror fieldName="paramMap['publishTime']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									标题：
								</td>
								<td align="left" class="f66">
									<s:textfield id="tb_title" name="paramMap.companyName"
										cssClass="in_text_2" cssStyle="width: 250px" theme="simple"></s:textfield>
									<span class="require-field">*<s:fielderror fieldName="paramMap['companyName']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
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

