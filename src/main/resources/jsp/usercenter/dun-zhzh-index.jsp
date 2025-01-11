<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/inside.css" rel="stylesheet" type="text/css" />
		<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	</head>
	<body>
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>
		
		
<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
	
		<!-- 引用左边公共部分 -->
		<%@include file="../include/dun-left.jsp"%>
	
    	<!--右 开始-->
        <div class="myhome_r clearfix">
        	<!--标题 开始-->
		    <div class="ny_tit">
            	<ul>
                	<li class="on">账户总汇</li>
                </ul>
            </div>
            <!--标题 结束-->
             <!--账户详情 开始-->
            <div class="zhxq clearfix">
                <table width="100%" cellpadding="0" cellspacing="0" class="zh_table">
                	<tr>
                    	<th class="th1" colspan="3" align="left">账户总汇：</th>
                    </tr>
                    <tr>
                    	<td>账户总额：￥
							<c:if test="#request.accmountStatisMap.accountSum !=''">${accmountStatisMap.accountSum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>可用余额：￥
							<c:if test="#request.accmountStatisMap.usableAmount !=''">${accmountStatisMap.usableAmount}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>冻结金额：￥
							<c:if test="#request.accmountStatisMap.freezeAmount !=''">${accmountStatisMap.freezeAmount}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<td>总收益：￥
							<c:if test="#request.accmountStatisMap.earnSum !=''">${accmountStatisMap.earnSum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>利息收益：￥
							<c:if test="#request.accmountStatisMap.rateEarnAmount !=''">${accmountStatisMap.rateEarnAmount}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>其他收益：￥
							<c:if test="#request.accmountStatisMap.otherEarnAmount !=''">${accmountStatisMap.otherEarnAmount}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<th class="th1" colspan="3" align="left">投资总汇：</th>
                    </tr>
                    <tr>
                    	<td>已收总额：￥
							<c:if test="#request.accmountStatisMap.hasPaySum !=''">${accmountStatisMap.hasPaySum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>已收本金：￥
							<c:if test="#request.accmountStatisMap.hasPayPrincipal !=''">${accmountStatisMap.hasPayPrincipal}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>已收利息：￥
							<c:if test="#request.accmountStatisMap.hasPayInterest !=''">${accmountStatisMap.hasPayInterest}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<td>待收总额：￥
							<c:if test="#request.accmountStatisMap.forPaySum !=''">${accmountStatisMap.forPaySum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>待收本金：￥
							<c:if test="#request.accmountStatisMap.forPayPrincipal !=''">${accmountStatisMap.forPayPrincipal}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>待收利息：￥
							<c:if test="#request.accmountStatisMap.forPayInterest !=''">${accmountStatisMap.forPayInterest}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<th class="th1" colspan="3" align="left">借款总汇：</th>
                    </tr>
                    <tr>
                    	<td>已还总额：￥
							<c:if test="#request.accmountStatisMap.hasRePaySum !=''">${accmountStatisMap.hasRePaySum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>已还本金：￥
							<c:if test="#request.accmountStatisMap.hasRePayPrincipal !=''">${accmountStatisMap.hasRePayPrincipal}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>已还利息：￥
							<c:if test="#request.accmountStatisMap.hasRePayInterest !=''">${accmountStatisMap.hasRePayInterest}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<td>待还总额：￥
							<c:if test="#request.accmountStatisMap.forRePaySum !=''">${accmountStatisMap.forRePaySum}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>待还本金：￥
							<c:if test="#request.accmountStatisMap.forRePayPrincipal !=''">${accmountStatisMap.forRePayPrincipal}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>待还利息：￥
							<c:if test="#request.accmountStatisMap.forRePayInterest !=''">${accmountStatisMap.forRePayInterest}</c:if>
							<s:else>0</s:else>
						</td>
                    </tr>
                    <tr>
                    	<th class="th1" colspan="3" align="left">额度总汇：</th>
                    </tr>
                    <tr>
                    	<td>借款总额度：￥
							<c:if test="#request.accmountStatisMap.creditLimit !=''">${accmountStatisMap.creditLimit}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>可用额度：￥
							<c:if test="#request.accmountStatisMap.usableCreditLimit !=''">${accmountStatisMap.usableCreditLimit}</c:if>
							<s:else>0</s:else>
						</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                    	<th class="th1" colspan="3" align="left">最近还款：</th>
                    </tr>
                    <tr>
                    	<td>最近还款日：
							<c:if test="#request.repayMap.minRepayDate == ''">无</c:if>
							${repayMap.minRepayDate}
						</td>
                        <td>最近还款金额：
							<c:if test="#request.repayMap.totalSum != ''">
								<fmt:formatNumber value="${repayMap.totalSum}" type="number"
									pattern="￥0.00" />
							</c:if>
							<s:else>0.00</s:else>
						</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <!--账户详情 结束-->
        </div>
        <!--右 结束-->
    </div>	
</div>    
		
		
		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
		
		<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
		<script>
	$(function() {
		//样式选中
		dqzt(2,'t04');
	});
</script>
	</body>
</html>
