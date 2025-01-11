<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="homeBorrowInvestInit.do">投资管理</a>  > 自动投标</div>
			<div id="acc_tabs">	
				<!--内容 开始-->
				<div>
					<table border="0" cellspacing="0" cellpadding="0" class="tabtx">
						<!-- <tr>
							<th colspan="2" align="center">设置我的自动投标工具</th>
						</tr> -->
						<tr>
							<td align="right">自动投标状态：</td>
							<td>
								<p id="statusText">
									<c:if test="%{automaticBidMap.bidStatus ==2}">开启状态</c:if>
									<s:else>关闭状态</s:else>
								</p>
							</td>
						</tr>
						<tr>
							<td align="right">您的账户余额：</td>
							<td><c:if test="#automaticBidMap.usableSum == ''">${automaticBidMap.usableSum}</c:if><s:else>0.00</s:else>
								元<input type="hidden" value="${automaticBidMap.usableSum}" id="usableSum" name="usableSum" class="txtmail" />
							</td>
						</tr>
						<tr>
							<td align="right"><span class="fred">*</span>每次投标金额：</td>
							<td><input type="text" id="bidAmount" value="${automaticBidMap.bidAmount}" class="txtmail" onblur="isNumber()"/>元</td>
						</tr>
						<tr>
							<td align="right"><span class="fred">*</span>利率范围：</td>
							<td>
								<input type="text" id="rateStart" value="${automaticBidMap.rateStart}" class="txtmail"/>% --
								<input type="text" id="rateEnd" value="${automaticBidMap.rateEnd}" class="txtmail"/>%
							</td>
						</tr>
						<tr>
							<td align="right">借款期限：</td>
							<td>
								<s:select list="#{3:'3个月',6:'6个月',9:'9个月',12:'12个月',18:'18个月',24:'24个月'}" id="deadlineStart" cssClass="sel_70" listKey="key"
									listValue="value" name="automaticBidMap.deadlineStart"></s:select>
								--
								<s:select list="#{3:'3个月',6:'6个月',9:'9个月',12:'12个月',18:'18个月',24:'24个月'}" id="deadlineEnd" cssClass="sel_70" listKey="key"
									listValue="value" name="automaticBidMap.deadlineEnd"></s:select>
							</td>
						</tr>
						<tr>
							<td align="right">信用等级范围：</td>
							<td>
								<s:select list="#{1:'HR',2:'E',3:'D',4:'C',5:'B',6:'A',7:'AA'}" id="creditStart" cssClass="sel_70" listKey="key"
									listValue="value" value="automaticBidMap.creditStart"></s:select>
								--
								<s:select list="#{1:'HR',2:'E',3:'D',4:'C',5:'B',6:'A',7:'AA'}" id="creditEnd" cssClass="sel_70" listKey="key"
									listValue="value" name="automaticBidMap.creditEnd"></s:select>
							</td>
						</tr>
						<tr>
							<td align="right"><span class="fred">*</span>账户保留金额：</td>
							<td><input type="text" id="remandAmount" value="${automaticBidMap.remandAmount}" class="txtmail"/>元	</td>
						</tr>
						<tr>
							<td align="right"><span class="fred">*</span>借款类型：</td>
							<td>
								<s:checkboxlist name="checkList.id"	value="checkList.{#this.id}" list="#{1:'净值借款',3:'信用借款',4:'实地考察借款',5:'机构担保借款'}"
									listKey="key" listValue="value"></s:checkboxlist>
							</td>
						</tr>
						<tr>
						  <td colspan="2">
						  <table width="60%" style="height: 60px;">
						    <tr>
								<td align="center">
									<a href="javascript:void(0);" id="setbtn" class="update">
										<c:if test="%{automaticBidMap.bidStatus ==2}">关闭自动投标</c:if>
										<s:else>开启自动投标</s:else>
									</a>
							    </td>
							    <td align="center"><a href="javascript:void(0);" id="savebtn" class="update">保存设置</a></td>
							</tr>
						  </table>
						  </td>
						</tr>
						<tr>
							<td colspan="2" style="border:1px dashed #c7c7c7; background: #f1f0f0">
								<p><strong>自动投标工具说明</strong></p>
								<p>1、贷款进入招标中十五分钟后，才会启动自动投标。</p>
								<p>2、投标进度达到95%时停止自动投标。若投标后投标进度超过95%，则按照投标进度达到95%的金额向下取50的倍数金额值投标。</p>
								<p>3、单笔投标金额若超过该标贷款总额的20%，则按照20%比例的金额向下取50的倍数金额值投标。</p>
								<p>4、满足自动投标规则的金额小于设定的每次投标金额，也会进行自动投标。</p>
								<p>5、贷款用户在获得贷款时会自动关闭自动投标，以避免借款被用作自动投标资金。</p>
								<p>6、投标排序规则如下：</p>
								<p style="padding-left: 20px;">a）投标序列按照开启自动投标的时间先后进行排序。</p>
								<p style="padding-left: 20px;">b）每个用户每个标仅自动投标一次，投标后，排到队尾。</p>
								<p style="padding-left: 20px;">c）轮到用户投标时没有符合用户条件的标，也视为投标一次，重新排队。</p>
							</td>
						</tr>
					</table>
				</div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>
	
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<input type="hidden" id="s" value="${automaticBidMap.bidStatus}" />
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function() {
	//样式选中
	dqzt(9, 't08');
	$('#savebtn').click(function() {
		var bidA = $('#bidAmount').val();
		if (bidA < 100) {
            alert('请输入大于100的整数');
            return false;
        }
		var chk_value = [];
		$('input[name="checkList.id"]:checked').each(function() {
			chk_value.push($(this).val());
		});
		$("#savebtn").attr("disabled", true);
		param['paramMap.usableSum'] = $('#usableSum').val();
		param['paramMap.bidAmount'] = $('#bidAmount').val();
		param['paramMap.rateStart'] = $('#rateStart').val();
		param['paramMap.rateEnd'] = $("#rateEnd").val();
		param['paramMap.deadlineStart'] = $('#deadlineStart').val();
		param['paramMap.deadlineEnd'] = $('#deadlineEnd').val();
		param['paramMap.creditStart'] = $('#creditStart').val();
		param['paramMap.creditEnd'] = $('#creditEnd').val();
		param['paramMap.remandAmount'] = $('#remandAmount').val();
		param['paramMap.borrowWay'] = '' + chk_value;
		$.shovePost('automaticBidModify.do', param, function(data) {
			$("#savebtn").attr("disabled", false);
			alert(data.msg);
		});
	});
	$('#setbtn').click(function() {
		var str = $('#s').val();
		param['paramMap.s'] = str;
		$.shovePost('automaticBidSet.do', param, function(data) {
			if (data.msg == 1) {
				alert('操作成功');
				window.location.href = 'automaticBidInit.do';
				return false;
			}
			alert(data.msg);
		});
	});
});
//判断输入的不能小于100
function isNumber(){
	var a = $('#bidAmount').val();
	if (a < 100) {
		alert('请输入大于100的整数');
	}
}
</script>
</body>
</html>