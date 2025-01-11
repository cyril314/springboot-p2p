<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	
   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
</head>

<body>

<jsp:include page="../include/top.jsp"></jsp:include>

<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
		<!-- left.jsp -->
		 <%@include file="../include/dun-left.jsp" %>
		 <!--右 开始-->
        <div class="myhome_r clearfix">
        	<!--标题 开始-->
		    <div class="ny_tit">
            	<ul>
                	<li class="on">充值提现</li>
                </ul>
            </div>
            <!--标题 结束-->
            <!--内容 开始-->	
            <div class="rz_content clearfix">
					 <!--账户概况 开始-->	
                     <div class="hh_zh">
                       
                          <ul class="zh_ul" style="padding-top:40px;">
                              <li>账户余额 : <span>￥<c:out value="#request.usableSum" default="0.00" ></s:property></span></li>
                          </ul>
                          <div class="zh_btn">
                              <a href="javascript:jumpUrl('rechargeInit.do');" class="zh_cz">充 值</a>
                              <a href="javascript:jumpUrl('withdrawLoad.do');" class="zh_tx">提 现</a>
                          </div>
                     </div>
                     <!--账户概况 结束-->
                     <div class="tips clearfix">
                          <dl class="h_srch clearfix">
                             <dt>起止日期：</dt>
                             <dd><input class="test" id="startTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/> - <input id="endTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" class="test" /></dd>
                            
                             <dd> <a href="javascript:void(0)" class="cxbtn" onclick="fundRecordList();">查询</a></dd>
                          </dl>	
                          <div  id="dlid">
                          <dl class="h_srch clearfix">
                             <dt>交易类型：</dt>
                             <%--<dd><a class="on">全部</a></dd>--%>
                             <dd><a href="javascript:rechargeInfo();" >充值</a></dd>
                             <dd><a href="javascript:withdrawInfo();">提现</a></dd>
                          </dl>	
                          </div>
                      </div>	
                      <p style="text-align:right; padding:5px 0;"><em class="execl">导出excel</em></p>
                      
                      <div class="biaoge" id="fundRecord">
        			  </div> 
                     
            </div>	
            <!--内容 结束-->
        </div>
        <!--右 结束-->
    </div>	
</div>    

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script>
$(function(){
//样式选中
 	  dqzt(6,'t06');
      $("#zh_hover").attr('class','nav_first');
     
      rechargeInfo();
		 

	     
     });
          
       function jumpUrl(obj){
          window.location.href=obj;
       }
    
</script>
<script>
function rechargeInfo(){
	$('#dlid > dl > dd > a').removeClass("on");
	$('#dlid > dl > dd > a').eq(0).addClass("on");
	param["paramMap.state"] = 1;
	param["pageBean.pageNum"] = 1;
	$.shovePost("queryFundrecordList.do",param,initCallBack);
}
function initCallBack(data){
	$("#fundRecord").html(data);
}

function withdrawInfo(){
	$('#dlid > dl > dd > a').removeClass("on");
	$('#dlid > dl > dd > a').eq(1).addClass("on");
	param["pageBean.pageNum"] = 1;
	$.shovePost("queryWithdrawList.do",param,initCallBack);
}


function fundRecordList(){
  if($("#startTime").val()!="" && $("#endTime").val()!=""){
        if($("#startTime").val() >$("#endTime").val() ){
         alert("结束日期要大于开始日期");
         return;
      }
  }
  param["paramMap.state"] = 1;
  param["pageBean.pageNum"] = 1;
  param["paramMap.startTime"]=$("#startTime").val();
  param["paramMap.endTime"]=$("#endTime").val();
  param["paramMap.momeyType"]=$("#momeyType").val();
  $.shovePost("queryFundrecordList.do",param,function(data){
     $("#fundRecord").html(data);
  });
}

</script>
</body>
</html>
