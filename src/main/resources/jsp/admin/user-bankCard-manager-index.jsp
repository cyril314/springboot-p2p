<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>财务管理-用户银行卡管理</title>
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
			});
			
			function initListInfo(param){
				param["paramMap.userName"] = $("#userName").val();
				param["paramMap.checkUser"] = $("#checkUser").val();
				param["paramMap.realName"] = $("#realName").val();
				param["paramMap.modifiedTimeStart"]= $("#modifiedTimeStart").val();
				param["paramMap.modifiedTimeEnd"]= $("#modifiedTimeEnd").val();
				param["paramMap.checkTimeStart"]= $("#checkTimeStart").val();
				param["paramMap.checkTimeEnd"]= $("#checkTimeEnd").val();
		 		$.shovePost("queryUserBankList.do",param,initCallBack);
		 	}
		 	
		 	function initCallBack(data){
				$("#dataInfo").html(data);
			}
			
			function show(id){
   			  var url = "queryOneBankCardInfo.do?bankId="+id;
              ShowIframe("银行卡详情显示",url,600,400);
   			}
						
		</script>
	</head>
	<body>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="120" height="28" class="main_alll_h2">
								<a href="queryUserBankInit.do">用户银行卡管理</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="120" class="xxk_all_a">
								<a href="queryModifyBankInit.do">用户银行卡变更</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div
						style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
						<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
							width="100%" border="0">							
								<tbody>
								<tr>
									<td class="f66" align="left" width="50%" height="36px">
										用户名：&nbsp;&nbsp;
										<input id="userName" name="paramMap.username" type="text"/>
										&nbsp;&nbsp;
										审核人：
										<s:select id="checkUser" list="checkers" name="paramMap.userName" listKey="id" listValue="userName" headerKey="-100" headerValue="--请选择--" />
										&nbsp;&nbsp;&nbsp;&nbsp;
										真实姓名：
										<input id="realName" name="realName" type="text"/>
										&nbsp;&nbsp;
										
									</td>
								</tr>
								<tr>
								  <td class="f66" align="left" width="50%" height="36px">
								        提交时间：
										<input id="modifiedTimeStart" name="paramMap.modifiedTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
										&nbsp;--&nbsp;
										<input id="modifiedTimeEnd" name="paramMap.modifiedTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
									   &nbsp;&nbsp;
									    审核时间：
										<input id="checkTimeStart" name="paramMap.checkTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
										&nbsp;--&nbsp;
										<input id="checkTimeEnd" name="paramMap.checkTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
										&nbsp;&nbsp;
										<input id="bt_search" type="button" value="搜索"  />
								  </td>
								</tr>		
								<tbody>					
						</table>
						<span id="dataInfo" > </span>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
