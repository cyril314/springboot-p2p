<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<jsp:include page="../include/head.jsp"></jsp:include>
		<link href="${ctx}/static/css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	</head>

	<body>
		
		<!-- 引用头部公共部分 -->
		<jsp:include page="../include/top.jsp"></jsp:include>

		<div class="ny_main1 clearfix">
			<div class="myhome_main clearfix">
				<!-- 引用我的帐号主页左边栏 -->
				<%@include file="../include/left.jsp"%>
				<!--右 开始-->
		        <div class="myhome_r clearfix">
		        	<!--标题 开始-->
				    <div class="ny_tit">
		            	<ul>
		                	<li class="on">安全中心</li>
		                </ul>	
		            </div>
		            <!--标题 结束-->
		            <!--内容 开始-->	
		            <div class="rz_content clearfix">
		            	<ul class="security-ul m-t25 clearfix">
		                    <li>
		                        <div class="clearfix">
		                            <div class="icon icon-loginpsw"></div>
		                            <h4>登录密码</h4>
		                            <p>登录好乐易贷账户时需要输入的密码</p>
		                            <div class="update"><a href="pwdChangeInit.do">修改</a></div>
		                        </div>
		                    </li>
		                    <li>
		                        <div class="clearfix">
		                            <div class="icon icon-jypsw"></div>
		                            <h4>交易密码</h4>
		                            <p>在账户资金变动时需要输入的密码</p>
		                            <div class="update"><a href="dealpwdChangeInit.do">修改</a></div>
		                        </div>
		                    </li>
		                    <li>
		                        <div class="clearfix">
		                            <div class="icon icon-phone"></div>
		                            <h4>绑定手机</h4>
		                            <p>绑定手机号码，找回账户密码，账户资金变动实时通知</p>
		                            <div class="update">
		                            	<c:if test="#request.mobilePhone!=null&&#request.mobilePhone.size>0">
		                            		<a href=bindingMobileInit.do"">更换</a>
		                            	</c:if>
		                            	<s:else>
		                            		<a href="reBindingMobileInit.do">绑定</a>
		                            	</s:else>
		                            </div>
		                        </div>
		                    </li>
		                    <li>
		                        <div class="clearfix">
		                            <div class="icon icon-mail"></div>
		                            <h4>绑定邮箱</h4>
		                            <p>绑定邮箱，找回账户密码</p>
		                            <div class="update">
		                            	<a style="display:none;" href="">更换</a>
		                            	<a href="">此功能暂未开放</a>
		                            </div>
		                        </div>
		                    </li>
		                 </ul>
		            </div>
		            <!--内容 结束-->
		        </div>
				<!--右 结束-->
			</div>
		</div>


		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</body>
</html>
