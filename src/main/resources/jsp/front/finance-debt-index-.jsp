<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/index.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/tab.js"></script><!--选项卡 js-->
<script type="text/javascript"><!--表格隔行换色 js--> 
var Ptr=document.getElementById("tab").getElementsByTagName("tr");
var Ptr1=document.getElementById("tab1").getElementsByTagName("tr");
function tab() {
    for (i=1;i<Ptr.length+1;i++) { 
    Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
    }
	for (i=1;i<Ptr1.length+1;i++) { 
    Ptr1[i-1].className = (i%2>0)?"t1":"t2"; 
    }
}
window.onload=tab;
</script>
<!--债权转让-->
<%--<dl class="tz_dl clearfix a_zq">
	<dt>
		<input type="hidden" value="${order }" id="norder"/>
		<ul class="item" id="order">
			<li class="col2">
				转让人
			</li>
			<li class="col1">
				借款标题
			</li>
			<li class="col3" >
				是否逾期
			</li>
			<li class="col4"  style="text-align:center;padding-left: 20px;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="down" id="10">债权总额</a>
			</li>
			<li class="col5" style="text-align:center;width: 60px;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="down" id="11">竞拍底价</a>
			</li>
			<li class="col6" style="text-align:center;width: 60px;padding-left: 40px;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="down" id="12">年利率</a>
			</li>
			<li class="col7" style="text-align:center;padding-left: 60px;">
				<a href="javascript:void(0);" style="cursor: pointer; font-size: 14px;padding-right:10px; display:block;width:75px;" class="down" id="13">剩余时间</a>
			</li>
			<li >
				操作
			</li>
		</ul>
	</dt>
	<span id="showList">
		<img src="./images/load.gif">
	</span>
</dl>
    --%>
    <input type="hidden" value="${order }" id="norder"/>
    <div id="tab0" class="tabcontent" style="display:block">
        <table id="tab" class="mail" cellpadding="0" cellspacing="0"> 
        <tr id="tr">
          <td><strong>转让人</strong></td>
          <td><strong>借款标题</strong></td>
          <td><strong>是否逾期</strong></td>
          <td><a href="javascript:void(0);" id="10">债权总额</a></td>
          <td><a href="javascript:void(0);" id="11">竞拍底价</a></td>
          <td><a href="javascript:void(0);" id="12">年利率</a></td>
          <td><a href="javascript:void(0);" id="12">剩余时间</a></td>
        <td><strong>操作</strong></td>
        </tr>
      </table> 
      <span id="showList"></span>

      </div>
<script type="text/javascript">
	$(function(){
		var param = {};
		alert('init...');
		initListInfo(param);
		/*$("#tr a").click(function(){
			alert('sss');
			if($(this).attr("class")=="up"){
				$(this).attr("class","down");
				$(this).val(2);
			}else if ($(this).attr("class")=="down"){
				$(this).attr("class","up");
				$(this).val(1);
			}else{
				return;
			}
			$("#norder").val($(this).attr("id"));
			var praData={};
			initListInfo(praData);
		});*/
	});
	function initListInfo(param) {
		alert('initListinfo()....');
	/*	param["paramMap.order"] = $("#norder").val();
		param["paramMap.orderAmount"]=$("#10").val();
		param["paramMap.orderHasInvestAmount"]=$("#11").val();
		param["paramMap.orderRate"]=$("#12").val();
		param["paramMap.orderDeadline"]=$("#13").val();*/
		
		$.post("financeDebtList.do", param, function(data) {
			alert('ooo:'+data);
			$("#showList").html(data);
		});
	};
</script>



