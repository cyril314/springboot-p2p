<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!--所有借款-->
<dl class="tz_dl clearfix all_zq">
	<dt>
        <input type="hidden" value="${order }" id="norder"/>
		<ul class="item" id="order">
			<li class="col1" style="text-align: center;">
				借款标题/借款类型
			</li>
			<li class="col2">信用等级</li>
			<li class="col3" style="align:center;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="downd" id="11">年利率</a>
			</li>
			<li class="col4" style="align:center;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px; display:block;text-align:center;width:110px;" class="downd" id="13">网站奖励</a>
			</li>
			<li class="col5" style="align:center;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="downd" id="14">金额</a>
			</li>
			<li class="col6" style="align:center;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="downd" id="12">期限</a>
			</li>
			<li class="col7" style="align:center;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="downd" id="15">进度</a>
			</li>
			<li class="col8">操作</li>
		</ul>
	</dt>
	<span id="showList"><img src="${ctx}/static/images/load.gif"/></span>
</dl>

<script type="text/javascript">
	$(function(){
		var param = {};
		initListInfo(param);
		$("#order a").click(function(){
			if($(this).attr("class")=="up"){
				$(this).attr("class","down");
				$(this).val(2);
			}else if ($(this).attr("class")=="down"){
				$(this).attr("class","up");
				$(this).val(1);
			}else{
				return;
			}
			$("#norder").val($(this).attr("id"));
			var praData={};
			initListInfo(praData);
		});
	});
	function initListInfo(param) {
		param["paramMap.order"] = $("#norder").val();
		param["paramMap.orderRate"]=$("#11").val();
		param["paramMap.orderDeadline"]=$("#12").val();
		param["paramMap.orderExcitation"]=$("#13").val();
		param["paramMap.orderAmount"]=$("#14").val();
		param["paramMap.orderHasInvestAmount"]=$("#15").val();
		$.post("dliFinanceList.do", param, function(data) {
			$("#showList").html(data);
		});
	};
</script>
