<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/index.css" />
	<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/js/public.js"></script>
</head>

<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>

<!--Calculator start-->
<div class="calculator">
<div class="ca_content">
    <div class="inmes_top">
      <div class="left">收益计算器</div>
      <div ><a href="javascript:history.go(-1);" class=" ca_back right">返回</a></div>
    </div>
<div>
    <table class="ca_tab" style="position:relative; width: 900px;">
      <tr>
        <td>投资金额：</td>
        <td><input type="text" id="investSum" class="txtca" /><span id="s_investSum"></span></td>
        <td>借款期限：</td>
        <td><input type="text" id="investTime" class="txtca"/> 个月<span id="s_investTime"></span></td>
      </tr>
      <tr>
        <td>年化利率：</td>
        <td><input type="text" id="yearRate" class="txtca"/>%<span id="s_yearRate"></span></td>
        <td>还款方式：</td>
        <td>
        	<%--内容修改时 也需要把 rateCalculate()方法中相对应的text也修改掉--%>
        	<div id="search"><div class="box">
        	<select name="checked" class="select" id="select1">
        		<option  class="sub" value="0" id="month1" >按月等额本息</option>
        		<option  class="sub" value="1" id="month2">按月付息</option>
        		<option  class="sub" value="2" id="allrepay">一次性还本付息</option>
        	</select>
        	</div></div>
     
      </td>
      </tr>
      <tr>
        <td colspan="4" align="center"><input type="button" onclick="javascript:rateCalculate();" class="btnjs" onmouseover="this.className='btnjshover'"  onmouseout="this.className='btnjs'" /></td>
      </tr>
      <tr>
        <td colspan="4"><div id="totalResult">每个月将收益：<span id="aa" style="color: red">0.00</span> 总收益：<span id="bb" style="color: red">0.00</span> 本息总额：<span id="cc" style="color: red">0.00</span></div> </td>                  
     </tr>
      
    </table>
    <div id="showPayTable" style="margin: 0 20px;"></div>
    <div class="ca_exp">
      <strong>按月等额本息</strong>，即借款人每月以相等的金额偿还借款本息，也是银行房贷等采用的方法。因计算中存在四舍五入，最后一期还款金额与之前略有不同。<br />
      <strong>按月付息</strong>，到期还本，即借款人每月偿还固定利息，最后一期偿还全部本金。<br />
      <strong>一次性还本付息</strong>，即借款人在贷款期内不是按月偿还本息，而是贷款到期后一次性归还本金和利息。
    </div>
</div>
</div>
</div>
<!--Calculator end-->





   <!-- 引用底部公共部分 -->     
	<jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>

    <script>

		//输入鼠标移开验证输入
		$("#investSum").blur(function(){
			if($("#investSum").val()==""){
				$("#s_investSum").attr("class", "formtz onError");
				$("#s_investSum").html("投资金额不能为空！");
				return;
			}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#investSum").val())){
				$("#s_investSum").attr("class", "formtz onError");
				$("#s_investSum").html("请输入正确数字进行计算！");
				return;
			}else {
				$("#s_investSum").attr("class", "");
				$("#s_investSum").html("");
				return;
			}
		});
		
		$("#investTime").blur(function(){
			if($("#investTime").val()==""){
			    $("#s_investTime").attr("class", "formqx onError");
			 	$("#s_investTime").html("借款期限不能为空");	
			 	return;		 	   
			}else if(isNaN($("#investTime").val())){
			    $("#s_investTime").attr("class", "formqx onError");
				$("#s_investTime").html("请输入正确借款期限");
				return;
	 	   	}else if(!/^[1-9]\d*$/.test($("#investTime").val())){
	 	   	    $("#s_investTime").attr("class", "formqx onError");
		 	    $("#s_investTime").html("请输入正确借款期限");
		 	    return;
	 	   	}else{
	 	   	 	$("#s_investTime").attr("class", "");
	 	   		$("#s_investTime").html("");
	 	   		return;
		 	}
		});

		$("#yearRate").blur(function(){
			if($("#yearRate").val()==""){
			    $("#s_yearRate").attr("class", "formll onError");
		 	    $("#s_yearRate").html("年利率不能为空");
		 	    return;
		 	}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#yearRate").val())){
		 	    $("#s_yearRate").attr("class", "formll onError");
		 	    $("#s_yearRate").html("请输入正确的年利率");
		 	    return;
		 	}else{
		 		 $("#s_yearRate").attr("class", "");
		 		$("#s_yearRate").html("");
		 		return;
			}	
		});
		
		var flag=false;
    	//收益计算
		function rateCalculate(){
			rateNumJudge();//调用输入验证函数
			if(!flag){
				return;
			}else{
				var aa = 0;
				var bb = 0;
				var cc = 0;
				var repayType = 0;
				//判断Id 始终为0 so 判断text	
				if($(".selected").text()=="按月等额本息"){
					repayType=0;
				}else if($(".selected").text()=="按月付息"){
					repayType=1;
					}
				else if($(".selected").text()=="一次性还本付息"){
					repayType=2;
				}
			    var _array = [];
			    _array.push("<div id='acc_tabs'><div id='tab0' class='tabcontent' style='display:block'>"
					        +"<table id='tab' class='mail' cellpadding='0' cellspacing='0'>");
			    _array.push("<tr><td><strong>期数</strong></td><td><strong>月还本息</strong></td>"
					        +"<td><strong>月还本金</strong></td><td><strong>月还利息</strong></td>"
					        +"<td><strong>本息余额</strong></td></tr>");
			    
				param["paramMap.borrowSum"] = $("#investSum").val();
		        param["paramMap.yearRate"] = $("#yearRate").val();
		        param["paramMap.borrowTime"] = $("#investTime").val();
		        param["paramMap.repayWay"] = repayType;	
		        $.post("frontfinanceTools.do",param,function(data){
					   if(data == 1){ 
					      $("#showPayTable").html("请输入正确信息！");
					      return;
					   }else if(data == 2){
					      $("#s_yearRate").html("年利率太低，请重新输入");				     
					      return;
					   }
					    for(var i = 0; i < data.length; i ++){
					    	  if(i == 0){
							         aa = data[i].monForRateA;
							         //bb = data[i].monRate;
							         cc = data[i].allPay;
							      }
							      bb += Number(data[i].monForRate);
									_array.push("<tr><td>"+data[i].mon+"</td><td>"+data[i].monForRateA+"</td>"
									+"<td>"+data[i].monForA+"</td>"
									+"<td>"+data[i].monForRate+"</td><td >"+data[i].rateARemain+"</td></tr>");
								}
								_array.push("</table></div></div>");
								$("#showPayTable").html(_array.join(""));
								$("#aa").html(aa);
								$("#bb").html(bb.toFixed(2));
								$("#cc").html(cc);
					});        
			}
		}

		//输入验证
		function  rateNumJudge(){
			flag=false;
			if($("#investSum").val()==""){
				$("#s_investSum").attr("class","formtz onError");
				$("#s_investSum").html("投资金额不能为空！");
				return;
			}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#investSum").val())){
				$("#s_investSum").attr("class","formtz onError");
				$("#s_investSum").html("请输入正确数字进行计算！");
				return;
			}else if($("#yearRate").val()==""){
				$("#s_yearRate").attr("class","formll onError");
		 	    $("#s_yearRate").html("年利率不能为空");
		 	    return;
		 	}else if($("#yearRate").val()>50){
				$("#s_yearRate").attr("class","formll onError");
		 	    $("#s_yearRate").html("年利率最多为50%");
		 	    return;
		 	}else if(!/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/.test($("#yearRate").val())){
		 		$("#s_yearRate").attr("class","formtz onError");
			 	$("#s_yearRate").html("请输入正确的年利率");
		 	    return;
		 	}else if($("#investTime").val()==""){
		 		$("#s_investTime").attr("class","formqx onError");		
			 	$("#s_investTime").html("借款期限不能为空");			 	   
				return;
			}else if($("#investTime").val()>36){
		 		$("#s_investTime").attr("class","formqx onError");		
			 	$("#s_investTime").html("借款期限最多为24个月");			 	   
				return;
			}
			else if(isNaN($("#investTime").val())){
				$("#s_investTime").attr("class","formqx onError");	
				$("#s_investTime").html("请输入正确借款期限");
				return;
	 	   	}else if(!/^[0-9]*[1-9][0-9]*$/.test($("#investTime").val())){
	 	   		$("#s_investTime").attr("class","formqx onError");	
		 	    $("#s_investTime").html("请输入正确借款期限");
		 	    return;
	 	   }
			$("#s_investTime").html("");
			$("#s_investSum").html("");	
			$("#s_yearRate").html("");
			flag=true;
			return flag;	
		}
	
    </script>
    <!--select样式的js-->
   <script type="text/javascript">
	 (function($){
	var selects=$('select');//获取select
	for(var i=0;i<selects.length;i++){
		createSelect(selects[i],i);
	}
	function createSelect(select_container,index){

		//创建select容器，class为select_box，插入到select标签前
		var tag_select=$('<div></div>');//div相当于select标签
		tag_select.attr('class','select_box');
		tag_select.insertBefore(select_container);

		//显示框class为select_showbox,插入到创建的tag_select中
		var select_showbox=$('<div></div>');//显示框
		select_showbox.css('cursor','pointer').attr('class','select_showbox').appendTo(tag_select);

		//创建option容器，class为select_option，插入到创建的tag_select中
		var ul_option=$('<ul></ul>');//创建option列表
		ul_option.attr('class','select_option');
		ul_option.appendTo(tag_select);
		createOptions(index,ul_option);//创建option
		
		//点击显示框
		tag_select.toggle(function(){
			ul_option.show();
		},function(){
			ul_option.hide();
		});

		var li_option=ul_option.find('li');
		li_option.on('click',function(){
			$(this).addClass('selected').siblings().removeClass('selected');
			var value=$(this).text();
			var value_id=$(this).val();
			select_showbox.text(value);
			ul_option.hide();
		});

		li_option.hover(function(){
			$(this).addClass('hover').siblings().removeClass('hover');	
		},function(){
			li_option.removeClass('hover');
		});
	}

	function createOptions(index,ul_list){
		//获取被选中的元素并将其值赋值到显示框中
		var options=selects.eq(index).find('option'),
			selected_option=options.filter(':selected'),
			selected_index=selected_option.index(),
			showbox=ul_list.prev();
			showbox.text(selected_option.text());
		
		//为每个option建立个li并赋值
		for(var n=0;n<options.length;n++){
			var tag_option=$('<li></li>'),//li相当于option
				txt_option=options.eq(n).text();
			tag_option.text(txt_option).css('cursor','pointer').appendTo(ul_list);

			//为被选中的元素添加class为selected
			if(n==selected_index){
				tag_option.attr('class','selected');
			}else{
				tag_option.attr('class','');
			}
		}
	}

})(jQuery)
	</script>
    
</body>

</html>
