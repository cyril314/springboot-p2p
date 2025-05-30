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
			praData["paramMap.level1userName"] = $("#level1userName").val();
			praData["paramMap.realName"] = $("#realName").val();
			praData["paramMap.startTime"] = $("#startTime").val();
			praData["paramMap.endTime"] = $("#endTime").val();
	   		$.shovePost("quereyAgentCloseMoneyInfo.do",praData,initCallBack);
   		}
   		
   		function initCallBack(data){
		 	$("#dataInfo").html(data);
   		}
   		function updatestatus(data){
   		      if(!window.confirm("确认结算?")){
   		         return ;
   		      }
   		      param["paramMap.id"] = data
               $.post("updateMoneyInfo.do",param,function(data){
               var callBack = data.msg;
	      if(callBack == undefined || callBack == ''){
		                 $('#right').html(data);
		                 $(this).show();
		                 }
                  if(data.msg=="1"){
                    alert("结算成功");
                    window.location.reload();
                    return ;
                  }
                  alert(data.msg);
               });   		
   		
   		}
   		
   		//分页
   		function pageInfo(pageId){
   			param["pageBean.pageNum"] = pageId;
   			initListInfo(param);
   		}
	</script>

	</head>
	<body>
		<div id="right"
			style="background-image: url(images/admin/right_bg_top.jpg); background-position: top; background-repeat: repeat-x;">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="150" height="28" align="center" 
								class="main_alll_h2">
								<a href="queryAwardLevel23Init.do">理财经理月结算管理</a>
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
									理财经理账号：
									<input id="userName" type="text"/>&nbsp;&nbsp; 
								    真实姓名:
									<input id="realName" type="text"/>&nbsp;&nbsp; 
								   时间：
									<input id="startTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>&nbsp;&nbsp; 
							       &nbsp;--&nbsp;&nbsp;&nbsp;
									<input id="endTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" />&nbsp;&nbsp;
									<input id="search" type="button" value="确定" name="search" />
								</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</table>
					<span id="dataInfo"> </span>
				</div>
			</div>
		</div>
	</body>
</html>
