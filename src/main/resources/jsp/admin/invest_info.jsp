<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
	<div id="right">
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col">
					  反担保方式
					</th>
					<th scope="col">
						状态
					</th>
					<th scope="col">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="8">暂无数据</td>
					</tr>
				</c:if>
				<s:else>
					<s:iterator value="pageBean.page" var="bean" status="st">
						<tr class="gvItem">
							<td>
							${selectName }
							</td>
							<td>
								<c:if test="#bean.deleted==1">
									开启
								</c:if>
								<s:else>
									关闭
								</s:else>
							</td>
							<td>
								<c:if test="#bean.deleted==1">
									<a style="cursor: pointer;" id="${id }"  onclick="javascript:updatypeId(${id},2);">关闭</a> 
								</c:if>
								<s:else>
									<a style="cursor: pointer;" id="${id }"  onclick="javascript:updatypeId(${id},1)">开启</a> 
								</s:else>
								&nbsp;&nbsp;
								<a style="cursor: pointer;" ids="${id }" onclick="javascript:fff(this)">修改</a> 
								&nbsp;&nbsp;
							 
							</td>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
<script type="text/javascript">

   function fff(data){
                var t = $(data).attr("ids");
		    	ShowIframe("修改",'updateinvers.do?id='+t,600,300);
		    }
		    function ffff(f,d){
		    	var param = {};
		    	param["paramMap.id"]=d;
		    	param["paramMap.tagd"] = f;
		    	$.post("updateinversReal.do",param,function(data){
		    	var callBack = data.msg;
		    	if(data==1){
		    	  alert("修改成功");
		    	  window.location.reload();
		    	}else if(data==0||data==3){
		    	alert("修改失败");
		    	}else if(callBack == undefined || callBack == ''){
		                 $('#right').html(data);
		                 $(this).show();
		                 }
		    	});
		      ClosePop();
		    }

		    function updatypeId(f,d){
		    	var param = {};
		    	param["id"]=f;
		    	param["typeId"] = d;
		    	$.post("updateselect.do",param,function(data){
		    	var callBack = data.msg;
	      if(callBack == undefined || callBack == ''){
		                 $('#right').html(data);
		                 $(this).show();
		                 }
		    	if(data==1){
		    	  alert("修改成功");
		    	  window.location.reload();
		    	}else{
		    	alert("修改失败");
		    	}
		    	});
		    }

</script>
<script>

</script>




	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
