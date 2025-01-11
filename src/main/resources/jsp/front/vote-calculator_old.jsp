<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="C_content1 ">
	<div class="C_content  C_content2  layout" >
    	<div class="C_xazq">
        	
        	<div class="ny_tit" style="height:35px;line-height: 35px;">
	        	<h2>收益计算器</h2>
	       		<a href="javascript:history.go(-1);" class="h_back" style="margin-top: 5px;">返回</a>
        	</div>
           	<div class="C_jsq">
            	<div class="C_jsq1">
                    <table cellpadding="0" cellspacing="0">
                    	<tr>
                        	<td style="width:140px;">
                            	<input type="radio" class="C_radiio_1" id="month1" name="checked"/><em onclick="check(1)">按月等额本息</em>
                               
                            </td>
                            <td style="width:170px;">
                            	
                                <input type="radio" class="C_radiio_1" id="month2" name="checked"/><em onclick="check(2)">按月付息，到期还本</em>
                                
                            </td>
                            <td >
                            	
                                <input type="radio" class="C_radiio_1" id="allrepay" name="checked"/><em onclick="check(3)">一次性还本付息</em>
                            </td>
                        </tr>
                        <tr>
                        	<td class="C_ts_td">投资金额：</td>
                            <td><input id="investSum" type="text" class="C_input_fbjk" /></td>
                            <td></td>
                            <td><span style="color: red;font-size: 12px;" id="s_investSum"></span></td>
                        </tr>
                        <tr>
                        	<td class="C_ts_td">年利率：</td>
                            <td><input id="yearRate" type="text" class="C_input_fbjk" /></td>                   
                            <td>%</td>
                            <td><span style="color: red;font-size: 12px;" id="s_yearRate"></span></td>
                        </tr>
                         <tr>
                        	<td class="C_ts_td">期限：</td>
                            <td><input id="investTime" type="text" class="C_input_fbjk"  /> </td>
                            <td>个月</td>
                            <td><span style="color: red;font-size: 12px;" id="s_investTime"></span></td>
                        </tr>
                        <tr>
                        	<td></td>
                            <td><a href="javascript:rateCalculate();"><img src="{ctx}/static/images/C_js.jpg" /></a></td>
                        </tr>
                        <tr>
                        	<div id="totalResult">
                            	<td colspan="3">每个月将收益：<span id="aa">0.00</span> 总收益：<span id="bb">0.00</span> 本息总额：<span id="cc">0.00</span></td>
                        	</div>                  
                        </tr>                   
                    </table>
                    
                    	
                </div>
                <div class="C_jsq2">
                	<span id="showPayTable"></span>
                	<%--<div class="wrap" style="margin:20px 0 20px 0">
	                	<div class="inwrap">
		                    <div class="page">
								<p>
								   	<shove:page url="callcenter.do" curPage="${pageBean.pageNum}" showPageCount="5" pageSize="${pageBean.pageSize }" theme="number" totalCount="${pageBean.totalNum}">
								   		<s:param name="cid" >${cid}</s:param>
								   		<s:param name="type" >${type}</s:param>
									</shove:page>
							    </p>
							</div> 
	                  	</div>
	                 </div>
	                分页
	                <div class="wrap" style="margin:20px 0 20px 0">
		                <div class="inwrap">
		                   <ul class="page">
		                      <li class="p1" ><a href="#">上一页</a></li>
		                      <li><a href="#">1</a></li>
		                      <li><a href="#">2</a></li>
		                      <li><a href="#">3</a></li>
		                      <li><a href="#">4</a></li>
		                      <li><a href="#">5</a></li>
		                      <li class="on"><a href="#">6</a></li>
		                      <li><a href="#">...</a></li>
		                      <li class="p1"><a href="#">下一页</a></li>
		                   </ul>       	
		                </div>
	            	</div> --%>
	            </div>
                
            </div>
            
            
        </div>
        
    	
    </div>
</div>
   <!-- 引用底部公共部分 -->     
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script type="text/javascript" src="${ctx}/static/js/nav-lc.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script>

		//输入鼠标移开验证输入
		$("#investSum").blur(function(){
			if($("#investSum").val()==""){
				$("#s_investSum").html("投资金额不能为空！");
				return;
			}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#investSum").val())){
				$("#s_investSum").html("请输入正确数字进行计算！");
				return;
			}else {
				$("#s_investSum").html("");
				return;
			}
		});
		
		$("#investTime").blur(function(){
			if($("#investTime").val()==""){
			 	$("#s_investTime").html("借款期限不能为空");	
			 	return;		 	   
			}else if(isNaN($("#investTime").val())){
				$("#s_investTime").html("请输入正确借款期限");
				return;
	 	   	}else if(!/^[1-9]\d*$/.test($("#investTime").val())){
		 	    $("#s_investTime").html("请输入正确借款期限");
		 	    return;
	 	   	}else{
	 	   		$("#s_investTime").html("");
	 	   		return;
		 	}
		});

		$("#yearRate").blur(function(){
			if($("#yearRate").val()==""){
		 	    $("#s_yearRate").html("年利率不能为空");
		 	    return;
		 	}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#yearRate").val())){
		 	    $("#s_yearRate").html("请输入正确的年利率");
		 	    return;
		 	}else{
		 		$("#s_yearRate").html("");
		 		return;
			}	
		});
		
		var flag=false;
    	//收益计算
		function rateCalculate(){
			rateNumJudge();//调用输入验证函数
			if(!flag){
				return;
			}else{
				var aa = 0;
				var bb = 0;
				var cc = 0;
				var repayType = 0;		
				if($("#month1").prop("checked")==true){
					repayType=0;
				}else if($("#month2").prop("checked")==true){
					repayType=1;
				}else if($("#allrepay").prop("checked")==true){
					repayType=2;
				}

			    var _array = [];
		        _array.push("<table cellpadding='0' cellspacing='0'>");
			    _array.push("<tr style='background:#fffcf7;'><td>期数</td><td>月还本息</td><td>月还本金</td>"
			    +"<td>月还利息</td><td>本息余额</td></tr>");
				param["paramMap.borrowSum"] = $("#investSum").val();
		        param["paramMap.yearRate"] = $("#yearRate").val();
		        param["paramMap.borrowTime"] = $("#investTime").val();
		        param["paramMap.repayWay"] = repayType;	
		       
		        $.post("frontfinanceTools.do",param,function(data){
		
					   if(data == 1){ 
					      $("#showPayTable").html("请输入正确信息！");
					      return;
					   }else if(data == 2){
					      $("#s_yearRate").html("年利率太低，请重新输入");				     
					      return;
					   }
					    for(var i = 0; i < data.length; i ++){
					    	  if(i == 0){
							         aa = data[i].monForRateA;
							         //bb = data[i].monRate;
							         cc = data[i].allPay;
							      }
							      bb += Number(data[i].monForRate);
									_array.push("<tr><td align='center'>"+data[i].mon+"</td><td align='center'>"+data[i].monForRateA+"</td>"
									+"<td align='center'>"+data[i].monForA+"</td>"
									+"<td align='center'>"+data[i].monForRate+"</td><td align='center'>"+data[i].rateARemain+"</td></tr>");
								}
								_array.push("</table>");
								$("#showPayTable").html(_array.join(""));
								$("#aa").html(aa);
								$("#bb").html(bb.toFixed(2));
								$("#cc").html(cc);
					});        
			}
		}

		//输入验证
		function  rateNumJudge(){
			flag=false;
			if($("#investSum").val()==""){
				$("#s_investSum").html("投资金额不能为空！");
				return;
			}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#investSum").val())){
				$("#s_investSum").html("请输入正确数字进行计算！");
				return;
			}else if($("#yearRate").val()==""){
		 	    $("#s_yearRate").html("年利率不能为空");
		 	    return;
		 	}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#yearRate").val())){
		 	    $("#s_yearRate").html("请输入正确的年利率");
		 	    return;
		 	}else if($("#investTime").val()==""){
			 	$("#s_investTime").html("借款期限不能为空");			 	   
				return;
			}else if(isNaN($("#investTime").val())){
				$("#s_investTime").html("请输入正确借款期限");
				return;
	 	   	}else if(!/^[0-9]*[1-9][0-9]*$/.test($("#investTime").val())){
		 	    $("#s_investTime").html("请输入正确借款期限");
		 	    return;
	 	   }
			$("#s_investTime").html("");
			$("#s_investSum").html("");	
			$("#s_yearRate").html("");
			flag=true;
			return flag;	
		}
		function check(id){
			if(id==1){
				$("#month1").prop("checked",true);
			}else if(id==2){
				$("#month2").prop("checked",true);
			}else if (id==3){
				$("#allrepay").prop("checked",true);
			}
		}
    </script>
    
</body>

</html>
