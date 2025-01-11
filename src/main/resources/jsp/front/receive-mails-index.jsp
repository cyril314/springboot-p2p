<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		param["pageBean.pageNum"] = 1;
		param['paramMap.mailStatus'] = -1;
		initListInfo(param);
	});
	function initListInfo(praData) {
		$.shovePost("queryReciveMails.do", praData, initCallBack);
	}
	function initCallBack(data) {
		$("#receive_mail_list").html(data);
	}
</script>
<span id="receive_mail_list"></span>
<span id="show_receive_mail"></span>
