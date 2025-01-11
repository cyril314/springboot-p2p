<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>体验金参数</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
</head>
<body>
	<div id="right">
		<div style="padding: 15px 10px 0px 10px;">
			<div>
				<table  border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td  width="18%" height="28"  class="main_alll_h2">
							<a href="queryPromotionsInit.do">体验金设置</a>
						</td>
						<td width="2px"></td>
						<td width="18%" height="28" class="xxk_all_a">
							&nbsp;
						</td>
						<td width="80">&nbsp;</td>
					</tr>
				</table>
			</div>
			<div id="showcontent" style="width: auto; background-color: #FFF; padding: 10px;"></div>
		</div>
	</div>
<script>
//初始化时加载内容页
$(function() {
	$.post("queryPromotions.do",function(result){
	    $("#showcontent").html(result);
	  });
});
//根据选择显示内容页
function tyjChange(val){
	$.post("queryPromotions.do?type="+val,function(result){
		$("#showcontent").html(result);
		//根据选择显示对应的文字
		if(val == 'register'){
			$("#tyjOJg option[value='register']").attr('selected',true);
		}else if(val == 'approve'){
			$("#tyjOJg option[value='approve']").attr('selected',true);
		}else{
			$("#tyjOJg option[value='']").attr('selected',true);
		}
	});
}
//设置输入信息的大小    
function limitInput(inVal){
    var inValue=document.getElementById(inVal).value;
    var min=1;
    var max=10;
    if(inVal == "pastTime")
        max = 60;
    if(inVal == "money")
    	max = 500000;
    if(isNaN(inValue)){
    	alert('输入正确的数值！');
    	document.getElementById(inVal).value='';
    }
    if(parseInt(inValue)<min){
        alert('输入数值过小！');
        document.getElementById(inVal).value='';
    }else if(parseInt(inValue)>max){
    	alert('输入数值过大！');
    	document.getElementById(inVal).value='';
    }
}
</script>
</body>
</html>