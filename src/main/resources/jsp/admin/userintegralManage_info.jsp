<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
	<div>
		<table id="help" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>
				<tr class=gvHeader>
					<th scope="col">
						序号
					</th>
						<th scope="col">
						用户名
					</th>
						<th scope="col">
						真实姓名
					</th>
						<th scope="col">
						信用积分
					</th>
						<th scope="col">
						会员积分
					</th>
						<th scope="col">
						最后调整时间
					</th>
					<th scope="col">
						操作
					</th>
				</tr>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
					<tr align="center" class="gvItem">
						<td colspan="7">暂无数据</td>
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
							${username }
							</td>
								<td>
							${realName }
							</td>
								<td>
							${creditrating }
							</td>
								<td>
							${rating }
							</td>
								<td>
						   <!-- 最后调整时间 -->
							</td>
							<td>
								<a style="cursor: pointer;"  onclick="javascript:window.location.href='userintegralcreditindex.do?id=${id }&y=1'">信用积分明细</a> 
								&nbsp;&nbsp;
							 <a style="cursor: pointer;"  onclick="javascript:window.location.href='userintegralcreditindex.do?id=${id }&y=2'">会员积分明细</a>
							 &nbsp;&nbsp;
							  <a style="cursor: pointer;"   onclick="javascript:fff(${id})">添加信用分</a>
							</td>
						</tr>
					</s:iterator>
				</s:else>
			</tbody>
		</table>
	</div>
<script>


   function fff(data){
		    	ShowIframe("修改",'addintegral.do?id='+data,650,450);
		    }
		    function ffff(){
		     window.location.reload();
		      ClosePop();
		    }



</script>

	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>