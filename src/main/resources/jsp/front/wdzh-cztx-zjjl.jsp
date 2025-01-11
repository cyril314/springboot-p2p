<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>

<jsp:include page="../include/top.jsp"></jsp:include>
<div class="account">
	<!-- 引用会员后台头部公共部分 -->
	<%@include file="../include/userTop.jsp"%>
	<div class="acc_content" style="margin-top:20px">
		<!-- 引用左边公共部分 -->
		<%@include file="../include/left.jsp"%>
		<!--账户详情 开始-->
		<div class="acc_all">
			<div class="cur"><img src="{ctx}/static/images/home.jpg" /> 当前位置：<a href="queryFundrecordInit.do">资金管理</a>  >  交易记录</div>
			<div id="acc_tabs">	
				<!--内容 开始-->
				  <div>
				    <table>
				      <tr>
				        <td align="right">起止日期：</td>
				        <td><input id="startTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" class="txttime" /> - 
				            <input id="endTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" class="txttime" /></td>
				        <td align="right">交易类型：</td>
				        <td><s:select list="potypeList" id="momeyType" name="momeyType" listKey="operateType" listValue="fundMode" 
				             cssStyle="width:180px;" headerKey="" headerValue="--请选择--" cssClass="sel"></s:select></td>
				        <td>
				            <input type="button" value="查询" class="btnsure" onmouseover="this.className='btnsurehover'" onmouseout="this.className='btnsure'" onclick="fundRecordList();">
				        </td>
				      </tr>
				    </table>
                   </div>	
                   <div class="biaoge" id="fundRecord">
        </div>
				<!--内容 结束-->
			</div>
		</div>
	</div>
</div>


<!-- 引用底部公共部分 -->     
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/My97DatePicker/WDatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/js/nav-zh.js"></script>
<script>
    $(function(){
    	dqzt(5,'t06');
	     $("#zh_hover").attr('class','nav_first');
		  $('.tabmain').find('li').click(function(){
		  $('.tabmain').find('li').removeClass('on');
        
       }); 
       param["pageBean.pageNum"] = 1;
	    initListInfo(param);
	    tab();
	 });
	 
	 function initListInfo(praData){
		$.shovePost("queryFundrecordList.do",praData,initCallBack);
	}
	function initCallBack(data){
		$("#fundRecord").html(data);
	}
	
   function fundRecordList(){
      if($("#startTime").val()!="" && $("#endTime").val()!=""){
	        if($("#startTime").val() >$("#endTime").val() ){
	         alert("结束日期要大于开始日期");
	         return;
	      }
      }
      param["pageBean.pageNum"] = 1;
      param["paramMap.startTime"]=$("#startTime").val();
      param["paramMap.endTime"]=$("#endTime").val();
      param["paramMap.momeyType"]=$("#momeyType").val();
      $.shovePost("queryFundrecordList.do",param,function(data){
         $("#fundRecord").html(data);
      });
      tab();
   }
   function tab(){
   $("#tab tbody tr:odd").addClass("t2");
   $("#tab tbody tr:even").addClass("t1");
   }
   function jumpUrl(obj){
          window.location.href=obj;
       }
</script>
</body>
</html>
