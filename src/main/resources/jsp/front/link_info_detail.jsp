<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>

<div class="inmes">
  <div class="center">
    <div class="inmes_all mt20" id="in_say">
      <div class="inmes_top">${paramMap.title}</div>
      <p>${paramMap.content}</p>
        <div id="showDongtai" >
      <!-- 网站动态显示位置 -->
    </div>
    </div>

	</div>
</div>
<!--内容 end-->

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<%--<script>
$(function(){
	initNewsListInfo(null);
    //样式选中
    dqzt(0);
});
	
		function initNewsListInfo(praData){		
			$.shovePost("frontQueryNewsList.do",praData,function(data){
				$("#showDongtai").html(data);
			});
			
		}
</script>
--%></body>
</html>

