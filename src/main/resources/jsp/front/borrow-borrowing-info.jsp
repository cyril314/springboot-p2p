<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>

                 	 <table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
 						 <tr>
    <td><strong>标题</strong></td>
    <td><strong>类型</strong></td>
    <td><strong>还款方式</strong></td>
    <td><strong>金额（元）</strong></td>
    <td><strong>年利率</strong></td>
    <td><strong>期限</strong></td>
    <td><strong>发布时间</strong></td>
    <td><strong>进度</strong></td>
    <td><strong>状态</strong></td>
    </tr>
  	<c:if test="pageBean.page==null || pageBean.page.size==0">
	   <tr align="center">
		  <td colspan="9">暂无数据</td>
	   </tr>
	</c:if>
	<s:else>
	<s:iterator value="pageBean.page" var="bean">
	 <tr>
		<td align="center"><a href="financeDetail.do?id=${bean.id}" target="_blank">${bean.borrowTitle}</a></td>
    	<td align="center">
    	<c:if test="#bean.borrowWay ==1">净值借款</c:if>
        <s:elseif test="#bean.borrowWay ==2"> 秒还借款</s:elseif>
        <s:elseif test="#bean.borrowWay ==3">信用借款</s:elseif>
        <s:elseif test="#bean.borrowWay ==4">实地考察借款</s:elseif>
        <s:elseif test="#bean.borrowWay ==5">机构担保借款</s:elseif>
         <s:elseif test="#bean.borrowWay ==6">流转标借款</s:elseif>
        </td>
    	<td align="center">
    	<c:if test="%{#bean.paymentMode == 1}">按月分期还款</c:if>
        <s:elseif test="%{#bean.paymentMode == 2}">按月付息,到期还本</s:elseif>
        <s:elseif test="%{#bean.paymentMode == 3}">秒还</s:elseif>
        <s:elseif test="%{#bean.paymentMode == 4}">一次性还本付息</s:elseif>
    	</td>
    	<td align="center">${bean.borrowAmount}</td>
    	<td align="center">${bean.annualRate}%</td>
    	<td align="center">${bean.deadline}个月</td>
    	<td align="center"><s:date name="#bean.publishTime" format="yyyy-MM-dd HH:mm:ss"/></td>
    	<td align="center">${bean.schedules}%</td>
    	<td align="center">
    	<c:if test="%{#bean.borrowStatus == 1}">
                                  初审中
        </c:if>
        <s:elseif test="%{#bean.borrowStatus == 2}">
                                   招标中
        </s:elseif>
        <s:elseif test="%{#bean.borrowStatus == 3}">
                                  满标
        </s:elseif>
        <s:elseif test="%{#bean.borrowStatus == 4}">
                                   还款中
        </s:elseif>
        <s:elseif test="%{#bean.borrowStatus == 5}">
                                  已经还完
        </s:elseif>
        <s:elseif test="%{#bean.borrowStatus == 6}">
                              流标
        </s:elseif>
    	</td>
       </tr>
     </s:iterator>
	</s:else>
                   </table>
	<!--分页器 开始-->
	<div class="digg clear">
				     <shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
				    	<s:param name="publishTimeStart">${paramMap.publishTimeStart}</s:param>
				    	<s:param name="publishTimeEnd">${paramMap.publishTimeEnd}</s:param>
				    	<s:param name="title">${paramMap.title}</s:param>
				     </shove:page>
			
		</div>
	<!--分页器 结束-->