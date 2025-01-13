<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/jsp/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>管理首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
<script type="text/javascript" src="${ctx}/static/js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript">
if(${session.index==-1}){
	window.top.main.location.href="main.do";
}
$(function () {
	$(".munes li").click(function () {
		$(".munes li").attr("class", "");
		$(this).attr("class", "cur");
	})
})
</script>
</head>
<body style="width: 100%; margin-top:20px; padding: 0px; background:#fff url(/static/images/admin/main-left.gif) 147px top repeat-y; *background:#fff url(/static/images/admin/main-left.gif) 146px top repeat-y; min-height:300px;">
	<form id="form1" style="padding:0; margin:0">
		<div id="left">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<c:forEach items="${adminRoleMenuList}" var="bean" varStatus="sta">
							<c:if test="${bean.rightsId == index}">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr style="cursor: pointer;"onclick="showsubmenu(${sta.index})">
										<td height="33" class="menu_top_a">${bean.summary }</td>
										<td align="left"></td>
									</tr>
								</table>
							</c:if>
						</c:forEach>
						<c:forEach items="${adminRoleMenuList}" var="bean" varStatus="sta">
							<c:if test="${bean.parentId == index}">
								<li>
									<a href="${bean.action}" target="main">
										<span class="point">&raquo;</span>${bean.summary}
									</a>
								</li>
							</c:if>
						</c:forEach>

						<div id="submenu${sta.index}" class="munes">
                           <ul>
							   <c:forEach var="sBean" items="${adminRoleMenuList}">
								   <c:if test="${sBean.parentId == sessionScope.index}">
									   <li>
										   <a href="${sBean.action}" target="main">
											   <span class="point">&raquo;</span>${sBean.summary}
										   </a>
									   </li>
								   </c:if>
							   </c:forEach>
						   </ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>