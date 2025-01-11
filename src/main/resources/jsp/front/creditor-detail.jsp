<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style type="text/css">body{ background: #DFDFDF;}
    .btnykj{ float:left; width:189px; height:41px; background:url(images/inmesykj.jpg) no-repeat; cursor:pointer}
	.btnykj:hover{float:left; width:189px; height:41px; background:url(images/inmesykjhover.jpg) no-repeat; cursor:pointer}
    </style>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!--投资详情 start-->
<div class="inmes">
<s:hidden id="debtId2" name="paramMap.debtId"></s:hidden>
<!-- 转让状态 -->
<s:hidden id="debtStatus" name="paramMap.debtStatus"></s:hidden>
<!-- 剩余天数 -->
<s:hidden id="remainDays" name="paramMap.remainDays"></s:hidden>
<!-- 最高竞价 -->
<s:hidden id="maxAuctionPrice" name="paramMap.maxAuctionPrice"></s:hidden>
<!-- 竞拍模式 -->
<s:hidden id="auctionMode" name="paramMap.auctionMode"></s:hidden>
<!-- 竞拍人次 -->
<s:hidden id="auctionCount" name="paramMap.auctionCount"></s:hidden>
  <div class="center">
    <div class="inmes_all" id="in_money">
      <div class="inmes_top">
       <!-- 2014-12-17李丹丹 图片之前用的是一个字 ，领导决定改成两字的图片   start -->
		<c:if test="paramMap.borrowWay == 1"><img src="{ctx}/static/images/bid_purge.png"  width="53"/></c:if>
		<s:elseif test="paramMap.borrowWay == 3"><img src="{ctx}/static/images/bid_credit.png" width="53" /></s:elseif>
		<s:elseif test="paramMap.borrowWay == 4"><img src="{ctx}/static/images/bid_indeed.png"  width="53"/></s:elseif>
		<s:elseif test="paramMap.borrowWay == 5"><img src="{ctx}/static/images/bid_warrant.png" width="53"/></s:elseif>
		<s:elseif test="paramMap.borrowWay==7">
			<img src="{ctx}/static/images/bid_dy.png" width="53"/><!-- 抵押图片 -->
		</s:elseif>
		<s:elseif test="paramMap.borrowWay==8">
			<img src="{ctx}/static/images/bid_mq.png" width="53"/><!-- 名企图片 -->
		</s:elseif>
		<s:elseif test="paramMap.borrowWay==9">
			<img src="{ctx}/static/images/bid_day.png" width="53"/><!-- 过桥图片 -->
		</s:elseif>
		<!-- 2014-12-17李丹丹 图片之前用的是一个字 ，领导决定改成两字的图片   start-->
      	&nbsp;转让描述：<shove:sub value="paramMap.details" suffix="..."size="40" />
      	<div class="right" style="margin-right: 20px;"><a href="financeDetail.do?id=${paramMap.borrowId}" target="_blank">借款详情>></a></div>
      </div>
      <div class="inmesl left">
        <table width="100%" >
          <tr style="margin-top: -5px;">
	            <td align="right">剩余本金(元)：</td>
	            <td ><span>￥<c:out value="paramMap.qirRemainprincipal" default="---" /></span> </td>
	            <td align="right">转让价(元)：</td>
	            <td ><span>￥<c:out value="paramMap.auctionBasePrice" default="---" /></span></td>
	            
          </tr>
          <tr>
	           <td align="right">剩余期数(月)：</td>
	           <td ><span><c:out value="paramMap.repayPeriod" default="---" /></span></td>
               <td align="right">还款方式：</td>
               <td>
           		<c:if test="paramMap.paymentMode == 1">等额本息</c:if><!--  原文字描述：按月分期还款二〇一五年一月五日 修改 -->
				<s:elseif test="paramMap.paymentMode == 2">按月付息,到期还本</s:elseif>
				<s:elseif test="paramMap.paymentMode == 3">秒还</s:elseif>
				<s:elseif test="paramMap.paymentMode == 4">一次性还款</s:elseif>
			   </td>
			</tr>
			<tr>
			<td align="right">下次还款时间：</td>
            <td colspan="3"><c:out value="paramMap.nextTimeRefund" default="---" /></td>
          </tr>
          </table>
          <table style="width: 100%;border:0; margin-top: -10px;">
          <tr>
            <td colspan="2" align="center">
             <div id="borrow_detail"><img src="{ctx}/static/images/load.gif" class="load" alt="加载中..." />  </div>
            </td>
          </tr>
        </table>
      </div>
      <div class="inmesr left">
        <!-- 投资信息 -->
        <c:if test='%{paramMap.debtStatus!=3 && paramMap.remainDays=="过期"}'><!-- 如果转让状态不等于3并且转让时间等于过期 -->
        	<table style="font-size: 14px; height: 30px; line-height: 30px;">
          		<tr>
					<td>${paramMap.auctionEndTime }结束	<br/>
						<a class="tz_btn">转让失败</a>
					</td>
				</tr>
		    </table>
        </c:if>
        <s:elseif test='%{paramMap.debtStatus==3}'><!-- 转让状态等于3则转让成功 -->
        	<table style="font-size: 14px; height: 30px; line-height: 30px;">
          		<tr><td>已结束</td></tr>
          		<tr><td>成交价：￥<c:out value="paramMap.auctionHighPrice"/></td></tr>
				<tr><td>${paramMap.auctionEndTime }成交</td>	</tr>
				<tr><td><input type="button" class="btnbtb" value="转让成功" /></td></tr>
			</table>
        </s:elseif>
       	<s:else>
        	<c:if test="%{#session.user==null}">
		    	<c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
		       		<table style="line-height:30px; width: 340px; margin: 10px 0 0 40px;">
		       			<tr>
			                <%--<td>最高竞价:<span id="s_maxAuctionPrice">￥0.00</span></td>
		                    --%><td>预期收益：￥<span id="debtSum" style="font-size: 50px;"><c:out value="paramMap.debtSum" default="---" /></span>元
		                       	<input type="hidden" id="debtSum_" value="${paramMap.remainprincipal}"/>
		                    </td>
			            </tr>
		       		    <tr>
			       			<td colspan="2">剩余时间：<span id="remainTimeOne"></span>
								<span id="remainTimeTwo" style="display: none;"></span>		
						 	</td>
					 	</tr>
					</table>
		            <form id="editForm">
		            	<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>
		                <table style="margin-top: 0">
		                 	<tr>
			                    <td align="right">转让金额：</td>
			                    <td>
			                    	<c:out value="paramMap.auctionBasePrice" default="---" />
	                    			<input type="hidden" class="test" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionBasePrice}" maxlength="20" readonly="readonly" /> 元
			                    </td>
			                </tr>
			                <tr>
			                    <td align="right">验证码：</td>
			                    <td>
			                    	<input type="text" class="test" name="paramMap.code" id="code" maxlength="4" /> 
			                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="65" height="20" onclick="javascript:switchCode()" />
			                    </td>
			                 </tr>
			                 <tr>
			                 	<td height="20" align="right"><span style="color: red;">提示信息：</span></td>
			                 	<td><span id="s_auctionPrice" style="color: red;"></span><span id="s_code" style="color: red;"></span></td>
			                 </tr>
			                 <tr>
			                    <td colspan="2" align="center">
			                    	<a href="javascript:void(0)" class="btnykj" id="btAuctionSave"></a>
			                    </td>		                  
		                 	</tr>
		                </table>    
		            </form> 
		       	 </c:if>
      		</c:if>
      		<s:else>
		        <c:if test="%{#session.user.id!=paramMap.alienatorId && #session.user.id!=paramMap.borrowerId}">
			        <c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
			        <table style="line-height:30px; width: 340px; margin: 10px 0 0 40px;">
					 	<tr>
		                 	<%--<td>最高竞价：<span id="s_maxAuctionPrice">￥0.00</span></td>
		                    --%>
		                    <td>预期收益：￥<span id="debtSum" style="font-size: 50px;"><c:out value="paramMap.debtSum" default="---" /></span>元
		                    	<input type="hidden" id="debtSum_" value="${paramMap.remainprincipal}"/>
		                    </td>
			             </tr>	
			            <tr>
				        	<td colspan="2">剩余时间：<span id="remainTimeOne"></span>
								<span id="remainTimeTwo" style="display: none;"></span>
						 	</td>
					 	</tr>
	                 </table>	              
	                 	<form id="editForm">
	                 		<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>
		                 	<table style="margin-top: 0">
		                 	  <tr>
			                    <td align="right">转让金额：</td>
			                    <td>
			                    	<c:out value="paramMap.auctionBasePrice" default="---" />
	                    			<input type="hidden" class="test" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionBasePrice}" maxlength="20" readonly="readonly" /> 元
			                    </td>
			                  </tr>
			                  <tr>
			                    <td align="right">验证码：</td>
			                    <td><input type="text" class="test" name="paramMap.code" id="code" maxlength="4" /> 
			                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="65" height="20" onclick="javascript:switchCode()" />
			                    </td>
			                  </tr>
			                  <tr>
			                  	<td height="20" align="right"><span style="color: red;">提示信息：</span></td>
			                  	<td><span id="s_auctionPrice" style="color: red;"></span><span id="s_code" style="color: red;"></span></td>
			                  </tr>
			                  <tr>
			                    <c:if test="#session.user.type==1">
			                    	<td colspan="2" align="center" ><a href="javascript:void(0)" class="btnykj" id="btAuctionSave"></a></td>
			                    </c:if>
			                    <s:else>
			                    	<td colspan="2" align="center"><input type="button" value="不可竞价" class="btnbtb"/></td>
			                    </s:else>
			                  </tr>		                  
		                 	</table>    
		               </form> 
			        </c:if>
		        </c:if>
	        <s:else>
		        <c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
		        <table style="line-height:30px; width: 340px; margin: 10px 0 0 40px;">
		        <tr>
				    <%--<td>最高竞价:<span id="s_maxAuctionPrice">￥0.00</span></td> 
				    --%><td>预期收益：￥<span id="debtSum" style="font-size: 50px;"><c:out value="paramMap.debtSum" default="---" /></span>元
	                    <input type="hidden" id="debtSum_" value="${paramMap.remainprincipal}" />
		            </td>
			     </tr>
			     <tr>
	                <td colspan="2">剩余时间：<span id="remainTimeOne"></span>
						<span id="remainTimeTwo" style="display: none;"></span>
				    </td>
	             </tr>
	            </table> 		              
               	<form id="editForm">
               		<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>
               		<table style="margin-top: 0">
               		<tr>  
	                    <td align="right">转让金额：</td>
	                    <td>
	                    	<c:out value="paramMap.auctionBasePrice" default="---" />
	                    	<input type="hidden" class="test" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionBasePrice}" maxlength="20" readonly="readonly" /> 元
	                    </td>
                    </tr>
                    <tr>
                    <td align="right">验证码：</td>
                    <td><input type="text" class="test" name="paramMap.code" id="code" maxlength="4" /> 
                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="65" height="20" onclick="javascript:switchCode()" />
                    </td>
                    </tr>
                    <tr>
                    	<td height="20" align="right"><span style="color: red;">提示信息：</span></td>
                    	<td><span id="s_auctionPrice" style="color: red;"></span><span id="s_code" style="color: red;"></span></td>
                    </tr> 
                    <tr>
                      <td colspan="2" align="center" ><a href="javascript:void(0)" class="btnykj" id="btAuctionSave"></a></td>
                    </tr>		                  
                    </table>    
                   </form> 
		        </c:if>
	        </s:else>
       	</s:else>
   	</s:else>
	</div> 
   	<div class="clear"></div>	 
	<!-- 结束 -->
    </div>
	    <div class="mt20 mb20" style="border:0;" id="record">
	     <div id="tabs1" style="background: none; border: none;">
	      <!-- 竞拍记录列表改为原始借款标详情 -->
	      <div id="auctionStatus" class="tzlist" style="overflow: hidden;"></div>
	  	 </div>
	 		<!-- 用于获取剩余时间 -->
	  		<div id="remainSeconds" style="display: none;">${paramMap.remainSeconds}</div>
		</div>
		<div class="clear"></div>
    </div>
</div>
<!--投资详情 end-->
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/raphael-min.js"></script> <!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/round-little.js"></script><!--百分比 js-->
<script>
	$(function(){
	    //样式选中
	     $("#zq_hover").attr('class','nav_first');
		 $("#zq_hover div").removeClass('none');
		  
		 if($("#debtStatus").val() != 2){
		 	$("#span_remainDays").html("");
		 }
		 var param = {};
		 param["id"] = '${paramMap.borrowId}';
		 param["userId"]='${zqUser}';
		 param["uName"]='${uName}';
		 $.shovePost("queryDebtBorrowDetail.do",param,function(data){
		 	$("#borrow_detail").html(data);
		 });
		 $("#auctionPrice").focus();
		 $("#auctionPrice").blur();
		//查询竞拍记录
		queryAuctionRecord();
	});	
</script>
<script>
	//借款人详情 
	function queryAuctionRecord(){
		var para = {};
	 	para["id"]= '${paramMap.borrowId}';
		$.shovePost('queryCreditorBorrow.do',para,function(data){
			$('#auctionStatus').html(data);
		});
	}
</script>
<script type="text/javascript">
var flag = true;
var AwdeDebtId = '${paramMap.debtId}';
var AwdeUserId = '${zqUser}';
$(function(){
	//我要竞价
	$('#btAuctionSave').click(function(){
	 	if($("#auctionPrice").val() == ""){
	 		$("#s_auctionPrice").html("竞价不能为空！");
	 		return;
	 	}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#auctionPrice").val())){
	 		$("#s_auctionPrice").html("竞价格式不正确！");
	 	}else if($("#code").val() == ""){
	 		$("#s_code").html("验证码不能为空！");
	 		return;
	 	}
	 	var param ={};
		param = $("#editForm").serializeArray();
	    if(flag){
	    flag=false;
	    $.shovePost("addAuctingDebt.do?showDate"+new Date().getTime(),param,function(data){
			if(data == "virtual"){
				window.location.href = "noPermission.do";
				return ;
	     	}
		  	if(data == 1){
		  		$.post("auctingWebDebtEnd.do?debtId="+AwdeDebtId+"&uId="+AwdeUserId);
		  		alert("购买成功");//竞拍->购买
		  		window.location.reload();
		  	}else if(data == -1){
		  	   flag=true;
		  		alert("验证码错误");
		  	}else if(data == -2){
		  	    flag=true;
		  		alert("不能投自己转让的的债权");
		  	}else if(data == -4){
		  	    flag=true;
		  		alert("可用余额不足");
		  	}else if(data == -5){
		  	     flag=true;
		  		alert("竞拍金额不能大于债权总额");
		  	}else if(data == -6){
		  	    flag=true;
		  		alert("竞拍金额不能小于转让者设置的最小竞拍金额");
		  	}else if(data == -7){
		  	    flag=true;
		  		alert("竞拍失败");
		  	}else if(data == -8){
		  	     flag=true;
		  		alert("对不起，该债权您只能竞拍两次!");
		  	}else if(data == -9){
		       	flag=true;
		  		alert("借款者不能竞拍该债权");
		  	}else if(data == -10){
		  	    flag=true;
		  		alert("第二次竞拍金额应大于第一次竞拍金额");
		  	}else if(data == -11){
		  	    flag=true;
		  		alert("竞拍金额要大于最高竞拍金额");
		  	}else if(data.ret == -99){
		  		alert(data.msg);
		  	      flag=true;
		  	}else{
		  	      flag=true;
		  		$("#div_editform").html(data);
		  	}
		    switchCode();
		 });
	 }
 });
 switchCode();
});

function switchCode(){
    var timenow = new Date();
    $('#codeNum').attr('src','admin/imageCode.do?pageId=auction&d='+timenow);
};	
</script>
<script>
//失去焦点事件
$("#auctionPrice").blur(function() {
		var auctionPrice = $("#auctionPrice").val();
		if (auctionPrice == "") {
			$("#s_auctionPrice").html("竞价不能为空！");
		} else {
			if (isNaN(auctionPrice)) {
				$("#s_auctionPrice").html("请输入正确的金额！");
			} else {
				$("#s_auctionPrice").html("");
				$("#debtSum").html(($("#debtSum_").val() - auctionPrice + ${paramMap.remaininterest}).toFixed(2));
			}
		}
	});

$("#code").blur(function() {
	if ($("#code").val() == "") {
		$("#s_code").html("验证码不能为空！");
	} else {
		$("#s_code").html("");
	}
});
</script>
<script type="text/javascript">
	//倒计时
	var SysSecond;
	var InterValObj;
	$(document).ready(function() {
		SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间 
		InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行 
	});
	
	//将时间减去1秒，计算天、时、分、秒 
	function SetRemainTime() {
		if (SysSecond > 0) {
			SysSecond = SysSecond - 1;
			var second = Math.floor(SysSecond % 60); // 计算秒     
			var minite = Math.floor((SysSecond / 60) % 60); //计算分 
			var hour = Math.floor((SysSecond / 3600) % 24); //计算小时 
			var day = Math.floor((SysSecond / 3600) / 24); //计算天 
			var times = day + "天" + hour + "小时" + minite + "分" + second + "秒";
			$("#remainTimeOne").html(times);
			$("#remainTimeTwo").html(times);
		} else {//剩余时间小于或等于0的时候，就停止间隔函数 
			window.clearInterval(InterValObj);
			//这里可以添加倒计时时间为0后需要执行的事件 
		}
	}
</script>
</body>
</html>
