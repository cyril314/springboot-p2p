<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!-- 银行卡列表 Start -->
<div>
<c:if test="#request.lists!=null && #request.lists.size>0">
	<s:iterator value="#request.lists" id="queryBankInfoInit" var="bean" status="c">
		<div class="yhk">
			<div class="cardtop">
			    <span style="float: left">${bean.bankName}</span>
			    <span style="float: left">${bean.cardDefault==1?"默认":"" }</span>
			    <c:if test="#bean.cardDefault==1"></c:if>
			    <s:else><a href="javascript:del(${bean.id})">删除</a></s:else>
			</div>
            <div class="cardcenter">
                <span>尾号:</span>${bean.cardNo} <br/>
                <span>户名:</span>${bean.cardUserName} <br/>
                <span>开户支行:</span>${bean.branchBankName}
            </div>
			<div class="cardbottom">
				<c:if test="#bean.modifiedCardStatus==2">
					<span style="padding-left: 20px;float:left;">正在变更</span>
					<span style="padding-right:20px;float:right;"><a href="javascript:changeBankCancel(${bean.id})">取消<br /></a></span>
				</c:if>
				<s:else>
					<c:if test="#bean.cardStatus==1">
				     	<span style="padding-left: 20px;float:left;">已绑定	</span>
				      	<span style="padding-right:20px;float:right;">
					      	<a href="javascript:changeBankInfos(${bean.id})">申请变更</a>
					      	<c:if test="#bean.cardDefault!=1"><a href="javascript:intercalate(${bean.id})" >设为默认</a></c:if>
				      	</span>
					</c:if>
					<s:else>
						<c:if test="#bean.cardStatus==3">
						    <span style="padding-left: 20px;float:left;">失败</span>
						<span style="padding-right:20px;float:right;"><a href="javascript:del(${bean.id})">取消</a></span>
						</c:if>
						<s:else>
							<span style="padding-left: 20px;float:left;">审核中</span>
						<span style="padding-right:20px;float:right;"><a href="javascript:del(${bean.id})">取消</a></span>
						</s:else>
					</s:else>
			      </s:else>
			</div>
		</div>
	</s:iterator>
</c:if>
<div class="yhk"><a href="javascript:disp('${user.realName}');" class="yhkadd">+添加银行卡</a></div>
</div>
<div class="clear"></div>
<!-- 银行卡列表 End -->    
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>