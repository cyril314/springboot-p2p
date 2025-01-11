<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		param['paramMap.mailStatus'] = -1;
		param["pageBean.pageNum"] = 1;
		initListInfo(param);
	});

	function initListInfo(praData) {
		$.shovePost("querySysMails.do", praData, initCallBack);
	}
	function initCallBack(data) {
		$("#sys_mail_list").html(data);
	}

	function showSysMailInfo(id, type) {
		$("#srh").hide();
		$("#biaoge").hide();
		$("#show_mail").show();
		var curPage = $("#curPage").val();

		window.location.href = "queryEmailById.do?mailId=" + id + "&type=" + type + "&curPage="+ curPage;
		/*$.post("queryEmailById.do?mailId=" + id + "&type=" + type + "&curPage="
				+ curPage, function(da) {
			$("#show_mail").html(da);
		});*/
	}
</script>

<span id="sys_mail_list"></span>
<span id="show_mail"></span>
