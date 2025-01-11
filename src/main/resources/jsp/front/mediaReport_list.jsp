<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
    function mediaDetail(param){
       $.post("frontMediaReportDetails.do","id="+param,function(data){
     	  var str = data.title.substring(0, 20);
     	 // var con = data.content.substring(0,50);
               $("#showcontent").html("");
              
            //$("#showcontent").html("<h3>"+data.title+"</h3>"+
            //               "<p class='time'></p>"+
            //             "<p class='zw'>"+data.content+"</p>");

               $("#showcontent").html("<div id='showcontent'><div class='ab_center'><div class='ab_content'>"
                       +"<a title='"+data.title+"'>"+str+"</a>"+
                     "<p class='zw'>"+data.content+"</p></div></div></div>");
    });
}
//$(function(){
//	$("#mediaReport1").click(function{
//			$("#mediaReport1").click();
//	});
//});
</script>
<!--列表 start-->
<div class="ab_news">
	<ul>
	 <c:if test="pageBean.page==null || pageBean.page.size==0">
	   <tr align="center"><td colspan="10">暂无数据</td></tr>
	 </c:if>
	 <s:else>
		<s:iterator value="pageBean.page" var="bean">
           	<li>
		        <table>
		          <tr>
		            <td rowspan="2"><img width="120" height="117" src="${bean.imgPath}" /></td>
		            <td><a href="javascript:mediaDetail(${bean.id})" class="ab_news_title">${bean.title}</a></td>
		          </tr>
		          <tr>
		            <td>
                        <p>[<a href="javascript:mediaDetail(${bean.id})">查看详情</a>]</p>
					</td>
		          </tr>
		        </table>
             </li>            
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
	$.shovePost("queryMediaReportListPage.do",praData,function(data){
	$("#showcontent").html("");
        $("#showcontent").html("<div id='showcontent'><div class='ab_news'>"+data+"</div></div>");
	});
}
</script>