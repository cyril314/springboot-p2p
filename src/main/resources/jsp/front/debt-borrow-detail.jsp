<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script>
	$(function() {
		var maxAuctionPrice = $("#maxAuctionPrice").val();
		if (maxAuctionPrice == "") {
			$("#s_maxAuctionPrice").html("无");
		} else {
			$("#s_maxAuctionPrice").html("￥" + maxAuctionPrice);
		}
		if ($("#debtStatus").val() == 2) {
			$("#remainTimeTwo").html($("#remainDays").val());
		}
	});
</script>
<!--借款人信息 开始-->
<%-- 	<h4>
		<em style="float: right;">
			<a href="javascript:void(0);" id="sendmail">发送站内信</a>&nbsp;&nbsp;
			<a href="javascript:void(0);" id="reportuser">举报此用户</a>&nbsp;&nbsp;
			<a id="focusonUser" href="javascript:void(0);">关注此用户</a>&nbsp;&nbsp;
		</em>
	</h4>
--%>
	<table style=" width: 100%; margin:0; padding-bottom: 20px; margin-left: 20px; border: 0;">
		<tr>
	        <td width="214">转让人： ${uName}</td>
	        <td colspan="2">居住城市：${zqUserMap.address}</td>
	    </tr>
	    <tr>
	    	<td>性别：${zqUserMap.sex}</td>
			<td>学历：${zqUserMap.highestEdu}</td>
			<td>婚否：${zqUserMap.maritalStatus}</td>
	    </tr>
    </table>
<!--借款人信息 结束-->
<script>
	//发送站内信息
	$('#sendmail').click(function() {
		var id = '${borrowUserMap.userId}';
		var username = '${borrowUserMap.username}';
		var url = "mailInit.do?id=" + id + "&username=" + username;
		var uname = '${user.userName}';
		if (username == uname) {
			alert("您不能给自己发送站内信");
			return false;
		}
		$.shovePost('mailInit.do', param, function(data) {
			$.jBox("iframe:" + url, {
				title : "发送站内信",
				width : 500,
				height : 400,
				buttons : {}
			});
		});
	});

	//举报此人
	$('#reportuser').click(function() {
		var id = '${borrowUserMap.userId}';
		var username = '${borrowUserMap.username}';
		var url = "reportInit.do?id=" + id + "&username=" + username;
		var uname = '${user.userName}';
		if (username == uname) {
			alert("您不能举报自己");
			return false;
		}
		$.shovePost('reportInit.do', param, function(data) {
			$.jBox("iframe:" + url, {
				title : "举报此人",
				width : 500,
				height : 400,
				buttons : {}
			});
		});
	});

	//关注此用户
	$('#focusonUser').click(function() {
		var username = '${borrowUserMap.username}';
		var uname = '${user.userName}';
		if (username == uname) {
			alert("您不能关注自己");
			return false;
		}
		param['paramMap.id'] = '${borrowUserMap.userId}';
		$.shovePost('focusonUser.do', param, function(data) {
			var callBack = data.msg;
			alert(callBack);
		});
	});
</script>

<script type="text/javascript">
	function cutText(str) {
		if (str.length > 80)
			return str.substr(0, 80) + ".....";
		return str;
	}

	$(function() {
		$(".conter").each(function() {
			$(this).data("ff", $(this).text());
			$(this).text(cutText($(this).text()));
		});
	});

	function openContent(obj) {
		var content = $(obj).parent().children(".conter");

		content.text(content.data("ff"));
		$(obj).hide();
		$(obj).next().show();
	}

	function closeContent(obj) {
		var content = $(obj).parent().children(".conter");

		content.text(cutText(content.data("ff")));
		$(obj).hide();
		$(obj).prev().show();
	}
</script>