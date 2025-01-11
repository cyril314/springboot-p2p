<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${ctx}/static/js/nav.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script>
$(function(){
	$('.tabmain').find('li').click(function(){
	$('.tabmain').find('li').removeClass('on');
	$(this).addClass('on');
	$('.lcmain_l').children('div').hide();
    $('.lcmain_l').children('div').eq($(this).index()).show();
	})
	})
</script>
<style>
.tabmail{ margin: 40px; font-size: 14px;}
.tabmail a{ color:#F00; font-weight: normal;}
.tabmail a:hover{ text-decoration: underline;}
</style>
 <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!--	
	<div class="C_zc">
		<div class="C_zc_k">
			<div class="C_zc_zj" style="margin-top: 10px">
            	<div class="C_zc_zj_l">-->
            	<div class="calculator" >
            	<div class="ca_content" style="min-height: 200px;">
            	<div class="inmes_top">邮箱激活</div>	
            		<span id="ok" class="hide" style="font-size: 20px;"></span>
            		<table cellpadding="0" cellspacing="0" class="tabmail" id="tabClass">
           				 <tr>
						    <td colspan="3"><span style=" float: none;" id="s_email" class="formtips">${msg }</span></td>
						  </tr>
           			</table>
            	 </div>
            	 </div>
            	 <!--     
              </div>
            </div>
        </div>
    </div>
--><!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script>
$(function(){
    //样式选中
     $("#zh_hover").attr('class','nav_first');
	 $("#zh_hover div").removeClass('none');
});
</script>
</body>
</html>
