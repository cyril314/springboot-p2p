<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col">
						序号
					</th>
					<th scope="col">
						用户账号
					</th>
					<th scope="col">
						真实姓名
					</th>
					<th scope="col">
						证件种类
					</th>
					<th scope="col">
					图片状态 
					</th>
					<th scope="col">
						审核观点
					</th>
					<th scope="col">
						上传时间	
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
				<s:set name="counts" value="#request.pageNum"/>
				<s:iterator value="pageBean.page" var="bean" status="s">
				
					<tr class="gvItem">
						<td>
						<c:out value="#s.count+#counts"/>
						</td>
						<td>
						<a href="queryPerUserCreditAction.do?userId=${id}">
						${username}
						</a>	
						</td>
						<td>
						${realName}
						</td>
						<td>
								
					${tmtname }
						</td>
						<td>
			   <c:if test="#bean.auditStatus==1">待审</c:if>
            <s:elseif test="#bean.auditStatus==2">无效</s:elseif>
            <s:elseif test="#bean.auditStatus==3">有效</s:elseif>
            <s:else>未上传</s:else>
							
					</td>
						<td>
							
				<shove:sub value="#bean.tmoption" size="30" suffix="..."/>
							
					</td>
						<td>
							
				 ${passTime }
							
							
							
					</td>
						<td>
					  <a href="countindex.do?ui=${id }&mt=${materAuthTypeId}">查看</a>
					</td>
					</tr>
				</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
  				<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
  		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
  <script>
function show(id,typeid){
     var url = "countindex.do?ui="+id+"&mt="+typeid;
              window.location.href= url ;
   			}
</script>