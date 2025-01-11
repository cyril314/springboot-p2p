<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
	<style type="text/css">
	body{ background: #DFDFDF;}
	.inmesAlll{ width:988px; height:auto; background:#FFF; border:1px solid #c7c7c7;}
	.inmesAlll p{ font-size: 13px; margin: 20px; line-height: 24px;}
	</style>
</head>
<body>
<!--投资详情 start-->
  <div class="center">
    <div class="inmes_all mt20">
		 <div class="inmes_top"> 借款标详情</div>
	</div>
    <div class="inmesAlll" id="in_money">
      <div class="inmesl left">
        <table>
          <tr>
            <td align="right">借款金额：</td>
            <td><span>￥<c:out value="#request.borrowDetailMap.borrowAmount" default="---" /></span> </td>
            <td align="right">年化收益：</td>
            <td><span><c:out value="#request.borrowDetailMap.annualRate" default="---" />%</span></td>
            <td align="right">借款期限：</td>
            <!-- 天标借款期限是天  2014-12-9李丹丹 add start -->
            	<c:if test="#request.borrowDetailMap.isDayThe==2">
            		<td><span><c:out value="#request.borrowDetailMap.deadline" default="---" />天</span></td>
            	</c:if>
            	<s:else>
            		<td><span><c:out value="#request.borrowDetailMap.deadline" default="---" />个月</span></td>
            	</s:else>
             <!-- 天标借款期限是天  2014-12-9李丹丹 add end -->
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
            	<s:else>${borrowDetailMap.lastInvestTime}满标</s:else>
			</td>
          </tr>
        </table>
      </div>
      <div class="clear"></div>
    </div>
    <div class="inmesAlll mt20" id="in_say">
      <div class="inmes_top">风控说明</div>
      <p>
      	<c:if test="#borrowDetailMap.auditOpinion==''">未审核</c:if>
      	<s:else>${borrowDetailMap.auditOpinion}</s:else>
      </p>
    </div>
    <div class="inmesAlll mt20" id="in_per">
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
		  <td><c:out value="#request.borrowRecordMap.borrowAmount" default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.forRepayPI" default="0" /></td>
		  <td><c:out value="#request.borrowRecordMap.hasI" default="0" /></td>
        </tr>
      </table>
    </div>
    <div class="inmesAlll mt20" id="in_note">
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
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-qt.jpg" /></td></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-qtx.jpg" /></td></s:else>
				</c:if>
				<!-- 2014-12-16 李丹丹  start      add名企显示  增加名企显示的图片-->
				<c:if test="#bean.name == '企业证件'" >
					<c:if test="#bean.auditStatus == 3"><td><img src="{ctx}/static/images/rz-qy.jpg" /></td></tr></c:if>
					<s:else><td><img src="{ctx}/static/images/rz-qyx.jpg" /></td></tr></s:else>
				</c:if>
				<!-- 2014-12-16 李丹丹  end  add名企显示 -->
			</s:iterator>
		</c:if>
		<s:else><tr><td colspan="3" align="center">没有数据</td></tr></s:else>
      </table>
    </div>
  </div>
<!--投资详情 end-->
<div id="remainSeconds" style="display: none;">${borrowDetailMap.remainTime}</div>
<input type="hidden" id="idStr" value="${idStr}" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/js/raphael-min.js"></script> <!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/round-little.js"></script><!--百分比 js-->
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script><!--选项卡 js-->
<script type="text/javascript">
	//表格隔行换色 js 
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
<script type="text/javascript">
	$(function() {
		$("#amount").blur(function(){
			var param = {};
			//获取标的类型
			var borrowWay = $("#borrowWay").val();
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
			//2014-12-10 李丹丹 add  实现如果标是天标， 则按照天标的方式计算收益-----------------start------------------------
			if(borrowWay=="9"){
				//天标收益计算器
				$.post("toolsCalculateDay.do",param,function(data){
					var bb = 0;
					var	monForRateA = data.map.monForRateA;//投标金额
					var	monRate = data.map.monRate;//
					var	monForRate = data.map.monForRate//预期收益
					var	allPay = data.map.allPay;
				     //var _array = [];
			        //_array.push("￥"+monForRate.toFixed(2));
					$("#earn").html("￥"+monForRate);
				});
			}else{
				//非天标收益计算器
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
			}	
		    //2014-12-10 李丹丹 add  实现如果标是天标， 则按照天标的方式计算收益-----------------end------------------------
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
</body>
</html>
