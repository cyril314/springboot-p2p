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
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="queryMySuccessBorrowInit.do">还款管理</a>  > 成功的借款</div>
			<div id="acc_tabs">
				<div class="title">
					<a class="on" onclick="jumpUrl('queryMySuccessBorrowInit.do')">成功的借款</a>
					<a onclick="jumpUrl('queryMyPayingBorrowInit.do')">还款中的借款</a>
					<a onclick="jumpUrl('queryPayoffInit.do')">已还完的借款</a>
				</div>				
				<!--内容 开始-->
				<div class="rz_content clearfix tab_content" id="showContent"><div align="center"><img src="{ctx}/static/images/load.gif"/></div>
				</div>
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
<script>
$(function(){
	 dqzt(12,'t012');
	var param = {};
	initListInfo(param);
		 $("#btn_search").click(function(){
		 	if($("#startTime").val() >$("#endTime").val()){
		      	alert("开始日期不能大于结束日期");
		      	return;
		  	}
			$("#pageNum").val(1);
		 	$("#searchForm").submit();
		 });
	 
	  	$("#jumpPage").click(function(){
		  	if($("#startTime").val() >$("#endTime").val()){
		      	alert("开始日期不能大于结束日期");
		      	return;
		  	}
		 	var curPage = $("#curPageText").val();
		 	if(isNaN(curPage)){
				alert("输入格式不正确!");
				return;
			}
		 	$("#pageNum").val(curPage);
		 	$("#searchForm").submit();
		 });
		 
	 });
	
	function showAgree(borrowId){
	     var url = "protocol.do?typeId=15&&borrowId="+borrowId;
	     jQuery.jBox.open("post:"+url, "查看协议书", 650,400,{ buttons: { } });
	     
    }
    
    function jumpUrl(obj){
          window.location.href=obj;
       }
           
     function excelout()
     {
    	window.location.href=encodeURI(encodeURI("exportSuccessBorrow.do?status=-1"+"&&startTime="+$("#startTime").val()+"&&endTime="+$("#endTime").val()+"&&title="+$("#title_s").val())); 
     }
	function initListInfo(param){
		$.post("queryMySuccessBorrowList.do",param,function(data){
			$("#showContent").html(data);
		});
		tab();
	}
	function tab(){
   $("#tab tbody tr:odd").addClass("t2");
   $("#tab tbody tr:even").addClass("t1");
   }
</script>

</body>
</html>
