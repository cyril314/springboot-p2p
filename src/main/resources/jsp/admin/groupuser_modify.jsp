<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	    	    
	    	    //-----add by houli 加载页面的时候将用户列表显示
	    	    $("#span_usernames").html('${paramMap.users}');
	    	    $("#userId").val('${paramMap.userIds}');
	    	    //-----------
	    	    
				//提交表单
				$("#btn_save").click(function(){
					$(this).hide();
					$("#editForm").submit();
					return false;
				});
				$("#add_users").click(function(){
				    
					var result = window.showModalDialog("queryGroupUserInit.do",window,"dialogWidth=800px;dialogHeight=600px");
					if(result != null && result != undefined){
						
						changeUserIdAndName(result.ids+",",result.names+",");
					}
				});
				$("#add_user").click(function(){
					var praData = {};
					praData["paramMap.userName"] = $("#userName").val();
					$.shovePost("queryUserIdByUserName.do",praData,function(data){
						if(data ==''){
							alert("请正确添加用户!");
							return false;
							}
						if(data != null && data != undefined){
							var ids = "";
							var names = ""; 
						
							for(var i = 0; i < data.length; i++){
								ids += (data[i].id+",");
								names += (data[i].username+",");
							}
							changeUserIdAndName(ids,names);
						}else{
							alert("请正确添加用户!");
							return false;
							}
					});
				});
				//changeActionUrl("addGroup.do","modifyGroup.do");
			});
			
			function changeUserIdAndName(ids,names){
				var userId = $("#userId").val();
				if(userId == ""){
					$("#userId").val(ids);
				}else{
					$("#userId").val(userId+ids);
				}
				var usernames = $("#span_usernames").text();
				if(usernames == ""){
					$("#span_usernames").html(names);
				}else{
					$("#span_usernames").html(usernames+names);
				}
			}
			//修改或增加的URL
			/*function changeActionUrl(addAction,upateAction){
				var id = "${paramMap.id}";
				alert("id = " + id);
				if(id != null && id != ""){
					$("#editForm").attr("action",upateAction);
				}else{
					$("#editForm").attr("action",addAction);
				}
			}*/
		</script>

	</head>
	<body>
	<form id="editForm"  method="post" action="modifyGroup.do" >
			<div id="right">
				<div style="padding: 15px 10px 0px 10px;">
					<div>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
							<td width="100" height="28"  class="main_alll_h2">
									<a href="#">修改用户组</a>
								</td>
								<td>
									&nbsp;
								</td>
						</tr>
						</table>
					</div>
					 
					<div style="width: auto; background-color: #FFF; padding: 10px;">
						<table width="100%" border="0" cellspacing="1" cellpadding="3">
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									用户组名称:<s:hidden name="paramMap.groupId"></s:hidden>
								</td>
								<td align="left" class="f66">
									<s:textfield name="paramMap.groupName" theme="simple" readonly="true" 
										cssClass="in_text_2" cssStyle="width: 150px" > </s:textfield>
									<span style="color: red;">*<s:fielderror
											fieldName="paramMap.groupName" />
									</span>
								</td>
							</tr>
							
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									备注:
								</td>
								<td align="left" class="f66">
									<s:textarea name="paramMap.groupRemark" theme="simple" rows="3" cols="60"></s:textarea>
									<span style="color: red;"><s:fielderror
											fieldName="paramMap.groupRemark" />
									</span>
									<s:hidden name="paramMap.id" ></s:hidden>
								</td>
							</tr>
							<!--add by houli 添加一个提现状态复选框 -->
							<tr>
							
								<td height="36" align="right" class="blue12">
									提现状态：
								</td>
								<td align="left" class="f66" >
								   <c:if test="paramMap.cashStatus == 1">
								      <input type="checkbox" id="w_status" checked="checked" name="paramMap.cashStatus"/>启用
								   </c:if>
								   <s:else>
								     <input type="checkbox" id="w_status" name="paramMap.cashStatus"/>启用
								   </s:else>
								</td>
							</tr>
							<!-- end -->
							<tr>
								<td style="width: 100px; height: 25px;" align="right"
									class="blue12">
									添加成员:
								</td>
								<td align="left" class="f66">
									<s:textfield name="userName" id="userName" theme="simple"  
										cssClass="in_text_2" cssStyle="width: 150px" > </s:textfield>
									<input type="button" id="add_user" value="添加" /> 
									<input type="button" id="add_users" value="批量添加" /> 
									<input id="userId" type="hidden" name="paramMap.userId" />
									<br/>
									<span id="span_usernames" style="display: block;width: 550px;word-wrap:break-word;"></span>
								</td>
							</tr>
							<tr>
								<td height="25">
								</td>
								<td align="left" class="f66" style="color: Red;">
									<s:fielderror fieldName="paramMap.allError" />
								</td>
							</tr>
							
							<tr>
								<td height="36" align="right" class="blue12">
									&nbsp;
								</td>
								<td>
                                <button id="btn_save" style="background-image: url('static/images/admin/btn_queding.jpg');width: 70px;border: 0;height: 26px"  ></button>
                                &nbsp;<button type="reset" style="background-image: url('static/images/admin/btn_chongtian.jpg');width: 70px;height: 26px;border: 0px"></button>&nbsp;
                                &nbsp;
                                <span style="color: red;">
                             	  <s:fielderror fieldName="actionMsg" theme="simple"></s:fielderror>
                                </span>
                            </td>
							</tr>
						</table>
						<br />
					</div>
				</div>
			</div>
		</form>
	</body>
</html>
