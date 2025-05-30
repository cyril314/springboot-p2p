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
	    //
	   function initListInfo(praData) {
			param["level1userId"] = ${level1userId};
			param["level2userId"] = ${level2userId};
			param["luserName"] = $("#luserName").val();
	   		$.shovePost("queryLeve1AwardInfo.do",praData,initCallBack);
   		}
   		
   		function initCallBack(data){
		 	$("#dataInfo").html(data);
   		}
   		
   		//分页
   		function pageInfo(pageId){
   			param["pageBean.pageNum"] = pageId;
   			initListInfo(param);
   		}
	</script>

	</head>
	<body>
		<div id="right">
			<div style="padding: 15px 10px 0px 10px;">
				<div>
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="200" height="28"  class="xxk_all_a">
								<a href="queryAwardTinit.do">业务机构提成管理</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="150" height="28"  class="xxk_all_a">
								<a href="queryAwardLevel1Init.do?level1userId=${level1userId }">业务机构提成奖励统计</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td   height="28"  class="main_alll_h3">
								<a href="queryLeve1AwardInit.do?level2userId=${level2userId}&&level1userId=${level1userId }">提成奖励明细</a>
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
									投资人账号： 
									<input id="luserName" />&nbsp;&nbsp; 
									<input id="search" type="button" value="搜索" name="search" />
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
