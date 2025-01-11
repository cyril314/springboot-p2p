<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
	<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="homeBorrowAuditInit.do">借款管理</a>  > 借款统计</div>
			<table class="acc_tab" cellpadding="0" cellspacing="0">
        <tr>
          <td colspan="4" class="acc_tab_col">逾期统计：</td>
        </tr>
        <tr>
          <td align="center">逾期本息</td>
          <td align="center">￥<c:if test="#request.loanStatisMap.hasFI !=''">${loanStatisMap.hasFI}</c:if><s:else>0</s:else></td>
          <td align="center">逾期次数</td>
          <td align="center"><c:if test="#request.loanStatisMap.hasFICount !=''">${loanStatisMap.hasFICount}</c:if><s:else>0</s:else></td>
        </tr>
        <tr>
          <td align="center">逾期罚款</td>
          <td align="center">￥<c:if test="#request.loanStatisMap.hasI !=''">${loanStatisMap.hasI}</c:if><s:else>0</s:else></td>
          <td align="center">严重逾期次数</td>
          <td align="center"><c:if test="#request.loanStatisMap.badFICount !=''">${loanStatisMap.badFICount}</c:if><s:else>0</s:else></td>
        </tr>       
        </table>
      
        <table class="acc_tab" cellpadding="0" cellspacing="0" style="margin-top:25px" >
        <tr>
          <td colspan="4" class="acc_tab_col">还款统计：</td>
        </tr>
        <tr>
          <td align="center">总借款额</td>
          <td align="center">￥<c:if test="#request.loanStatisMap.borrowAmount !=''">${loanStatisMap.borrowAmount}</c:if><s:else>0</s:else></td>
          <td align="center">发布借款数</td>
           <td align="center"><c:if test="#request.loanStatisMap.publishBorrow !=''">${loanStatisMap.publishBorrow}</c:if><s:else>0</s:else></td>
        </tr>
        <tr>
          <td align="center">已还本息</td>
          <td align="center">￥<c:if test="#request.loanStatisMap.hasPI !=''">${loanStatisMap.hasPI}</c:if><s:else>0</s:else></td>
          <td align="center">成功借款数</td>
          <td align="center"><c:if test="#request.loanStatisMap.successBorrow !=''">${loanStatisMap.successBorrow}</c:if><s:else>0</s:else></td>
        </tr>       
        <tr>
          <td align="center">待还本息</td>
          <td align="center">￥<c:if test="#request.loanStatisMap.forRepayPI !=''">${loanStatisMap.forRepayPI}</c:if><s:else>0</s:else></td>
          <td align="center">借款总笔数统计</td>
          <td align="center"><c:if test="#request.loanStatisMap.borrowAmount !=''">${loanStatisMap.allPublishRepay}</c:if><s:else>0</s:else></td>
        </tr>   
        <tr>
          <td align="center">正常还清笔数</td>
          <td align="center"><c:if test="#request.loanStatisMap.repayBorrow !=''">${loanStatisMap.repayBorrow}</c:if><s:else>0</s:else></td>
          <td align="center">提前还清笔数</td>
          <td align="center"><c:if test="#request.loanStatisMap.beforeRepayBorrow !=''">${loanStatisMap.beforeRepayBorrow}</c:if><s:else>0</s:else></td>
        </tr>    
        <tr>
          <td align="center">未还清笔数</td>
          <td align="center"><c:if test="#request.loanStatisMap.forRepayBorrow !=''">${loanStatisMap.forRepayBorrow}</c:if><s:else>0</s:else></td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
        </tr>         
      </table>      
		</div>
	</div>
</div>
 

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
$(function(){
    //样式选中
    dqzt(13,'t012');
     $("#zh_hover").attr('class','nav_first');
	 $("#zh_hover div").removeClass('none');
});		     
</script>
</body>
</html>
