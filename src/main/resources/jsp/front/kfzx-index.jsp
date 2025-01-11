<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
	<jsp:include page="../include/head.jsp"></jsp:include>
   
	<style type="text/css">
		.pageDivClass{clear: both;padding-top: 0px;}
	</style>
  </head> 
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="help">
	<div class="he_content" >
    	<div class="he_menu right">
	      <ul>
	      	<s:iterator value="#request.types" id="callcenter" var="bean" status="st">
			    <c:if test="#bean.id==#request.typeId">
			        <li><a id="menu${st.count }" class="on${st.count }" href="callcenter.do?type=true&cid=${bean.id}" onclick="switchmenu('menu${st.count }');">${bean.helpDescribe }</a></li>
			    </c:if>
			    <s:else>
	   				<li><a id="menu${st.count }" class="menu${st.count }" href="callcenter.do?type=true&cid=${bean.id}" onclick="switchmenu('menu${st.count }');">${bean.helpDescribe }</a></li>
	   			</s:else>
		   	</s:iterator>
	      </ul>
		</div>
		<div class="clear"></div>
		<!-- 列表信息 -->
    	<div class="nav" id="kfs">
            <div >
            	<ul>
            		<c:if test="pageBean.page!=null || pageBean.page.size>0">
	      				<s:iterator value="pageBean.page"  var="bean" status="sta">
	       					<li id="q_${bean.questionId}" value="0">
	       						<a id="qs" href="javascript:showAnswer_test(${bean.questionId})" onclick="javascript:cp(${bean.questionId});" class="que"><img src="{ctx}/static/images/que.jpg" />&nbsp;&nbsp;<span id="qss${bean.questionId}">${bean.question}</span></a>
	       						<div>
	       							<span class="ans" id="test_${bean.questionId}"></span>
	       						</div>
	      					</li>
	      				</s:iterator>
	      			</c:if>
	      			<s:else>暂无数据</s:else>
                </ul>         	
            </div>
		<div class="clear"></div>
		<!-- 分页部分 -->
		<div class="digg clear">
			<shove:page url="callcenter.do" curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="number" totalCount="${pageBean.totalNum}">
				<s:param name="cid" >${cid}</s:param>
				<s:param name="type" >${type}</s:param>
			</shove:page>
		</div>
     </div>
   </div>
</div>
<!-- 引用底部公共部分 --> 
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript">
//默认查询样式
$(function(){
	if($("#curDes").html()=="新手入门"){
		$("#select1").addClass("C_current1");
	}
})

function showAnswer_test(id){
	$(".ans").html("");
	if($("#q_"+id).val()==0){
		$("#q_"+id).val(1);
	}else{
		$("#q_"+id).val(0);
		return;
	}
	$.shovePost("callcenterAnswer.do",{id:id},function(data){
 	 	//var test = "<p style='text-indent: 0em; font-family: 微软雅黑; font-size: 12px;'>答：</p>";
 		//$("#test_"+id).html(test+data);
 		$("#test_"+id).html(data);
	});
}

function showAnswer(id){
	$.shovePost("callcenterAnswer.do",{id:id},initCallBack);
}
	
function initCallBack(data){
 	var test = "<p style='text-indent: 0em;'>答：</p>";
	$("#dataInfo").html(test+data);
}
	
function cp(id){
   	$("#qs1").html("问："+$("#qss"+id).text());
}

$("#jumpPage").attr("href","javascript:void(null)");
$("#curPageText").attr("class","cpage");
$("#jumpPage").click(function(){
     var curPage = $("#curPageText").val();
	 if(isNaN(curPage)){
		alert("输入格式不正确!");
		return;
	 }
   	window.location.href="callcenter.do?type=true&cid=${cid}&curPage="+curPage+"&pageSize=${pageBean.pageSize}";
});

$(function(){
   //样式选中
	var sd=parseInt($(".l_navmain").css("height"));
	var sf=parseInt($(".r_main").css("height"));
	if(sd<sf){
		$(".l_navmain").css("height",sf)
	}
	dqzt(6);
});	
</script>
</body>
</html>