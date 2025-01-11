<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>


<div class="C_right_bt">
	<div class="C_wz">
		<a href="getMessageBytypeId.do?typeId=4">关于我们</a> >
		<a>网站动态</a>
	</div>
	<div class="C_WZGG">
		<div class="C_wzgg2">
			<ul>
				<c:if test="pageBean.page==null || pageBean.page.size==0">
                      		没有网站动态
                		</c:if>
				<s:else>
					<s:iterator value="pageBean.page" var="bean" status="sta">
						<li>
							<a onclick="query('${bean.id}')" style="cursor: pointer;">${bean.title}
							</a>
						</li>
					</s:iterator>
				</s:else>
			</ul>
		</div>
	</div>
</div>
