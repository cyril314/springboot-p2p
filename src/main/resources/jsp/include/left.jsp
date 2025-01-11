<%@ page language="java" pageEncoding="utf-8" %>
<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
<script language="javascript">
function qiehuan(num){
	for(var i=0;i<=5;i++){
		if(i==num){
			document.getElementById("acc_menu"+i).style.display="block";
			document.getElementById("mynav"+i).className="on";
		}else{
			document.getElementById("acc_menu"+i).style.display="none";
			document.getElementById("mynav"+i).className="";
		}
	}
}
$(function(){
	$("#mynav ul li a").removeClass("on");
	$("#acc_menu div").css("display","none"); 
	var mynavcookie=getCookie("mynav");	
	$("#"+mynavcookie).addClass("on");
	var acc_menu=getCookie("acc_menu");	
	$("#"+acc_menu).css("display","block"); 
});

function getCookie(name){//取cookies函数        
     var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)")); 
     if(arr != null) return unescape(arr[2]); return null;
}
function mynav(obj,num){		
		SetCookie('mynav','mynav'+num);
		SetCookie('acc_menu','acc_menu'+num);
		window.location.href = obj;
	}
function SetCookie(name,value){//两个参数，一个是cookie的名子，一个是值 
     var Days = 1; //此 cookie 将被保存1 天
     var exp = new Date();    //new Date("December 31, 9998");
     exp.setTime(exp.getTime() + Days*24*60*60*1000);
     document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	}
</script>
<div class="acc_menu" id="mynav">
	<ul>
		<li><a href="javascript:void(0);" onClick="mynav('home.do','0');" id="mynav0" onmouseover=qiehuan(0);; class="on">个人首页</a></li>
		<li><a href="javascript:void(0);" onClick="mynav('userrrjc.do','1');" id="mynav1" onmouseover=qiehuan(1);;>账户管理</a></li>
		<li><a href="javascript:void(0);" onClick="mynav('queryFundrecordInit.do','2');" id="mynav2" onmouseover=qiehuan(2);;>资金管理</a></li>
		<li><a href="javascript:void(0);" onClick="mynav('homeBorrowInvestInit.do','3');" id="mynav3" onmouseover=qiehuan(3);;>投资管理</a></li>
		<li><a href="javascript:void(0);" onClick="mynav('homeBorrowAuditInit.do','4');" id="mynav4" onmouseover=qiehuan(4);;>借款管理</a></li>
		<li><a href="javascript:void(0);" onClick="mynav('queryCanAssignmentDebtInit.do','5');" id="mynav5" onmouseover=qiehuan(5);;>债权管理</a></li>
	</ul>
</div>
<div id="acc_menu">
	<div id="acc_menu0" style="display: none"></div>
	<div id="acc_menu1" class="acc_menu_con" style="display: none">
		<a href="javascript:void(0);" onClick="mynav('userrrjc.do','1');">好乐易贷认证</a>|
		<a href="javascript:void(0);" onClick="mynav('friendManagerInit.do','1');">好友管理</a>|
		<a href="javascript:void(0);" onClick="mynav('securityCenterInit.do','1');">安全中心</a>|
		<a href="javascript:void(0);" onClick="mynav('mailNoticeInit.do','1');">通知设置</a>
	</div>
	<div id="acc_menu2" class="acc_menu_con" style="display: none">
		<a href="javascript:void(0);" onClick="mynav('queryFundrecordInit.do','2');">交易记录</a>|
		<a href="javascript:void(0);" onClick="mynav('rechargePageInit.do','2');">充值提现</a>|
		<a href="javascript:void(0);" onClick="mynav('yhbound.do','2');">银行卡</a>
	</div>
	<div id="acc_menu3" class="acc_menu_con" style="display: none">
		<a href="javascript:void(0);" onClick="mynav('homeBorrowInvestInit.do','3');">投资记录</a>|
		<a href="javascript:void(0);" onClick="mynav('automaticBidInit.do','3');">自动投标</a>|
		<a href="javascript:void(0);" onClick="mynav('financeStatisInit.do','3');">理财统计</a>
	</div>
	<div id="acc_menu4" class="acc_menu_con" style="display: none">
		<a href="javascript:void(0);" onClick="mynav('homeBorrowAuditInit.do','4');">借款管理</a>|
		<a href="javascript:void(0);" onClick="mynav('queryMySuccessBorrowInit.do','4');">还款管理</a>|
		<a href="javascript:void(0);" onClick="mynav('loanStatisInit.do','4');">借款统计</a>
	</div>
	<div id="acc_menu5" class="acc_menu_con" style="display: none">
		<a href="javascript:void(0);" onClick="mynav('queryCanAssignmentDebtInit.do','5');">债权转让</a>|
		<a href="javascript:void(0);" onClick="mynav('queryBuyingDebtInit.do','5');">债权购买</a>
	</div>
</div>
