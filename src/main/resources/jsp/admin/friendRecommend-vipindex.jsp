<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<html>
  <head>
   <title>投资统计管理首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
  </head>
<body>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="100" id="today" height="28"  class="main_alll_h2">
								<a href="friendRecommendInit.do">普通用户推荐统计</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="100" id="tomorrow"  class="xxk_all_a">
								<a href="friendRecommendInit2.do">vip用户推荐统计</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<div  style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
					<table  style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
						width="100%" border="0">
						<tbody>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									推荐人姓名(vip推荐)
									<input type="text" id="recommendUserName" />
									用户成为vip时间:
									<input id="timeStart" class="Wdate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>&nbsp;&nbsp;
									--
								    <input id="timeEnd" class="Wdate" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})"/>&nbsp;&nbsp;
									<input type="button" id="search" name="search" value="查找" /> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<span id="divList"><img src="static/images/admin/load.gif"
						class="load" alt="加载中..." />
				</span>
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
		
	});	
	function initListInfo(praData){
				praData["paramMap.recommendUserName"] = $("#recommendUserName").val();//推荐人姓名
				praData["paramMap.timeStart"] = $("#timeStart").val();//开始时间
				praData["paramMap.timeEnd"] = $("#timeEnd").val();//结束时间
		 		$.shovePost("friendRecommendList2.do",praData,initCallBack);
		 	}
	function initCallBack(data){
		$("#divList").html(data);
	}		
</script>
</html>
