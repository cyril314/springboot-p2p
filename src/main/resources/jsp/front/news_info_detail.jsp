<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style type="text/css">
#imgxz img {max-width: 620px;};
</style>
</head>
<body>
<!--about start-->
<div class="ab_all">
  <!--列表 start-->
  <div class="ab_center">
    <div class="ab_mes_title">${paramMap.title}</div>
    <div class="ab_mes_content">${paramMap.content }</div>
    <div class="ab_mes_other">
		<c:if test="#request.previousDate!=null" >上一条：<a onclick="queryUp('${request.previousDate.id}')">${request.previousDate.title}</a></c:if>
		<s:else><a>&nbsp;&nbsp;&nbsp;</a></s:else><br/>	   
		<c:if test="#request.lastDate!=null" >下一条：<a onclick="queryDown('${request.lastDate.id}')">${request.lastDate.title}</a></c:if>
		<s:else><a>&nbsp;&nbsp;&nbsp;</a></s:else>
    </div>
  </div>
  <!--列表 end-->
</div>
<!--about end-->  
</body>
</html>