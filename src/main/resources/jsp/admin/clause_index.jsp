<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>条款编辑管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
	<script type="text/javascript">
	$(function() {
		param["pageBean.pageNum"] = 1;
		initListInfo(param);
	});

	function initListInfo(param) {
		$.shovePost("queryClauseListPage.do", param, initCallBack);
	}

	function initCallBack(data) {
		$("#dataInfo").html(data);
	}

	function dels() {
		if (!window.confirm("确定要删除吗?")) {
			return;
		}
		var stIdArray = [];
		$("input[name='cb_ids']:checked").each(function() {
			stIdArray.push($(this).val());
		});
		if (stIdArray.length == 0) {
			alert("请选择需要删除的内容");
			return;
		}
		var ids = stIdArray.join(",");
		window.location.href = "deleteClause.do?commonId=" + ids;
	}

	function del(id) {
		alert(id);
		if (!window.confirm("确定要删除吗?")) {
			return;
		}
		window.location.href = "deleteClause.do?commonId=" + id;
	}

	function checkAll(e) {
		if (e.checked) {
			$(".helpId").attr("checked", "checked");
		} else {
			$(".helpId").removeAttr("checked");
		}
	}
   	</script>
	<style type="text/css">
	.collapsed {
		display: none;
	}
	.tablemain {
		background-color: #278296;
		border-collapse: collapse;
		border: solid 1px #447;
		padding: 0px;
		text-align: left;
	}
	.tablemain td {
		margin-left: 3px;
	}
	.treet {
		background-color: #F4FAFB
	}
	.treet td {
		font: normal 10pt Arial;
		padding: 0px 2px 0px 0px;
		cursor: pointer;
	}
	.adeimg, .ttimage, .parimg, .preimg {
		border: none;
		margin: 0px;
		padding: 0px;
		vertical-align: bottom;
		width: 16px;
		height: 16px;
	}
	.adeimg, .parimg {
		cursor: pointer;
	}
	.even {
		background-color: #BBDDE5;
	}
	.over {
		background-color: #ffc;
	}
	</style>
</head>
<body>
<form action="queryHelpCategoryListPage.do" method="post" >
	<div id="right" style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
		<div style="padding: 15px 10px 0px 10px;">
			<div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="100" height="28" align="center" bgcolor="#CC0000" class="white12">
							<a href="queryClauseListPageInit.do">条款编辑管理</a>
						</td>
						<td width="2">&nbsp;</td>
						<td width="100" align="center" bgcolor="#8594A9" class="white12">
							<a href="addClauseInit.do">添加条款</a>
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			<div style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
				<span id="dataInfo"></span>
			</div>
		</div>
	</div>
</form>
</body>
</html>
