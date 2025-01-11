<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="homeBorrowInvestInit.do">投资管理</a>  > 理财统计</div>
			<table class="acc_tab" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="2" class="acc_tab_col">回报统计：</td>
        </tr>
        <tr>
          <td align="center">奖励收入总额</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.rewardIncome !=''">${financeStatisMap.rewardIncome}</c:if><s:else>0</s:else></td>
        </tr>
        <tr>
          <td align="center">已赚逾期罚息</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.hasFI !=''">${financeStatisMap.hasFI}</c:if><s:else>0</s:else></td>
        </tr>
        <tr>
          <td align="center">已赚利息</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.earnInterest !=''">${financeStatisMap.earnInterest}</c:if><s:else>0</s:else></td>
        </tr>
        </table>
        <table class="acc_tab" cellpadding="0" cellspacing="0" style="margin-top:25px" >
        <tr>
          <td colspan="4" class="acc_tab_col">个人理财统计：</td>
        </tr>
        <tr>
          <td align="center">总借出金额</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.investAmount !=''">${financeStatisMap.investAmount}</c:if><s:else>0</s:else></td>
          <td align="center">总借出笔数</td>
           <td align="center"><c:if test="#request.financeStatisMap.investCount !=''">${financeStatisMap.investCount}</c:if><s:else>0</s:else></td>
        </tr>
        <tr>
          <td align="center">已回收本息</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.hasPI !=''">${financeStatisMap.hasPI}</c:if><s:else>0</s:else></td>
          <td align="center">已回收笔数</td>
          <td align="center"><c:if test="#request.financeStatisMap.hasCount !=''">${financeStatisMap.hasCount}</c:if><s:else>0</s:else></td>
        </tr>       
        <tr>
          <td align="center">待回收本息</td>
          <td align="center">￥<c:if test="#request.financeStatisMap.forPI !=''">${financeStatisMap.forPI}</c:if><s:else>0</s:else></td>
          <td align="center">待回收笔数</td>
          <td align="center"><c:if test="#request.financeStatisMap.forCount !=''">${financeStatisMap.forCount}</c:if><s:else>0</s:else></td>
        </tr>        
      </table>
		</div>
	</div>
</div>

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

  <script>
    $(function(){
    	dqzt(10,'t08');
        });
  
    </script>
</body>
</html>
