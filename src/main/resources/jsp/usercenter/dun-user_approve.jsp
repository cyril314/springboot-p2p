<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="../include/head.jsp"></s:include>
		<link href="${ctx}/static/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script>
	//加载用户信用信息info
	$(function() {
		var param = {};
		initListInfo(param);
		$("#vi").click(function() {
			$("#vi").attr("class", "on");
			$("#cr").attr("class", "");
			var param = {};
			param["pageBean.pageNum"] = 1;
			initListInfo(param);
		});
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


		<div class="ny_main1 clearfix">
			<div class="myhome_main clearfix">
				<!-- 引用我的帐号主页左边栏 -->
				<%@include file="../include/dun-left.jsp"%>
				<!--右 开始-->
				<div class="myhome_r clearfix">
					<!--标题 开始-->
					<div class="ny_tit tab_meun">
						<ul>
							<li id="vi" class="on">
								会员积分
							</li>
						</ul>
					</div>
					<!--标题 结束-->
					<!--内容 开始-->
					<div class="rz_content clearfix tab_content" id="info">
					</div>
					<!--内容 结束-->
				</div>
				<!--右 结束-->
			</div>
		</div>


		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
		<script>
			$(function() {
				dqzt(1,'t04');
			});
		</script>
	</body>
</html>
