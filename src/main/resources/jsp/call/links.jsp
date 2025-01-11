<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="../include/taglib.jsp"%>

<c:if test="#request.linksList.size>0">
	<s:iterator var="links" value="#request.linksList" status="sta">
		<%--<c:if test="#sta.index!=0">|&nbsp;</c:if>--%>
		<li><a href="${companyURL}" target="_blank">${companyName}</a></li>
	</s:iterator>
</c:if>
