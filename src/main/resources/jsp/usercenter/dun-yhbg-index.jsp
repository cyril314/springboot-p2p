<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
	<jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
    <link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
    <script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
  </head>

<body>
<!-- 引用头部公共部分 -->
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
                	<li class="on" onclick="loadBankInfo('yhbound.do');">银行卡管理</li>
                </ul>
            </div>
            <!--标题 结束-->
            <!--内容 开始-->	
            
            <!-- sdfsd -->
           <div class="box">
        <div class="boxmain2" style="padding-top:10px;">
         <div class="biaoge2" style="margin-top:0px;">
   	
   	
   	
    	</div>
          <!-- sdfsd -->
            
            <div id="bankInfo" class="rz_content clearfix">
				 
            </div>
            <!--内容 结束-->
        </div>
        <!--右 结束-->
    </div>	
</div>    




<!--弹出层 开始-->
<div id="pop_box"></div>
<!--还款-->
<div id="pop2" class="pop clearfix" style="margin-left: 300px;margin-top:100px;">
   <h2>添加银行卡<a href="javascript:p0p2Close()" style="float:right;padding-right:20px;">关闭</a></h2>
   <div class="pop_content">
       <table width="100%" class="pop_tab" cellpadding="0" cellspacing="0">
            <tr height="36">
                <td width="25%" align="right"><span class="fred">*</span> 持卡人	：</td>
                <td width="75%">
                	<span class="txt" id="cardUserName1">
		                <c:if test="#request.realName==''">
				    		<c:out value="#request.realName" default="---" ></s:property>
					    </c:if>
					    <s:else>
					    	<shove:sub value="#request.realName" size="2" suffix="***"/>*
					    </s:else>
				    </span> 
			    </td>
            </tr>
            <tr height="36">
                <td align="right"><span class="fred">*</span> 卡号：</td>
                <td><input type="text" class="input2" id="bankCard1"/>输入您的卡号</td>
            </tr>
            <tr height="36">
                <td align="right"><span class="fred">*</span> 银行：</td>
                <td><input type="text" class="input2" id="bankName1"  />输入您的开户银行名称<%-- <em class="fblur" style="cursor:pointer;">请选择</em>--%></td>
            </tr><%--
            <tr height="36">
                <td align="right">开户城市：</td>
                <td><select class="sel"><option>--请选择--</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<select class="sel"><option>--请选择--</option></select></td>
            </tr>
            --%><tr height="36">
                <td align="right"><span class="fred">*</span> 开户支行：</td>
                <td><input type="text" class="input2" id="subBankName1" />输入您的开户支行</td>
            </tr>
            <tr height="36">	
            	<td></td>
                <td class="fred"><span style="color: red; float: none;" id="bk1_tip" class="formtips"></span></td>
            </tr>
            <tr height="45">
                <td>&nbsp;</td>
                <td><input type="button" value="确 认" onclick="addBankInfo()" class="pop_btn1" /> &nbsp;<input type="button" value="取 消" onclick="p0p2Close()" class="pop_btn1" /></td>
            </tr>
        </table>
    </div>    	
</div>


</div>
</div>
<!--弹出层 结束-->

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
 <script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script>
  function jumpUrl(obj){
          window.location.href=obj;
       }
  
</script>
	<script>
	   $(function(){
		   dqzt(7,'t06');
		   var bb = '${person}';//设置提现银行卡必须先填写个人资料
	 		if (bb == "0") {
	 			alert("请先完善个人信息");
	 			window.location.href="owerInformationInit.do";
	 		} 
	   });
	</script>
	<script>	
	$(function(){
		 $.shovePost("queryBankInfoInit.do",null,function(data){
			    $("#bankInfo").html(data);
		  });
	       //提现银行卡设置1
	       $("#bankName1").blur(function(){
			     if($("#bankName1").val()==""){
			       $("#bk1_tip").html("开户银行名称不能为空");
			     }else{
			       $("#bk1_tip").html("");
			     }
		    });
		    
		    $("#subBankName1").blur(function(){
			     if($("#subBankName1").val()==""){
			       $("#bk1_tip").html("开户支行不能为空");
			     }else{
			       $("#bk1_tip").html("");
			     }
		    });
		    
		    $("#bankCard1").blur(function(){
			     if($("#bankCard1").val()==""){
			       $("#bk1_tip").html("卡号不能为空");
			     }else if(isNaN($("#bankCard1").val())){
			       $("#bk1_tip").html("请输入正确的银行卡号");
			     }else{
			       $("#bk1_tip").html("");
			     }
		    });
	       
	       //提现银行卡设置2
	       $("#bankName2").blur(function(){
			     if($("#bankName2").val()==""){
			       $("#bk2_tip").html("开户银行名称不能为空");
			     }else{
			       $("#bk2_tip").html("");
			     }
		    });
		    
		    $("#subBankName2").blur(function(){
			     if($("#subBankName2").val()==""){
			       $("#bk2_tip").html("开户支行不能为空");
			     }else{
			       $("#bk2_tip").html("");
			     }
		    });
		    
		    $("#bankCard2").blur(function(){
			     if($("#bankCard2").val()==""){
			       $("#bk2_tip").html("卡号不能为空");
			     }else if(isNaN($("#bankCard2").val())){
			       $("#bk2_tip").html("请输入正确的银行卡号");
			     }else{
			       $("#bk2_tip").html("");
			     }
		    });
		});
		
		$("#addbank").click(function(){   
		    addBankInfo();
		     
		  
		});
	   //添加提现银行信息
	   function addBankInfo(){
	    if($("#bankName1").val()=="" || $("#subBankName1").val()=="" ||$("#bankCard1").val()=="" ){
           $("#bk1_tip").html("请完整填写信息");
           return;
         }else if(isNaN($("#bankCard1").val())){
           $("#bk1_tip").html("请输入正确的银行卡号");
           return;
         }

	     param["paramMap.bankName"] = $("#bankName1").val();
         param["paramMap.subBankName"] = $("#subBankName1").val();
         param["paramMap.bankCard"] = $("#bankCard1").val();
         param["paramMap.cardUserName"] = $("#cardUserName1").text();
         
         if(!window.confirm("确定要添加银行卡绑定吗?")){
	 			return;
	 		}else{
	 		   $("#addbank").attr("disabled",true);
	 		}
         
         $.shovePost("addBankInfo.do",param,function(data){
               if(data == 1){
               	$("#bk1_tip").html("请输入有效的银行卡信息");
               	$("#bankCard1").attr("value","");//银行卡信息错误，只清空银行卡信息
               	return;
               }else if(data == 2){
                  alert("你已经添加了两张银行卡信息，未绑定的银行卡信息可以删除\n否则需要申请更换银行");
               }else{
 			    $("#bankInfo").html(data);
 			   }
               p0p2Close();
 			   $("#bankName1").attr("value","");
 			   $("#subBankName1").attr("value","");
 			   $("#bankCard1").attr("value","");
 			   $("#addbank").attr("disabled",false);
 			});
	   }
	   
	   function addBankInfo2(){
	    if($("#bankName2").val()=="" || $("#subBankName2").val()=="" ||$("#bankCard2").val()=="" ){
           $("#bk2_tip").html("请完整填写信息");
           return;
         }else if(isNaN($("#bankCard2").val())){
           $("#bk2_tip").html("请输入正确的银行卡号");
           return;
         }
	     param["paramMap.bankName"] = $("#bankName2").val();
         param["paramMap.subBankName"] = $("#subBankName2").val();
         param["paramMap.bankCard"] = $("#bankCard2").val();
         param["paramMap.cardUserName"] = $("#cardUserName2").text();
         
         if(!window.confirm("确定要添加银行卡绑定吗?")){
	 			return;
	 		}
	 		
         $.shovePost("addBankInfo.do",param,function(data){
               if(data == 1){
               	$("#bk2_tip").html("请输入有效的银行卡信息");
               	$("#bankCard2").attr("value","");//银行卡信息错误，只清空银行卡信息
               	return ;
               }else if(data == 2){
                  alert("你已经添加了两张银行卡信息，未绑定的银行卡信息可以删除\n否则需要申请更换银行");
               }else{
 			    $("#bankInfo").html(data);
 			   }
 			   $("#bankName2").attr("value","");
 			   $("#subBankName2").attr("value","");
 			   $("#bankCard2").attr("value","");
 			});
	   }
	   function tipjBox(content)
	   {
		   $.jBox.tip(content);
	   }

	   function closejBox()
	   {
		   tipjBox("变更成功，请等待审核");
			history.go(0);
	   }
	   //删除添加的银行卡信息
	   function del(id){
	 		if(!window.confirm("确定要删除吗?")){
	 			return;
	 		}
 			$.shovePost("deleteBankInfo.do",{bankId:id},function(data){
 			    $("#bankInfo").html(data);
 			});
	 	}
	 	
	 	 function changeBankCancel(id){
	 	 if(!window.confirm("确定要取消变更吗?")){
	 			return;
	 		}
	       $.shovePost("bankChangeCancel.do",{bankId:id},function(data){
	        if(data == 1){
	          alert("取消失败，请重新取消");
	          return;
	        }
	         $("#bankInfo").html(data);
	       });
	     }

	     function disp(name){
			 $.jBox("iframe: addBankInfoInit.do?name="+name, {
      		     title: "添加银行卡",
      		     width: 550,
      		     height: 390,
      		     buttons: {  }
   		 	});
	     }

	     function p0p2Close(){
	    	 window.parent.window.jBox.close() ;
	     }
	</script>

 	<script>


	//工作认证
		function loadWorkInit(url){
			var bb = '${person}';//填写工作信息必须先填写个人资料
			if (bb == "0") {
				alert("请先完善个人信息");
				window.location.href="owerInformationInit.do";
			} else {
				window.location.href=url;
			}
		}
 	 function bindingPhoneLoad(url) {
		/**	var bb = '${person}';//申请手机绑定必须先填写个人资料
			var cc = '${pass}';
			if (bb == "0") {
				alert("请先完善个人信息");
				window.location.href='owerInformationInit.do';
			} else if (cc != 3) {
				alert("请等待个人信息审核通过");
				return ;
			} else {*/
				   window.location.href=url;
	//		}
		}

 	//加载该用户提现银行卡信息
 	function loadBankInfo(url) {
 		var bb = '${person}';//设置提现银行卡必须先填写个人资料
 		if (bb == "0") {
 			alert("请先完善个人信息");
 			window.location.href="owerInformationInit.do";
 		} else {
 			window.location.href=url;
 		}

 	}
	    function changeBankInfos(id){
   		       var url = "queryOneBankInfo.do?bankId="+id;
   		    $.jBox("iframe:" + url, {
      		     title: "银行卡变更",
      		     width: 500,
      		     height: 350,
      		     buttons: {  } 
   		 });
   		    }
   		    
	    function intercalate(id){
	    	param["paramMap.bankId"] = id; 
	    	$.shovePost("updateCardDefault.do",param,function(data){
 			   	if(data==1){
 	 			   	alert("操作成功");
 	 			  location.reload();
 			   	}
 			});
	    }
	</script>
</body>
</html>
