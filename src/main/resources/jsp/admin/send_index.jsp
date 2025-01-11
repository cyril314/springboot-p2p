<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
	<head>
		<title>发送记录</title>
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
  	                initListInfo(param);
				});
				
			   
				
			});
			
			function initListInfo(param){	
			    
  	             param["paramMap.beginTime"] = $("#beginTime").val();	
  	             param["paramMap.endTime"] = $("#endTime").val();							    
		 		$.shovePost("querySendSMSListPage.do",param,initCallBack);
		 	}
		 	
		 	function initCallBack(data){
		 	  	$("#dataInfo").html(data);
			
			}
		    
		    function updates(e){
		       $.post("getSendSMSByDetailpage.do","id="+e,function(data){
		           	$("#dataInfo").html(data);
		       });
		    }
			

		 	
		</script>
	</head>
	<body style="min-width: 1000px"> 
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td id="admins" width="100" height="28"  class="xxk_all_a">
								<a href="queryUserListInit.do">手动发送</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td id="adusers" width="100"  class="main_alll_h2">
								<a href="querySendSMSListInit.do">发送记录</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td >
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
									<td class="f66" align="left" width="80%" height="36px">
										
										发送时间：
										 <input id="beginTime"  type="text"   name="paramMap.beginTime"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})"/>
										 --
										  <input id="endTime"  type="text"   name="paramMap.endTime"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:'readOnly'})"/>
										 
										<input id="bt_search" type="button" value="查找"  />
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
