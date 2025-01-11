<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>

<script type="text/javascript">  
    $(document).ready(function(){ 
    	$("#tyjOJg").change(function(){ 
	        var val = $("#tyjOJg").find("option:selected").val();//选中的值
	        tyjChange(val);
    	});
    	var radioVal = $("#tyjHiddenRadio").val();
      	//是否开启
		if(radioVal == "1"){
        	$("#tyjRadioYes").attr("checked",true); 
        }else{
        	$("#tyjRadioNo").attr("checked",true); 
        }
        //触发修改是否开启
		$("input[name='tyjRadio']").change(function() {
			var tyjRadio = $(this).val();
			if(tyjRadio == 1){
				$("#tyjRadioYes").attr("checked",true);
				$("#tyjRadioNo").removeAttr("checked");
			}else{
				$("#tyjRadioYes").removeAttr("checked");
				$("#tyjRadioNo").attr("checked",true);
			}
		});
		var tyjSelect = '${paramMap.experName}';
		if(tyjSelect == "register"){
        	$("#SoRegister").attr("selected",true); 
        }else if(tyjSelect == "approve"){
        	$("#SoApprove").attr("selected",true); 
        }else{
        	$("#SoNull").attr("selected",true);
        }
    })
</script> 
<!-- 内容显示位置 -->
<input type="hidden" id="tyjHiddenRadio" value="${paramMap.isUse }" />
<table width="50%" border="0" cellspacing="1" cellpadding="3" align="center">
	<tr style="height: 20px;"></tr>
	<tr>
		<td style="width: 100px; height: 25px;" align="right" class="blue12">体验类型名称：</td>
		<td align="left" class="f66">
			<select name="tyjOJg" id="tyjOJg">
				<option id="SoNull" value ="">请&nbsp;选&nbsp;择</option>    
		        <option id="SoRegister" value ="register">用户注册</option>  
		        <option id="SoApprove" value ="approve">实名认证</option>  
		    </select>
		</td>
	</tr>
	<tr>
		<td style="width: 100px; height: 25px;" align="right" class="blue12">体验截至天数：</td>
		<td align="left" class="f66">
			<input id="pastTime" name="paramMap.pastTime" value="${paramMap.pastTime }" onkeyup="limitInput(this.id);"/>
			<span>*最大天数为60天</span>
		</td>
	</tr>	
		<tr>
		<td style="width: 100px; height: 25px;" align="right" class="blue12">体验金额大小：</td>
		<td align="left" class="f66">
			<input id="money" name="paramMap.money" value="${paramMap.money }" onkeyup="limitInput(this.id);"/>
			<span>*最大金额为50万，请输入10的倍数</span>
		</td>
	</tr>	
	<tr>
		<td style="width: 100px; height: 25px;" align="right" class="blue12">是否启用中：</td>
		<td align="left" class="f66">
			<input type="radio" id="tyjRadioYes" name="tyjRadio" value="1" />是
			<input type="radio" id="tyjRadioNo" name="tyjRadio" value="0" />否
		</td>
	</tr>	
	<tr>
		<td height="36" align="right" class="blue12"><s:hidden name="action"></s:hidden>&nbsp;</td>
		<td>
			<button id="btn_tijiao"	style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; height: 26px; border: 0px"></button>
			&nbsp; &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<img id="img" src="static/images/NoImg.GIF" style="display: none; width: 100px; height: 100px;" />
		</td>
	</tr>
</table>
<br />
<script>
//提交操作
$(function() {
	$('#btn_tijiao').click(function() {
		$("#btn_tijiao").attr("disabled", true);
		var param = {};
		param["paramMap.selId"] = '${paramMap.id}';
		param["paramMap.selTyjOJg"] = $("#tyjOJg").find("option:selected").val();
		param["paramMap.selPastTime"] = $("#pastTime").val();
		param["paramMap.selMoney"] = $("#money").val();
		param["paramMap.selRaido"] = $("input[type=radio][checked]").val();
		param["paramMap.selBorrowWay"] = '${paramMap.borrowWay}';

		$.post("updatePromotions.do", param, function(data) {
			var callBack = data.msg;
			if (callBack == 1) {
				alert("操作成功!");
				window.location.reload();
				return false;
			}else if (callBack == undefined || callBack == '') {
				alert(data.msg);
				$('#showcontent').html(data);
				return false;
			}else{
				alert(data.msg);
				return false;
			}
		});
	});
});
</script>