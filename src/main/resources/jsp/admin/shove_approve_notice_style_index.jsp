<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>借款管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		<script type="text/javascript">
			$(function(){
				param["pageBean.pageNum"] = 1;
				param["sid"] =$("#styleId").val();
				initListInfo(param);
			});
			
			function initListInfo(param){
		 		$.shovePost("queryNoticeStyleAllList.do",param,initCallBack);
		 	}
		 	
		 	function initCallBack(data){
		 	  
				$("#dataInfo").html(data);
			}
			
		 	
		</script>
	</head>
	<body style="min-width: 1000px">
		<div id="right">
		<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<c:if test="#request.sid==1 || #request.sid == 0">
							<td width="100" height="28"  class="main_alll_h2">
							</c:if>
							<s:else>
							<td width="100" height="28"  class="xxk_all_a">
							</s:else>
								<a href="queryNoticeStyleAllInit.do?sid=1">站内信提醒设置</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							
							<c:if test="#request.sid==2">
							<td width="100" height="28"  class="main_alll_h2">
							</c:if>
							<s:else>
							<td width="100" height="28"  class="xxk_all_a">
							</s:else>
								<a href="queryNoticeStyleAllInit.do?sid=2">短信提醒设置</a>
							</td>
							
							<td width="2">
								&nbsp;
							</td>
							<c:if test="#request.sid==3">
							<td width="100" height="28"  class="main_alll_h2">
							</c:if>
							<s:else>
							<td width="100" height="28"  class="xxk_all_a">
							</s:else>
								<a href="queryNoticeStyleAllInit.do?sid=3">邮件提醒设置</a>
								<c:if test="#sid==2"></c:if>
							</td>
							<td>
								&nbsp;<input type="hidden" value="${sid}" name="styleId" id="styleId">
							</td>
						</tr>
					</table>
					<div
						style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: auto; padding-top: 10px; background-color: #fff;">
						<span id="dataInfo"> <img src="${ctx}/static/images/admin/load.gif" class="load" alt="加载中..." /></span>
					</div>
				</div>
			</div>
	</body>
</html>
