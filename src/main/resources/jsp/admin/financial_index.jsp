<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>管理首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<link href="${ctx}/static/plugins/date/calendar.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popup.js"></script>
		<script type="text/javascript" language="javascript">
		 $(function(){
		    	param["pageBean.pageNum"]=1;
			    initListInfo(param);
			    
			    $("#search").click(function(){
			    param["pageBean.pageNum"] = 1;
				initListInfo(param);
			    	});
			    }
		    )
		    //加载留言信息
		   function initListInfo(praData) {
			    param["userName1"] = $("#userName1").val();
			    param["userName2"] = $("#userName2").val();
			    param["userName3"] = $("#userName3").val();
			    param["userName4"] = $("#userName4").val();
			    param["realName4"] = $("#realName4").val();
				param["startDate"] = $("#startDate").val();
				param["endDate"] = $("#endDate").val();
		   		$.shovePost("queryFinancialInfo.do",praData,initCallBack);
	   		}
	   		
	   		function initCallBack(data){
			 	$("#dataInfo").html(data);
			 	$(".enable").click(function(){
				 		var even = $(this);
				 		var rId = even.attr("rId");
				 		var enable = even.attr("enable");
					 		if(enable==1){
							 			if(confirm("确定要解除关系？")){
										 		$.shovePost("updateRelation.do",{id:rId},function(data){
		 								 		var callBack = data.msg;
	                                            if(callBack == undefined || callBack == ''){
		                                        $('#right').html(data);
		                                        $(this).show();
		                                         }
										 			if(data.msg==1){
										 				alert("解除关系成功！");
										 				even.html("重置关系");
										 				even.attr("enable",2);
										 				window.location.reload();
										 				return;
										 			}
										 			alert(data.msg);
										 		});
								 		}
					 		}else{
					 			ShowIframe("关联投资人","queryrelationinvestorsInit.do?id="+rId,1000,800);
					 		}
			 	});
	   		}
	   		//分页
	   		function pageInfo(pageId){
	   			param["pageBean.pageNum"] = pageId;
	   			initListInfo(param);
	   		}

	   		function startDate(){
				return showCalendar('startDate', '%Y-%m-%d', '24', true, 'startDate');
			}
			
			function endDate(){
				return showCalendar('endDate', '%Y-%m-%d', '24', true, 'endDate');
			}
			
				
				//判断是否有选中项
	   		function checked(str){
	   			var c = 0;
	   			$(".adminId").each( function(i, n){
					if(n.checked){
						c = 1;
					}
				});
				if(c==0){
					alert("请先选中您要"+str+"的项！");
					return false;
				}
				return true;
	   		}
	   		
	   		//全选
	   		function checkAll(e){
		   		if(e.checked){
		   			$(".adminId").attr("checked","checked");
		   		}else{
		   			$(".adminId").removeAttr("checked");
		   		}
	   		}	
	       function popCell(data){
				if(data.msg==1){
	 				alert("重置成功！");
	 				initListInfo(param);
	 				ClosePop();
	 				return;
	 			}
	 			alert(data.msg);
			}
	</script>

	</head>
	<body>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100" height="28" class="main_alll_h2">
								<a href="queryFinancialInit.do">理财人列表</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<div
					style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: auto; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
						width="100%" border="0">
						<tbody>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									业务机构账号：
									<input id="userName1" type="text" />&nbsp;&nbsp; 
									理财经理账号：
									<input id="userName2" type="text" />&nbsp;&nbsp; 
			
									投资人账号：
									<input id="userName3" type="text" />&nbsp;&nbsp; 
								</td>
							</tr>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									
									理财人账号：
									<input id="userName4" type="text" />&nbsp;&nbsp; 
									添加时间:
									<input id="startDate" size="20" maxlength="20" type="text" onclick="startDate();" value="${startDate }" /> —
									<input id="endDate" size="20" maxlength="20" type="text" onclick="endDate();" value="${endDate }" />&nbsp;&nbsp; 
									姓名：
									<input id="realName4" type="text" />
									<input id="search" type="button" value="确定" name="search" />
								</td>
							</tr>
						</tbody>
					</table>
					<span id="dataInfo"> </span>
				</div>
			</div>
		</div>
	</body>
</html>
