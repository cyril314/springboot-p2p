<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<style>
.js-max-input {border: solid 1px #ffd2b2;background: #fffae5;padding: 0 10px 0 10px;font-size:20px;color: #ff4400}/*提示框样式*/
.inputElem1{ border:1px solid #c7c7c7; border-radius:2px; width:200px; height: 25px; line-height: 25px;}/*文本框样式*/
</style>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置： <a href="queryFundrecordInit.do">资金管理</a> > 银行卡管理</div>
			<div id="acc_tabs">	
				<!--内容 开始-->
				 <div id="bankInfo"></div>
				<!--内容 结束-->
				<!--弹出层 开始-->
				<div id="pop_box"></div>
				<!--还款-->
				<div id="pop2" class="pop">
				   <div class="poptitle" id="title">
					  <h2>添加银行卡</h2>
					  <div><a class="close" href="javascript:void();" id="close" title="关闭" onclick="hide('pop2')"></a></div>
				   </div>
				   <div class="pop_content">
				       <table width="100%" cellpadding="0" cellspacing="0">
				            <tr>
				                <td width="35%" align="right"><span class="fred">*</span> 持卡人	：</td>
				                <td >
				                	<span id="cardUserName1">
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
				                <td align="right"><span class="fred">*</span> 卡号：</td>
				                <!--<td><input type="text" class="txtmail" id="bankCard1"/></td>-->
				                <td>
				                  <div class="parentCls">
									<input type="text" class="inputElem1" autocomplete = "off"  maxlength="19" id="bankCard1" />
								  </div>
				                </td>
				            </tr>
				            <tr>
				                <td align="right"><span class="fred">*</span> 开户银行：</td>
				                <td><input type="text" class="txtmail" id="bankName1"  />
				                <%-- <em class="fblur" style="cursor:pointer;">请选择</em>--%></td>
				            </tr><%--
				            <tr height="36">
				                <td align="right">开户城市：</td>
				                <td><select class="sel"><option>--请选择--</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<select class="sel"><option>--请选择--</option></select></td>
				            </tr>
				            --%><tr>
				                <td align="right"><span class="fred">*</span> 开户支行：</td>
				                <td><input type="text" class="txtmail" id="subBankName1" /></td>
				            </tr>
				            <tr>	
				            	<td style="height: 36px;"></td>
				                <td class="fred"><span style="color: red; float: none;" id="bk1_tip" class="formtips"></span></td>
				            </tr>
				            <tr>
				                <td colspan="2" align="center"><input type="button" value="确 认" onclick="addBankInfo()" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/>
				                <input type="button" value="取 消" onclick="hide('pop2')" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"/></td>
				            </tr>
				        </table>
				    </div>    	
				</div>
				<div id="fade"></div>
				<!--弹出层 结束-->
			</div>
		</div>
	</div>
</div>

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/popup.js"></script>
<script type="text/javascript" src="${ctx}/static/js/big.js"></script>
<script>
function jumpUrl(obj){
	window.location.href=obj;
}
</script>
<script><!--
	$(function() {
		dqzt(7, 't06');
		var bb = '${person}';//设置提现银行卡必须先填写个人资料
		if (bb == "0") {
			alert("请先完善个人信息");
			window.location.href = "owerInformationInit.do";
		}
		//卡号放大镜提示start
	    new TextMagnifier({
				inputElem: '.inputElem1',
				align: 'top',
				splitType: [4,4,4,4,3]
			});
		//发送信息弹出层
		var oDrag = document.getElementById("pop2");
		var oTitle = document.getElementById("title");

		drag(oDrag, oTitle);
		oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth)
				/ 2 + "px";
		oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight)
				/ 2 + "px";
	});
</script>
<script>	
	$(function() {
		$.shovePost("queryBankInfoInit.do", null, function(data) {
			$("#bankInfo").html(data);
		});
		//提现银行卡设置1
		$("#bankName1").blur(function() {
			if ($("#bankName1").val() == "") {
				$("#bk1_tip").html("开户银行名称不能为空");
			} else {
				$("#bk1_tip").html("");
			}
		});

		$("#subBankName1").blur(function() {
			if ($("#subBankName1").val() == "") {
				$("#bk1_tip").html("开户支行不能为空");
			} else {
				$("#bk1_tip").html("");
			}
		});

		$("#bankCard1").blur(function() {
			if ($("#bankCard1").val() == "") {
				$("#bk1_tip").html("卡号不能为空");
			} else if (isNaN($("#bankCard1").val())) {
				$("#bk1_tip").html("请输入正确的银行卡号");
			} else {
				$("#bk1_tip").html("");
			}
		});

		//提现银行卡设置2
		$("#bankName2").blur(function() {
			if ($("#bankName2").val() == "") {
				$("#bk2_tip").html("开户银行名称不能为空");
			} else {
				$("#bk2_tip").html("");
			}
		});

		$("#subBankName2").blur(function() {
			if ($("#subBankName2").val() == "") {
				$("#bk2_tip").html("开户支行不能为空");
			} else {
				$("#bk2_tip").html("");
			}
		});

		$("#bankCard2").blur(function() {
			if ($("#bankCard2").val() == "") {
				$("#bk2_tip").html("卡号不能为空");
			} else if (isNaN($("#bankCard2").val())) {
				$("#bk2_tip").html("请输入正确的银行卡号");
			} else {
				$("#bk2_tip").html("");
			}
		});
	});

	$("#addbank").click(function() {
		addBankInfo();
	});
	//添加提现银行信息
	function addBankInfo() {
		if ($("#bankName1").val() == "" || $("#subBankName1").val() == ""
				|| $("#bankCard1").val() == "") {
			$("#bk1_tip").html("请完整填写信息");
			return;
		} else if (isNaN($("#bankCard1").val())) {
			$("#bk1_tip").html("请输入正确的银行卡号");
			return;
		}

		param["paramMap.bankName"] = $("#bankName1").val();
		param["paramMap.subBankName"] = $("#subBankName1").val();
		param["paramMap.bankCard"] = $("#bankCard1").val();
		param["paramMap.cardUserName"] = $("#cardUserName1").text();

		if (!window.confirm("确定要添加银行卡绑定吗?")) {
			return;
		} else {
			$("#addbank").attr("disabled", true);
		}

		$.shovePost("addBankInfo.do", param, function(data) {
			if (data == 1) {
				$("#bk1_tip").html("请输入有效的银行卡信息");
				$("#bankCard1").attr("value", "");//银行卡信息错误，只清空银行卡信息
				return;
			} else if (data == 2) {
				alert("你已经添加了两张银行卡信息，未绑定的银行卡信息可以删除\n否则需要申请更换银行");
			} else {
				$("#bankInfo").html(data);
			}
			p0p2Close();
			$("#bankName1").attr("value", "");
			$("#subBankName1").attr("value", "");
			$("#bankCard1").attr("value", "");
			$("#addbank").attr("disabled", false);
		});
	}

	function addBankInfo2() {
		if ($("#bankName2").val() == "" || $("#subBankName2").val() == ""
				|| $("#bankCard2").val() == "") {
			$("#bk2_tip").html("请完整填写信息");
			return;
		} else if (isNaN($("#bankCard2").val())) {
			$("#bk2_tip").html("请输入正确的银行卡号");
			return;
		}
		param["paramMap.bankName"] = $("#bankName2").val();
		param["paramMap.subBankName"] = $("#subBankName2").val();
		param["paramMap.bankCard"] = $("#bankCard2").val();
		param["paramMap.cardUserName"] = $("#cardUserName2").text();

		if (!window.confirm("确定要添加银行卡绑定吗?")) {
			return;
		}

		$.shovePost("addBankInfo.do", param, function(data) {
			if (data == 1) {
				$("#bk2_tip").html("请输入有效的银行卡信息");
				$("#bankCard2").attr("value", "");//银行卡信息错误，只清空银行卡信息
				return;
			} else if (data == 2) {
				alert("你已经添加了两张银行卡信息，未绑定的银行卡信息可以删除\n否则需要申请更换银行");
			} else {
				$("#bankInfo").html(data);
			}
			$("#bankName2").attr("value", "");
			$("#subBankName2").attr("value", "");
			$("#bankCard2").attr("value", "");
		});
	}
	function tipjBox(content) {
		$.jBox.tip(content);
	}

	function closejBox() {
		tipjBox("变更成功，请等待审核");
		history.go(0);
	}
	//删除添加的银行卡信息
	function del(id) {
		if (!window.confirm("确定要删除吗?")) {
			return;
		}
		$.shovePost("deleteBankInfo.do", {
			bankId : id
		}, function(data) {
			$("#bankInfo").html(data);
		});
	}

	function changeBankCancel(id) {
		if (!window.confirm("确定要取消变更吗?")) {
			return;
		}
		$.shovePost("bankChangeCancel.do", {
			bankId : id
		}, function(data) {
			if (data == 1) {
				alert("取消失败，请重新取消");
				return;
			}
			$("#bankInfo").html(data);
		});
	}
	//添加银行卡点击事件
	function disp(name) {
		///$.jBox("iframe: addBankInfoInit.do?name="+name
		// , {
		// title: "添加银行卡",
		// width: 550,
		//height: 390,
		//buttons: {  }
		//}
		//);
		$.post("iframe: addBankInfoInit.do?name=" + name);
		show("pop2");
	}

	function p0p2Close() {
		window.parent.window.jBox.close();
		hide("pop2");
	}
</script>
<script>

	//工作认证
	function loadWorkInit(url) {
		var bb = '${person}';//填写工作信息必须先填写个人资料
		if (bb == "0") {
			alert("请先完善个人信息");
			window.location.href = "owerInformationInit.do";
		} else {
			window.location.href = url;
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
		window.location.href = url;
		//		}
	}

	//加载该用户提现银行卡信息
	function loadBankInfo(url) {
		var bb = '${person}';//设置提现银行卡必须先填写个人资料
		if (bb == "0") {
			alert("请先完善个人信息");
			window.location.href = "owerInformationInit.do";
		} else {
			window.location.href = url;
		}

	}
	function changeBankInfos(id) {
		var url = "queryOneBankInfo.do?bankId=" + id;
		$.jBox("iframe:" + url, {
			title : "银行卡变更",
			width : 500,
			height : 350,
			buttons : {}
		});
	}

	function intercalate(id) {
		param["paramMap.bankId"] = id;
		$.shovePost("updateCardDefault.do", param, function(data) {
			if (data == 1) {
				alert("操作成功");
				location.reload();
			}
		});
	}
</script>
</body>
</html>
