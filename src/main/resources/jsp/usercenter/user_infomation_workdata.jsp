<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--=======================-->
<jsp:include page="../include/head.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/date/calendar.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#li_geren").click(function(){
       		var from = '${from}';
			window.location.href='querBaseData.do?from='+from;
		});
		$("#li_work").click(function(){
			var from = '${from}';
			window.location.href='querWorkData.do?from='+from;
		});
		$("#li_vip").click(function(){
			var from = '${from}';
			window.location.href='quervipData.do?from='+from;
		});
	});
	
	$(function(){
		if('${allworkmap.audi}'=='12'){
			$("#workPro").attr("disabled","true");
			$("#workCity").attr("disabled","true");
		  }
	});
</script>
</head>
<body>
<!-- 引用头部公共部分  -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!--=======================-->
<div class="account">
	<div class="acc_content">
		<!-- 导航 Start -->
		<div class="pertop">
			<ul>
				<li><a href="querBaseData.do" >个人基本信息</a></li>
				<li><a href="querWorkData.do" style="background: #1ca4ad; color: #FFF;">个人工作信息</a></li>
				<li><a href="quervipData.do">申请VIP</a></li>
				<li><a href="userPassData.do">认证资料</a></li>
			</ul>
			<a href="borrow.do" class="ca_back">返回</a>
		</div>
		<!-- 导航 End -->
		<!-- 内容 Start -->
		<div class="percontent">
			<div class="tsmes">*为必填项，所有资料均会严格保密。</div>
			<!-- Start -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" width="125"><span class="span_red">*</span>单位名称：</td>
					<td><input type="text" name="paramMap.orgName" id="orgName" class="txtmail" value="${map.orgName}"	
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 职业状态：</td>
					<td>
						<select name="paramMap.occStatus" class="txtmail" id="occStatus"
							<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="">请选择</option>
							<option value="工薪阶层" <c:if test='#request.map.occStatus == "工薪阶层"'>selected="selected"</c:if><s:else></s:else>> 工薪阶层</option>
							<option value="私营企业主" <c:if test='#request.map.occStatus == "私营企业主"'>selected="selected"</c:if>	<s:else></s:else>> 私营企业主</option>
							<option value="网络商家" <c:if test='#request.map.occStatus == "网络商家"'>selected="selected"</c:if><s:else></s:else>> 网络商家</option>
							<option value="其他" <c:if test='#request.map.occStatus == "其他"'>selected="selected"</c:if><s:else></s:else>> 其他</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 工作城市：</td>
					<td>
						<s:select id="workPro" name="workPro" cssStyle="width:100px; height:25px; border:1px solid #e7e7e7;" list="#request.provinceList" listKey="regionId" listValue="regionName" headerKey="-1" headerValue="--请选择--" />
						<s:select id="workCity" name="cityId" cssStyle="width:100px; height:25px; border:1px solid #e7e7e7;" list="#request.cityList" listKey="regionId" listValue="regionName" headerKey="-1" headerValue="--请选择--" />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 公司类别：</td>
					<td>
						<select class="txtmail" id="companyType"
							name="paramMap.companyType"
							<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="">请选择</option>
							<option value="事业单位"
								<c:if test='#request.map.companyType == "事业单位"'>selected="selected"</c:if>
								<s:else></s:else>>
								事业单位
							</option>
							<option value="国家单位"
								<c:if test='#request.map.companyType == "国家单位"'>selected="selected"</c:if>
								<s:else></s:else>>
								国家单位
							</option>
							<option value="央企(包括下级单位)"
								<c:if test='#request.map.companyType == "央企(包括下级单位)"'>selected="selected"</c:if>
								<s:else></s:else>>
								央企(包括下级单位)
							</option>
							<option value="地方国资委直属企业"
								<c:if test='#request.map.occStatus == "地方国资委直属企业"'>selected="selected"</c:if>
								<s:else></s:else>>
								地方国资委直属企业
							</option>
							<option value="世界500强(包括合资企业及下级单位)"
								<c:if test='#request.map.companyType == "世界500强(包括合资企业及下级单位)"'>selected="selected"</c:if>
								<s:else></s:else>>
								世界500强(包括合资企业及下级单位)
							</option>
							<option value="外资企业(包括合资企业)"
								<c:if test='#request.map.companyType == "外资企业(包括合资企业)"'>selected="selected"</c:if>
								<s:else></s:else>>
								外资企业(包括合资企业)
							</option>
							<option value="一般上市公司(包括国外上市公司)"
								<c:if test='#request.map.companyType == "一般上市公司(包括国外上市公司)"'>selected="selected"</c:if>
								<s:else></s:else>>
								一般上市公司(包括国外上市公司)
							</option>
							<option value="一般民营企业"
								<c:if test='#request.map.companyType == "一般民营企业"'>selected="selected"</c:if>
								<s:else></s:else>>
								一般民营企业
							</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 公司行业：</td>
					<td>
						<select class="txtmail" id="companyLine"
							name="paramMap.companyLine"
							<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="">请选择</option>
							<option value="农、林、牧、渔业"
								<c:if test='#request.map.companyLine == "农、林、牧、渔业"'>selected="selected"</c:if>
								<s:else></s:else>>
								农、林、牧、渔业
							</option>
							<option value="采矿业"
								<c:if test='#request.map.companyLine == "采矿业"'>selected="selected"</c:if>
								<s:else></s:else>>
								采矿业
							</option>
							<option value="电力、热力、燃气及水的生产和供应业"
								<c:if test='#request.map.companyLine == "电力、热力、燃气及水的生产和供应业"'>selected="selected"</c:if>
								<s:else></s:else>>
								电力、热力、燃气及水的生产和供应业
							</option>
							<option value="制造业"
								<c:if test='#request.map.companyLine == "制造业"'>selected="selected"</c:if>
								<s:else></s:else>>
								制造业
							</option>
							<option value="教育"
								<c:if test='#request.map.companyLine == "教育"'>selected="selected"</c:if>
								<s:else></s:else>>
								教育
							</option>
							<option value="环境和公共设施管理业"
								<c:if test='#request.map.companyLine == "环境和公共设施管理业"'>selected="selected"</c:if>
								<s:else></s:else>>
								环境和公共设施管理业
							</option>
							<option value="建筑业"
								<c:if test='#request.map.companyLine == "建筑业"'>selected="selected"</c:if>
								<s:else></s:else>>
								建筑业
							</option>
							<option value="交通运输、仓储业和邮政业"
								<c:if test='#request.map.companyLine == "交通运输、仓储业和邮政业"'>selected="selected"</c:if>
								<s:else></s:else>>
								交通运输、仓储业和邮政业
							</option>
							<option value="信息传输、计算机服务和软件业"
								<c:if test='#request.map.companyLine == "信息传输、计算机服务和软件业"'>selected="selected"</c:if>
								<s:else></s:else>>
								信息传输、计算机服务和软件业
							</option>
							<option value="批发和零售业"
								<c:if test='#request.map.companyLine == "批发和零售业"'>selected="selected"</c:if>
								<s:else></s:else>>
								批发和零售业
							</option>
							<option value="住宿、餐饮业"
								<c:if test='#request.map.companyLine == "住宿、餐饮业"'>selected="selected"</c:if>
								<s:else></s:else>>
								住宿、餐饮业
							</option>
							<option value="金融、保险业"
								<c:if test='#request.map.companyLine == "金融、保险业"'>selected="selected"</c:if>
								<s:else></s:else>>
								金融、保险业
							</option>

							<option value="房地产业"
								<c:if test='#request.map.companyLine == "房地产业"'>selected="selected"</c:if>
								<s:else></s:else>>
								房地产业
							</option>
							<option value="文化、体育、娱乐业"
								<c:if test='#request.map.companyLine == "文化、体育、娱乐业"'>selected="selected"</c:if>
								<s:else></s:else>>
								文化、体育、娱乐业
							</option>
							<option value="综合（含投资类、主业不明显)"
								<c:if test='#request.map.companyLine == "综合（含投资类、主业不明显)"'>selected="selected"</c:if>
								<s:else></s:else>>
								综合（含投资类、主业不明显)
							</option>
							<option value="其它"
								<c:if test='#request.map.companyLine == "其它"'>selected="selected"</c:if>
								<s:else></s:else>>
								其它
							</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 公司规模：</td>
					<td>
						<select class="txtmail" name="paramMap.companyScale"
							id="companyScale"
							<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="50人以下"
								<c:if test='#request.map.companyScale == "50人以下"'>selected="selected"</c:if>
								<s:else></s:else>>
								50人以下
							</option>
							<option value="50-100人"
								<c:if test='#request.map.companyScale == "50-100人"'>selected="selected"</c:if>
								<s:else></s:else>>
								50-100人
							</option>
							<option value="100-500人"
								<c:if test='#request.map.companyScale == "100-500人"'>selected="selected"</c:if>
								<s:else></s:else>>
								100-500人
							</option>
							<option value="500人以上"
								<c:if test='#request.map.companyScale == "500人以上"'>selected="selected"</c:if>
								<s:else></s:else>>
								500人以上
							</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 职位：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.job"	id="job" value="${map.job }"
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 月收入：</td>
					<td>
						<select class="txtmail" name="paramMap.monthlyIncome"
							id="monthlyIncome"
							<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="">请选择</option>
							<option value="1000以下" <c:if test='#request.map.monthlyIncome == "1000以下"'>selected="selected"</c:if><s:else></s:else>> 1000以下</option>
							<option value="1000-2000" <c:if test='#request.map.monthlyIncome == "1000-2000"'>selected="selected"</c:if><s:else></s:else>> 1000-2000</option>
							<option value="2000-5000" <c:if test='#request.map.monthlyIncome == "2000-5000"'>selected="selected"</c:if><s:else></s:else>> 2000-5000</option>
							<option value="5000-10000" <c:if test='#request.map.monthlyIncome == "5000-10000"'>selected="selected"</c:if><s:else></s:else>> 5000-10000</option>
							<option value="10000-20000" <c:if test='#request.map.monthlyIncome == "10000-20000"'>selected="selected"</c:if><s:else></s:else>> 10000-20000</option>
							<option value="20000以上" <c:if test='#request.map.monthlyIncome == "20000以上"'>selected="selected"</c:if><s:else></s:else>> 20000以上</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td align="right">
						<span class="span_red">*</span> 现单位工作年限：
					</td>
					<td>
						<select class="txtmail" name="paramMap.workYear" id="workYear" <c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if>>
							<option value="">请选择</option>
							<option value="1年" <c:if test='#request.map.workYear == "1年"'>selected="selected"</c:if><s:else></s:else>> 1年	</option>
							<option value="1-3年" <c:if test='#request.map.workYear == "1-3年"'>selected="selected"</c:if><s:else></s:else>> 1-3年</option>
							<option value="3-5年" <c:if test='#request.map.workYear == "3-5年"'>selected="selected"</c:if><s:else></s:else>> 3-5年</option>
							<option value="5年以上" <c:if test='#request.map.workYear == "5年以上"'>selected="selected"</c:if><s:else></s:else>> 5年以上</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right"><span class="span_red">*</span> 公司电话：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.companyTel" id="companyTel" value="${map.companyTel }"
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />格式：0311-29556666&nbsp;
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 工作邮箱：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.workEmail" id="workEmail" value="${map.workEmail }"
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span> 公司地址：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.companyAddress" id="companyAddress" value="${map.companyAddress }"
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
			</table>
			<!-- End -->
			<div class="tsmes">直系亲属联系人（在您贷款成功后，我们会通过电话核实您的紧急联系人信息）</div>
			<!-- Start -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" width="125"><span class="span_red">*</span>姓名：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.directedName" id="directedName" value="${map.directedName }"
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span>关系：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.directedRelation" id="directedRelation" value="${map.directedRelation }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span>手机：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.directedTel" id="directedTel" value="${map.directedTel }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
			</table>
			<div class="tsmes">其他联系人</div>
			<!-- Start -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" width="125"><span class="span_red">*</span>姓名：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.otherName" id="otherName" value="${map.otherName }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				<tr>
					<td align="right"><span class="span_red">*</span>关系：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.otherRelation" id="otherRelation" value="${map.otherRelation }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span>手机：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.otherTel" id="otherTel" value="${map.otherTel }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
			</table>
			<!-- End -->
			<div class="tsmes">更多其他联系人</div>
			<!-- Start -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td align="right" width="125"><span class="span_red">*</span>姓名：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.moredName" id="moredName" value="${map.moredName }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span>关系：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.moredRelation" id="moredRelation" value="${map.moredRelation }" 
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td align="right"><span class="span_red">*</span>手机：</td>
					<td>
						<input type="text" class="txtmail" name="paramMap.moredTel" id="moredTel" value="${map.moredTel }"	
						<c:if test='#request.allworkmap.audi ==12'>disabled="disabled"</c:if> />
					</td>
				</tr>
				
				<tr>
					<td class="C_ts_td_xy">	</td>
					<td>
						<c:if test="#request.allworkmap.audi ==12">
							<div class="C_tx C_tx1"><a href="javascript:void(0);">不可修改</a></div>
						</c:if>
						<s:else><a href="#" id="jc_btn" class="update">保存并继续</a></s:else>
					</td>
				</tr>
			</table>
			<!-- End -->
		</div>
		<!-- 内容 End -->
	</div>
</div>
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
<script>
$(function(){
    //样式选中
	dqzt(2);
	var sd=parseInt($(".l-nav").css("height"));
	var sdf=parseInt($(".r-main").css("height"));
	$(".l-nav").css("height",sd>sdf?sd:sdf-15);
	//上传图片
	$("#btn_personalHead").click(function(){
		var dir = getDirNum();
		var json = "{'fileType':'JPG,BMP,GIF,TIF,PNG','fileSource':'user/"+dir+"','fileLimitSize':0.5,'title':'上传图片','cfn':'uploadCall','cp':'img'}";
		json = encodeURIComponent(json);
		 window.showModalDialog("uploadFileAction.do?obj="+json,window,"dialogWidth=500px;dialogHeight=400px");
		var headImgPath = $("#img").attr("src");
		if(headImgPath!=""){
			alert("上传成功！");	
				
		}else{ 
			alert("上传失败！");	
		}
	});
	//省份改变
	$("#workPro").change(function(){
		var provinceId = $("#workPro").val();
		citySelectInit(provinceId, 2);
		//$("#area").html("<option value='-1'>--请选择--</option>");
	});
});
	//城市跟随改变
	function citySelectInit(parentId, regionType){
		var _array = [];
		_array.push("<option value='-1'>--请选择--</option>");
		var param = {};
		param["regionType"] = regionType;
		param["parentId"] = parentId;
		$.post("ajaxqueryRegion.do",param,function(data){
			for(var i = 0; i < data.length; i ++){
				_array.push("<option value='"+data[i].regionId+"'>"+data[i].regionName+"</option>");
			}
		$("#workCity").html(_array.join(""));
	});
}
function uploadCall(basepath,fileName,cp){
	if(cp == "img"){
		var path = "upload/"+basepath+"/"+fileName;
	$("#img").attr("src",path);
	$("#setImg").attr("src",path);
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
	//======================工作认证
	$("#jc_btn").click(function(){
		if($("#orgName").val() ==""){
			alert('请填写单位名称');
			return ;
		}
		if($("#occStatus").val() ==""){
			alert('请填写职业状态');
			return ;
		}
		if($("#workPro").val() ==""){
			alert('请填写工作省份');
			return ;
		}
		if($("#workCity").val() == '-1'){
			alert('请填写工作城市');
			return ;
		}
		if($("#companyType").val() ==""){
			alert('请填写公司类别');
			return ;
		}
		if($("#companyLine").val() ==""){
			alert('请填写公司行业');
			return ;
		}
		if($("# companyScale").val() ==""){
			alert('请填写公司规模');
			return ;
		}
		if($("#job").val() ==""){
			alert('请填写职位');
			return ;
		}
		if($("#monthlyIncome").val() ==""){
			alert('请填写月收入');
			return ;
		}
		if($("#workYear").val() ==""){
			alert('请填写现单位工作年限');
			return ;
		}
		if($("#workYear").val() ==""){
			alert('请填写现单位工作年限');
			return ;
		}
		if($("#companyTel").val() ==""){
			alert('请填写公司电话');
			return ;
		}else if((!/^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/.test($("#companyTel").val()))){
			alert('请正确填写公司电话');
			return ;
		}
		if($("#workEmail").val()==''){
			alert("工作邮箱不能为空");
			return ;
		}
		if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test($("#workEmail").val())){
			alert("请正确填写工作邮箱");
			return ;
		}
		if($("#companyAddress").val() ==""){
			alert('请填写现公司地址');
			return ;
		}
		if($("#directedName").val() ==""){
			alert('请填写直系亲属联系人姓名');
			return ;
		}
		if($("#directedRelation").val() ==""){
			alert('请填写直系亲属联系人关系');
			return ;
		}
		if($("#directedTel").val() ==""){
			alert('请输入你的直系联系人手机号');
			return;
		}else if((!/^1[3,5,8]\d{9}$/.test($("#directedTel").val()))){ 
			alert('你输入的直系联系人手机号不正确');
			return;
		}
		if($("#otherName").val() ==""){
			alert('请填写其他联系人姓名');
			return ;
		}
		if($("#otherRelation").val() ==""){
			alert('请填写其他联系人关系');
			return ;
		}
		if($("#otherTel").val() ==""){
			alert('请输入你的其他联系人手机号');
			return;
		}else if((!/^1[3,5,8]\d{9}$/.test($("#otherTel").val()))){ 
			alert('你输入的其他联系人手机号不正确');
			return;
		}
		if($("#moredName").val() ==""){
			alert('请填写更多其他联系人姓名');
			return ;
		}
		if($("#moredRelation").val() ==""){
			alert('请填写更多其他联系人关系');
			return ;
		}
		if($("#moredTel").val() ==""){
			alert('请输入你的更多联系人手机号');
			return;
		}else if((!/^1[3,5,8]\d{9}$/.test($("#moredTel").val()))){ 
			alert('你输入的更多联系人手机号不正确');
			return;
		}
		var param = {};
		param["paramMap.orgName"]=$("#orgName").val();
		param["paramMap.occStatus"]=$("#occStatus").val();
		param["paramMap.workPro"]=$("#workPro").val();
		param["paramMap.workCity"]=$("#workCity").val();
		param["paramMap.companyType"]=$("#companyType").val();
		param["paramMap.companyLine"]=$("#companyLine").val();
		param["paramMap.companyScale"]=$("#companyScale").val();
		param["paramMap.job"]=$("#job").val();
		param["paramMap.monthlyIncome"]=$("#monthlyIncome").val();
		param["paramMap.workYear"]=$("#workYear").val();
		param["paramMap.companyTel"]=$("#companyTel").val();
		param["paramMap.workEmail"]=$("#workEmail").val();
		param["paramMap.companyAddress"]=$("#companyAddress").val();
		param["paramMap.directedName"]=$("#directedName").val();
		param["paramMap.directedRelation"]=$("#directedRelation").val();
		param["paramMap.directedTel"]=$("#directedTel").val();
		param["paramMap.otherName"]=$("#otherName").val();
		param["paramMap.otherRelation"]=$("#otherRelation").val();
		param["paramMap.otherTel"]=$("#otherTel").val();
		param["paramMap.moredName"]=$("#moredName").val();
		param["paramMap.moredRelation"]=$("#moredRelation").val();
		param["paramMap.moredTel"]=$("#moredTel").val();
		param["paramMap.moredName"]=$("#moredName").val();
		//add by houli
		var btype = '${btype}';
		$.post("updatework.do",param,function(data){
	        if(data.msg=="vip保存成功"){
	           alert("保存成功");
	           window.location.href='userPassData.do?btype='+btype;
	        }
	         if(data.msg=="保存成功"){
	           alert("保存成功");
	           window.location.href='quervipData.do?btype='+btype;
	         }
	             if(data.msg=="请正确填写公司名字"){
	           alert("请正确填写单位名字");
	         }
	         if(data.msg=="22"){
	           alert("真实姓名的长度为不小于2和大于50");
	         }
	             if(data.msg=="请填写职业状态"){
	           alert("请填写职业状态");
	         }
	             if(data.msg=="请填写工作城市省份"){
	           alert("请填写工作城市省份");
	         }
	             if(data.msg=="请填写工作城市"){
	           alert("请填写工作城市");
	         }
	             if(data.msg=="直系人姓名长度为不小于2和大于50"){
	           alert("直系人姓名长度为不小于2和大于50");
	         }
	           if(data.msg=="请填写公司类别"){
	           alert("请填写公司类别");
	         }
	             if(data.msg=="请填写公司行业"){
	           alert("请填写公司行业");
	         }
	             if(data.msg=="请填写公司规模"){
	           alert("请填写公司规模");
	         }
	             if(data.msg=="请填写职位"){
	           alert("请填写职位");
	         }
	             if(data.msg=="请填写月收入"){
	           alert("请填写月收入");
	         }
	             if(data.msg=="请填写现单位工作年限"){
	           alert("请填写现单位工作年限");
	         }
	             if(data.msg=="请正确填写公司电话"){
	           alert("请正确填写公司电话");
	         }
	             if(data.msg=="请填写工作邮箱"){
	           alert("请填写工作邮箱");
	         }
	             if(data.msg=="请填写公司地址"){
	           alert("请填写公司地址");
	         }
	             if(data.msg=="请填写直系人姓名"){
	           alert("请填写直系人姓名");
	         }
	             if(data.msg=="请填写直系人关系"){
	           alert("请填写直系人关系");
	         }
	             if(data.msg=="请正确填写直系人电话"){
	           alert("请正确填写直系人手机");
	         }
	             if(data.msg=="请填写其他人姓名"){
	           alert("请填写其他人姓名");
	         }
	             if(data.msg=="请填写其他人关系"){
	           alert("请填写其他人关系");
	         }
	            if(data.msg=="请正确填写其他人联系电话"){
	           alert("请正确填写其他人联系手机");
	         }
	         if(data.msg=="moretel"){
	           alert("请正确填写其他联系手机");
	         }
	            if(data.msg=="morename"){
	           alert("请正确填写其他联系人名字");
	         }
	          if(data.msg=="morereation"){
	           alert("请正确填写其他联系人关系");
	         }
	        if(data.msg=="请正确填写直系人电话长度错误"){
	           alert("请正确填写直系人电话长度");
	         }
	        if(data.msg=="其他人姓名长度为不小于2和大于50"){
	           alert(" 其他人姓名长度为不小于2和大于50");
	         }
	         if(data.msg=="更多联系人姓名长度为不小于2和大于50"){
	           alert(" 其他人姓名长度为不小于2和大于50");
	         } 
	         if(data.msg=="querBaseData"){
	           window.location.href='querBaseData.do';
	         }
		});  
	});
</script>
</body>
</html>
