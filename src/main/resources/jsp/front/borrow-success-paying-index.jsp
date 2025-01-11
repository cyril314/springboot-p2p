<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
    <link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="queryMySuccessBorrowInit.do">还款管理</a>  > 还款中的借款</div>
			<div id="acc_tabs">
				<div class="title">
					<a onclick="jumpUrl('queryMySuccessBorrowInit.do')">成功的借款</a>
					<a class="on" onclick="jumpUrl('queryMyPayingBorrowInit.do')">还款中的借款</a>
					<a onclick="jumpUrl('queryPayoffInit.do')">已还完的借款</a>
				</div>				
				<!--内容 开始-->
				<div class="rz_content clearfix tab_content" id="showContent"><div align="center"><img src="{ctx}/static/images/load.gif"/></div>
				</div>
				<div id="borrow_details"></div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript">
$(function() {
	dqzt(12, 't012');
	var param = {};
	initListInfo(param);
	$('.tabmain').find('li').click(function() {
		$('.tabmain').find('li').removeClass('on');
	});
	$("#btn_search").click(function() {
		if ($("#startTime").val() > $("#endTime").val()) {
			alert("开始日期不能大于结束日期");
			return;
		}
		$("#pageNum").val(1);
		$("#searchForm").submit();
	});

	$("#jumpPage").click(function() {
		if ($("#startTime").val() > $("#endTime").val()) {
			alert("开始日期不能大于结束日期");
			return;
		}
		var curPage = $("#curPageText").val();
		if (isNaN(curPage)) {
			alert("输入格式不正确!");
			return;
		}
		$("#pageNum").val(curPage);
		$("#searchForm").submit();
	});
});

function showAgree(borrowId) {
	var url = "protocol.do?typeId=15&&borrowId=" + borrowId;
	jQuery.jBox.open("post:" + url, "查看协议书", 650, 400, {
		buttons : {}
	});
}

function jumpUrl(obj) {
	window.location.href = obj;
}

function excel2() {
	window.location.href = encodeURI(encodeURI("exportSuccessBorrow.do?status=4"
			+ "&&startTime="
			+ $("#startTime2").val()
			+ "&&endTime="
			+ $("#endTime2").val() + "&&title=" + $("#title2").val()));
}
// 还款明细详情
function payingDetails(id) {
	/*var url = "queryPayingDetails.do?borrowId="+id+"&status=1";
	window.location.href=url;*/
	$("#borrow_des").attr("value", id);
	$("#showContent").hide();
	$("#biaoge_details").hide();
	var param = {};
	param["paramMap.borrowId"] = id;
	param["pageBean.pageNum"] = 1;
	param["paramMap.status"] = "1";
	$.shovePost("queryPayingDetails.do", param, function(data) {
		$('#uls > li').removeClass("on");
		$('#uls > li').eq(3).css('display', 'block');
		$('#uls > li').eq(3).addClass("on");
		$("#borrow_details").html("");
		$("#borrow_details").html(data);
		//弹出框
		});
}
//function  initListInfo(param){
// 	param["paramMap.borrowId"] = $('#borrowIdval').val();
// 	param["paramMap.status"] = "1";
// 	$.shovePost("queryPayingDetails.do",param,function(data){
//       $("#borrow_details").html(data);
//弹出框
//    });
//    tab();
// }
function initListInfo(param) {
	$.post("queryMyPayingBorrowList.do", param, function(data) {
		$("#showContent").html(data);
	});
	tab();
}
function tab() {
	$("#tab tbody tr:odd").addClass("t2");
	$("#tab tbody tr:even").addClass("t1");
}
</script>
</body>
</html>
