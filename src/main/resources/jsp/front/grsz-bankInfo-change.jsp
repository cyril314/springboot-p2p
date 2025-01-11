<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
		<style type="text/css">
		  .tabyhkbg{ width: 500px; font-size: 14px; }
		  .tabyhkbg td{ height: 40px; line-height: 40px;}
		  body{ overflow-x: hidden;}
		</style>
	</head>
	<body>
       <table cellpadding="0" cellspacing="0" class="tabyhkbg">
            <tr>
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
            <tr>
                <td align="right"><span class="fred">*</span> 原卡号：</td>
                <td>${bankCard }</td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span> 新卡号：</td>
                <td><input type="text" class="txtmail" id="bankCard_" maxlength="30"/>&nbsp;&nbsp;输入您的卡号</td>
            </tr>
            <tr>
                <td align="right"><span class="fred">*</span> 新的开户行：</td>
                <td><input type="text" class="txtmail" id="bankName_"  maxlength="100"/>&nbsp;&nbsp;输入您的开户银行名称<%-- <em class="fblur" style="cursor:pointer;">请选择</em>--%></td>
            </tr><%--
            <tr height="36">
                <td align="right">开户城市：</td>
                <td><select class="sel"><option>--请选择--</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<select class="sel"><option>--请选择--</option></select></td>
            </tr>
            --%><tr>
                <td align="right"><span class="fred">*</span> 新的支行：</td>
                <td><input type="text" class="txtmail" id="subBankName_"  maxlength="100"/>&nbsp;&nbsp;输入您的开户支行</td>
            </tr>
            <tr>	
            	<td></td>
                <td class="fred"><span style="color: red; float: none;" id="bk1_tip" class="formtips"></span></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                 <table width="100%">
                   <tr>
                 <td align="center"><input type="button" value="变 更" onclick="changeBankInfo()" class="update" /></td>
                 <td align="center"><input type="button"  class="update"  value="取 消" onclick="p0p2Close()"/></td>
                 </tr>
                 </table>
                 </td>
            </tr>
        </table>	
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
		<script>
	$(function() {

		$("#bankName_").focus();
		//提现银行卡设置1
		$("#bankName_").blur(function() {
			if ($("#bankName_").val() == "") {
				$("#bk1_tip_").html("开户银行名称不能为空");
			} else {
				$("#bk1_tip_").html("");
			}
		});

		$("#subBankName_").blur(function() {
			if ($("#subBankName_").val() == "") {
				$("#bk1_tip_").html("开户支行不能为空");
			} else {
				$("#bk1_tip_").html("");
			}
		});

		$("#bankCard_").blur(function() {
			if ($("#bankCard_").val() == "") {
				$("#bk1_tip_").html("卡号不能为空");
			} else if (isNaN($("#bankCard_").val())) {
				$("#bk1_tip_").html("请输入正确的银行卡号");
			} else {
				$("#bk1_tip_").html("");
			}
		});

	});

	function changeBankInfo() {
		if ($("#bankName_").val() == "" || $("#subBankName_").val() == ""
				|| $("#bankCard_").val() == "") {
			$("#bk1_tip_").html("请填写完整信息");
			return;
		}

		if ($("#bk1_tip_").text() != "") {
			return;
		}
		if (!window.confirm("确定要变更吗?")) {
			return;
		}
		param["paramMap.bankId"] = ${bankId};
		param["paramMap.mBankName"] = $("#bankName_").val();
		param["paramMap.mSubBankName"] = $("#subBankName_").val();
		param["paramMap.mBankCard"] = $("#bankCard_").val();

		$.shovePost("updateBankInfo.do", param, function(data) {
			if (data == 1) {
				window.parent.tipjBox("变更失败，请重新变更")
				return;
			}
			alert("变更成功");
			window.parent.history.go(0);
			window.parent.window.jBox.close();

		});

	}
	function p0p2Close(){
   	 window.parent.window.jBox.close() ;
    }
</script>
	</body>
</html>
