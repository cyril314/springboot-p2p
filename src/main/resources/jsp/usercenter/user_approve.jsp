<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="../include/head.jsp"></s:include>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script>
	//加载用户信用信息info
	$(function() {
		if ('1' == '${flag}') {
			$.post("queryUserIntegral.do", null, initCallBack);
		} else if ('2' == '${flag}') {
			$('#vi').trigger("click");
		}
		$("#vi").click(function() {
			$("#vi").attr("class", "on");
			$("#cr").attr("class", "");
			var param = {};
			param["pageBean.pageNum"] = 1;
			initListInfo(param);
			tab();
		});
		//点击查看用户的信用积分信息
		$("#cr").click(function() {
			$("#vi").attr("class", "");
			$("#cr").attr("class", "on");
			$.post("queryUserIntegral.do", null, initCallBack);
			tab();
		});
		function tab() {		
    	$("#tab tbody tr:odd").addClass("t2");
    	$("#tab tbody tr:even").addClass("t1");
	}
	});
	
</script>
		<script>
	//分页
	function initListInfo(praData) {
		$.post("queryUservip.do", praData, initCallBack);
	}
	function initCallBack(data) {
		$("#info").html(data);
	}
	
</script>
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
      <div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  > 好乐易贷认证</div>
      
     <div id="acc_tabs">
      <div class="title">
		<a class="on" id="cr">信用积分</a>
		<a id="vi">会员积分</a>
	  </div>
	  <div class="clear"></div>
      <!--标题 结束-->
	  <!--内容 开始-->
	  <div id="info" class="acc_content_all">
	  </div>
      <!--内容 结束-->
	  </div>
      </div>
      </div>
      </div>

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
<!--表格隔行换色 js--> 
<script type="text/javascript">
function tab() {
var Ptr=document.getElementById("tab").getElementsByTagName("tr");
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
}
window.onload=tab;
</script>
	</body>
</html>
