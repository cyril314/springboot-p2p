<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
	<div>
		<table id="gvNews" style="width: 100%; color: #333333;"
			cellspacing="1" cellpadding="3" bgcolor="#dee7ef" border="0">
			<tbody>  
				<tr class=gvHeader>
					<th style="width: 35px;" scope="col">
						序号
					</th>
					<th scope="col" style="width: 130px;">
						业务机构账号（姓名）
					</th>
					<th scope="col">
						理财经理
					</th>
					<th scope="col">
						真实姓名
					</th>
					<th scope="col">
						投资人
					</th>
					<th scope="col">
						理财人
					</th>
					<th scope="col">
						业务机构提成
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
						<td align="center">
						${bean.level1userName }<br/>
						（${bean.level1realName}）
						</td>
						<td>
						${level2userName}
						</td>
						<td>
						${level2realName }
						</td>
						<td>
						<c:if test="#bean.level==3">
						${username }
						</c:if>
						
						</td>
						<td>
						<c:if test="#bean.level==4">
						${username }
						</c:if>
						</td>
						<td>
						${level1money }
						</td>
					</tr>
				</s:iterator>
				</s:else>
				<tr>
				<td  colspan="2"><strong>合计项</strong></td>
				<td colspan="1" align="right" >提成奖励总计:</td>
				<td  colspan="1" >￥<c:if test="%{paramMap.level1money==''}">0</c:if><s:else>
				${paramMap.level1money }	</s:else></td>
				<td colspan="2" align="right" >当前页的提成奖励总合计:</td>
				<td  align="center" >￥${sumMoney}</td>		
				</tr>
			</tbody>
		</table>
	</div>
	
	<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
