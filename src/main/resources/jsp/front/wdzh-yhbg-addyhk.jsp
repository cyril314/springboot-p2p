<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
</head>
<body>
   <div class="pop_content">
       <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td width="35%" align="right"><span class="fred">*</span> 持卡人	：</td>
                <td >
                	<span class="txt" id="cardUserName1">
		                <c:if test="#request.realName==''">
				    		<c:out value="#request.realName" default="---" ></s:property>
					    </c:if>
					    <s:else><shove:sub value="#request.realName" size="2" suffix="***"/>*</s:else>
				    </span> 
			    </td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span> 卡号：</td>
                <td><input type="text" class="input2" id="bankCard1" maxlength="30"/>&nbsp;&nbsp;输入您的卡号</td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span> 银行：</td>
                <td><input type="text" class="input2" id="bankName1"  maxlength="100"/>&nbsp;&nbsp;输入您的开户银行名称<%-- <em class="fblur" style="cursor:pointer;">请选择</em>--%></td>
            </tr><%--
            <tr height="36">
                <td align="right">开户城市：</td>
                <td><select class="sel"><option>--请选择--</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<select class="sel"><option>--请选择--</option></select></td>
            </tr>
            --%><tr>
                <td align="right"><span class="fred">*</span> 开户支行：</td>
                <td><input type="text" class="input2" id="subBankName1"  maxlength="100"/>&nbsp;&nbsp;输入您的开户支行</td>
            </tr>
            <tr>	
            	<td style="height: 36px;"></td>
                <td class="fred"><span style="color: red; float: none;" id="bk1_tip" class="formtips"></span></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="button" value="确 认" onclick="addBankInfo()" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/> 
                <input type="button" value="取 消" onclick="p0p2Close()" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/></td>
            </tr>
        </table>
    </div>    	
<!-- 引用底部公共部分 -->     
<script>
//添加提现银行信息
function addBankInfo(){
 if($("#bankName1").val()=="" || $("#subBankName1").val()=="" ||$("#bankCard1").val()=="" ){
    $("#bk1_tip").html("请完整填写信息");
    return;
  }else if(isNaN($("#bankCard1").val())){
    $("#bk1_tip").html("请输入正确的银行卡号");
    return;
  }
 var param = {};
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
		   $("#bankName1").attr("value","");
		   $("#subBankName1").attr("value","");
		   $("#bankCard1").attr("value","");
		   $("#addbank").attr("disabled",false);
		   p0p2Close();
		});
}
function p0p2Close(){
	window.parent.location.reload();
}
</script>
</body>
</html>

