<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>

		<div class="C_content1 " style="padding-top: 95px;">
			<div class=" C_content_wyjk ">
				<div class="C_sqxyed">
					<span>申请信用额度</span>
					<a href="borrow.do"></a>
				</div>
				<div class="C_sqxyed2">
					<div class="C_sqxyed2_a">
						当前信用额度：
						<span>${creditMap.creditLimit}</span>元 ，可用信用额度：
						<span>${creditMap.usableCreditLimit}</span>元
					</div>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td class="C_ts_td_xy">
								申请额度：
							</td>
							<td>
								<input type="text" style="width: 150px; height: 25px;"
									id="applyAmount" name="paramMap.applyAmount" />
							</td>
						</tr>
						<tr>
							<td class="C_ts_td_xy">
								详细说明：
							</td>
							<td>
								<textarea style="width: 500px; height: 100px; border:1px solid #e6e6e6;"
									id="applyDetail" name="paramMap.applyDetail" ></textarea>
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<p>
									<span>温馨提示：</span>额度申请原则上每次最多申请1万。 额度申请后，无论申请是否批准，
									必须隔一个月后才能再次申请，每个月只能申请一次。如有问题,请与客服联系<br/>	
									<span style="color: red;">${apply}</span>
								</p>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<a href="#" id="bcbtn"><img src="{ctx}/static/images/C_ljsq.jpg" />
								</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="C_sqxyed3">
					<table cellpadding="0" cellspacing="0">
						<tr style="background: #fffcf7;">
							<td style="width: 200px;">
								序号
							</td>
							<td style="width: 200px;">
								申请额度
							</td>
							<td style="width: 200px;">
								通过额度
							</td>
							<td style="width: 360px;">
								详细说明
							</td>
							<td style="width: 200px;">
								状态
							</td>
						</tr>
						<c:if test="pageBean.page!=null || pageBean.page.size>0">
							<s:set name="counts" value="#request.pageNum" />
							<s:iterator value="pageBean.page" var="credting" status="s">
								<tr>
									<td align="center">
										<c:out value="#s.count+#counts" />
									</td>
									<td align="center">
										<c:out value="#credting.applyAmount" default="0"/>
									</td>
									<td align="center">
										<c:out value="#credting.agreeAmount" default="- -"/>
									</td>
									<td align="center" class="ck">
										<c:out value="#credting.applyDetail" />
									</td>
									<td align="center" class="ck">
										<c:if test="#credting.status ==1">审核中</c:if>
										<s:elseif test="#credting.status ==2">
											<img src="{ctx}/static/images/C_no.png" />
										</s:elseif>
										<s:elseif test="#credting.status ==3">
											<img src="{ctx}/static/images/C_OK.png" />
										</s:elseif>
									</td>
								</tr>
							</s:iterator>
						</c:if>
						<s:else>
							<tr>
								<td colspan="6" align="center">
									没有数据
								</td>
							</tr>
						</s:else>
					</table>
				</div>
				<div class="wrap" style="margin: 20px 0 20px 0">
					<div class="inwrap">
							<c:if test="pageBean.page!=null || pageBean.page.size>0">
									<p style="text-align: center;line-height: 37px;">
										<shove:page url="creditingInit.do"
											curPage="${pageBean.pageNum}" showPageCount="6"
											pageSize="${pageBean.pageSize }" theme="jsNumber"
											totalCount="${pageBean.totalNum}">
										</shove:page>
									</p>
							</c:if>
						<!-- <ul class="page">
                      <li class="p1"><a href="#">上一页</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li class="on"><a href="#">6</a></li>
                      <li><a href="#">...</a></li>
                      <li class="p1"><a href="#">下一页</a></li>
                   </ul>    -->
					</div>
				</div>

			</div>
		</div>

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript">
			$("#jumpPage").attr("href", "javascript:void(null)");
			$("#jumpPage").click(
					function() {
						var curPage = $("#curPageText").val();
						if (isNaN(curPage)) {
							alert("输入格式不正确!");
							return;
						}
						window.location.href = "creditingInit.do?curPage=" + curPage
								+ "&pageSize=${pageBean.pageSize}";
					});
		</script>
		<script type="text/javascript">
			var flag = true;
			$(function() {
				$("#bcbtn").click(function() {
					if (flag) {
						flag = false;
						param['paramMap.applyAmount'] = $('#applyAmount').val();
						param['paramMap.applyDetail'] = $('#applyDetail').val();
						//--add by houli 增加信用类型
						param['paramMap.creditingName'] = '信用额度';
						//--end
						$.shovePost('addCrediting.do', param, function(data) {
							var callBack = data.msg;
							if (callBack == 1) {
								alert("操作成功!");
								window.location.href = 'creditingInit.do';
								return false;
							}
							flag = true;
							alert(callBack);
						});
					}
				});
			});
		</script>
	</body>
</html>
