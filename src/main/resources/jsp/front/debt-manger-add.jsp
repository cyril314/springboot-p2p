<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!--弹出层-->
<form id="editForm">
<div id="pop2" class="pop2">
	<div class="poptitle" id="title">
		<h2>确定转让</h2>
		<div><a class="close" href="javascript:void();" id="close" title="关闭" onclick="hide('pop2')"></a></div>
	</div>
   <div class="pop_content">
       <table width="100%" class="pop_tab" cellpadding="0" cellspacing="0">
            <tr>
                <td width="25%" align="right"> 竞拍期限：</td>
                <td width="75%">
					<input type="hidden" id="paramMap_auctionDays" class="sel" name="paramMap.auctionDays" value="7" />7天
					<strong style="color: red;"><s:fielderror fieldName="paramMap.auctionDays" /></strong>
				</td>
            </tr>
             <tr>
                <td align="right">已收利息：</td>
                <td>
					<span id="span_hasInterest">${paramMap.hasInterest }</span>元
					<s:hidden id="hasInterest" name="paramMap.hasInterest"></s:hidden>
				</td>
            </tr>
               <tr>
                <td align="right">年收益率：</td>
                <td>
					<span id="span_annualRate">${paramMap.annualRate }</span>%
					<s:hidden id="annualRate" name="paramMap.annualRate"></s:hidden>
				</td>
            </tr>
            <tr>
                <td align="right">债权金额：</td>
                <td>
					<span id="span_debtSum">${paramMap.debtSum }</span>元
					<s:hidden id="debtSum" name="paramMap.debtSum"></s:hidden>
					<s:hidden id="investId" name="paramMap.investId"></s:hidden>
				</td>
            </tr>
            <tr>
                <td align="right">剩余期数：</td>
                <td>
					<span id="span_debtLimit">${paramMap.remainBorrowLimit}/${paramMap.debtLimit}</span>个月
					<input id="debtLimit" name="paramMap.debtLimit" value="${paramMap.debtLimit}" type="hidden" class="txtmail" />
					<input id="remainBorrowLimit" name="paramMap.remainBorrowLimit" value="${paramMap.remainBorrowLimit}" type="hidden" class="txtmail" />
				</td>
            </tr>
            <tr>
                <td align="right">剩余本金：</td>
                <td><!-- 剩余本金=应收本金(recivedPrincipal)-已收本金(hasPrincipal) -->
					<span id='span_remainingPrincipal'>${paramMap.remainingPrincipal }</span>元
					<s:hidden id="remainingPrincipal" name="paramMap.remainingPrincipal"></s:hidden>
				</td>
            </tr><%--
            <tr>
                <td align="right">预期收益：</td>
                <td><!-- 预期收益=应收利息(recievedInterest)-已收利息(hasInterest) -->
					<span id='span_expectedEarnings'>${paramMap.expectedEarnings}</span>
					<s:hidden id="expectedEarnings" name="paramMap.expectedEarnings"></s:hidden>
				</td>
            </tr>
            --%><tr>
                <td align="right"><span class="fred">*</span>转让金额：</td>
                <td>
					<input type="text" class="txtmail" name="paramMap.auctionBasePrice" id="auctionBasePrice" value="${paramMap.auctionBasePrice}" />
					<strong style="color: red;"><s:fielderror fieldName="paramMap.auctionBasePrice" /> </strong>
					<input id="borrowId" name="paramMap.borrowId" value="${paramMap.borrowId }" type="hidden" class="txtmail" />
                </td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span>转让管理费：</td>
                <td><span id="span_moneyFee" ></span></td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span> 转让描述：</td>
                <td>
					<textarea class="areamail" name="paramMap.details">${paramMap.details }</textarea><br />
					<strong style="color: red;"> <s:fielderror fieldName="paramMap.details" /></strong>
				</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                	<input type="button" value="确 认"  id="debt_ok" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/> &nbsp;
                	<input type="button" value="取 消" id="qxtck" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/>
                </td>
            </tr>
        </table>
    </div>    	
</div>
</form>
<!--弹出层 结束-->
<script>
$(function() {
	$("#auctionBasePrice").blur(function(){
			var basePrice = $("#auctionBasePrice").val();
			var re = /^[1-9]+[0-9]*]*$/;
			if (!re.test(basePrice)){alert('请正确输入转让金额!');return false;}  
			var moneyFee= basePrice * 2 /100;  //管理费
	        $("#span_moneyFee").html("");
			$("#span_moneyFee").html(moneyFee);
		});

	$("#debt_cancel").click(function() {
		hide('pop2');
		$("#zrzq_div").attr("style", "display:none");
		$("#editForm")[0].reset();
	});

	$("#qxtck").click(function() {
		hide('pop2');
		$("#zrzq_div").attr("style", "display:none");
		$("#editForm")[0].reset();
	});
	$("#debt_ok").click(function() {
		var para = $("#editForm").serialize();
		var sybj =$("#remainingPrincipal").val();
		var zrje = $("#auctionBasePrice").val();
		if(zrje==""||zrje ==undefined ){alert('请输入转让金额!');return false;}
		var re = /^[1-9]+[0-9]*]*$/;
		if (!re.test(zrje)){alert('请正确输入转让金额!');return false;}  
		if(zrje-sybj>0){alert('转让金额不能大于剩余本金!');return false;}
		
		$.shovePost("addWebAssignmentDebt.do", para, function(data) {			
			if (data == 1) {
				alert("操作成功");
				$("#debt_cancel").click();
				//goUrl('queryCanAssignmentDebtInit.do');
				window.location.href='queryCanAssignmentDebtInit.do';
			} else if (data == -1) {
				alert("操作失败");
				$("#debt_cancel").click();
			} else {
				alert(data.msg);
				//$("#debt_cancel").click();
			}
		});
	});
});
</script>