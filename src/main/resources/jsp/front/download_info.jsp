<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
		<div class="account">
		<div class="acc_content" >
        	<h2 style="text-align: center;">${paramMap.title}</h2>
            <ul>
            	<li style="margin-left: 50px">
            		<p>发布者：${paramMap.username}</p>
            		<p></p>   
                   	<p>发布时间：${paramMap.publishTime}</p>
                   	<p></p>
	                <p>点击次数：${paramMap.visits}</p>
	                <p></p>	    
                    <a href="downloads.do?id=${paramMap.id}" class="update" >文件下载</a>          
                </li>        
            </ul>
    
        
    	<div class="wrap" style="margin:20px 0 20px 0">
                <div class="inwrap">
                </div>
            </div>
</div>
</div>
<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function(){
      //样式选中
  dqzt(0)
	 initNewsListInfo(null);
});

      function initNewsListInfo(praData){		
			$.shovePost("frontQueryNewsList.do",praData,function(data){
				$("#showDongtai").html(data);
			});
			
		}
</script>
</body>
</html>

