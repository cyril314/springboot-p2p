<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>


<div class="nymain">
  <div class="lcnav">
    <div class="tab">
<div class="tabmain">
  <ul><li class="on" style="padding:0 20px;">借款协议</li>
  </ul>
    </div>
    </div>
    <div class="line">
    </div>
  </div>
  <div class="lcmain">
    <div class="lcmain_l" style="width: 98%">
    <div class="lctab" style="padding:0 10px; width: 98%">
    <div class="gginfo">
    <h2 style="font-size: 20px">借款协议</h2>
  <p align="right">
	 合同编号: <b><u>P2P—${map.DatesNumber}${map.id }</u></b>
</p>
<p align="right">
	 签约日期: <b><u>${map.DateTime}</u></b>
</p>
<p>
	协议三方定义:
</p>
<p>
	贷出者:
	 <c:if test="#request.user_invest_map==null || #request.user_invest_map.size==0">
		     　暂无贷出者
			</c:if>
			<s:else>
				<s:iterator var="mapBeans" value="#request.user_invest_map" >
	 <b><u>
		<c:if test="%{#mapBeans.realName==''}">${mapBeans.username}</c:if>
			<s:else>${mapBeans.realName}</s:else>
			</u></b><b><u>;</u></b> 
			</s:iterator>
			</s:else>
	 ，以下称“贷出方”；
</p>
<p>
	借入者: <b>${map.realName} &nbsp;&nbsp;&nbsp; (<shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</b>，以下称“借入方”；
</p>
<p>
	管理方: <b><u>好乐易贷</u></b>，以下称“管理方”。
</p>
<p>&nbsp;
	
</p>
<p>
	郑重承诺:
</p>
<p>
 ${contentMap.content }
</p>
<p>
	贷出者:
</p>
<p>&nbsp;
	
</p>
<div style="padding-left: 20px; padding-right: 20px;">
<table border="1" cellspacing="0" cellpadding="0" style="border:none;padding-left: 5px;"   >
	<tbody>
		<tr>
			<td  valign="middle" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">出借人名称</span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			<td  width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">借出金额</span><span style="font-family:&quot;color:windowtext;">(</span><span style="font-family:宋体;color:windowtext;">人民币</span><span style="font-family:&quot;color:windowtext;">)</span>
				</p>
			</td>
			<td  width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">借款期限</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
				<td  width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">年利率</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
					<td  width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">借款开始日期</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
					<td  width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">借款到期日期</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
			
						<td width="180px;"  valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
			
			
			
			<td width="180px;" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
				<p>
					<span style="font-family:宋体;color:windowtext;">总还款本息</span><span style="font-family:&quot;color:windowtext;">(</span><span style="font-family:宋体;color:windowtext;">人民币</span><span style="font-family:&quot;color:windowtext;">)</span>
				</p>
			</td>
		</tr>
		<c:if test="#request.investMaps==null || #request.investMaps.size==0">
					暂无数据
	</c:if>
	<s:else>
	<s:iterator var="mapBean" value="#request.investMaps" >
		
		<tr>
			<td width="150px" valign="top" style="border:solid black 1.0pt;background:white;">
				<p>
					<span style="font-family:宋体;color:windowtext;">${mapBean.username } ${bean.realName } ${bean.idNo }</span><span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">￥${mapBean.recivedPrincipal }</span>
				</p>
			</td>
			
				<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">${mapBean.deadline }<c:if test="#mapBean.isDayThe==1"> 个月</c:if>
	<c:if test="#mapBean.isDayThe==2"> 天</c:if></span>
				</p>
			</td>
			
			
				<td width="100px" valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">${mapBean.annualRate }%</span>
				</p>
			</td>
			
				<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">
					${mapBean.starTime}
					</span>
				</p>
			</td>
			
					<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">	${mapBean.endTime} </span>
				</p>
			</td>
					<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">&nbsp;&nbsp;</span>
				</p>
			</td>
			
			<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">￥${mapBean.sumPI }</span>
				</p>
			</td>
		</tr>
		</s:iterator>
		</s:else>
		
				<tr>
			<td width="150px" valign="top" style="border:solid black 1.0pt;background:white;">
				<p>
					<span style="font-family:宋体;color:windowtext;">总金额：</span>
				</p>
			</td>
			<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">￥${sumMap.sumPal }</span>
				</p>
			</td>
			
				<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">${mapBean.deadline }<c:if test="#mapBean.isDayThe==1"> 个月</c:if>
	<c:if test="#mapBean.isDayThe==2"> 天</c:if></span>
				</p>
			</td>
			
			
				<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
				<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
			
					<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;"></span>
				</p>
			</td>
					<td  valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">总还本息：</span>
				</p>
			</td>
			
			<td valign="top" style="border:solid black 1.0pt;background:white;">
				<p align="center" style="text-align:center;">
					<span style="font-family:&quot;color:windowtext;">￥${sumMap.sumPI }</span>
				</p>
			</td>
		</tr>
	</tbody>
</table>
</div>
<p>&nbsp;
	
</p>
<p>
</p>
	借入者 : <b><u>${map.Busername}</u></b><b><u>(</u></b><b><u>身份证号码：</u></b>
	<b><u><shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</u></b>
<p>
	管理方: <b><u>好乐易贷</u></b>
</p>
<p>
	三方约定:
</p>
<p>
	由管理方负责将贷出方的款项划转至借款方开立的账户。
</p>
<p>
	第一条 借款基本信息
</p>
<p>&nbsp;
	
</p>
<div align="center">
	<table border="1" cellspacing="0" cellpadding="0" style="border:none;">
		<tbody>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">借款详细用途</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">${map.purpose}</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">借款本金数额</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${map.borrowAmount}</span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">应偿还本息数额</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:&quot;color:windowtext;">￥${sumMap.sumPI }</span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款分期月数</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${map.deadline}</span><span style="font-family:宋体;color:windowtext;">
						<c:if test="#request.map.isDayThe==1">个月</c:if>
						<c:if test="#request.map.isDayThe==2">天</c:if>
						</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">借款利率</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${map.annualRate}%</span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款方式</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">
					   <c:if test="#request.map.paymentMode==1">
	按月分期
	</c:if>
				<s:elseif test="#request.map.paymentMode==2">
	按先息后本还款
	</s:elseif>
				<s:elseif test="#request.map.paymentMode==3">
	秒还
	</s:elseif>
				<s:elseif test="#request.map.paymentMode==4">
	一次性还本付息
	</s:elseif>
					</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">借款描述</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">${map.detail}</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款日</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">每月${map.days }日（24：00前，节假日不顺延）</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			<tr>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款起止日期</span><span style="font-family:&quot;color:windowtext;">:</span>
					</p>
				</td>
				<td width="397" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:Courier;color:red;">${map.starTime }  至  ${map.endTime }  止<span style="font-family:Courier;color:red;"></span></span>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p>&nbsp;
	
</p>
<p>
	分期还款列表
</p>
<p>&nbsp;
	
</p>
<div style="padding-left: 20px; padding-right: 20px;">
	<table border="1" cellspacing="0" cellpadding="0" style="border:none;"  >
		<tbody>
			<tr>
				<td width="57" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">期数</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">年利率</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">应还时间</span><span style="font-family:&quot;color:windowtext;"></span><span style="font-family:宋体;color:windowtext;"></span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
				<td width="198" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">应还本息</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
					<td width="198" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款本金</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
						<td width="198" valign="top" style="border:solid black 1.0pt;background:#D9D9D9;">
					<p>
						<span style="font-family:宋体;color:windowtext;">还款利息</span><span style="font-family:&quot;color:windowtext;"></span>
					</p>
				</td>
			</tr>
			
				<c:if test="#request.borrow_map==null || #request.borrow_map.size==0">
						暂无数据
			</c:if>	<s:else>
	<s:iterator value="#request.borrow_map" var="bean">
			<tr>
				<td width="57" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${bean.repayPeriod }</span>
					</p>
				</td>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${bean.annualRate }%</span>
					</p>
				</td>
				<td width="142" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;"><s:date name="#bean.repayDate" format="yyyy-MM-dd"/></span>
					</p>
				</td>
				<td width="198" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${bean.isp }</span>
					</p>
				</td>
					<td width="198" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${bean.stillPrincipal }</span>
					</p>
				</td>
					<td width="198" valign="top" style="border:solid black 1.0pt;background:white;">
					<p>
						<span style="font-family:&quot;color:windowtext;">${bean.stillInterest }</span>
					</p>
				</td>
			</tr>
			</s:iterator>
			</s:else>
			
		</tbody>
	</table>
</div>
<p>&nbsp;
	
</p>
<p>&nbsp;
	
</p>
<p>
	第二条 各方权利和义务
</p>
<p>
	贷出方的权利和义务 :
</p>
<div style="color:windowtext;">
  ${mapContent.content}
  </div>
<p>
	（以下无正文）
</p>
<p>
	贷出者:
	 <c:if test="#request.user_invest_map==null || #request.user_invest_map.size==0">
		     　暂无贷出者
			</c:if>
			<s:else>
				<s:iterator var="mapBeans" value="#request.user_invest_map" >
	 <b><u>
		<c:if test="%{#mapBeans.realName==''}">${mapBeans.username}</c:if>
			<s:else>${mapBeans.realName}</s:else>
			</u></b><b><u>;</u></b>
			</s:iterator>
			</s:else>
	
</p>
<p>
	借入者: <b>${map.realName} &nbsp;&nbsp;&nbsp; (<shove:sub  value="#request.map.isno" size="12"   suffix="******" />)</b>
</p>
<p>
	通信地址：<b><u>${sitemap.address}</u></b>
</p>
<p>
	管理方：<b><u>好乐易贷</u></b>
</p>
<p>&nbsp;
	
</p>
</div></div></div></div></div>

<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>

<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
dqzt(2);
</script>

</body>
</html>

