<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<jsp:include page="../include/head.jsp"></jsp:include>
		<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
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
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="userrrjc.do">账户管理</a>  > 安全中心</div>
			<div id="acc_tabs">
							
				<!--内容 开始-->
				 <div class="safecenter">
		            	<ul>
		                    <li>
		                        <table>
		                        <tr>
		                          <td><strong>登录密码</strong></td>
		                        </tr>
		                        <tr>
		                            <td>登录好乐易贷账户时需要输入的密码</td>
		                            <td align="right"><a href="changePwdInit.do" class="update">修改</a></td>
		                         </tr> 
		                        </table>
		                    </li>
		                    <li>
		                        <table>
		                        <tr>
		                          <td><strong>交易密码</strong></td>
		                        </tr>
		                        <tr>
		                            <td>在账户资金变动时需要输入的密码</td>
		                            <td align="right"><a href="changeDealpwdInit.do" class="update">修改</a></td>
		                        </tr>
		                        </table>
		                    </li>
		                    <li>
		                        <table>
		                           <tr>
		                          <td><strong>绑定手机</strong></td>
		                        </tr>
		                        <tr>
		                            <td>绑定手机号码，账户资金变动实时通知</td>
		                            <td align="right"><c:if test="#request.mobilePhone!=null">
		                            		<a href="reBindingMobileInit.do" class="update">更换</a><!--  style="display: none;" 
		                            		<a href="">此功能暂未开放</a>-->
		                            	</c:if>
		                            	<s:else>
		                            		<a href="bindingMobileInit.do" class="update"> 绑定</a>
		                            	</s:else></td>
		                         </tr>
		                        </table>
		                    </li>
		                    <li>
		                        <table>
		                           <tr>
		                             <td><strong>绑定邮箱</strong></td>
		                           </tr>
		                           <tr>
		                            <td>绑定邮箱，找回账户密码</td>
		                            <td align="right"><a style="display:none;" href="" class="update">更换</a>
		                            	<a href="" class="update">此功能暂未开放</a></td>
		                            </tr>
		                        </table>
		                    </li>
		                 </ul>
		            </div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>

		<!-- 引用底部公共部分 -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<script >
		$(function() {
			dqzt(3,'t04');
		});
		
		</script>
	</body>
</html>
