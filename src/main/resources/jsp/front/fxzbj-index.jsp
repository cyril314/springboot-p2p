<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
<style>
.pertop ul li{padding:0 20px ; float: left; font-size: 16px; color: #FFF; cursor: pointer;}
</style>
</head>
<body>
<!-- 引用顶部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div id='showcontent'>
	<div class='ab_center'>
		<div class="percontent">
			<div style="font-size: 25px;text-align: center; height:50px; line-height: 50px; font-weight: bolder;">
				<div id="title">${paramMap.columName}</div>
			</div>
		</div>
		<div class='ab_content'>
					<p class="zw">${paramMap.content}</p>
	    <div id="showDongtai" ></div>
		</div>
	</div>
</div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function(){
  	param["pageBean.pageNum"] = 1;
	initNewsListInfos(null);
	//样式选中
	//dqzt(0);
	});
	
function initNewsListInfos(praData){		
	$.Post("frontQueryNewsList.do",praData,function(data){
		$("#showDongtai").html("");
		$("#showDongtai").html(data);
	});
}
</script>
</body>
</html>