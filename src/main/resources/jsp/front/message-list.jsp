<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>


<div>
	<ul class="ly_list clearfix">
		<c:if test="pageBean.page!=null || pageBean.page.size>0">
			<s:iterator value="pageBean.page" var="message">
				<li class="clearfix">
					<div class="l_pic">
						<a href="userMeg.do?id=${message.userId}" target="_blank"> <shove:img
								src="${message.personalHead}" defaulImg="images/default-img.jpg"
								width="62" height="62"></shove:img> </a>
					</div>
					<div class="l_txt">
						<h5>
							<span><a href="userMeg.do?id=${message.userId}"
								target="_blank"><b><c:out value="#message.username" />
								</b>
							</a>：</span>
							<em><s:date name="#message.msgTime"
									format="yyyy-MM-dd HH:mm:ss" />
							</em>
						</h5>
						<p>
							<c:out value="#message.msgContent" />
						</p>
					</div>
				</li>
			</s:iterator>
		</c:if>
		<s:else>
			<li>
				<div class="plbox" style="text-align: center; font-size: 50;">
					暂无留言
				</div>
			</li>
		</s:else>
	</ul>
	<!--分页器 开始-->
	<div class="wrap" style="margin: 20px 0 20px 0">
		<div class="inwrap">
			<c:if test="pageBean.page!=null || pageBean.page.size>0">
				<div class="page">
					<p>
						<shove:page curPage="${pageBean.pageNum}" showPageCount="7"
							pageSize="${pageBean.pageSize }" theme="jsNumber"
							totalCount="${pageBean.totalNum}">
						</shove:page>
					</p>
				</div>
			</c:if>
		</div>
	</div>
</div>

	<!--分页器 结束-->
	<div class="ly clearfix">
		<p>
			咨询或评论：(字数在1-120之间)
		</p>
		<textarea id="msgContent" class="txt918"></textarea>
		<p class="ly_y">
			验证码：
			<input type="text" class="test" name="paramMap.code1" id="code1" />
			<img src="" title="点击更换验证码" style="cursor: pointer;" id="codeNum1"
				width="61" height="24" onclick="javascript: msgswitchCode()" style="margin-left: 5px;" />
		</p>
		<p>
			<input id="savetbn" type="button" value="提 交" class="ly_btn" />
		</p>
	</div>




<script type="text/javascript">
	var flag = true;
	$(function() {
		$('#savetbn').click(function() {
			param['paramMap.id'] = $('#idStr').val();
			param['paramMap.code'] = $('#code1').val();
			param['paramMap.msg'] = $('#msgContent').val();
			if (flag) {
				flag = false;
				$.shovePost('addBorrowMSG.do', param, function(data) {
					if (data.msg == 1) {
						msgboardListInfo(param);
					} else {
						alert(data);
						flag = true;
					}
				});
			}

		});
		msgswitchCode();
	});
	function initListInfo(param) {
		msgboardListInfo(param);
	}
	function msgswitchCode() {
		var timenow = new Date();
		$('#codeNum1')
				.attr('src', 'admin/imageCode.do?pageId=msg&d=' + timenow);
	};
</script>