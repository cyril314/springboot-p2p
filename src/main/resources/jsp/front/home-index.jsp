<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link href="${ctx}/static/css/index.css"  rel="stylesheet" type="text/css" />
<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
<!-- 引用会员后台头部公共部分 -->
<%@include file="../include/userTop.jsp"%>
<!-- 公告 start-->
<div class="acc_content" style="margin-top:20px">
	<div class="acc_notice">
		<div class="acc_noticeall">最新公告：
			<c:if test="${zxggMap.size()>0}">
				<a href="getMessageBytypeId.do?typeId=4&t=7&id=${zxggMap.id }" target="_blank">${zxggMap.title}</a>
				<span><c:out value="${zxggMap.publishTime.substring(0,10)}"/>
				   <a href="getMessageBytypeId.do?typeId=4&t=7"  target="_blank" >查看更多 &gt;&gt;</a>
				</span>
			</c:if>
			<c:if test="${zxggMap.size()<1}">暂无公告</c:if>
		</div>
	</div>
</div>
<!-- 公告 end-->
<div class="acc_content" style="margin-top:20px">
<!-- 引用左边公共部分 -->
<%@include file="../include/left.jsp"%>
<!--账户详情 开始-->
<div class="acc_all">
	<div class="cur"><img src="${ctx}/static/images/home.jpg" /> 当前位置：个人首页</div>
		<table class="acc_tab" cellpadding="0" cellspacing="0">
			<tr><td colspan="3" class="acc_tab_col">账户总汇：</td></tr>
			<tr>
				<td align="center">账户总额：￥<c:out value="${accmountStatisMap.accountSum}" default="0" /></td>
				<td align="center">可用余额：￥<c:out value="${accmountStatisMap.usableAmount}" default="0" /></td>
				<td align="center">冻结金额：￥<c:out value="${accmountStatisMap.freezeAmount}" default="0" /></td>
			</tr>
			<tr>
				<td align="center">总收益：￥<c:out value="${accmountStatisMap.earnSum}" default="0" /></td>
				<td align="center">利息收益：￥<c:out value="${accmountStatisMap.rateEarnAmount}" default="0" /></td>
				<td align="center">其他收益：￥<c:out value="${accmountStatisMap.otherEarnAmount}" default="0" /></td>
			</tr>
			<tr><td colspan="3" class="acc_tab_col">投资总汇：</td></tr>
			<tr>
				<td align="center">已收总额：￥<c:out value="${accmountStatisMap.hasPaySum}" default="0" /></td>
				<td align="center">已收本金：￥<c:out value="${accmountStatisMap.hasPayPrincipal}" default="0" /></td>
				<td align="center">已收利息：￥<c:out value="${accmountStatisMap.hasPayInterest}" default="0" /></td>
			</tr>
			<tr>
				<td align="center">待收总额：￥<c:out value="${accmountStatisMap.forPaySum}" default="0" /></td>
				<td align="center">待收本金：￥<c:out value="${accmountStatisMap.forPayPrincipal}" default="0" /></td>
          		<td align="center">待收利息：￥<c:out value="${accmountStatisMap.forPayInterest}" default="0" /></td>
        	</tr>
        	<tr><td colspan="3" class="acc_tab_col">借款总汇：</td></tr>
        	<tr>
				<td align="center">已还总额：￥<c:out value="${accmountStatisMap.hasRePaySum}" default="0" /></td>
          		<td align="center">已还本金：￥<c:out value="${accmountStatisMap.hasRePayPrincipal}" default="0" /></td>
          		<td align="center">已还利息：￥<c:out value="${accmountStatisMap.hasRePayInterest}" default="0" /></td>
        	</tr>
        	<tr>
          		<td align="center">待还总额：￥<c:out value="${accmountStatisMap.forRePaySum}" default="0" /></td>
          		<td align="center">待还本金：￥<c:out value="${accmountStatisMap.forRePayPrincipal}" default="0" /></td>
          		<td align="center">待还利息：￥<c:out value="${accmountStatisMap.forRePayInterest}" default="0" /></td>
        	</tr>
        	<tr><td colspan="3" class="acc_tab_col">额度总汇：</td></tr>
        	<tr>
          		<td align="center">借款总额度：￥<c:out value="${accmountStatisMap.creditLimit}" default="0.00" /></td>
          		<td align="center">可用额度：￥<c:out value="${accmountStatisMap.usableCreditLimit}" default="0.00" /></td>
          		<td></td>
        	</tr>
        	<tr><td colspan="3" class="acc_tab_col">最近还款：</td></tr>
        	<tr>
          		<td align="center">最近还款日：
		          	<c:if test="#request.repayMap.minRepayDate == ''">无</c:if>
				  	<s:else>${repayMap.minRepayDate}</s:else>
		  		</td>
         		 <td align="center">最近还款金额：￥
					<c:out value="${repayMap.totalSum}" default="0.00" />
					<fmt:formatNumber value="${repayMap.totalSum}" type="number" pattern="0.00" />
		  		</td>
          		<td></td>
			</tr>
		</table>
    </div>
</div>
<!--账户详情 结束-->
<!--热门投标 start-->
<div class="acc_content" style="margin-top:20px">
    <div class="hottitle">推荐投标</div>
    <div class="moneyhot">
      <ul>
         <c:if test="#request.bdlist.size >0">
         	<s:iterator  value="#request.bdlist" var="bd" status="st">
	         <li>
		          <table>
		            <tr>
		              <td colspan="7">
		              <a  href="financeDetail.do?id=${bd.id}" target="_blank" class="mhottitle">${bd.borrowTitle}</a>
		              	<!-- 信用等级图标  -->
		                <c:if test="#bd.credit==1"><img src="${ctx}/static/images/HR.png"/></c:if><!-- HR -->
						<s:elseif test="#bd.credit==2"><img src="${ctx}/static/images/E.png"/></s:elseif><!-- E -->
						<s:elseif test="#bd.credit==3"><img src="${ctx}/static/images/D.png"/></s:elseif><!-- D -->
						<s:elseif test="#bd.credit==4"><img src="${ctx}/static/images/C.png"/></s:elseif><!-- C -->
						<s:elseif test="#bd.credit==5"><img src="${ctx}/static/images/B.png"/></s:elseif><!-- B -->
						<s:elseif test="#bd.credit==6"><img src="${ctx}/static/images/A.png"/></s:elseif><!-- A -->
						<s:elseif test="#bd.credit==7"><img src="${ctx}/static/images/AA.png"/></s:elseif><!-- AA -->
		             	<!--借款类型图标  -->
				        <c:if test="#bd.borrowWay==1"><img src="${ctx}/static/images/jing.png"/></c:if>
						<s:elseif test="#bd.borrowWay==3"><img src="${ctx}/static/images/xin.png"/></s:elseif>
						<s:elseif test="#bd.borrowWay==4"><img src="${ctx}/static/images/shi.png"/></s:elseif>
						<s:elseif test="#bd.borrowWay==5"><img src="${ctx}/static/images/dan.png"/></s:elseif>
		              </td>
		            </tr>
		            <tr>
		              <td align="right">借款总额：</td><td width="200">${bd.borrowAmount}</td>
		              <td align="right">期限：</td><td width="200">${bd.deadline}个月</td>
		              <td align="right">年利率：</td><td width="200">${bd.annualRate}% </td>
		              <td rowspan="2">
		              	<a href="financeDetail.do?id=${bd.id}" class="btnqtb">去投标</a>
		              </td>
		            </tr>
		            <tr>
		              <td align="right">还款方式：</td>
		              <td>
		               	<c:if test="#bd.paymentMode==1">等额本息</c:if>
						<s:elseif test="#bd.paymentMode==2">先息后本</s:elseif> 
		              </td>
		              <td align="right">网站奖励：</td>
		              <td>
			            <c:if test="#bd.excitationType==1">	- -	</c:if>
						<s:elseif test="#bd.excitationType==2">￥${bd.excitationSum}</s:elseif> 
						<s:elseif test="#bd.excitationType==3">${bd.excitationSum}%</s:elseif>
		              </td>
		              <td align="right">进度：</td>
		              <td>
		              	<div id="box" class="boxstyle"><div id="bar${st.count}" class="barstyle"></div></div>
		              	 <span class="boxnum" id="ba${st.count}">${bd.hasInvestAmount*100/bd.borrowAmount1}%</span>
		              </td>
		            </tr>
		          </table>
	        </li>
         	</s:iterator>
         </c:if>
         <s:else>暂无标可投</s:else>
      </ul>
    </div>
    <div class="clear"></div>
</div>
</div>
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script language="javascript">
$(function() {
	//样式选中
	dqzt(99, 't01');
});

var total = 100; //总数	
var bar1Text = $("#ba1").text();
if (bar1Text != "") {
	var b1 = bar1Text.split("%");
	var curN = b1[0]; //第一个标的当前值
}

var bar2Text = $("#ba2").text();
if (bar2Text != "") {
	var b2 = bar2Text.split("%");
	var curN1 = b2[0]; //第二个标的当前值
}

function show() {
	if (bar1Text != "") {
		var o = document.getElementById("bar1");
		if(curN <1){
			curN=1;
		}
		o.style.width = ((curN / total) * 120) + 'px';
	}
	if (bar2Text != "") {
		var o1 = document.getElementById("bar2");
		if(curN1 <1){
			curN1=1;
		}
		o1.style.width = ((curN1 / total) * 120) + 'px';
	}
}
show();
</script>
</body>
</html>
