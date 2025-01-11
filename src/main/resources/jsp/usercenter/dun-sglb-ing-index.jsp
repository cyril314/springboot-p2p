<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <jsp:include page="../include/head.jsp"></jsp:include>
    <link href="${ctx}/static/css/inside.css"  rel="stylesheet" type="text/css" />

</head>

<body>

<jsp:include page="../include/top.jsp"></jsp:include>

<div class="ny_main1 clearfix">
	<div class="myhome_main clearfix">
		<!-- left.jsp -->
		 <%@include file="../include/dun-left.jsp" %>
		 <!--右 开始-->
        <div class="myhome_r clearfix">
        	<!--标题 开始-->
		    <div class="ny_tit">
            	<ul>
                	<li id="acquisition" onclick="javascript:jumpUrl('dunAcquisitionInit.do')">债权收购记录</li>
                	<li id="reAcquisition" onclick="javascript:jumpUrl('dunReAcquisitionInit.do')" class="on">回款中的收购</li>
                	<li id="acquisitioned" onclick="javascript:jumpUrl('dunAcquisitionedInit.do')">已回款的收购</li>
                </ul>
            </div>
            <!--标题 结束-->
            <!--内容 开始-->	
            <div class="rz_content clearfix">
				<div class="tips clearfix">
                    <dl class="h_srch clearfix">
                       <dt>起止日期：</dt>
                       <dd><input id="startTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" class="test" /> - <input id="endTime" type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:'readOnly'})" class="test" /></dd>
                       <dd></dd>
                       <dd></dd>
                       <dd></dd>
                       <dd><a href="javascript:void(0)" class="cxbtn" onclick="fundRecordList();">查询</a></dd>
                    </dl>	
				</div>	
                      <%--<p style="text-align:right; padding:5px 0;"><em class="execl">导出excel</em></p>
                       --%>
				<div class="biaoge" id="fundRecord">
        		</div>
            </div>
            <!--内容 结束-->
        </div>
        <!--右 结束-->
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
    	dqzt(8,'t10');
    	 param["pageBean.pageNum"] = 1;
	    initListInfo(param);
	 });
	 
	 function initListInfo(praData){
		$.shovePost("dunReAcquisitionList.do",praData,initCallBack);
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
      $.shovePost("queryFundrecordList.do",param,function(data){
         $("#fundRecord").html(data);
      });
   }
   
   function jumpUrl(obj){
          window.location.href=obj;
       }
</script>
</body>
</html>
