<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@include file="../include/taglib.jsp"%>
<script type="text/javascript">
	$(function() {
		initListInfo(param);
	});

	function initListInfo(praData) {
		$.shovePost("querySendMails.do", praData, initCallBack);
	}
	function initCallBack(data) {
		$("#send_mail_list").html(data);
	}

	function showSysMailInfo(id, type) {
		$("#send_srh").hide();
		$("#send_biaoge").hide();
		$("#show_send_mail").show();
		window.location.href = "queryEmailById.do?mailId=" + id + "&type=" + type;
		/*$.post("queryEmailById.do?mailId=" + id + "&type=" + type,
				function(da) {
					$("#show_send_mail").html(da);
				});*/
	}
</script>
<span id="send_mail_list"></span>
<span id="show_send_mail"></span>
