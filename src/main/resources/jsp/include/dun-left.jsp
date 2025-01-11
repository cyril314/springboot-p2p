<%@ page language="java" pageEncoding="utf-8" %>
<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>

<script>
	function pastpictur() {
		jBox.open("post:pastpicture.do", "上传头像", 500, 150, {
			buttons : {
				"关闭" : true
			}
		});
	}
	function uploadCall(basepath, fileName, cp) {
		if (cp == "img") {
			var path = "upload/" + basepath + "/" + fileName;
			$("#img").attr("src", path);
			param['paramMap.imgPath'] = path;
			$.shovePost("updatePersonImg.do", param, uploadCallBack);
		}
	}
	function uploadCallBack(data) {
		alert(data.msg);
	}
</script>
<div class="sidenavbox clearfix">
	<div class="sidenav_top"></div>
	<div class="side_nav myhome_nav clearfix">
		<div class="gr_infobox">
			<div class="h_grtx">
				<a href="javascript:void(0);" onclick="pastpictur()">
					<img src="${user.personalHead }" />
				</a>
			</div>
			<div class="gr_info">
				<h4>
					Hi！
					<span>${user.userName }</span>
				</h4>
				<p>
					<em title="会员积分">积 分</em>：
					<span>${user.rating }</span>
				</p>
				<h5>
					<span style="width:25px;">
							<a href="javascript:void(0)" title="催收机构"><img src="{ctx}/static/images/ico24.png" /> </a>
					</span>
					<span style="width:30px;">
						<c:if test="#session.user.cellPhone!=null&&#session.user.cellPhone.length()>0">
							<a href="reBindingMobileInit.do" title="已绑定手机号码"><img src="{ctx}/static/images/ico25.png" /> </a>
						</c:if>
						<s:else>
							<a href="bindingMobileInit.do" title="未绑定手机号码"><img src="{ctx}/static/images/ico25_2.png" /> </a>
						</s:else>
					</span>
					<span style="width:25px;">
						<c:if test="#session.user.dealpwd==#session.user.password">
							<a href="changeDealpwdInit.do" title="提现密码和登录密码一致,不安全"><img src="{ctx}/static/images/ico26_2.png" /> </a>
						</c:if>
						<s:else>
							<a href="changeDealpwdInit.do" title="提现密码和登录密码不一致,安全"><img src="{ctx}/static/images/ico26.png" /> </a>
						</s:else>
					</span>
				</h5>
			</div>
		</div>
		<ul class="clearfix" id="left">
			<li class="ico_1" id="li_1">
				<a href="home.do" class="sidenav1" id="t01">我的好乐易贷</a>
			</li>
			<li class="ico_2" id="li_2">
				<a href="dunUserrrjc.do" class="sidenav1 sidenav2" id="t04">账户管理</a>
				<dl class="sidenav_child clearfix">
					<dd id="dd_1">
						<a href="dunUserrrjc.do">好乐易贷认证</a>
					</dd>
					<dd id="dd_2">
						<a href="dumZhzh.do">账户总汇</a>
					</dd>
					<dd id="dd_3">
						<a href="dumSecurityCenterInit.do">安全中心</a>
					</dd>
					<dd id="dd_4">
						<a href="dunMailNoticeInit.do">通知设置</a>
					</dd>
				</dl>
			</li>
			<li class="ico_3" id="li_3">
				<a href="queryFundrecordInit.do" class="sidenav1 sidenav2" id="t06">资金管理</a>
				<dl id="dl_2" class="sidenav_child clearfix">
					<dd>
						<a href="queryFundrecordInit.do">交易记录</a>
					</dd>
					<dd id="dd_5">
						<a href="rechargePageInit.do">充值提现</a>
					</dd>
					<dd id="dd_6">
						<a href="yhbound.do">银行卡</a>
					</dd>
				</dl>
			</li>
			<li class="ico_5" id="li_6">
				<a href="dunAcquisitionInit.do" class="sidenav1 sidenav2"
					id="t10">收购管理</a>
				<dl id="dl_5" class="sidenav_child clearfix">
					<dd id="dd_13">
						<a href="dunAcquisitionInit.do">债权收购列表</a>
					</dd>
					<dd id="dd_14">
						<a href="dunFinanceStatisInit.do">理财统计</a>
					</dd>
				</dl>
			</li>
		</ul>
	</div>
	<div class="sidenav_bottom"></div>
</div>


