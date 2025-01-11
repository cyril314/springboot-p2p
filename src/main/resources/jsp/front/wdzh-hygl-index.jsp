<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  > 好友管理</div>
			<div id="acc_tabs">
				<div class="title">
					<a class="on" id="rc">推荐记录</a>
					<a id="cc">关注用户 </a>
				</div>				
				<!--内容 开始-->
				<div class="acc_content_all">
						<div>
							<p style="margin-top: 15px;">
								邀请链接：
								<span id="yq_address_input">${url}reg.do?param=${userId}</span>&nbsp;&nbsp;&nbsp;
								<input type="button" value="复 制" class="myhome_btn" id="yq_address_btn" />
							</p>
							<p class="ts">温馨提示:请不要发送邀请信给不熟悉的人士，避免给别人带来不必要的困扰。请把下边的链接地址发给您的好友，这样您就成了他的邀请者。您邀请的好友注册成为VIP后，您可以立刻获得${fee}元的理财金奖励。</p>
							<div id="showContent"><div align="center"><img src="{ctx}/static/images/load.gif"/></div></div>
						</div>
					</div>				
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>	
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/zclip/jquery.zclip.min.js"></script>
<script>
	$(function() {
		$("#zh_hover").attr('class', 'nav_first');
		$("#zh_hover div").removeClass('none');
		dqzt(2,'t04');
		initListInfo();
		tab();

		$('.tabtil').find('li').click(function() {
			$('.tabtil').find('li').removeClass('on');
			$(this).addClass('on');
			$('.tabtil').nextAll('div').hide();
			$('.tabtil').nextAll('div').eq($(this).index()).show();
		});

		$("#rc").click(function() {
			$("#rc").attr("class", "on");
			$("#cc").attr("class", "");
			$.post("friendManagerList.do", null, initCallback);
			tab();
		});
		$("#cc").click(function() {
			$("#rc").attr("class", "");
			$("#cc").attr("class", "on");
			var param = {};
			param["paramMap.id"] = ${user.id}
			param["paramMap.attention"] = "attention";
			$.post("userFrends.do", param, initCallback);
			tab();
		});
	});

	function initListInfo() {
		$.shovePost("friendManagerList.do", param, initCallback);
	}
	function initCallback(data) {
		$("#showContent").html(data);
	}

	$(function() {
		init();
		tab();
	});
	function init() {
		if (!$.browser.msie) {
			$('#yq_address_btn').zclip( {
				path : '${ctx}/static/plugins/zclip/ZeroClipboard.swf',
				copy : function() {
					return $('#yq_address_input').html();
				}
			});
		}
	}
	
	function tab(){
		$("#tab tbody tr:odd").addClass("t2");
		$("#tab tbody tr:even").addClass("t1");
	}
</script>
</body>
</html>

