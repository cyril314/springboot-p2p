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
	    	init();
	    	  if($('#paramMap_img').val() == ''){
			    	$("#img").attr("src","static/images/NoImg.GIF");
			 }else{
					$('#img').attr('src',"../"+$('#paramMap_img').val());
			 }
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
			
			function init(){
				var provinceId = $("#province").val();
				citySelectInit(provinceId, 2);
			} 
</script>
</head>
	<body>
	<form id="addAdmin" action="updateEconomy.do" method="post">
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28" class="xxk_all_a">
									<a href="queryEconomyInit.do">理财经理列表</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="100" class="main_alll_h2">
								 修改理财经理
								</td>
								<td width="2">
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					 
					<div style="width: auto; background-color: #FFF; padding: 10px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
						<s:hidden name="paramMap.id" />
						<s:hidden name="paramMap.relationId" />
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									业务机构：
								</td>
								<td align="left" class="f66">
									<s:select list="parentList" name="paramMap.parentId" listKey="id" listValue="userName" headerKey="-1" headerValue="--请选择--" ></s:select>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.parentId" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									理财经理账号：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.userName" theme="simple"  readonly="true"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.userName" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									密码：
								</td>
								<td align="left" class="f66">
									<s:password name="paramMap.password" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" />
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.password" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									确认密码：
								</td>
								<td align="left" class="f66">
									<s:password name="paramMap.confirmPassword" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" />
									<span style="color: red;"><s:fielderror
											fieldName="paramMap.confirmPassword" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									姓名：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.realName" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.realName" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									相片：
								</td>
								<td align="left" class="f66">
								    <s:hidden name="paramMap.img"></s:hidden>
									<img id="img" src="${headImg}" width="62" height="62"/> <a href="javascript:void(0);" id="btn_personalHead" class="scbtn">上传图片</a>
								    <span style="color: red;">*<s:fielderror
											fieldName="paramMap.img" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									性别：
								</td>
								<td align="left" class="f66">
									<s:radio name="paramMap.sex" list="#{1:'男',0:'女' }" />
								    <span style="color: red;">*<s:fielderror
											fieldName="paramMap.sex" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									身份证号码：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.card" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.card" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									手机号码：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.telphone" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.telphone" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									QQ：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.qq" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.qq" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									邮箱：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.email" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.email" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									省份：
								</td>
								<td align="left" class="f66">
								<s:select id="province" name="paramMap.nativePlacePro" cssStyle="width: 100px"
										list="provinceList" listKey="regionId"
										listValue="regionName" headerKey="-1" headerValue="--请选择--" />
									<s:select id="city" name="paramMap.nativePlaceCity" cssStyle="width: 100px"
										list="#{-1:'--请选择--' }" />
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.nativePlaceCity" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									联系地址：
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.address" theme="simple"
										cssClass="in_text_2" cssStyle="width: 150px" ></s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.address" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									描述：
								</td>
								<td align="left" class="f66">
									<textarea name="paramMap.summary" id="tr_content" cols="35" rows="4"><c:out value="paramMap.summary" escape="false" /></textarea>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.summary" />
									</span>
								</td>
							</tr>
							<tr>
								<td style="height: 25px;" align="right" class="blue12">
									状态：
								</td>
								<td align="left" class="f66">
									<s:radio name="paramMap.enable" id="enable" theme="simple"
										list="#{1:'启用',2:'禁用'}"/>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.enable" />
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
