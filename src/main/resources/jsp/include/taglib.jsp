<%@ page language="java" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    String path = request.getContextPath();
    String temp = request.getServerPort() == 80 ? "" : ":" + request.getServerPort();
    String basePath = request.getScheme() + "://" + request.getServerName() + temp + path + "/";
    if (application.getAttribute(basePath) == null) {
        application.setAttribute("basePath", basePath);
    }
%>