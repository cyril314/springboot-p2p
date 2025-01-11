<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
	</head>
	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>
		<form id="form" action="addBorrow.do" method="post">
			<div class="account">
				<div class="acc_content">
					<div class="inmes_top" style="border: 0">
						<span id="typeName">${session.typeName}</span>
						<a href="window.history.back(-1)" class="ca_back">返回</a>
					</div>
					<div class="percontent">
						<div class="tsmes">
							*为必填项，所有资料均会严格保密。 
							<s:elseif test="#session.typeName=='净值借款'">您的净值资产为<fmt:formatNumber value="${amount}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber>,借款金额上限为净值资产的70%,即<fmt:formatNumber value="${usableAmount}" pattern="##.##" minFractionDigits="2" ></fmt:formatNumber></s:elseif>
						</div>
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td align="right" ><span class="fred">*</span>借款标题：</td>
								<td>
									<input type="text" class="txtmail" maxlength="20" value="${paramMap.title}" name="paramMap.title"/>
    								<span class="fred"><s:fielderror fieldName="paramMap['title']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 借款目的：</td>
								<td>
									<s:select list="borrowPurposeList" id="purpose" name="paramMap.purpose" cssClass="C_input_fbjk" listKey="selectValue" listValue="selectName"  headerKey="" headerValue="--请选择--"></s:select>
									<span class="fred"><s:fielderror fieldName="paramMap['purpose']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 借款描述：</td>
								<td>
									<textarea class="areamail" id="detail" name="paramMap.detail"><c:out value="#paramMap.detail"/> </textarea>
									<span class="fred"><s:fielderror fieldName="paramMap['detail']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 借款总额：</td>
								<td>
									<input type="text" class="txtmail" maxlength="11" name="paramMap.amount" value="${paramMap.amount}"/>元
									<span class="fred"><s:fielderror fieldName="paramMap['amount']"></s:fielderror></span>
									<span class="fred"><s:fielderror fieldName="enough"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 借款期限：</td>
								<td>
									<s:select list="borrowDeadlineMonthList" id="deadLine" name="paramMap.deadLine" cssClass="C_input_fbjk" listKey="key" listValue="value"   headerKey="" headerValue="--请选择--"></s:select>
									<span class="fred"><s:fielderror fieldName="paramMap['deadLine']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 还款方式：</td>
								<td>
									<s:select id="paymentMode" name="paramMap.paymentMode" list="borrowRepayWayList" cssClass="C_input_fbjk" listKey="id" listValue="name" headerKey="" headerValue="--请选择--"></s:select>
	    							<span class="fred"><s:fielderror fieldName="paramMap['paymentMode']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 利率：</td>
								<td>
									<input type="text" name="paramMap.annualRate" maxlength="5" value="${paramMap.annualRate}" class="txtmail" maxlength="6"/>%
									<span class="fred"><s:fielderror fieldName="paramMap['annualRate']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 筹标期限：</td>
								<td>
								    <input type="hidden" name="validateDay" value="${validateDay }" class="txtmail" />
								    <c:if test="#request.validateDay==1"><input type="hidden" name="paramMap.raiseTerm" value="0" />无限制</c:if>
								    <s:else>
								    	<s:select list="borrowRaiseTermList" id="raiseTerm" name="paramMap.raiseTerm" cssClass="C_input_fbjk" listKey="key" listValue="value"   headerKey="" headerValue="--请选择--"></s:select>
								    	<span class="fred"><s:fielderror fieldName="paramMap['raiseTerm']"></s:fielderror></span>
								    </s:else>
								</td>
							</tr>
							<tr>
								<td align="right"><span class="fred">*</span> 用户头像：</td>
								<td>
									<div class="C_tx">
										<ul>
											<li id="r_1" class="C_current4">上传借款图片</li>
											<li id="r_2">使用用户头像</li>
											<li id="r_3">使用系统头像</li>
										</ul>
								        <span class="fred"><s:fielderror fieldName="paramMap['imgPath']"></s:fielderror></span>
								        <input type="hidden" id="radioval" name="paramMap.radioval" value="${paramMap.radioval}"/>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div>
										<img id="img" src="${headImg}" style="width:120px;height:120px;"/>
										<input type="hidden" id="imgPath"  name="paramMap.imgPath" value="${paramMap.imgPath}"/>
    									<input type="hidden" id="personalImg" value="${user.personalHead}"/>
										<div id="tab_1"><a href="javascript:void(0);" id="btn_personalHead">上传图片</a></div>
										<div id="tab_2" class="hide"></div>
										<div id="tab_3" class="hide">
										    <table id="sysimg" style="width:400px;">
										        <tr>
										            <td class="tx">
										            <s:iterator var="sysImage" value="sysImageList">
										            	<img src="${sysImage.selectName}" class="selimg" style="width:120px;height:120px;cursor: pointer;"/>
										            </s:iterator>
										            </td>
										        </tr>
										    </table>
										</div>
										<p>
											（推荐使用您的生活近照，或其他与借款用途相关的图片， 有助增加借款成功几率。严禁使用他人照片）
										</p>
									</div>

								</td>
							</tr>
							<c:if test="#request.password_status == 1">
								<tr>
									<td class="C_ts_td_xy">
										投标密码：<input type="hidden" name="password_status" value="${password_status }" class="txtmail" />
									</td>
									<td>
										<input type="password" class="txtmail" id="investPWD" value="${paramMap.investPWD }" disabled="disabled" name="paramMap.investPWD" maxlength="20" />
										<input type="checkbox" style="width: 11px; height: 11px; vertical-align: -2px; margin-right: 5px;" id="hasPWD" name="paramMap.hasPWD"/>
										设置密码
	  									<span class="fred"><s:fielderror fieldName="paramMap['investPWD']"></s:fielderror></span>
									</td>
								</tr>
							</c:if>
							<tr>
								<td align="right">
									验证码：
								</td>
								<td>
									<input type="text" class="txtmail" name="paramMap.code" id="code"/>
									<img src="" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="52" height="27" onclick="javascript:switchCode()" />
									<span class="fred"><s:fielderror fieldName="paramMap['code']"></s:fielderror></span>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><span class="fred"><s:fielderror fieldName="paramMap['allError']"></s:fielderror></span></td>
							</tr>
							<tr>
								<td></td>
								<td><a id="bcbtn" class="update">发布借款</a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		</form>
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script>
	var flag = true;
	$(function(){
	 var img='${paramMap.imgPath}';
	 if(img=="" ){
		img = "images/default-img.jpg";
	}
	 $('#imgPath').val(img);
	 $("#img").attr("src",img);
     $('#deadLine').val('${paramMap.deadLine}');
     $('#paymentMode').val('${paramMap.paymentMode}');
     $('#raiseTerm').val('${paramMap.raiseTerm}');
     $('#excitation').val('${paramMap.excitationType}');
     $('#excitationMode').val('${paramMap.excitationMode}');
     $('#radioval').val('${paramMap.radioval}');
     $('#detail').val('${paramMap.detail}');
     var excitation = $('#excitation').val();
     var mode = $('#excitationMode').val();
     var radioval = $('#radioval').val();
 	 var purpose = $("#purpose").find("option:selected").val(); 
     
     if(radioval !=''){
          $('#r_'+radioval).attr('checked','true');
          if(radioval ==1){
             $('#tab_1').css('display','block');
          }
          if(radioval ==2){
             $('#tab_2').css('display','block');
             $('#tab_1').css('display','none');
          }
          if(radioval ==3){
             $('#tab_3').css('display','block');
             $('#tab_1').css('display','none');
          }
     }
	//上传图片
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
	 $('#sysimg img').click(function(){
	     $('#imgPath').val($(this).attr('src'));
	     $('#img').attr('src',$(this).attr('src'));
	 });
	 $('#r_1').click(function(){
	     $('#tab_1').css('display','block');
	     $('#tab_2').css('display','none');
	     $('#tab_3').css('display','none');
	     $('#r_1').addClass("C_current4");
	     $('#r_2').removeClass("C_current4");
	     $('#r_3').removeClass("C_current4");
	     $('#radioval').val('1');
	 });
	 $('#r_2').click(function(){
	     var personalImg=$('#personalImg').val();
	     $('#tab_1').css('display','none');
	     $('#tab_2').css('display','block');
	     $('#tab_3').css('display','none');
	     $('#r_1').removeClass("C_current4");
	     $('#r_2').addClass("C_current4");
	     $('#r_3').removeClass("C_current4");
	     $('#radioval').val('2');
	     $('#img').attr('src',personalImg);
	     $('#imgPath').val(personalImg);
	 });
	 $('#r_3').click(function(){
	     $('#tab_1').css('display','none');
	     $('#tab_2').css('display','none');
	     $('#tab_3').css('display','block');
	     $('#r_1').removeClass("C_current4");
	     $('#r_2').removeClass("C_current4");
	     $('#r_3').addClass("C_current4");
	     $('#radioval').val('3');
	 });
	 $('#paymentMode').change(function(){
	     var check = $('#daythe').attr('checked');
	     if(check == true){
	        $('#paymentMode').get(0).selectedIndex = 1;
	     }
	 });
	$('#hasPWD').click(function(){
		var hasPWD = $('#hasPWD').attr('checked');
		if(hasPWD =='checked'){
			$('#investPWD').attr('disabled',false);
		}else{
			$('#investPWD').attr('disabled',true);
		}
		$('#investPWD').val('');
	});
	$('#bcbtn').click(function(){
		if($("#subscribeStatus").val()!=1){
			var arStart = $('#paramMap_minTenderedSum').val();
			var amount = $('#amount').val();
			arStart = parseFloat(arStart);
			amount = parseFloat(amount);
			var arEnd = $('#paramMap_maxTenderedSum').val();
			arEnd = parseFloat(arEnd);
			if(arStart > arStart){
				alert('最多投标金额不能小于最低投标金额!');
				$('#paramMap_maxTenderedSum')[0].selectedIndex = 0;
				return false;
			}
			if(arStart > amount){
				alert('最低投标金额不能超过借款金额!');
				$('#paramMap_minTenderedSum')[0].selectedIndex = 0;
				return false;
			}
			if(arEnd > amount){
				alert('最多投标金额不能超过借款金额!');
				$('#paramMap_maxTenderedSum')[0].selectedIndex = 0;
				return false;
			}
		}
	     if($("#purpose").val() == null || $("#purpose").val() == "") { 
	         alert("必须选择借款目的"); 
	         return false; 
	     }
		//alert("您申请的借款已经提交管理人员进行审核，谢谢！")
		if(flag){
	       $('#form').submit();
	       flag = false;
		}			
	});
    switchCode();
});
	function switchCode(){
		var timenow = new Date();
		$('#codeNum').attr('src','admin/imageCode.do?pageId=borrow&d='+timenow);
	};		
</script>
<script>
	function uploadCall(basepath,fileName,cp){
		if(cp == "img"){
			var path = "upload/"+basepath+"/"+fileName;
			$("#img").attr("src",path);
			$("#setImg").attr("src",path);
			$("#imgPath").val(path);
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
</body>
</html>