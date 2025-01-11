<%@page import="com.sun.org.apache.xml.internal.serialize.Printer"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	<title><%=IConstants.SEO_TITLE %></title>
	<link rel="stylesheet" href="${ctx}/static/css/index.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/static/css/css_old.css" type="text/css" />
	<link rel="stylesheet" href="${ctx}/static/css/inside.css" type="text/css" />
	<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		getOs();
		function getOs(){
			if(navigator.userAgent.indexOf("MSIE 6.0")>0){
				alert("检测到您的浏览器版本过低，请使用 IE7 以上版本。");
		   	}
		}
	</script>
	<script>
		function doYouLock() {
			if (confirm("用户是否要锁定？")) {
				$.post("doYouLock.do", function(data) {
					if (data.msg == 1) {
						alert("用户已经锁定");
						window.location.reload();
						//window.location.href="dliFinance.do";
					} else if (data.msg == 2) {
						alert("用户已经解锁");
						window.location.reload();
						//window.location.href="dliFinance.do";
					}else if (data.msg == 3) {
						alert("用户未激活");
					}else{
						alert("请登录用户");
					}
				});
			}
		}
	</script>
	<style>
	</style>
</head>
<body>
<!--top start-->
<div class="top">
  <div class="center">
    <div class="left"></div>
    <div class="right">
        <!--<a target="_blank" href="http://old.okleyi.com" class="top_old"></a> -->
     <c:if test="#session.user==null">
    	<a href="dliLogin.do">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
     </c:if>
	 <s:else>
		<span style="display: block; float: left; padding-left: 10px;">您好！${duoli.user}&nbsp;正在操作&nbsp;${user.userName} </span>&nbsp;&nbsp;<a href="dliLogout.do">退出</a>
	 </s:else>
    </div>
  </div>
</div>
<div class="clear"><br/><br/></div>
<!--top end--> 
	<!--我要投资 开始-->
	<div class="ny_main clearfix" style="margin-top: -34px;">
		<div class="h_wytz clearfix">
			<div class="tit1">
				<ul class="zq_tit">
					<li class="ico01 on1" id="borrow">
						<span>所有借款</span>
					</li>
				</ul>
				<input id="onlock" name="onlock" value="锁定/解锁" style="float: right; margin-right:10px; width: 80px; height: 30px; line-height: 20px; margin-top: 5px; background: #ca0000; color: #FFF; font-size: 14px; cursor: pointer;" 
					type="button" onclick="doYouLock()" onmouseover="this.style.background='#e01717'" onmouseout="this.style.background='#ca0000'"/>
				<c:if test="#session.user != null">
					<c:if test="#session.user.enable == 4"><span  id="suoding" style="float: right; padding: 0 10px;color: #F00;" >用户已锁定</span></c:if>
					<s:else><span id="notsuoding" style="float: right; padding: 0 10px; " >用户未锁定</span></s:else>
				</c:if>
				
			</div>
			<div id="showIncome"></div>
		</div>
	</div>
<!--我要投资 结束-->
<!-- 引用底部公共部分 -->
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function() {
	var param = {};
	var flag = '${flag}';
	if (flag) {
		$("#borrow").attr("class", "ico02");
		$("#debt").attr("class", "ico01 on1");
		debtInitInfo(param);
	} else {
		borrowInit(param);
	}
	$("#borrow").click(function() {
		$("#borrow").attr("class", "ico01 on1");
		$("#debt").attr("class", "ico02");
		borrowInit(param);
	});
	$("#debt").click(function() {
		$("#borrow").attr("class", "ico02");
		$("#debt").attr("class", "ico01 on1");
		debtInitInfo(param);
	});
});

function borrowInit(param) {
	$.post("dliFinanceBorrowInit.do", param, function(data) {
		$("#showIncome").html(data);
	});
}

function debtInitInfo(param) {
	$.post("financeDebtInit.do", param, function(data) {
		$("#showIncome").html(data);
	});
}
</script>
</body>
</html>
