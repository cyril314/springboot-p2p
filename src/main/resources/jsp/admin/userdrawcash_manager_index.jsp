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
		   
	    });
	    //加载留言信息
	   function initListInfo(praData) {
	   		param["paramMap.userName"] = $("#userName").val();
	   		param["paramMap.startUseableSum"] = $("#startUseableSum").val();
	   		param["paramMap.endUseableSum"] = $("#endUseableSum").val();
	   		param["paramMap.realName"] = $("#realName").val();
	   		param["paramMap.startAllSum"] = $("#startAllSum").val();
	   		param["paramMap.endAllSum"] = $("#endAllSum").val();
	   		param["paramMap.cashStatus"] = $("#cashStatus").val();
	   		$.shovePost("queryDrawCashManagerInfo.do",param,initCallBack);
   		}
   		
   		function initCallBack(data){
		 	$("#dataInfo").html(data);
   		}
   		
   		//分页
   		function pageInfo(pageId){
   			param["pageBean.pageNum"] = pageId;
   			initListInfo(param);
   		}
   		
   		//删除单个
   		function deleteById(ids,cashStatus){
   			var msg = "开启";
   			if(cashStatus == 2){
   				msg = "禁止";
   			}
	 		
	 		if(window.confirm("确定要"+msg+"吗?")){
	 			window.location.href = "updateUserCashStatus.do?id="+ids+"&cashStatus="+cashStatus;
	 		}
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
   		
   		function addGroupInit(){
   			window.location.href = "addGroupInit.do";
   		}
   		//删除多个选中项
   		function deleteAll(cashStatus){
   			if(!checked("删除")){
   				return;
   			}
   			var msg = "开启";
   			if(cashStatus == 2){
   				msg = "禁止";
   			}
	 		if(!window.confirm("确定要"+msg+"所有选中记录?")){
	 			return;
	 		}
	 		var ids = "";
			$(".adminId").each( function(i, n){
				if(n.checked){
					ids += n.value+",";
				}
			});
			ids = ids.substring(0,ids.lastIndexOf(","));
		 	window.location.href = "updateUserCashStatus.do?id="+ids+"&cashStatus="+cashStatus;
   		}

   		//全选
   		function checkAll(e){
	   		if(e.checked){
	   			$(".adminId").attr("checked","checked");
	   		}else{
	   			$(".adminId").removeAttr("checked");
	   		}
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
							<td width="100" height="28" align="center" bgcolor="#8594A9"
									class="white12">
									<a href="queryGroupInit.do">用户组列表</a>
								</td>
								<td width="2px">
									&nbsp;
								</td>
								<td width="100" height="28" align="center" bgcolor="#CC0000"
									class="white12">
									<a href="#">提现管理</a>
								</td>
								<td width="2px">
									&nbsp;
								</td>
								<td width="100" height="28" align="center" bgcolor="#8594A9"
									class="white12">
									<a href="queryGroupUsersInit.do">检索成员</a>
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
									
									用户名：<input id="userName"  type="text"> &nbsp;&nbsp;
									可用金额：<input id="startUseableSum"  type="text"> -- <input id="endUseableSum"  type="text">&nbsp;&nbsp;<br /><br />
									真实名字：<input id="realName"  type="text"> &nbsp;&nbsp;
									总金额：<input id="startAllSum"  type="text"> -- <input id="endAllSum" type="text"> &nbsp;&nbsp;
									提现状态：<select id="cashStatus" >
												<option value="">请先择</option>
												<option value="1">开启</option>
												<option value="2">禁止</option>
											</select>
									<input id="search" type="button" value="确定"  />			
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
