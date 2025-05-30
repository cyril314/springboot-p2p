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
		<link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/date/calendar.css"/>
		<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
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
		    param["paramMap.userName"] = $("#userName").val();
			param["paramMap.realName"] = $("#realName").val();
	   		$.shovePost("queryxxRechargeInfo.do",param,initCallBack);
   		}
   		
   		function initCallBack(data){
		 	$("#dataInfo").html(data);
   		}
   		
		</script>

	</head>
	<body style="min-width: 1000px;">
		<div id="right"
			style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							   <td width="100" height="28" 
								class="main_alll_h2">
								<a href="javascript:void(0);">线下充值管理</a>
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
									用户名:
									<input id="userName" name="paramMap.userName" />&nbsp;&nbsp; 
									真实姓名：
									<input id="realName" name="paramMap.realName" />&nbsp;&nbsp; 
									<input id="search" type="button" value="查找" name="search" />
								</td>
							</tr>
						</tbody>
					</table>
					<span id="dataInfo"><img src="${ctx}/static/images/admin/load.gif" class="load" alt="加载中..." /> </span>
				</div>
			</div>
		</div>
	</body>
</html>
