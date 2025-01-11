<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	<jsp:include page="../include/head.jsp"></jsp:include>
	<style type="text/css">body{ background: #DFDFDF;}</style>
</head>
<body onload="showNewsBox1('news1')">
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 引用头部公共部分End -->
<div class="flr" id="flr">
	<a href="#in_money">我要投资</a>
	<a href="#in_say">风控说明</a>
	<a href="#in_per">借款人信息</a>
	<%-- <a href="#in_safe">安全保障</a>--%>
	<a href="#in_note">资料认证</a>
	<a href="#record" onclick="showNewsBox1('news1')">投资记录</a>
	<a href="#record" onclick="showNewsBox1('news2')">还款详情</a>
</div>
<!--投资详情 start-->
<div class="inmes">
  <div class="center">
    <div class="inmes_all" id="in_money">
      <div class="inmes_top">
		<c:if test="#request.borrowDetailMap.borrowWay==1">
			<img src="{ctx}/static/images/type_jin.png" />
		</c:if>
		<s:elseif test="#request.borrowDetailMap.borrowWay==3">
			<img src="{ctx}/static/images/type_xin.png" />
		</s:elseif>
		<s:elseif test="#request.borrowDetailMap.borrowWay==4">
			<img src="{ctx}/static/images/type_shi.png" />
		</s:elseif>
		<s:elseif test="##request.borrowDetailMap.borrowWay==5">
			<img src="{ctx}/static/images/type_dan.png" />
		</s:elseif>
		&nbsp;<c:out value="#request.borrowDetailMap.borrowTitle" default="---" />
		<!-- <a id="focusonBorrow" href="javascript:void(0);" class="h_gz">关注此借款</a> -->
      </div>
      <div class="inmesl left">
        <table>
          <tr>
            <td align="right">借款金额：</td>
            <td><span>￥<c:out value="#request.borrowDetailMap.borrowAmount" default="---" /></span> </td>
            <td align="right">年化收益：</td>
            <td><span><c:out value="#request.borrowDetailMap.annualRate" default="---" />%</span></td>
            <td align="right">借款期限：</td>
            <td><span><c:out value="#request.borrowDetailMap.deadline" default="---" />个月</span></td>
          </tr>
          <tr>
            <td align="right">网站奖励：</td>
            <td><span><c:out value="#request.borrowDetailMap.excitationSum" default="---" />%</span></td>
            <td align="right">还款方式：</td>
            <td><c:out value="#request.borrowDetailMap.paymentModeS" default="---" /></td>
            <td align="right">起息时间：</td>
            <td>满标复审</td>
          </tr>
          </table>
          <table style="border:0;">
          <tr>
            <td colspan="2" align="center">
             <div class="round">
                  <div id="bg" style="padding-left:1px;"></div>
                  <!-- 进度圆圈 -->
                  <div id="txt" class="pertxt1">
                  	<input type="hidden" id="jdy" value="${borrowDetailMap.schedules }"/>
                  </div>
                  <!-- 承载进度文字 --> 
              </div>
            </td>
            <td colspan="4">
            	剩余金额：<span>￥${borrowDetailMap.investAmount}</span><br />
            	<c:if test="#request.borrowDetailMap.borrowStatus==2">
            	剩余时间：<span id="remainTimeOne"></span><span id="remainTimeTwo" style="display: none;"></span>
            	</c:if>
            	<s:else>
            	<!--<c:if test="#borrowDetailMap.lastInvestTime!=null">
                ${borrowDetailMap.lastInvestTime}满标
              	</c:if>-->
            	${borrowDetailMap.lastInvestTime}满标
            	</s:else>
			</td>
          </tr>
        </table>
      </div>
      <div class="inmesr left">
      <c:if test="#request.borrowDetailMap.borrowStatus==2">
        <table>
          <tr>
            <td>最小投标金额：<span>￥<c:out default="0" value="#request.borrowDetailMap.minTenderedSum"/></span></td>
            <td>最大投标金额：<span>￥<c:out default="0" value="#request.borrowDetailMap.maxTenderedSum"/></span></td>
          </tr>
          <tr>
            <td>可用金额：
            	<span>￥<c:if test="#request.usableSum !=''">${request.usableSum}</c:if><s:else>0.00</s:else></span></td>
            <td>预期收益：<span><em id="earn">￥<c:out default="0.00" value="#request.earnAmount______"/></em></span></td>
          </tr>
        </table>
        <table>
          <tr>
            <td align="right">投标金额：</td>
            <td><input type="text" class="test" maxlength="20" value="${paramMap.amount}" id="amount" name="paramMap.amount"/>元</td>
          </tr>
          <tr>
            <td align="right">验证码：</td>
            <td>
            	<input type="text" class="test1" id="code" name="paramMap.code" maxlength="4"/>
				<img src="" title="点击更换验证码" style="cursor: pointer;" id="codeNum" onclick="javascript:switchCode()" />
				<span class="fred"><s:fielderror fieldName="paramMap['code']"></s:fielderror></span>
			</td>
          </tr>
          <tr>
            <td colspan="2" align="center" style=" padding-top:10px;">
				<c:if test="(#session.user!=null&&#session.user.id==#request.borrowDetailMap.publisher)||#session.user.type==0">
					<input type="button" value="不可投资" class="btnbtb"/>
				</c:if>
				<s:else>
					<a href="javascript:void(0);" class="tz_btn" id="btnsave" >
						<input type="button" class="btntb" onmouseover="this.className='btntbhover'" onmouseout="this.className='btntb'" />
					</a>
				</s:else>
				<a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
            </td>
          </tr>
        </table>
        </c:if>
        <s:elseif test="#request.borrowDetailMap.borrowStatus==3">
            <table style="font-size: 14px; height: 45px; line-height: 45px;">
              <tr>
                <td>已满标</td>
              </tr>
              <tr>
                <td>可投金额<span>￥${borrowDetailMap.investAmount}</span></td>
              </tr>
             
              <tr>
                <td><input type="button" value="复审中" class="btnbtb"/></td>
              </tr>
            </table>
			<!--<h4>投资余额	：0</h4>
			<p class="hh_p">已结束</p>
			<p class="hh_p1">可投金额￥${borrowDetailMap.investAmount}</p>
			<ul class="h_bxq1_right1 clearfix">
				<li>${borrowDetailMap.lastInvestTime}满标</li>
				<li class="tz_btnli">
					<a class="tz_btn">复审中</a>
				</li>
			</ul>-->
		</s:elseif>
		<s:elseif test="#request.borrowDetailMap.borrowStatus==4">
		    <table style="font-size: 14px; height: 45px; line-height: 45px;">
              <tr><td>还款中</td></tr>
              <tr>
                <td>可投金额<span>￥${borrowDetailMap.investAmount}</span></td>
              </tr>
             
              <tr>
                <td><input type="button" value="还款中" class="btnbtb"/>
                    <a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
                </td>
              </tr>
            </table>
			<!--<h4>投资余额	:0</h4>
			<p class="hh_p">已结束</p>
			<p class="hh_p1">可投金额￥${borrowDetailMap.investAmount}</p>
			<ul class="h_bxq1_right1 clearfix">
				<li>${borrowDetailMap.lastInvestTime}满标</li>
				<li class="tz_btnli">
					<a class="tz_btn">还款中</a>
					<a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
				</li>
			</ul>-->
		</s:elseif>
		<s:elseif test="#request.borrowDetailMap.borrowStatus==5">
		    <table style="font-size: 14px; height: 45px; line-height: 45px;">
              <tr><td>已还完</td></tr>
              <tr>
                <td>可投金额<span>￥${borrowDetailMap.investAmount}</span></td>
              </tr>
             
              <tr>
                <td><input type="button" value="已还完" class="btnbtb"/>
                    <a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
                </td>
              </tr>
            </table>
			<!--<h4>投资余额:0	</h4>
			<p class="hh_p">已结束</p>
			<p class="hh_p1">可投金额￥${borrowDetailMap.investAmount}</p>
			<ul class="h_bxq1_right1 clearfix">
				<li>${borrowDetailMap.lastInvestTime}满标</li>
				<li class="tz_btnli">
					<a class="tz_btn">已还完</a>
					<a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
				</li>
			</ul>-->
		</s:elseif>
		<s:else>
		    <table style="font-size: 14px; height: 45px; line-height: 45px;">
		      <tr>
		      	<td>
		      		<c:if test="#request.borrowDetailMap.borrowStatus==1">初审中</c:if>
		      		<s:elseif test="#request.borrowDetailMap.borrowStatus==6">流标</s:elseif>
		      	</td>
		      </tr>
              <tr>
                <td>可投金额<span>￥${borrowDetailMap.investAmount}</span></td>
              </tr><!--
              <tr>
              	<c:if test="#borrowDetailMap.lastInvestTime!=null">
                <td>${borrowDetailMap.lastInvestTime}满标</td>
              	</c:if>
              	<s:else><td></td></s:else>
              </tr>
              --><tr>
                <td><input type="button" value="其他" class="btnbtb"/>
                    <a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
                </td>
              </tr>
            </table>
			<!--<h4>投资余额：0</h4>
			<p class="hh_p">已结束</p>
			<p class="hh_p1">可投金额￥${borrowDetailMap.investAmount}</p>
			<ul class="h_bxq1_right1 clearfix">
				<li>${borrowDetailMap.lastInvestTime}满标</li>
				<li class="tz_btnli">
					<a class="tz_btn">其他</a>
					<a href="getMessageBytypeId.do?typeId=1" class="hh_yx" target="_blank">查看协议(范本)</a>
				</li>
			</ul>-->
		</s:else>
      </div>
      <div class="clear"></div>
    </div>
    <div class="inmes_all mt20" id="in_say">
      <div class="inmes_top">风控说明</div>
      <p>
      	<c:if test="#borrowDetailMap.auditOpinion==''">未审核</c:if>
      	<s:else>${borrowDetailMap.auditOpinion}</s:else>
      </p>
    </div>
    <div class="inmes_all mt20" id="in_per">
      <div class="inmes_top">借款人信息</div>
      <table class="permes">
        <tr>
          <td>用户名：${borrowUserMap.username}</td>
          <td>工作城市：${borrowUserMap.workPro}${borrowUserMap.workCity}</td>
          <td>信用等级: <img src="{ctx}/static/images/ico_${borrowUserMap.credit}.jpg" title="${borrowUserMap.creditrating}分" width="33" height="22" /></td>
        </tr>
      </table>
      <table class="permesall" cellpadding="0" cellspacing="0">
        <tr style=" background:#efefef;">
          <td><strong>性别</strong></td>
          <td><strong>年龄</strong></td>
          <td><strong>婚姻状况</strong></td>
          <td><strong>工作城市</strong></td>
          <td><strong>公司行业</strong></td>
          <td><strong>公司规模</strong></td>
        </tr>
        <tr>
          <td>${borrowUserMap.sex}</td>
          <td>${borrowUserMap.age}</td>
          <td>${borrowUserMap.maritalStatus}</td>
          <td>${borrowUserMap.workPro}&nbsp;${borrowUserMap.workCity}</td>
          <td>${borrowUserMap.companyLine}</td>
          <td>${borrowUserMap.companyScale}</td>
        </tr>
        <tr style=" background:#efefef;">
          <td><strong>职位</strong></td>
          <td><strong>学历</strong></td>
          <td><strong>有无购房</strong></td>
          <td><strong>有无房贷</strong></td>
          <td><strong>有无购车</strong></td>
          <td><strong>有无车贷</strong></td>
        </tr>
        <tr>
          <td>${borrowUserMap.job}</td>
          <td>${borrowUserMap.highestEdu}</td>
          <td>${borrowUserMap.hasHourse}</td>
          <td>${borrowUserMap.hasHousrseLoan}</td>
          <td>${borrowUserMap.hasCar}</td>
          <td>${borrowUserMap.hasCarLoan}</td>
        </tr>
      </table>
      <table class="permesall" cellpadding="0" cellspacing="0">
        <tr style=" background:#efefef;">
          <td><strong>发布的借款</strong></td>
          <td><strong>成功借款笔数</strong></td>
          <td><strong>还清笔数</strong></td>
          <td><strong>逾期笔数</strong></td>
          <td><strong>严重逾期次数</strong></td>
          <td><strong>共借入</strong></td>
          <td><strong>待还金额</strong></td>
          <td><strong>逾期金额</strong></td>
        </tr>
        <tr>
          <td><c:out value="#request.borrowRecordMap.publishBorrow" default="0" /></td>
          <td><c:out value="#request.borrowRecordMap.successBorrow" default="0" /></td>
          <td><c:out value="#request.borrowRecordMap.repayBorrow" default="0" /></td>
          <td><c:out value="#request.borrowRecordMap.hasFICount"	default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.badFICount" default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.pborrowAmount" default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.forRepayPI" default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.hasI" default="0" /></td>
        </tr>
      </table>
    </div>
    <%-- 
    <div class="inmes_all mt20" id="in_safe">
      <div class="inmes_top">安全保障</div>
      <p>
      	<c:if test="#borrowDetailMap.auditOpinion==''">未审核</c:if>
      	<s:else>${borrowDetailMap.auditOpinion}</s:else>
      </p>
    </div>
   --%>
    <div class="inmes_all mt20" id="in_note">
      <div class="inmes_top">借款人资料认证</div>
      <table cellpadding="0" cellspacing="0" class="rz">
		<c:if test="%{#request.list !=null && #request.list.size()>0}">
			<s:iterator value="#request.list" id="bean">
				<c:if test="#bean.name == '身份认证'">
					<c:if test="#bean.auditStatus == 3"><tr><td><img src="{ctx}/static/images/rz-per.jpg" /></td></c:if>
					<s:else><tr><td><img src="{ctx}/static/images/rz-perx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '工作认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-work.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-workx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '居住地认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-home.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-homex.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '信用报告'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-xy.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-xyx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '收入认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-sr.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-srx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '房产认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-fc.jpg" /></td></tr></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-fcx.jpg" /></td></tr></s:else>
				</c:if>
				<c:if test="#bean.name == '车产认证'">
					<c:if test="#bean.auditStatus == 3"><tr><td><img src="{ctx}/static/images/rz-chc.jpg" /></td></c:if>
					<s:else><tr><td><img src="{ctx}/static/images/rz-chcx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '结婚证书认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-jhzs.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-jhzsx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '学历认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-xl.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-xlx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '技工认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-jg.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-jgx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '手机认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-sj.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-sjx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '微博认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-sina.jpg" /></td></tr></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-sinax.jpg" /></td></tr></s:else>
				</c:if>
				<c:if test="#bean.name == '实地认证'">
					<c:if test="#bean.auditStatus == 3"><tr><td><img src="{ctx}/static/images/rz-sd.jpg" /></td></c:if>
					<s:else><tr><td><img src="{ctx}/static/images/rz-sdx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '抵押认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-dy.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-dyx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '担保认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-db.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-dbx.jpg" /></td></s:else>
				</c:if>
				<c:if test="#bean.name == '其他资料认证'">
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-qt.jpg" /></td></tr></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-qtx.jpg" /></td></tr></s:else>
				</c:if>
			</s:iterator>
		</c:if>
		<s:else>
			<tr ><td colspan="3" align="center">没有数据</td></tr>
		</s:else>
      </table>
    </div>
    <div class="inmes_all mt20 mb20" style="border:0;" id="record">
     <div id="tabs1">
      <div class="title1"> 
       <a href="javascript:void(0)" id="news1" onclick="showNewsBox1('news1')">投资记录</a>
       <a href="javascript:void(0)" id="news2" onclick="showNewsBox1('news2')">还款详情</a></div>
      	<!--投资记录-->
	      <div id="info_invest" ></div>
      	<!--还款详情-->
      	<div id="info_repayment"></div>
      </div>
    </div>
  </div>
</div>
<!--投资详情 end-->
<div id="remainSeconds" style="display: none;">${borrowDetailMap.remainTime}</div>
<input type="hidden" id="idStr" value="${idStr}" />
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 引用底部公共部分End -->
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/raphael-min.js"></script> <!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/round-little.js"></script><!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script><!--选项卡 js-->
<script type="text/javascript"><!--表格隔行换色 js--> 
var Ptr=document.getElementById("tab").getElementsByTagName("tr");
var Ptr1=document.getElementById("tab1").getElementsByTagName("tr");
function tab() {
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
	for (i=1;i<Ptr1.length+1;i++) { 
    Ptr1[i-1].className = (i%2>0)?"t1":"t2"; 
    }
}
window.onload=tab;
</script>
<script>
$(window).bind("scroll",function() {//右侧悬浮菜单
    var d = $(document).scrollTop(),
    e = $(window).height();
    0 < d ? $("#flr").css("bottom", "50px") : $("#flr").css("bottom", "-400px");
	clearTimeout(timmer);
	timmer = setTimeout(function() {
    	clearTimeout(timmer)
    },100);
});
</script>
<script type="text/javascript">
	$(function() {
		$("#amount").blur(function(){
			var param = {};
			param["paramMap.borrowSum"] = $("#amount").val();
			param["paramMap.yearRate"] = ${borrowDetailMap.annualRate};
			param["paramMap.borrowTime"] = ${borrowDetailMap.deadline};
			var repayWay = ${borrowDetailMap.paymentMode};
			if(repayWay == 1){
				param["paramMap.repayWay"] = 0;
			}else if(repayWay == 2){
				param["paramMap.repayWay"] = 1;
			}else if (repayWay == 4){
				param["paramMap.repayWay"] = 2;
			}
			
			$.post("frontfinanceTools.do",param,function(data){
				var bb = 0;
		    	for(var i = 0; i < data.length; i ++){
					if(i == 0){
					   aa = data[i].monForRateA;
					   //bb = data[i].monRate;
					   cc = data[i].allPay;
					}
					bb += Number(data[i].monForRate);
				}
			    var _array = [];
		        _array.push("￥"+bb.toFixed(2));
				$("#earn").html(_array.join(""));
			});        
		});
		$('#sendmail').click(function() {
			var id = '${borrowUserMap.userId}';
			var username = '${borrowUserMap.username}';
			var url = "mailInit.do?id=" + id + "&username=" + username;
			var uname = '${user.userName}';
			if (username == uname) {
				alert("您不能给自己发送站内信");
				return false;
			}
			$.shovePost('mailInit.do', param, function(data) {
				$.jBox("iframe:" + url, {
					title : "发送站内信",
					width : 500,
					height : 400,
					buttons : {}
				});
			});
		});
		$('#reportuser').click(function() {
			var id = '${borrowUserMap.userId}';
			var username = '${borrowUserMap.username}';
			var url = "reportInit.do?id=" + id + "&username=" + username;
			var uname = '${user.userName}';
			if (username == uname) {
				alert("您不能举报自己");
				return false;
			}
			$.shovePost('reportInit.do', param, function(data) {
				$.jBox("iframe:" + url, {
					title : "举报此人",
					width : 500,
					height : 400,
					buttons : {}
				});
			});
		});
		$('#focusonUser').click(function() {
			var username = '${borrowUserMap.username}';
			var uname = '${user.userName}';
			if (username == uname) {
				alert("您不能关注自己");
				return false;
			}
			param['paramMap.id'] = '${borrowUserMap.userId}';
			$.shovePost('focusonUser.do', param, function(data) {
				var callBack = data.msg;
				alert(callBack);
			});
		});
		$('#focusonBorrow').click(function() {
			var username = '${borrowUserMap.username}';
			var uname = '${user.userName}';
			if (username == uname) {
				alert("您不能关注自己发布的借款");
				return false;
			}
			param['paramMap.id'] = '${borrowDetailMap.id}';
			$.shovePost('focusonBorrow.do', param, function(data) {
				var callBack = data.msg;
				alert(callBack);
			});
		});

		$("#base_info").click(function() {
			$("#base_info").addClass("on");
			$("#sauth_info").removeClass();
			$("#invest_info").removeClass();
			$("#repayment_info").removeClass();
			$("#msgboard_info").removeClass();

			$("#info_base").removeClass();
			$("#info_sauth").addClass("hide");
			$("#info_invest").addClass("hide");
			$("#info_repayment").addClass("hide");
			$("#info_msgboard").addClass("hide");
		});
		$("#sauth_info").click(function() {
			$("#base_info").removeClass();
			$("#sauth_info").addClass("on");
			$("#invest_info").removeClass();
			$("#repayment_info").removeClass();
			$("#msgboard_info").removeClass();

			$("#info_base").addClass("hide");
			$("#info_sauth").removeClass();
			$("#info_invest").addClass("hide");
			$("#info_repayment").addClass("hide");
			$("#info_msgboard").addClass("hide");
		});
		<%-- 投资记录 --%>
		$("#invest_info").click(function() {
			$("#base_info").removeClass();
			$("#sauth_info").removeClass();
			$("#invest_info").addClass("tzlist");
			$("#repayment_info").removeClass();
			$("#msgboard_info").removeClass();

			$("#info_base").addClass("hide");
			$("#info_sauth").addClass("hide");
			$("#info_invest").removeClass();
			$("#info_repayment").addClass("hide");
			$("#info_msgboard").addClass("hide");
			investListInfo(param);
		});
		<%-- 还款详情 --%>
		$("#repayment_info").click(function() {
			$("#base_info").removeClass();
			$("#sauth_info").removeClass();
			$("#invest_info").removeClass();
			$("#repayment_info").addClass("tzlist");
			$("#msgboard_info").removeClass();

			$("#info_base").addClass("hide");
			$("#info_sauth").addClass("hide");
			$("#info_invest").addClass("hide");
			$("#info_repayment").removeClass();
			$("#info_msgboard").addClass("hide");
			repaymentListInfo(param);
		});
		$("#msgboard_info").click(function() {
			$("#base_info").removeClass();
			$("#sauth_info").removeClass();
			$("#invest_info").removeClass();
			$("#repayment_info").removeClass();
			$("#msgboard_info").addClass("on");

			$("#info_base").addClass("hide");
			$("#info_sauth").addClass("hide");
			$("#info_invest").addClass("hide");
			$("#info_repayment").addClass("hide");
			$("#info_msgboard").removeClass();
			msgboardListInfo(param);
		});
	});
	function msgboardListInfo(param) {
		param['paramMap.id'] = '${borrowDetailMap.id}';
		$.post("borrowmessage.do", param, function(data) {
			$("#info_msgboard").html(data);
		});
	}
	<%-- 还款详情 --%>
	function repaymentListInfo(param) {
		var id = $('#idStr').val();
		param['paramMap.id'] = id;
		$.shovePost('financeRepay.do', param, function(data) {
			$('#info_repayment').html(data);
		});
	}
	<%-- 投资记录 --%>
	function investListInfo(param) {
		var id = $('#idStr').val();
		param['paramMap.id'] = id;
		$.post('financeInvestRecord.do', param, function(data) {
			$('#info_invest').html(data);
		});
	}
</script>
<script type="text/javascript">
	//展开
	function cutText(str) {
		if (str.length > 80)
			return str.substr(0, 80) + ".....";
		return str;
	}

	$(function() {
		$(".conter").each(function() {
			$(this).data("ff", $(this).text());
			$(this).text(cutText($(this).text()));
		});
	});

	function openContent(obj) {
		var content = $(obj).parent().children(".conter");

		content.text(content.data("ff"));
		$(obj).hide();
		$(obj).next().show();
	}

	function closeContent(obj) {
		var content = $(obj).parent().children(".conter");

		content.text(cutText(content.data("ff")));
		$(obj).hide();
		$(obj).prev().show();
	}
</script>
<script type="text/javascript">
	//倒计时
	var SysSecond;
	var InterValObj;

	$(document).ready(function() {
		SysSecond = parseInt($("#remainSeconds").html()); //这里获取倒计时的起始时间 
			InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行 
		});

	//将时间减去1秒，计算天、时、分、秒 
	function SetRemainTime() {
		if (SysSecond > 0) {
			SysSecond = SysSecond - 1;
			var second = Math.floor(SysSecond % 60); // 计算秒     
			var minite = Math.floor((SysSecond / 60) % 60); //计算分 
			var hour = Math.floor((SysSecond / 3600) % 24); //计算小时 
			var day = Math.floor((SysSecond / 3600) / 24); //计算天 
			var times = day + "天" + hour + "小时" + minite + "分" + second + "秒";
			$("#remainTimeOne").html(times);
			$("#remainTimeTwo").html(times);
		} else {//剩余时间小于或等于0的时候，就停止间隔函数 
			window.clearInterval(InterValObj);
			//这里可以添加倒计时时间为0后需要执行的事件 
		}
	}
</script>
<script type="text/javascript">
var flag = true;
$(function(){
	 $('#btnsave').click(function(){
		var id = $('#idStr').val();
	     param['paramMap.id'] = id;
	     param["paramMap.code"] = $("#code").val();
	     param['paramMap.amount'] = $('#amount').val();
	     param['paramMap.investPWD'] = $('#investPWD').val();
	     if(flag){
           flag = false;
	       $.shovePost('financeInvest.do',param,function(data){
		      var callBack = data.msg;
		      if(callBack == undefined || callBack == ''){
		         //$('#content').html(data);
		         flag = true;
		      }else{
		         if(callBack == 1){
		          alert("操作成功!");
		          //window.location.href= 'financeDetail.do?id='+id;
		          $("#invest_info").click();
		          scroll(1000,1000);
		          switchCode();
		          flag = false;
		          window.location.reload();
		          return false;
		         }
		         alert(callBack);
		         flag = true;
		      }
	    	});
		 }
	 });
    switchCode();
});
function switchCode(){
	var timenow = new Date();
	$('#codeNum').attr('src','admin/imageCode.do?pageId=invest&d='+timenow);
};		 
</script>
</body>
</html>
