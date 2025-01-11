<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <%@include file="../include/taglib.jsp" %>
<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
  <tr>
    <td><strong>订单号</strong></td>
    <td><strong>用户名</strong></td>
    <td><strong>类型</strong></td>
    <td><strong>所属银行</strong></td>
    <td><strong>充值金额</strong></td>
    <td><strong>费用</strong></td>
    <td><strong>到账金额</strong></td>
    <td><strong>充值时间</strong></td>
    <td><strong>状态</strong></td>
  </tr>
 
   <c:if test="pageBean.page==null ||pageBean.page.size==0">
		<tr align="center" class="gvItem">
			<td colspan="9">暂无数据</td>
		</tr>
	</c:if>
	<s:else>
		<s:iterator value="pageBean.page" var="bean" status="st">
		  <tr>
		    <td align="center">${bean.id }</td>
		    <td align="center">${bean.userId }</td>
		    <td align="center">
		    <c:if test="#bean.rechargeType==1">支付宝</c:if>
		    <s:elseif test="#bean.rechargeType==2">环迅支付</s:elseif>
		    <s:elseif test="#bean.rechargeType==3">国付宝充值</s:elseif>
		    <s:elseif test="#bean.rechargeType==4">手动充值</s:elseif>
		    </td>
		    <td align="center">${bean.bankName }</td>
		    <td align="center">${bean.rechargeMoney }</td>
		    <td align="center">${bean.cost }</td>
		    <td align="center">${bean.rechargeMoney - bean.cost }</td>
		    <td align="center"><s:date name="#bean.rechargeTime" format="yyyy-MM-dd HH:mm:ss" /></td>
		    <td align="center">${bean.status }</td>
  		</tr>
		</s:iterator>
	</s:else>
          </table>
          
         	<div class="digg clear">
	<p>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
    </p>
    </div>
          