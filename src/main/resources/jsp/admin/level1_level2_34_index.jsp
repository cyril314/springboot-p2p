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
	    //加载留言信息
	   function initListInfo(praData) {
			param["level1userId"] = '${level1userId}';
			param["level"] = '${level}';
			param["level2userName"] = $("#level2userName").val();
			param["dateStatus"] = $("#dateStatus").val();
	   		$.shovePost("queryLevel1level4Info.do",praData,initCallBack);
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
							<td width="150" height="28"  class="xxk_all_a">
								<a href="queryAwardLevel1Init.do?level1userId=${level1userId }">业务机构提成奖励明细</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="150" height="28"  class="xxk_all_a">
								<a href="queryLeve2AwardInit.do?parentId=${level1userId }">理财经理提成奖励</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="150" height="28" class="${level==3?'main_alll_h2':'xxk_all_a' }">
								<a href="queryLevel1level3Init.do?level1userId=${level1userId }">投资人提成奖励</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
							<td width="150" height="28" class="${level==3?'xxk_all_a':'main_alll_h2' }">
								<a href="queryLevel1level4Init.do?level1userId=${level1userId }">理财人提成奖励</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<div
					style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
					<table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0"
						width="100%" border="0">
						<tbody>
							<tr>
								<td class="f66" align="left" width="50%" height="36px">
									理财经理：
									<input id="level2userName" type="text" />&nbsp;&nbsp;
									${level==3?'投资人':'理财人' }状态：
									<s:select list="#{-1:'--请选择--',1:'有效期',2:'已过期'}" id="dateStatus"></s:select>
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
