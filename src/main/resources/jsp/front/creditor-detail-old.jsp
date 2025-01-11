<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
    
</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="ny_main clearfix">
	<!--标的详情 开始-->
	<div class="h_bxq clearfix">
		
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
	
    	<!-- 标的详情 -->
		<div class="h_bxq1 clearfix">
         	 <div class="hot1"></div>
         	 <div class="h_bxq1_left clearfix">
             	<h4>
             		<span style="padding-left: 25px;"></span> <c:out value="paramMap.borrowTitle" default="---" />
             		<c:if test="paramMap.borrowWay == 1"><img src="{ctx}/static/images/C-jin1.png" /></c:if>
					<s:elseif test="paramMap.borrowWay == 3"><img src="{ctx}/static/images/C_xin.jpg" /></s:elseif>
					<s:elseif test="paramMap.borrowWay == 4"><img src="{ctx}/static/images/C_shi.png" /></s:elseif>
					<s:elseif test="paramMap.borrowWay == 5"><img src="{ctx}/static/images/C_dan.png" /></s:elseif>
             		<a href="financeDetail.do?id=${paramMap.borrowId}" target="_blank" class="h_gz">借款详情</a>
             	</h4>
             	
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10px;">
                    <tr style="font-size:16px; height:40px;">
                        <td>债权总额</td>
                        <td>竞拍底价</td>
                        <td>债权期限</td>
                    </tr>
                    <tr style="font-size:18px; color:#ca0000; height:40px;">
                        <td>￥<c:out value="paramMap.debtSum" default="---" /></td>
                        <td>￥<c:out value="paramMap.auctionBasePrice" default="---" /></td>
                        <td><c:out value="paramMap.debtLimit" default="---" />个月</td>
                    </tr>
                    <tr style="height: 40px;">
                        <td>还款方式：
                        	<c:if test="paramMap.paymentMode == 1">按月分期还款</c:if>
							<s:elseif test="paramMap.paymentMode == 2">按月付息,到期还本</s:elseif>
							<s:elseif test="paramMap.paymentMode == 3">秒还</s:elseif>
							<s:elseif test="paramMap.paymentMode == 4">一次性还款</s:elseif>
                        </td>
                        <td>起息时间：满标复审</td>
                      <!-- <td>担保机构：深圳XXXX担保公司</td> --> 
                    </tr>
                </table>
                <h5>审核意见：</h5>
				<div class="h_bxq1_left_txt conter">
                	${paramMap.auditOpinion}
				</div>
                <div onclick="openContent(this)" class="open_c">展开</div>
				<div onclick="closeContent(this)" class="close_c">收起</div>
             </div>
             
			<!-- 投资信息 -->
             <div class="h_bxq1_right clearfix">
             	<h4>投资金额</h4> 
             	<c:if test='%{paramMap.debtStatus!=3 && paramMap.remainDays=="过期"}'>
                 		<p class="hh_p">
							<img src="{ctx}/static/images/tubiao5.png"/>
						</p>
						<ul class="h_bxq1_right1 clearfix">
                 		<br/>
                 		<br/>
                 		<br/>
						<li class="tz_btnli">
							${paramMap.auctionEndTime }结束
							<br/>
							<a class="tz_btn">转让失败</a>
					</li> 
                 	</ul>
             	</c:if>
             	<s:elseif test='%{paramMap.debtStatus==3}'>
             			<p class="hh_p">
							已结束
							<br/>
							成交价：￥<c:out value="paramMap.auctionHighPrice"/>
						</p>
						<ul class="h_bxq1_right1 clearfix">
                 		<br/>
                 		<br/>
						<li class="tz_btnli">
							${paramMap.auctionEndTime }成交
							<br/>
							<a class="tz_btn">转让成功</a>
						</li> 
						</ul>
             	</s:elseif>
             	<s:else>
             		<c:if test="%{#session.user==null}">
		        		<c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
		        			<p class="hh_p">剩余时间：
		        				<span id="remainTimeOne"></span>
								<span id="remainTimeTwo" style="display: none;"></span>		
						 	</p>
		                 	<p class="hh_p1">最高竞价<span id="s_maxAuctionPrice">￥0.00</span></p>
		                 	  		              
		                 	<form id="editForm">
		                 	<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>       
			                 <ul class="h_bxq1_right1 clearfix">
			                    <li>竞拍金额：
			                    	<input type="text" class="test1" style="height:33px;width:142px;" type="text" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionPrice}" maxlength="20" /> 元
			                    	<br/><span id="s_auctionPrice" style="color: red;"></span>
			                    </li>
			                    <li class="money1">
			                        <span>预期收益：<em>￥<span id="debtSum"><c:out value="paramMap.debtSum" default="---" /></span></em></span>
		                        		<input type="hidden" id="debtSum_" value="${paramMap.debtSum}"/>
			                    </li>
			                    <br/>
			                    <li>验证码：&nbsp;&nbsp;&nbsp;
			                    	<input style="height:33px; width:142px;" type="text" class="test1" name="paramMap.code" id="code"/> 
			                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="55" height="33" onclick="javascript:switchCode()" />
			                    	<br/><span id="s_code" style="color: red;"></span>
			                    </li>
			                    <li class="tz_btnli">
			                    	<a href="javascript:void(0)" class="tz_btn" id="btAuctionSave">我要竞价</a>
										<a href="getMessageBytypeId.do?typeId=15" class="hh_yx">查看协议(范本)</a>
			                    </li>		                  
			                 </ul>    
			               </form> 
		        	 </c:if>
	        		</c:if>
	        		<s:else>
				        <c:if test="%{#session.user.id!=paramMap.alienatorId && #session.user.id!=paramMap.borrowerId}">
					        <c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
					        	<p class="hh_p">剩余时间：
			                 		<span id="remainTimeOne"></span>
									<span id="remainTimeTwo" style="display: none;"></span>
							 	</p>
			                 	<p class="hh_p1">最高竞价：<span id="s_maxAuctionPrice">￥0.00</span></p>  		              
			                 	<form id="editForm">
			                 	<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>       
				                 <ul class="h_bxq1_right1 clearfix">
				                    <li>竞拍金额：
				                    	<input type="text" class="test1" type="text" style="height:33px;width:142px;" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionPrice}" maxlength="20" /> 元
				                    	<br/><span id="s_auctionPrice" style="color: red;"></span>
				                    </li>
				                    <li class="money1">
				                        <span>预期收益：<em>￥<span id="debtSum"><c:out value="paramMap.debtSum" default="---" /></span></em></span>
		                        		<input type="hidden" id="debtSum_" value="${paramMap.debtSum}"/>
				                    </li>
				                    <br/>
				                    <li>验证码：&nbsp;&nbsp;&nbsp;
				                    	<input type="text" style="height:33px; width:142px;" class="test1" name="paramMap.code" id="code"/> 
				                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="55" height="33" onclick="javascript:switchCode()" />
				                    	<br/><span id="s_code" style="color: red;"></span>
				                    </li>
				                    <li class="tz_btnli">
				                    	<c:if test="#session.user.type==1">
				                    		<a href="javascript:void(0)" class="tz_btn" id="btAuctionSave">我要竞价</a>
				                    	</c:if>
				                    	<s:else>
				                    		<a href="javascript:void(0)" class="tz_btn">不 可 竞 价</a>
				                    	</s:else>
										<a href="getMessageBytypeId.do?typeId=15" class="hh_yx">查看协议(范本)</a>
				                    </li>		                  
				                 </ul>    
				               </form> 
					        </c:if>
				        </c:if>
				        <s:else>
					        <c:if test='%{paramMap.debtStatus==2&&paramMap.remainDays!="过期"}'>
					        	<p class="hh_p">剩余时间：
			                 		<span id="remainTimeOne"></span>
									<span id="remainTimeTwo" style="display: none;"></span>
							 	</p>
			                 	<p class="hh_p1">最高竞价<span id="s_maxAuctionPrice">￥0.00</span></p>  		              
			                 	<form id="editForm">
			                 	<s:hidden id="debtId" name="paramMap.debtId"></s:hidden>       
				                 <ul class="h_bxq1_right1 clearfix">
				                    <li>竞拍金额：
				                    	<input type="text" class="test1" style="height:33px;width:142px;" type="text" id="auctionPrice" name="paramMap.auctionPrice" value="${paramMap.auctionPrice}" maxlength="20" disabled="disabled"/> 元
				                    	<br/><span id="s_auctionPrice" style="color: red;"></span>
				                    </li>
				                    <li class="money1">
				                        <span>预期收益：<em>￥<c:out value="paramMap.debtSum" default="---"/></em></span>
		                        		<input type="hidden" id="debtSum_" value="${paramMap.debtSum}"/>
				                    </li>
				                    <br/>
				                    <li>&nbsp;验&nbsp;证&nbsp;码：
				                    	<input type="text" style="height:33px; width:142px;" class="test1" name="paramMap.code" id="code"/> 
				                    	<img src="admin/imageCode.do?pageId=auction" title="点击更换验证码" style="cursor: pointer;" id="codeNum" width="55" height="33" onclick="javascript:switchCode()" />
				                    	<br/><span id="s_code" style="color: red;"></span>
				                    </li>
				                    <li class="tz_btnli">
				                    	<a href="javascript:void(0)" class="tz_btn" id="btAuctionSave">我要竞价</a>
										<a href="getMessageBytypeId.do?typeId=15" class="hh_yx">查看协议(范本)</a>
				                    </li>		                  
				                 </ul>    
				               </form> 
					        </c:if>
				        </s:else>
		        	</s:else>
             	</s:else> 	 
             </div>
	</div> 
	<!-- 结束 -->
    		
    	 <span id="borrow_detail">
			<img src="{ctx}/static/images/load.gif" class="load" alt="加载中..." />
		</span>
         

         <!--基本信息 开始-->
         <div class="hh_jkxx clearfix">
         	 <div class="jk_tit tab_meun">
             	  <ul>
                  	   <li id="AuctionRecord" class="on" onclick="queryAuctionRecord();">竞拍记录</li>
                       <li id="MsgRecod" class="" onclick="queryMsgRecod();">留言板</li>	
                  </ul>
             </div>
             
             <div class="jk_content tab_content clearfix">	
             	  <!-- 竞拍记录显示 -->	
                  <div id="auctionStatus" class="hide"></div>
                               
                  <!--留言记录-->
             	  <div id="msgStatus" class="hide">
             	  	
             	  </div>

				 <!-- 发布留言 -->
				 <div id="addMsg" class="hide">
					 <div id="msgadd" class="ly clearfix">
			             <p>咨询或评论：(字数在1-120之间)</p>
			             <textarea id="msgContent"></textarea>
			             <p class="ly_y">验证码：
			             		<input type="text" class="test" name="paramMap.code" id="code1"/>
			                 	<img title="点击更换验证码" src="" style="margin-left:5px;cursor: pointer;" id="codeNum1"  onclick="javascript:switchCode1()"/>
			             </p>
			             <p><input id="savetbn" type="button" value="提 交" class="ly_btn" /></p>
			       	</div>
			     </div>    
             	
             </div>
         </div>	
         <!--基本信息 结束-->	
         
         
    </div>
    <!--标的详情 结束-->
    
    <div id="remainSeconds" style="display: none;">
		${paramMap.remainSeconds}
	</div>
</div>    
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>

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
		 $.shovePost("queryDebtBorrowDetail.do",param,function(data){
		 	$("#borrow_detail").html(data);
		 });
	
		
		//查询竞拍记录
		queryAuctionRecord();
	});	
	
	     
</script>


<script>
	//查询竞拍记录
	function queryAuctionRecord(){
		var para = {};
	 	para['paramMap.id']= $("#debtId2").val();
	 	//if($("#auctionMode").val() == 1){	
		 	 $.shovePost('queryAcutionRecordInfo.do',para,function(data){
				   $('#auctionStatus').html(data);
		    });
		//}else{
	 	//	$('#auctionStatus').html("");
	 	//}
		
		$("#addMsg").attr('class','hide');
	 	$("#AuctionRecord").attr("class","on");
		$("#MsgRecod").attr("class","");
		$("#auctionStatus").attr("class","");
		$("#msgStatus").attr("class","hide");
	}

	//查询留言记录
	function queryMsgRecod(){
		$("#addMsg").attr('class','');
		$("#AuctionRecord").attr("class","");
		$("#MsgRecod").attr("class","on");
		$("#auctionStatus").attr("class","hide");
		
		param['paramMap.id']= $("#debtId2").val();
	    $.shovePost('debtMSGInit.do',param,function(data){
			   $('#msgStatus').html(data);
	    });
	    $("#msgStatus").attr("class","");
		
	}
</script>


<script type="text/javascript">
var flag = true;
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
	   	 var param = $("#editForm").serializeArray();
	     if(flag){
	     flag=false;
	     $.shovePost("addAuctingDebt.do?showDate"+new Date().getTime(),param,function(data){
		  	if(data == "virtual"){
					window.location.href = "noPermission.do";
					return ;
	     	}
		  	if(data == 1){
		  		alert("竞拍成功");
		  		location.reload();
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
	$("#auctionPrice").blur(function(){
		var auctionPrice = $("#auctionPrice").val();
		if(auctionPrice == ""){
	 		$("#s_auctionPrice").html("竞价不能为空！");
	 	}else{
		 	if(isNaN(auctionPrice)) {
		 		$("#s_auctionPrice").html("请输入正确的金额！");
			} else {
				$("#s_auctionPrice").html("");
				$("#debtSum").html(($("#debtSum_").val() - auctionPrice).toFixed(2));
			}
	 	}
	});
	
	
	$("#code").blur(function(){
		if($("#code").val() == ""){
	 		$("#s_code").html("验证码不能为空！");
	 	}else{
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
