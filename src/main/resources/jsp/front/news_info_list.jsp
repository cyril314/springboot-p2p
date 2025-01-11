<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!--列表 start-->
<div class="ab_center">
    <ul>
    	<c:if test="pageBean.page==null || pageBean.page.size==0">没有网站公告</c:if>
    	<s:else>
         <s:iterator value="pageBean.page" var="bean" status="sta">
      		<li> <a href="javascript:void(0)" onclick="query('${bean.id}')">${bean.title}</a><span>${bean.publishTime }</span></li>
 		 </s:iterator>
		</s:else>
    </ul>
    <div class="digg clear"> 
		<shove:page curPage="${pageBean.pageNum}" showPageCount="8" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
		</shove:page>
  	</div>  
</div>
<!--列表 end--> 
<script>
function initListInfo(praData){		
	$.shovePost("queryNewsListPage.do",praData,function(data){
	$("#showcontent").html("");
        $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"+data+"</div></div></div>");
	});
}
</script>