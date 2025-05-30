<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>修改管理组</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript">
			$(function(){
			init();
				$(".top").click(function(){
					var id = $(this).val();
					$(".top_"+id).attr("checked",$(this).attr("checked"));
				});
				$(".parent").click(function(){
					var id = $(this).val();
					$(".parent_"+id).attr("checked",$(this).attr("checked"));
					if(this.checked){
						var topId = $(this).attr("parentId");
						$("#top_"+topId).attr("checked",this.checked);
					}
				});
				$(".bottom").click(function(){
					var parentId = $(this).attr("parentId");
					if(this.checked){
						$("#parent_"+parentId).attr("checked",this.checked);
						var topId = $("#parent_"+parentId).attr("parentId");
						$("#top_"+topId).attr("checked",this.checked);
					}
				});
				$("#btn_save").click(function(){
				 $("#btn_save").attr("disabled",true);
					var stIdArray = [];
					$("input[name='rightsId']:checked").each(function(){
						stIdArray.push($(this).val());
					});
					if(stIdArray.length == 0){
					$("#btn_save").attr("disabled",false);
		 				alert("请选择权限!");
		 				return ;
	 				}
	 				param["ids"] = stIdArray.join(",");
	 				param["roleName"] = $("#roleName").val();
	 				param["roleId"] = $("#roleId").val();
	 				param["description"] = $("#description").val();
	 				$.shovePost("updateRole.do",param,function(data){
	 					if(data.msg==1){
	 						alert("修改成功！");
	 						window.location.href = 'queryRoleList.do';
	 						return ;
	 					}
	 					alert(data.msg);
	 				})
				});
				
			});
			
		function init(){
			var rightsIds = $("#rightsIds").val();
			if(rightsIds!="-1"){
				var rightsids = rightsIds.split(",");
				var length = rightsids.length;
				if(length>0){
					for(var i = 0 ; i< length;i++){
						$(".rightId").each( function(j, n){
							if(rightsids[i]==n.value){
								n.checked=true;
								return false;
							}
						});
					}
				}
			}
		}
			
		</script>
	</head>
	<body>
	<input type="hidden" id="categoryIds" value="${request.categoryIds }" />
	<input type="hidden" id="auditionCandidatesId" value="${request.id }" />
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="100" height="28"  class="xxk_all_a">
									<a href="queryRoleList.do">管理组列表</a>
								</td>
								<td width="2">
									&nbsp;
								</td>
								<td width="100"  class="main_alll_h2">
									修改管理组
								</td>
								<td width="2">
									&nbsp;
								</td>
							<td width="100" height="28"  class="xxk_all_a">
								<a href="queryAdminInit.do">管理员列表</a>
							</td>
							<td width="2">
								&nbsp;
							</td>
								<td width="100"  class="xxk_all_a">
									<a href="addAdminInit.do">添加管理员</a>
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</div>
					 
					<div style="width: auto; background-color: #FFF; padding: 10px;">
					<input type="hidden" id="rightsIds" value="${rightsIds }" />
					<input type="hidden" id="roleId" value="${paramMap.id }" />
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<s:set name="max" >0</s:set>
								<tr>
									<td style="height: 25px;padding-left: 10px;" align="right" class="blue12" width="70px;">
										管理组名称：
									</td>
									<td align="left" class="f66">
										<input type="text" value="${paramMap.name }" id="roleName"  />
									</td>
								</tr>
								<tr>
									<td style="height: 25px;padding-left: 10px;" align="right" class="blue12" width="70px;">
										管理组描述：
									</td>
									<td align="left" class="f66">
										<textarea type="text" value="${paramMap.description }" id="description" cols="40" rows="4" >${paramMap.description }</textarea>
									</td>
								</tr>
								<tr>
									<td style="height: 25px;padding-left: 10px;" align="right" class="blue12" width="70px;">
										权限分配：
									</td>
									<td class="f66">
						<s:iterator value="rightsList.{?#this.id<0}" var="bean">
						<input class="top rightId" name="rightsId" id="top_${bean.id}" type="checkbox" value="${bean.id}" />${bean.summary }<br/>
							<s:iterator value="rightsList.{?#this.parentID==#bean.id}" var="sBean">
								&nbsp;&nbsp;&nbsp;<input class="top_${bean.id} parent rightId" name="rightsId" id="parent_${sBean.id }" parentId="${sBean.parentId }" type="checkbox" value="${sBean.id}" />${sBean.summary }
								<s:iterator value="rightsList.{?#this.parentID==#sBean.id}" var="ssBean">&nbsp;&nbsp;&nbsp;
								<input class="top_${bean.id} bottom parent_${sBean.id} rightId" name="rightsId" parentId="${ssBean.parentId }"  type="checkbox" value="${ssBean.id}" />${ssBean.summary }</s:iterator><br/>
							</s:iterator>
							<br/>
		             </s:iterator>
									</td>
								</tr>
								<s:set name="max" >${sta.count }</s:set>
							
							<tr>
								<td colspan="2" align="left" style="padding-left: 30px;">
									<button id="btn_save"
										style="background-image: url('static/images/admin/btn_queding.jpg'); width: 70px; border: 0; height: 26px"></button>
									&nbsp;
								</td>
							</tr>
						</table>
						<br />
					</div>
				</div>
			</div>
	</body>
</html>
