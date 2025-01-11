<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--弹出层 开始-->
<div id="drag" class="drag">
	   <div class="title" id="title">
		  <h2>发送站内信</h2>
		  <div><a class="close" href="javascript:void();" id="close" title="关闭" onclick="hide('drag')"></a></div>
		</div>
		<div class="pop_content">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td align="right" width="70"><span class="fred">*</span>收件人：</td>
					<td>
						<input type="text" id="receiver" name="sendText" class="txtmail" />
						<span id="s_receiver" class="fred"></span>
					</td>
				</tr>
				<!-- <tr height="36">
				<td></td>
				<td class="fred">
					<span id="s_receiver"></span>
				</td>
			</tr> -->
				<tr>
					<td align="right">
						标题：
					</td>
					<td>
						<input type="text" id="title_s" name="sendText" class="txtmail" />
						<span id="s_title" class="fred"></span>
					</td>
				</tr>
				<!-- <tr height="40">
				<td></td>
				<td class="fred">
					<span id="s_title"></span>
				</td>
			</tr> -->
				<tr>
					<td align="right">
						内容：
					</td>
					<td>
						<textarea id="content" name="sendText" class="areamail"></textarea>
						<span id="s_content" class="fred"></span>
					</td>
				</tr>
				<!-- <tr height="36">
				<td></td>
				<td class="fred">
					<span id="s_content"></span>
				</td>
			</tr> -->
				<tr>
					<td align="right"><span class="fred">*</span> 验证码：</td>
					<td>
						<input type="text" id="code" name="sendText" class="txtmail" />
						<img src="admin/imageCode.do?pageId=userlogin" title="点击更换验证码"
							style="cursor: pointer; vertical-align: middle" id="codeNum" width="54" height="25"
							onclick="javascript:switchCode()" />
						<span id="s_code" class="fred"></span>
					</td>
				</tr>
				<!-- <tr height="36">
				<td></td>
				<td class="fred">
					<span id="s_code"></span>
				</td>
			</tr> -->
				<tr>
					<td colspan="2" align="center">
					   <input type="button" value="提交" class="btnsure" 
					   onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'"
					   onclick="addMail()" id="btnSave" />
					</td>
				</tr>
			</table>
		</div>
</div>
<!--弹出层 结束-->