<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>财务管理-充值管理</title>
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
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
		<script type="text/javascript">
			$(function(){
				param["pageBean.pageNum"] = 1;
				initListInfo(param);
				$("#bt_search").click(function(){
					param["pageBean.pageNum"] = 1;
					initListInfo(param);
				});
				
				$("#excel").click(function(){      
				     $("#excel").attr("disabled",true);
                      window.location.href=encodeURI(encodeURI("exportBackCash.do?checkUser="+$("#checkUser").val()+"&&startTime="+$("#startTime").val()+"&&endTime="+$("#endTime").val()+"&&userName="+$("#userName").val()+"&&type="+$("#type").val()));
                setTimeout("test()",4000);
				});				
			});	
			function test(){
			   $("#excel").attr("disabled",false);
			   }		
			function initListInfo(param){
				param["paramMap.checkUser"] = $("#checkUser").val();
				param["paramMap.startTime"] = $("#startTime").val();
				param["paramMap.endTime"] = $("#endTime").val();
				param["paramMap.type"] = $("#type").val();
				param["paramMap.uname"] = $("#userName").val();
		 		$.shovePost("queryBackCashDetails.do",param,initCallBack);
		 	}
		 	
		 	function initCallBack(data){
				$("#dataInfo").html(data);
			}
							
		</script>
	</head>
	<body>
	<s:hidden id="userId" name="paramMap.userId"  ></s:hidden>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="120" height="28" class="xxk_all_a">
								<a href="queryUserCashListInit.do">充值管理</a>
							</td>
							<td width="2">&nbsp;</td>
							<td width="120" class="main_alll_h2">
								<a href="queryBackCashDetailsInit.do">充值明细</a>
							</td>
							<td width="2">&nbsp;</td>
							<td width="2">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					<div style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
						<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0" width="100%" border="0">
							<tbody>
								<tr>
									<td class="f66" align="left" width="80%" height="36px">
										 用户名：&nbsp;&nbsp;
										<input style="width:100px" id="userName" name="paramMap.username" type="text"/>
										&nbsp;&nbsp;
										操作员：&nbsp;&nbsp;
										<input style="width:100px" id="checkUser" name="paramMap.checkUser" type="text"/>
										&nbsp;&nbsp;
										操作时间：
										<input id="startTime" name="paramMap.startTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
										&nbsp;&nbsp;
										到
										<input id="endTime" name="paramMap.endTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
										&nbsp;&nbsp;
										类型：
										<s:select id="type" list="operateType" name="paramMap.type" listKey="typeId" listValue="tvalue" headerKey="-100" headerValue="--请选择--" />
										&nbsp;&nbsp;
										
										<input id="bt_search" type="button" value="搜 索"  />
										&nbsp;&nbsp;
										<input id="excel"  type="button" value="导出EXCEL" name="btnExportExcel" />
									</td>
								</tr>
							</tbody>
						</table>
						<span id="dataInfo"> </span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>