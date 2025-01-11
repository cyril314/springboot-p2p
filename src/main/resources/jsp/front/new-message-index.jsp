<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<style>
.pertop ul li{padding:0 20px ; float: left; font-size: 16px; color: #FFF; cursor: pointer;}
.current{background: #1ca4ad;color: #FFF;}
</style>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 引用头部公共部分End -->
<div class="account ">
	<div class="acc_content">
		<div class="pertop">
			<ul>
				<li id="tzlc">投资理财</li>
				<li id="jkrz">借款融资</li>
				<li id="aqbz">安全保障</li>
			</ul>
			<a href="index.do" class="ca_back">返回</a>
		</div>
		<div class="percontent">
			<div style="font-size: 25px;text-align: center; height:50px; line-height: 50px; font-weight: bolder;">
				<div id="title"></div>
			</div>
			<div>
				<div id="content"></div>
			</div>
		</div>
	</div>
</div>

<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src=".${ctx}/static/script/jquery.min.js"></script>
<script><!--
	$(function(){
		$("#tzlc").click(function(){
			window.location.href='getMessageBytypeId.do?typeId=35';
		});
		$("#jkrz").click(function(){
			window.location.href='getMessageBytypeId.do?typeId=36';
		});
		$("#aqbz").click(function(){
			window.location.href='getMessageBytypeId.do?typeId=37';
		});
		queryInfo();
		var type = ${type};
		if(type==35){
			$("#tzlc").addClass("current");
			$("#jkrz").removeClass("current");
			$("#aqbz").removeClass("current");
		}else if(type==36){
			$("#tzlc").removeClass("current");
			$("#jkrz").addClass("current");
			$("#aqbz").removeClass("current");
		}else if(type==37){
			$("#tzlc").removeClass("current");
			$("#jkrz").removeClass("current");
			$("#aqbz").addClass("current");
		}
	});
	function queryInfo(){
		$.post("queryMessageDetail.do","typeId="+${type},function(data){
			$("#title").html(data.columName);
			$("#time").html(data.publishTime);
			$("#content").html(data.content);
		});
	}
--></script>
</body>
</html>
