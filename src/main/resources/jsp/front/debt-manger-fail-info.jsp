<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>

                 	<table id="tab" class="jlmes" cellpadding="0" cellspacing="0">
                     	 <tr>
                         	<td><strong>借款标题</strong></td>
                            <td><strong>投资金额</strong></td>
                            <td><strong>债权本金</strong></td>
                            <td><strong>剩余期数</strong></td>
                            <td><strong>下次还款时间</strong></td>
                            <td><strong>成交价格</strong></td>
                            <td><strong>年收益率</strong></td>
                            <td><strong>状态</strong></td>
                         </tr>
                       	<c:if test="pageBean.page==null || pageBean.page.size() == 0">
                       	<tr>
                       		<td colspan="7" align="center">暂无记录</td>
                       	</tr>
                       	</c:if>
                       	<s:else>
    					<s:iterator value="pageBean.page" var="bean">
                         <tr>
                         	<td><a href="financeDetail.do?id=${borrowId}" target="_blank">${borrowTitle }</a></td>
                            <td><fmt:formatNumber  value='${realAmount }' type="currency" pattern="0.00" /></td>
                            <td>${recivedPrincipal-hasPrincipal}</td>
                            <td>${remainBorrowLimit }个月</td>
                            <td>${nextrepaymentDate }</td>
                            <td>${auctionBasePrice }</td>
                            <td>${annualRate }</td>
                            <td>
                            	<c:if test="#bean.debtStatus==4">竞拍失败</c:if>
							    <s:elseif test="#bean.debtStatus==6">审核失败</s:elseif>
							     <s:elseif test="#bean.debtStatus==5">撤销</s:elseif>
							    <s:elseif test="#bean.debtStatus==7">提前还款</s:elseif>
                            </td>
                         </tr>  
                         </s:iterator>
                         </s:else>                  
                     </table>
                     <!--分页器 开始-->
                     <div class="digg clear">
                            <shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
								<s:param name="borrowerName" >${paramMap.borrowerName }</s:param>
								<s:param name="borrowTitle" >${paramMap.borrowTitle }</s:param>
							</shove:page>
					 </div>
                    <!--分页器 结束--> 	