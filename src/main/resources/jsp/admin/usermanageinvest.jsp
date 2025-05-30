<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>借款产品参数</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="${ctx}/static/css/admin/admin_css.css" rel="stylesheet"
			type="text/css" />
		<link href="${ctx}/static/css/css2.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/dialog/popup.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
		<script type="text/javascript">
	$(function(){
		$('#search').click(function(){
		   param["pageBean.pageNum"] = 1;
		   initListInfo(param);
		});	
		
		$("#excel").click(function(){
		   window.location.href=encodeURI(encodeURI("exportuserInvestInfo.do?i="+${userId}+"&paramMap.createtimeStart="+$("#createtimeStart").val()+"&paramMap.createtimeEnd="+$("#createtimeEnd").val()));
		
		});			
	});		
	function initListInfo(praData){
	param["i"] = ${userId };
	param["paramMap.createtimeStart"] = $("#createtimeStart").val();
	param["paramMap.createtimeEnd"] = $("#createtimeEnd").val();
    $.post("queryUserManageInvest.do",param,initCallBack);
 	}
 	function initCallBack(data){
 	  
		$("#dataInfo").html(data);
	}
	$("#li_work").click(function() {
	window.location.href = 'queryUserMangework.do?uid=${map.userId}';
});
</script>
</head>
<body>
<div id="dataInfo" style="padding: 15px 10px 0px 10px;">
	<table width="10%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%" height="28" class="main_alll_h2">
				<a href="javascript:void(0)">用户基本信息</a>
			</td>
		</tr>
	</table>
	<div id="showcontent" style="background: #FFF; padding: 10px;">
		<!-- 内容显示位置 -->
		<table width="100%" border="0" cellspacing="1" cellpadding="3">
			<tr>
				<!--第1个table  -->
				<td>
					<table border="1" cellspacing="1" cellpadding="3" width="100%">
						<tr class="gvItem">
							<td align="right" class="blue12" width="15%">
								用户名：
							</td>
							<td align="left" width="80">
								${ UserMsgmap.username}
							</td>
						</tr>
						<tr>
							<td align="right" class="blue12">
								真实姓名：
							</td>
							<td align="left" class="f66">
								${UserMsgmap.realName}
							</td>
						</tr>
						<tr>
							<td align="right" class="blue12">
								邮箱：
							</td>
							<td align="left" class="f66">
								${ UserMsgmap.email}
							</td>
						</tr>
						<tr>
							<td align="right" class="blue12">
								身份证：
							</td>
							<td align="left" class="f66">
								${ UserMsgmap.idNo}
							</td>
						</tr>
						<tr>
							<td align="right" class="blue12">
								手机：
							</td>
							<td align="left" class="f66">
								${ UserMsgmap.telephone}
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<!--第二个table  -->
				<td id="secodetble">
					<table border="0" cellspacing="1" cellpadding="3" width="100%">
						<tr>
							<td height="60">
								<table>
									<tr>
										<td class="xxk_all_a" height="20" align="center" width="15%">
											<a style="cursor: pointer;"
												onclick="javascript:window.location.href='queryUserManageBaseInfoinner.do?i=${UserMsgmap.id}';">个人基本信息</a>
										</td>
										<td>
											&nbsp;
										</td>
										<td class="xxk_all_a1" width="100px" height="20"
											align="center">
											<a style="cursor: pointer;"
												href="queryUserMangework.do?uid=${UserMsgmap.id}">工作信息</a>
										</td>
										<td>
											&nbsp;
										</td>
										<td class="main_alll_h2" width="100px" height="20"
											align="center">
											<a style="cursor: pointer;"
												onclick="javascript:window.location.href='queryUserManageInvest.do?i=${UserMsgmap.id}';">投资信息</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td>
								<div style="height: 40px; line-height: 40px;">
									投资时间：
									<input id="createtimeStart" class="Wdate"
										value="${paramMap.createtimeStart}"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" />
									&nbsp;&nbsp; --
									<input id="createtimeEnd" class="Wdate"
										value="${paramMap.createtimeEnd}"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" />
									&nbsp;&nbsp; &nbsp;&nbsp;
									<input id="search" type="button" value="查找" name="search" />
									&nbsp;&nbsp;
									<input id="excel" type="button" value="导出Excel" name="excel" />
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div>
									<table border="1" cellspacing="1" cellpadding="3" width="100%">
										<tbody>
											<tr class=gvHeader>
												<th>序号</th>
												<th>用户名</th>
												<th>真实姓名</th>
												<th>手机号码</th>
												<th>投资日期</th>
												<th>还款方式</th>
												<th>投资期限</th>
												<th>投资标题</th>
												<th>投资金额</th>
											</tr>
											<c:if test="pageBean.page==null || pageBean.page.size==0">
												<tr align="center" class="gvItem">
													<td colspan="6">
														暂无数据
													</td>
												</tr>
											</c:if>
											<s:else>
												<s:set name="counts" value="#request.pageNum" />
												<s:iterator value="pageBean.page" var="bean" status="s">
													<tr class="gvItem">
														<td>
															<c:out value="#s.count+#counts" />
														</td>
														<td align="center">
															${username }
														</td>
														<td align="center">
															${realName }
														</td>
														<td align="center">
															${cellPhone }
														</td>
														<td align="center">
															${investTime }
														</td>
														<td align="center">
															<c:if test="paymentMode==1">
						                                                                                                           按月等额本息还款
						                                    </c:if>
															<s:elseif test="paymentMode==2">
					                                        	按先息后本还款
					                                       	</s:elseif>
															<s:elseif test="paymentMode==3">
					                                        	秒还
					                                       	</s:elseif>
															<s:elseif test="paymentMode==4">
					                                        	一次性还款
					                                       	</s:elseif>

														</td>
														<td align="center">
															${deadline }
															<c:if test="%{#bean.isDayThe ==1}">个月</c:if>
															<s:else>天</s:else>
														</td>
														<td align="center">
															${borrowTitle }
														</td>
														<td align="center">
															${investAmount }
														</td>
													</tr>
												</s:iterator>
											</s:else>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td align="center">
								<shove:page curPage="${pageBean.pageNum}" showPageCount="10"
									pageSize="${pageBean.pageSize }" theme="jsNumber"
									totalCount="${pageBean.totalNum}"></shove:page>

							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>
