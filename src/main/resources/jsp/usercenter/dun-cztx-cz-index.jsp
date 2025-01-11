<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
    <link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
<style>
body { font-size:12px; color:#333}
table { line-height:33px;width:720px;}
table tr{}
table tr td { line-height:33px;}
table tr td input{ height:33px; cursor:pointer; margin:1px; float:left}
table tr td label {line-height:33px; height:33px}
.border_ { border:#eeeeee 1px double; width:720px; overflow:hidden; margin-left:0px; margin-right:0px;}
.border_ table tr td .border_ table tr td strong {
	font-size: 14px;
}
</style>
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
                	<li class="on" onclick="jumpUrl('rechargeInit.do');">充值提现</li>
                </ul>
                <a href="javascript:history.go(-1);" class="h_back">返回</a>
            </div>
            
            <!-- ---- -->
                <div class="r_main">
      <div class="box" >
      <div class="boxmain2" >
      
    
        <div class="biaoge2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
    <td width="11%"><span>充值金额：</span></td>
    <td width="89%">
	    <input  id="money" style="height: 20px;width: 140px;border: 1px solid #ccc;"/> 元 
	    <span style="color: red; float: none;" id="money_tip" class="formtips"></span>
    </td>
  </tr>
  <tr>
    <td>充值类型：</td>
   <td style="">
   <c:if test="#request.gopay==2">
   <input id="gopay" type="radio" name="pay" value="2" style="float: none;"  />&nbsp;
   <img src="{ctx}/static/images/gopay.png" width="121px" height="33px" onclick="check(1)"/>&nbsp;&nbsp;&nbsp;&nbsp;
   </c:if>
   <c:if test="#request.IPS==2">
   <input id="ipay" type="radio" name="pay"  value="1" style="float: none;" />&nbsp;&nbsp;
   <img src="{ctx}/static/images/ipay.png" width="121px" height="33px" onclick="check(2)"/>
    </c:if>
   <input type="radio"  name="pay"  id="xxpay" value="3" style="float: none;"/>&nbsp;<span onclick="check(3)">线下充值</span>
   </td> </tr>
   <tr>
  	<td colspan="2">
  		  <div class="border_" id="div_gopay" style="display:none; ">
  <table border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
          <td colspan="5" ><strong>请选择支付方式：</strong></td>
    </tr>
        <tr valign="middle">
          <td><input  type="radio"   name="bankType" value="ICBC" id="ICBC" />
            <img src="{ctx}/static/images/banks/bank_01.png" width="128" height="33" onclick="check1('ICBC')"/></td>
          <td><input type="radio"  name="bankType"  value="CMB" id="CMB"/>
            <img src="{ctx}/static/images/banks/bank_02.png" width="128" height="33" onclick="check1('CMB')"/></td>
          <td><input type="radio"   name="bankType"  value="CCB" id="CCB"/>
            <img src="{ctx}/static/images/banks/bank_03.png" width="128" height="33" onclick="check1('CCB')" /></td>
          <td><input type="radio"  name="bankType"  value="ABC" id="ABC"/>
            <img src="{ctx}/static/images/banks/bank_04.png" width="128" height="33" onclick="check1('ABC')" /></td>
          <td><input type="radio"  name="bankType" value="BOC" id="BOC"/>
            <img src="{ctx}/static/images/banks/bank_05.png" width="128" height="33" onclick="check1('BOC')" /></td>
        </tr>
        <tr>
          <td><input type="radio"  name="bankType"  value="SPDB" id="SPDB"/>
            <img src="{ctx}/static/images/banks/bank_06.png" width="128" height="33" onclick="check1('SPDB')" /></td>
          <td><input type="radio"   name="bankType"   value="SDB" id="SDB"/>
            <img src="{ctx}/static/images/banks/bank_07.png" width="128" height="33" onclick="check1('SDB')" /></td>
          <td><input type="radio"   name="bankType"   value="CIB" id="CIB"/>
            <img src="{ctx}/static/images/banks/bank_08.png" width="128" height="33" onclick="check1('CIB')" /></td>
          <td><input type="radio"   name="bankType"   value="BOBJ" id="BOBJ"/>
            <img src="{ctx}/static/images/banks/bank_09.png" width="128" height="33" onclick="check1('BOBJ')" /></td>
          <td><input type="radio"   name="bankType"   value="CEB" id="CEB"/>
            <img src="{ctx}/static/images/banks/bank_10.png" width="128" height="33" onclick="check1('CEB')" /></td>
        </tr>
        <tr>
          <td><input type="radio"   name="bankType"   value="BOCOM" id="BOCOM"/>
            <img src="{ctx}/static/images/banks/bank_11.png" width="128" height="33" onclick="check1('BOCOM')" /></td>
          <td><input type="radio"   name="bankType"   value="CMBC" id="CMBC"/>
            <img src="{ctx}/static/images/banks/bank_12.png" width="128" height="33" onclick="check1('CMBC')" /></td>
          <td><input type="radio"   name="bankType"   value="CITIC" id="CITIC"/>
            <img src="{ctx}/static/images/banks/bank_13.png" width="128" height="33" onclick="check1('CITIC')" /></td>
          <td><input type="radio"   name="bankType"   value="GDB" id="GDB"/>
            <img src="{ctx}/static/images/banks/bank_14.png" width="128" height="33" onclick="check1('GDB')" /></td>
          <td><input type="radio"   name="bankType"   value="PAB" id="PAB"/>
            <img src="{ctx}/static/images/banks/bank_15.png" width="128" height="33" onclick="check1('PAB')" /></td>
        </tr>
        <tr>
          <td><input type="radio"   name="bankType"   value="PSBC" id="PSBC"/>
            <img src="{ctx}/static/images/banks/bank_16.png" width="128" height="33" onclick="check1('PSBC')" /></td>
         
          <td><input type="radio"   name="bankType"   value="SRCB" id="SRCB"/>
            <img src="{ctx}/static/images/banks/bank_18.png" width="128" height="33" onclick="check1('SRCB')" /></td>
            <td><input type="radio"   name="bankType"   value="BOS" id="BOS"/>
            <img src="{ctx}/static/images/banks/bank_19.png" width="128" height="33" onclick="check1('BOS')" /></td>
            <td><input type="radio"   name="bankType"   value="HXBC" id="HXBC"/>
            <img src="{ctx}/static/images/banks/bank_20.png" width="128" height="33" onclick="check1('HXBC')" /></td>
         <td></td>
     
        
        </tr>
     
      
        <tr>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
        </tr>
        <tr>
          <td colspan="2"><input  type="radio"  name="bankType"   value="DEFAULT" />
            <span style="float:left; margin-left:10px">使用国付宝支付<font color="#999999"></font></span></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
  </table>
</div>
 <div class="border_" id="div_ipay"  style="display:none; " >
  <table border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
          <td colspan="5" ><strong>请选择支付方式：</strong></td>
    </tr>
        <tr valign="middle">
          <td><input  type="radio"  name="bankType" value="01" id="rd_ipay_jieji" />
            <em onclick="check1('rd_ipay_jieji')">人民币借记卡</em></td>
          <td><input type="radio"  name="bankType"  value="128" id="xykzf"/>
            <em onclick="check1('xykzf')">信用卡支付</em></td>
          <td><input type="radio"   name="bankType"  value="04" id="ips"/>
            <em onclick="check1('ips')">IPS账户支付</em></td>
          <td><input type="radio"  name="bankType"  value="16" id="dhzf"/>
           <em onclick="check1('dhzf')">电话支付</em></td>
          <td><input type="radio"  name="bankType" value="32" id="sjzf"/>
            <em onclick="check1('sjzf')">手机支付</em></td>
        </tr>
        <tr>
          <td colspan="5"><input type="radio"  name="bankType"  value="1024" id="yyzf"/>
            <em onclick="check1('yyzf')">手机语音支付</em></td>
         
        </tr>
       
    
       <tr>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
          <td height="10"></td>
        </tr>
       
        <tr>
         
          <td></td>
          <td></td>
          <td></td>
        </tr>
	  </table>
	</div>
	  	</td>
	  </tr>
	  <tr>
	  	  <td style="padding-top:20px;" colspan="2"> 
	    <div id="xxdiv"  style="display:none;">
	    	<table  style="line-height:30px;">
	    		<tr align="center" height="30px">
	    			<td width="40px">&nbsp;</td>
	    			<td width="40px">银行</td>
	    			<td width="70px">账号</td>
	    			<td width="60px">开户人</td>
	    			<td width="70px">开户行</td>
	    		</tr>
	    	<s:iterator value="#request.banksList" var="bank" status="count">
	    		<tr align="center">
	    			<td><input type="radio"  value="${bank.bankname }" name="paramMap.banks" style="float:none;"
	    			<c:if test="#count.count == 1">checked="checked"</c:if> /></td>
	    			<td><image src="${bank.bankimage }" style="width:130px;height:60px;"/></td>
	    			<td>${bank.Account }</td>
	    			<td>${bank.accountname }</td>
	    			<td>${bank.accountbank }</td>
	    		</tr>
	    	</s:iterator>
				         <tr>
					    <td align="right">
					  交易编号：
					    </td>
					    <td align="center">
				 <input type="text" class="inp140" style="margin-top: 2px; width: 180px;float:none;" id="rechargeNumber_text"/></td>
					    <td colspan="3">&nbsp;&nbsp;填写网上交易流水号或ATM机汇款交易号或其他号码，只供查询用 
					    </td>
				  </tr>
				         <tr>
					    <td align="right">
					  充值备注：
					    </td>
					    <td align="center">
					    <input type="text" class="inp140" style="margin-top: 2px;width: 180px;float:none;"  id="remark_text"/></td>
					    <td colspan="3">&nbsp;&nbsp;请注明您的用户名，转账银行卡和转账流水号，以及转账时间 
					    </td>
				  </tr>
				  <tr>
				  <td colspan="5" align="center">
				  <a id="saveii" class="h_sqbtn" style="color:#fff;margin-top: 10px;margin-bottom: 10px" >提交充值</a>
				  </td>
				  </tr>
	    	</table>
        </div>			
				</td>	
	  </tr>
	</table>

        </div>
        <div class="btn" id="btn_submit">  
        <input type="button" class="h_sqbtn" value="立即充值" id="addrecharge"/>
        <!--
        <a href="javascript:void(0);" class="bcbtn" onclick="addRechargeInfo();">保存并继续</a>
        --></div>
        <p id="p_about" class="tips2" style="border:none;">
        </p>
        <div class="biaoge" style="margin-top:25px;">
           <span id="rechargeInfo"></span>
          </div>
      
      
      </div>
</div>
     
    </div>
          <!-- ---- -->  
            
            
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
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script>
 	$("#saveii").click(function(){
		 jQuery.jBox.open("post:queryRechartips.do", "充值委托书", 600,400,{ buttons: { } });
	});
</script>
<script>
		//添加线下充值
		function addRechargeoutline(name){
		   var param ={};
		   param["paramMap.realname"] = name;
		   param["paramMap.bankName"] = $("input[name='paramMap.banks']:checked").val();
		   param["paramMap.money"] = $("#money").val();
		   param["paramMap.rechargeNumber"] = $("#rechargeNumber_text").val();
		   param["paramMap.remark"] = $("#remark_text").val();
		   $.post("addRechargeoutline.do",param,function(data){
			   if(data.msg=='提交成功'){
				 alert(data.msg);
			     window.location.href="rechargeInit.do";
			   }else{
			     alert(data.msg);
			   }
		   });
		}
</script>
<script>
  $(function(){
         $("#zh_hover").attr('class','nav_first');
         dqzt(6,'t06');
		  $('.tabmain').find('li').click(function(){
		  $('.tabmain').find('li').removeClass('on');
        
       }); 
       /**
       param["pageBean.pageNum"] = 1;
	    initListInfo(param);
	   */
	    $("#gopay").click(function(){
	    	$("#div_gopay").attr("style","display:block;");
	    	$("#btn_submit").attr("style","display:block;");
	    	 $("#xxdiv").attr("style","display:none;");
			$("#div_ipay").attr("style","display:none;");
			$("#ICBC").attr("checked","checked");
	    	//$("#p_about").html("国付宝简介:国付宝信息科技有限公司（以下简称“国付宝”）是商务部中国国际电子商务中心（以下简称“CIECC”）与海航商业控股有限公司（以下简称“海航商业”）合资成立，"+
	    	//"针对政府及企业的需求和电子商务的发展，精心打造的国有背景的，引入社会诚信体系的独立第三方电子支付平台，也是“金关工程”的重要组成部分。"+
			//"国付宝信息科技有限公司成立于2011年1月25日，由商务部中国国际电子商务中心与海航商业控股有限公司合作成立，主要经营第三方支付业务。"+
			//"公司注册资本14285.72万元，主要经营第三方支付业务，互联网支付及移动电话支付（全国）。");
	    });
	    $("#ipay").click(function(){
	    	$("#div_gopay").attr("style","display:none;");
	   	 	$("#div_ipay").attr("style","display:block;");
	   	 	$("#btn_submit").attr("style","display:block;");
	    	 $("#xxdiv").attr("style","display:none;");
			$("#rd_ipay_jieji").attr("checked","checked");
	    	//$("#p_about").html(" 环迅支付简介:迅付信息科技有限公司（简称：环迅支付），是中国最早成立的第三方支付企业。公司在2011年获颁中国人民银行首批《支付业务许可证》。"+
	    	//"公司平台支持所有国内主流银行及国际信用卡，为全球60万家商户及2000万用户提供金融级的支付体验。");
	    });
	    //线下充值
	    $("#xxpay").click(function(){
	    	$("#rechargeDetail").html("以下是通过线下进行充值。");
	        $("#div_gopay").attr("style","display:none;");
	   	 	$("#div_ipay").attr("style","display:none;");
	        $("#btn_submit").attr("style","display:none;");
	        $("#xxdiv").attr("style","display:block;");
	        $("#xxdiv").attr("class","biaoge");   
	        
	        $("#p_about").attr("style"," border:none; display:none;");
	        $("#p_about").html(" 线下充值的金额最小10000，奖励千分之三，小于10000没有奖励。");
	        
	    });
	    $("#gopay").click();
	 });
	 
	 function initListInfo(praData){
	 	
		$.shovePost("queryRechargeInfo.do",praData,initCallBack);
	}
	function initCallBack(data){
		$("#rechargeInfo").html(data);
	}
   
   	$("#addrecharge").click(function(){   
		   addRechargeInfo();
		});
   function addRechargeInfo(){
      if($("#money").val() == ""){
        $("#money_tip").html("请输入充值金额");
        return;
      }else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#money").val())){
	       $("#money_tip").html("请输入正确的提现金额，必须为大于0的数字"); 
	       return;
	  }else if($("#money").val() < 0.01){
	      $("#money_tip").html("最小金额不能低于0.01"); 
	       return;
	  }else{
	     $("#money_tip").html("");
	  }
      
       var payType = -1;
      if($("#gopay").attr("checked")=="checked"){
		    payType= 1;
      }	else if($("#ipay").attr("checked")=="checked"){
     	 	payType = 2;
      }else{
      	  alert("请选择充值类型");
      	  return ;
      }
      var bankType = "";
     
   	  bankType=$("input[name='bankType']:checked").val();
    
      
      if(bankType=="" || bankType==undefined){
    	  alert("请选择银行类型");
    	  return;
      }   
	  
	  if(!window.confirm("确定进行帐户充值")){
        return;
      }else{
	  $("#addrecharge").attr("disabled",true);
	  }
      var money = $("#money").val();
      var type = "";
      if($("#ipay").attr("checked")=="checked"){
	      	window.open("ipayPayment.do?divType=li_2&money="+money+"&gatewayType="+bankType);
	      }else if($("#gopay").attr("checked")=="checked"){
	      	window.open("gopayPayment.do?divType=li_2&money="+money+"&bankCode="+bankType);
	      }else{
	      	alert("请选择充值类型");
	      }
	      $("#addrecharge").attr("disabled",false);
   }
   
   function jumpUrl(obj){
       window.location.href=obj;
    }
 	function check(id){
 	 	if(id==1){
 	 		$("#gopay").click();
 	 	}else if(id==2){
 	 		$("#ipay").click();
 	 	}else if(id==3){
 	 		$("#xxpay").click();
 	 	}
	}  
	function check1(value){
		$("#"+value).prop("checked",true);
	}
</script>
</body>
</html>
