<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
	<link href="${ctx}/static/css/css.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/static/plugins/jbox/Gray/jbox.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.pertop ul li{padding:0 20px ; float: left; font-size: 16px; color: #FFF; cursor: pointer; background: #1ca4ad} 
.permes{ border-bottom: 1px dashed #c7c7c7; padding-bottom: 20px;}
.permes img{ width: 128px; height: 128px; padding: 2px; border: 1px solid #c7c7c7;}
.permes a{ color: #F00; display: block; margin: 10px 0;}
.rec{ margin: 20px;}
.rectop{ width:100%; height: 40px; line-height:40px; border: 1px solid #c7c7c7;}
.rectop ul li{ list-style: none; list-style-type: none; float: left; width: 100px; border-right: 1px solid #c7c7c7; text-align: center; cursor: pointer;}
.rectop .on{ border-top: 3px solid #1ca4ad; color: #1ca4ad; height: 38px; line-height: 37px; background: #FFF; }
.reccontent{ width: 100%; border: 1px solid #c7c7c7; margin-top: 20px; }
.reccontent ul li{ list-style:none; list-style-type: none; height:20px; line-height:20px; border-bottom: 1px dashed #c7c7c7; padding:10px;}
.reccontent ul li span{ text-align: right; float: right;}
</style>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- 引用头部公共部分END -->
		<div class="account">
			<!--标的详情 开始-->
			<div class="acc_content">
                <div class="pertop">
                  <ul>
                    <li>个人信息</li>
                  </ul>                            
                </div>
				<!--借款人信息 开始-->
				<div class="permes">
					<table>
				      <tr>
				        <td rowspan="3" align="center"><img src="${userMsg.personalHead }" /><br/>
				                        <a href="javascript:void(0);" id="sendmail">发送站内信</a></td>
				        <td>用户名：<shove:sub value="#request.userMsg.username" size="2" suffix="***" /></td>
				        <td>会员到期：${userMsg.vip }</td>
				      </tr>
				      <tr>
				        <td>注册时间：${userMsg.createTime }</td>
				        <td>个人统计：${BorrowRecode.publisher }条借款记录，${inverseRecorde.investor}条投标记录</td>
				      </tr>
				      <tr>
				        <td>籍 贯：${userMsg.nativePro}&nbsp;&nbsp;${userMsg.nativeCity }</td>
				        <td>居住地：${userMsg.regProregionName}&nbsp;&nbsp;${userMsg.regCityregionName }</td>
				      </tr>
				    </table>
				</div>
				<!--借款人信息 结束-->
				
				<!--基本信息 开始-->
				<div class="rec">
					<div class="rectop" >
						<ul>
							<li class="on"><span id="Dynamic">最近动态</span></li>
							<li><span id="frieds">关注用户</span></li>
							<li><span id="userDynamic">用户动态</span></li>
							<li><span id="borrow">借款列表</span></li>
							<li><span id="recorde">投资记录</span></li>
							<li><span id="xybginfo">信用报告</span></li>
						</ul>
					</div>

					<div id="lcmain_l">
						<div id="content"><div style="margin-top:10px;" align="center"><img src="{ctx}/static/images/load.gif" /></div></div>
					</div>
				</div>
				<!--基本信息 结束-->
			</div>
			<!--标的详情 结束-->
		</div>
		<input type="hidden" id="uid" value="${userMsg.id}" />
		<input type="hidden" id="username" value="${userMsg.username}" />
		<input type="hidden" id="uname" value="${user.userName}" />
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<!-- 引用底部公共部分END -->
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript"
	src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script>
	$(function() {
		//样式选中
		dqzt(3);
	});
</script>
<script>
$(function() {
	$('#focusonUser').click(function() {
		var param = {};
		param['paramMap.id'] = $('#uid').val();
		//modify by houli 不能关注自己
			var username = $('#username').val();
			var uname = $('#uname').val();
			if (username == uname) {
				alert("您不能关注自己");
				return false;
			}
			//
			$.post('focusonUser.do', param, function(data) {
				if (data == "virtual") {
					window.location.href = "noPermission.do";
				} else {
					var callBack = data.msg;
					alert(callBack);
				}
			});
		});

	$('#sendmail').click(function() {
		var param = {};
		var id = $('#uid').val();
		var username = $('#username').val();
		//modify by houli 不能给自己发送站内信
			var uname = $('#uname').val();
			if (username == uname) {
				alert("您不能给自己发送站内信");
				return false;
			}
			//
			var url = "mailInit.do?id=" + id + "&username=" + username;
			$.post('mailInit.do', param, function(data) {
				if (data == "virtual") {
					window.location.href = "noPermission.do";
				} else {
					jQuery.jBox.open("post:" + url, "发送站内信", 500, 400, {
						buttons: {}
					});
				}
			});
	});
});
</script>
<script>
$(function() {
	//最近动态
	$("#Dynamic").click(function() {
		$("#frieds").parent().removeClass("on");
		$("#Dynamic").parent().addClass("on");
		$("#borrow").parent().removeClass("on");
		$("#recorde").parent().removeClass("on");
		$("#userDynamic").parent().removeClass("on");
		$("#xybginfo").parent().removeClass("on");
		var param = {};
		param["paramMap.id"] = $('#uid').val();
		$.post("queryUserRecoreIndex.do", param, function(data) {
			//$("#Dynamiclist").html(data);
			$("#content").html(data);
		});
	});
	
	//关注用户
	$("#frieds").click(function() {
		$("#frieds").parent().addClass("on");
		$("#Dynamic").parent().removeClass("on");
		$("#borrow").parent().removeClass("on");
		$("#recorde").parent().removeClass("on");
		$("#userDynamic").parent().removeClass("on");
		$("#xybginfo").parent().removeClass("on");
		var param = {};
		param["pageBean.pageNum"] = 1;
		param["paramMap.id"] = $('#uid').val();
		$.post("userFrends.do", param, function(data) {
			//$("#frendlist").html(data);
			$("#content").html(data);
		});
	});

	//关注用户动态
	$('#userDynamic').click(function() {
		$("#frieds").parent().removeClass("on");
		$("#Dynamic").parent().removeClass("on");
		$("#borrow").parent().removeClass("on");
		$("#recorde").parent().removeClass("on");
		$("#userDynamic").parent().addClass("on");
		$("#xybginfo").parent().removeClass("on");
		var param = {};
		param["paramMap.id"] = $('#uid').val();
		$.post("queryfrendrecoredIndex.do", param, function(data) {
			//$("#userDynamiclist").html(data);
			$("#content").html(data);
		});
	});

	//借款列表
	$('#borrow').click(function() {
		$("#frieds").parent().removeClass("on");
		$("#Dynamic").parent().removeClass("on");
		$("#borrow").parent().addClass("on");
		$("#recorde").parent().removeClass("on");
		$("#userDynamic").parent().removeClass("on");
		$("#xybginfo").parent().removeClass("on");
		var param = {};
		param["paramMap.id"] = $('#uid').val();
		$.post("myBorrowList.do", param, function(data) {
			//$("#browlist").html(data);
			$("#content").html(data);
		});
	});

	//投资记录
	$('#recorde').click(function() {
		$("#frieds").parent().removeClass("on");
		$("#Dynamic").parent().removeClass("on");
		$("#borrow").parent().removeClass("on");
		$("#recorde").parent().addClass("on");
		$("#userDynamic").parent().removeClass("on");
		$("#xybginfo").parent().removeClass("on");
		var param = {};
		param["paramMap.id"] = $('#uid').val();
		$.post("queryBorrowRecode.do", param, function(data) {
			//$("#recordelist").html(data);
			$("#content").html(data);
		});
	});

	//信用报告
	$('#xybginfo').click(function() {
		$("#frieds").parent().removeClass("on");
		$("#Dynamic").parent().removeClass("on");
		$("#borrow").parent().removeClass("on");
		$("#recorde").parent().removeClass("on");
		$("#userDynamic").parent().removeClass("on");
		$("#xybginfo").parent().addClass("on");
		var param = {};
		var ids = ${userMsg.id};
		param["paramMap.id"] = ids;
		$.post("userCridit.do", param, function(data) {
			$("#content").html(data);
			//$("#xybglist").html(data);
		});
	});
	$("#Dynamic").click();
});
	function initCallBack(data){
       	$("#content").html(data);
	}
</script>
</body>
</html>