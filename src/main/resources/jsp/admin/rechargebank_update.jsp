<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>管理首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" language="javascript">
	    	$(function(){
				//提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#addAdmin").submit();
					return false;
				});
				$("#btn_personalHead").click(function(){
				var dir = getDirNum();
				var json = "{'fileType':'JPG,BMP,GIF,TIF,PNG','fileSource':'user/"+dir+"','fileLimitSize':0.5,'title':'上传图片','cfn':'uploadCall','cp':'img'}";
				json = encodeURIComponent(json);
				window.showModalDialog("uploadFileAction.do?obj="+json,window,"dialogWidth=500px;dialogHeight=400px");
				var headImgPath = $("#img").attr("src");
				if(headImgPath ==""){
					alert("上传失败！");	
			}
	 	 });
	  
	  $("#province").change(function(){
					var provinceId = $("#province").val()
					citySelectInit(provinceId, 2);
					$("#area").html("<option value='-1'>--请选择--</option>");
				});
});
function uploadCall(basepath,fileName,cp){
	if(cp == "img"){
		var path = "upload/"+basepath+"/"+fileName;
		$("#img").attr("src","../"+path);
		$("#paramMap_img").val(path);
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
var flag = true;
function citySelectInit(parentId, regionType){
				var _array = [];
				_array.push("<option value='-1'>--请选择--</option>");
				var param = {};
				param["regionType"] = regionType;
				param["parentId"] = parentId;
				$.post("ajaxqueryRegionAdmin.do",param,function(data){
					for(var i = 0; i < data.length; i ++){
						_array.push("<option value='"+data[i].regionId+"'>"+data[i].regionName+"</option>");
					}
					$("#city").html(_array.join(""));
					if(flag){
						$("#city").val('${paramMap.nativePlaceCity}');
						flag = false;
					}
				});
			}
</script>
</head>
	<body>
	<form id="addAdmin" action="updateRechargeBankInfo.do" method="post">
			<div id="right"
				style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table width="200px" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28"  class="xxk_all_a">
									<a href="querybankeditInit.do">充值银行卡管理</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="100"  class="main_alll_h2">
									<a href="javascript:void(0)">编辑充值银行</a>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					<div style="width: auto; background-color: #FFF; padding: 10px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
						<s:hidden name="paramMap.id" />
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									银行名称：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.bankname" theme="simple" 
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.bankname" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									账号：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.Account" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" />
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.Account" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									开户姓名：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.accountname" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" />
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.accountname" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
								开户行：
								</td>
								<td align="left" class="f66">
									<s:textarea name="paramMap.accountbank" theme="simple"
										 rows="10" cols="20"/>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.accountbank" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									银行图片：
								</td>
								<td align="left" class="f66">
								    <s:hidden name="paramMap.bankimage" value="" id="paramMap_img"></s:hidden>
									<img id="img" src="../${paramMap.bankimage}" width="62" height="62"/> <a href="javascript:void(0);" id="btn_personalHead" class="scbtn">上传图片</a>
								    <span style="color: red;">*<s:fielderror
											fieldName="paramMap.bankimage" />
									</span>
								</td>
							</tr>
							<tr>
								<td height="25">
								</td>
								<td align="left" class="f66" style="color: Red;">
									<s:fielderror fieldName="paramMap.allError" />
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td>
                                <button id="btn_save" style="background-image: url('static/images/admin/btn_queding.jpg');width: 70px;border: 0;height: 26px"  ></button>
                                &nbsp;<button type="reset" style="background-image: url('static/images/admin/btn_chongtian.jpg');width: 70px;height: 26px;border: 0px"></button>&nbsp;
                                &nbsp;
                                <span style="color: red;">
                             	  <s:fielderror fieldName="actionMsg" theme="simple"></s:fielderror>
                                </span>
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
