<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>投标排名管理首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<link href="${ctx}/static/css/admin/admin_custom_css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100" id="today" height="28"  class="xxk_all_a">
								<a href="investStatisInit.do">投标记录</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="100" id="tomorrow"  class="main_alll_h2">
								投标排名
							</td>
								
							<td>
								&nbsp;
							</td>
							</tr>
					</table>
				</div>
				<div style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
						width="100%" border="0">
						<tbody>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									用户名:
									<input id="investor" value="" />&nbsp;&nbsp; 
									时间:
									<input id="timeStart" class="Wdate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})"/>&nbsp;&nbsp;
									--
									<input id="timeEnd" class="Wdate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})"/>&nbsp;&nbsp;
									用户组:
									<s:select id="group" list="userGroupList" listKey="selectValue" listValue="selectName" headerKey="-1" headerValue="--请选择--"></s:select>
									<input id="search" type="button" value="查找" name="search" />
									&nbsp;&nbsp;
									<input id="excel" type="button" value="导出Excel" name="excel" />
								</td>
							</tr>
						</tbody>
					</table>
		             <span id="divList"><img src="${ctx}/static/images/admin/load.gif" class="load" alt="加载中..." /></span>
					<div>
	</div>
</div>
			</div>
		</div>
	</body>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script type="text/javascript">
			$(function(){
				initListInfo(param);
				$('#search').click(function(){
				   param["pageBean.pageNum"]=1;
				   initListInfo(param);
				});	
				
				$("#excel").click(function(){
				  window.location.href=encodeURI(encodeURI("exportinvestStatisRank.do?investor="+$("#investor").val()+"&&timeStart="+$("#timeStart").val()+"&&timeEnd="+$("#timeEnd").val()+"&&group="+$("#group").val()));
				
				});			
			});			
			function initListInfo(praData){
				praData["paramMap.investor"] = $("#investor").val();
				praData["paramMap.timeStart"] = $("#timeStart").val();
				praData["paramMap.timeEnd"] = $("#timeEnd").val();
				praData["paramMap.group"] = $("#group").val();
		 		$.shovePost("investStatisRankList.do",praData,initCallBack);
		 	}
		 	function initCallBack(data){
				$("#divList").html(data);
			}
</script>
</html>
