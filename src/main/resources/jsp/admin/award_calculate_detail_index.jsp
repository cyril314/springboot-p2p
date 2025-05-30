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
		<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
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
			param["userId"] = $("#userId").val();
			param["startTime"] = $("#starttime").val();
			param["endTime"] = $("#endtime").val();
	   		$.post("queryAwardDetailByUserId.do",param,initCallBack);
   		}
   		
   		function initCallBack(data){
		 	$("#dataInfo").html(data);
   		}
		</script>

	</head>
	<body style="min-width: 1200px">
		<div id="right"
			style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
			<div style="padding: 15px 10px 0px 10px;">
				
				<div
					style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: auto; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
						width="100%" border="0">
						<tbody>
							<tr>
							<td class="f66" align="left" width="50%" height="36px">
							<input id="userId" type="hidden" value="${userId }" />
							     时间：
							    <input id="starttime"  class="Wdate" name="paramMap.starttime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>
							   --
							    <input id="endtime" class="Wdate" name="paramMap.endtime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>&nbsp;&nbsp; 
								<input id="search" type="button" value="查找" name="search" class="scbtn"/>
								</td>
							</tr>
							<tr>
							<td class="f66" align="left" width="50%" height="36px">
							<c:if test="#request.map == null || #request.map.size<=0">
							<strong>	总提成(元)：0元 &nbsp;&nbsp;&nbsp; 已结算(元)：0元 &nbsp;&nbsp;&nbsp; 未结算(元)：0元  </strong>
							</c:if>
							<s:else>
							<strong style="color: red;">	总提成(元)：${map.totalMoney }元 &nbsp;&nbsp;&nbsp; 已结算(元)：${map.hasPaySum }元 &nbsp;&nbsp;&nbsp; 未结算(元)：${map.forPaySum }元  </strong>
							</s:else>
							  
							</td>
							</tr>
						</tbody>
					</table>
					<span id="dataInfo"> <img src="${ctx}/static/images/admin/load.gif" class="load" alt="加载中..." /></span>
				</div>
			</div>
		</div>
	</body>
</html>
