<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="nymain">
  <div class="lcnav">
    <div class="tab">
<div class="tabmain">
  <ul><li class="on" style="padding:0 20px;">网站公告</li>
  </ul>
    </div>
    </div>
    <div class="line">
    </div>
  </div>
  <div class="lcmain">
    <div id="showdownlist" class="lcmain_l">
         <!-- 网站列表显示位置 -->
    </div>
      <!-- 网站动态显示位置 -->
   <div id="showDongtai" class="lcmain_r"></div>
  </div>
</div>

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function(){
  	param["pageBean.pageNum"] = 1;
	initListInfo(param);
	initNewsListInfo(null);

    //样式选中
	dqzt(0)
});
	
function initListInfo(praData){		
	$.shovePost("queryNewsListPage.do",praData,function(data){
		$("#showdownlist").html(data);
	});
}
		
function initNewsListInfo(praData){		
	$.shovePost("frontQueryNewsList.do",praData,function(data){
		$("#showDongtai").html(data);
	});
}
</script>
</body>
</html>
