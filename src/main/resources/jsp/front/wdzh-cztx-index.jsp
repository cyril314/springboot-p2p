<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <jsp:include page="../include/head.jsp"></jsp:include>
   <script>

   </script>
</head>

<body>


<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
			<!-- 引用会员后台头部公共部分 -->
			<%@include file="../include/userTop.jsp"%>
			<div class="acc_content" style="margin-top:20px">
				<!-- 引用左边公共部分 -->
				<%@include file="../include/left.jsp"%>
				
				<div class="acc_all">
  <div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置： <a href="queryFundrecordInit.do">资金管理</a> > 充值提现</div>
  <div class="cztx_top p10"> 账户余额：<span>￥<c:out value="#request.usableSum" default="0.00" ></s:property></span>
  <input type="button" value="充值" class="btnsure" onClick="javascript:jumpUrl('rechargeInit.do');" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'" />
  <input type="button" value="提现" class="btnsure" onClick="javascript:jumpUrl('withdrawLoad.do');" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'" />
   </div>
    <div id="acc_tabs">
      <div class="title"> 
          <a href="javascript:rechargeInfo();" id="recharge" >充值</a> 
          <a href="javascript:withdrawInfo();" id="withdraw" >提现</a> 
          <div class="cztx_time">起止时间: <input type="text" id="startTime" class="txttime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>---<input type="text" id="endTime" class="txttime"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
          <input type="button" value="查询" class="btnsure" onclick="fundRecordList();" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'" />
          <input type="button" class="btnexcel" onmouseover="this.className='btnexcelhover'" onclick="excelout()" onmouseout="this.className='btnexcel'" />
          </div>
      </div>
      <div id="fundRecord" >
      </div>     
    </div>
</div>

<script type="text/javascript">
$(function(){
		//样式选中
		dqzt(6,'t06');
		$("#zh_hover").attr('class','nav_first');
		rechargeInfo();
		
	});
function rechargeInfo(){
	$('#withdraw').removeClass("on");
	$('#recharge').addClass("on");
	param["paramMap.state"] = 1;
	param["pageBean.pageNum"] = 1;
	$.shovePost("queryRechargeRecordList.do",param,initCallBack);
	tab();
}
function initCallBack(data){
	$("#fundRecord").html(data);
}
function withdrawInfo(){
	$('#recharge').removeClass("on");
	$('#withdraw').addClass("on");
	param["pageBean.pageNum"] = 1;
	$.shovePost("queryWithdrawList.do",param,initCallBack);
	tab();
}
<!--表格隔行换色 js--> 

function tab() {
	$("#tab tbody tr:odd").addClass("t2");
	$("#tab tbody tr:even").addClass("t1");
}
  window.onload=tab;

 function jumpUrl(obj){
        window.location.href=obj;
     }
     
     function fundRecordList(){
  if($("#startTime").val()!="" && $("#endTime").val()!=""){
        if($("#startTime").val() >$("#endTime").val() ){
         alert("结束日期要大于开始日期");
         return;
      }
     
  }
  param["pageBean.pageNum"] = 1;
  param["paramMap.startTime"]=$("#startTime").val();
  param["paramMap.endTime"]=$("#endTime").val();
  param["paramMap.momeyType"]=$("#momeyType").val();

	if($("#recharge").attr("class")=="on"){
		  $.shovePost("queryRechargeRecordList.do",param,function(data){
		     $("#fundRecord").html(data);
		  });
	}else{
		$.shovePost("queryWithdrawList.do",param,function(data){
		     $("#fundRecord").html(data);
		  });
	}
}

function excelout()
{
	var t = 2;
	if($("#recharge").attr("class")=="on"){
		t = 1;
		window.location.href=encodeURI(encodeURI("exportRecharge.do?startTime="+$("#startTime").val()+"&&endTime="+$("#endTime").val())); 
	}else{
		window.location.href=encodeURI(encodeURI("exportWithdraw.do?startTime="+$("#startTime").val()+"&&endTime="+$("#endTime").val())); 
	}
}


</script>
		
				</div>
</div>


<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>

</body>
</html>
