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

<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
		<!-- left.jsp -->
		 <%@include file="../include/dun-left.jsp" %>
		 <!--右 开始-->
        <div class="myhome_r clearfix">
        	<!--标题 开始-->
		    <div class="ny_tit">
            	<ul>
                	<li class="on">理财统计</li>
                </ul>
            </div>
            <!--标题 结束-->
            <!--内容 开始-->	
            <div class="rz_content tab_content clearfix">
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="zh_table" style="margin-top:10px;">
                    <tr>
                        <th colspan="2">回报统计</th>
                    </tr>
                    <tr>
                        <td width="50%">奖励收入总额</td>
                        <td width="50%">￥<c:if test="#request.financeStatisMap.rewardIncome !=''">${financeStatisMap.rewardIncome}</c:if><s:else>0</s:else></td>
                    </tr>
                     <tr>
                        <td width="50%">已赚逾期罚息</td>
                        <td width="50%">￥<c:if test="#request.financeStatisMap.hasFI !=''">${financeStatisMap.hasFI}</c:if><s:else>0</s:else></td>
                    </tr>
                     <tr>
                        <td width="50%">已赚利息</td>
                        <td width="50%">￥<c:if test="#request.financeStatisMap.earnInterest !=''">${financeStatisMap.earnInterest}</c:if><s:else>0</s:else></td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="zh_table" style="margin-top:25px;">
                    <tr>
                        <th colspan="4">个人理财统计</th>
                    </tr>
                    <tr>
                        <td width="26%">总收购金额</td>
                        <td width="26%">￥<c:if test="#request.financeStatisMap.investAmount !=''">${financeStatisMap.investAmount}</c:if><s:else>0</s:else></td>
                        <td width="26%">总收购笔数</td>
                        <td width="22%"><c:if test="#request.financeStatisMap.investCount !=''">${financeStatisMap.investCount}</c:if><s:else>0</s:else></td>
                    </tr>
                    <tr>
                        <td width="26%">已回收本息</td>
                        <td width="26%">￥<c:if test="#request.financeStatisMap.hasPI !=''">${financeStatisMap.hasPI}</c:if><s:else>0</s:else></td>
                        <td width="26%">已回收笔数</td>
                        <td width="22%"><c:if test="#request.financeStatisMap.hasCount !=''">${financeStatisMap.hasCount}</c:if><s:else>0</s:else></td>
                    </tr>
                    <tr>
                        <td width="26%">待回收本息</td>
                        <td width="26%">￥<c:if test="#request.financeStatisMap.forPI !=''">${financeStatisMap.forPI}</c:if><s:else>0</s:else></td>
                        <td width="26%">待回收笔数</td>
                        <td width="22%"><c:if test="#request.financeStatisMap.forCount !=''">${financeStatisMap.forCount}</c:if><s:else>0</s:else></td>
                    </tr>
                    <tr>
                        <td width="26%">待回收罚息</td>
                        <td width="26%">￥<c:if test="#request.financeStatisMap.forFI !=''">${financeStatisMap.forPI}</c:if><s:else>0</s:else></td>
                        <td width="26%">已回收罚息</td>
                        <td width="26%">￥<c:if test="#request.financeStatisMap.forFI !=''">${financeStatisMap.forPI}</c:if><s:else>0</s:else></td>
                    </tr>
                </table>  
            </div>
            <!--内容 结束-->
        </div>
        <!--右 结束-->
    </div>	
</div>    

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

  <script>
    $(function(){
    	dqzt(9,'t10');
        });
    </script>
</body>
</html>
