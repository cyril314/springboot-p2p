<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="../include/head.jsp"></s:include>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css2.css" />
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/layer/layer.mintest.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/layer/layertest.js"></script>
<script>
//删除证件
function del(){
if(!window.confirm("确认删除这张证件吗？")){
$("#but_del").attr("disabled",false);
return false;
}
var param = {};
param["paramMap.tmdid"] = '${map.tmdid}';//证件id
$.post("delcertificate.do",param,function(data){
//	alert(data);
//var callBack = data.msg;
//if(callBack == undefined || callBack == ''){
//		                 $('#right').html(data);
//		                 $(this).show();
//		                 }
//window.location.reload();
history.go(-1);
});

}
</script>
		<script>
//控制复选框是否可见
$(function(){
if('${map.visiable}'=='1'){//可见
 $("#visiable").attr("checked",true);
}else{
 $("#visiable").attr("checked",false);
}
});
</script>
		<script>
$(function(){
  
 $("#visiable").click(function(){
 

 if($(this).attr("checked")=='checked'){
    $(this).attr("value","1");
 }
 if($(this).attr("checked")==undefined){
 $(this).attr("value","2");
 }
 
 
 });
  
   $("#but_del").click(function(){
      $("#but_del").attr("disabled",true);
      del()
   });
  
  $("#but_yes").click(function(){
    $("#but_yes").attr("disabled",true);
     var param = {};
     param["paramMap.valid"] = $("input[name='paramMap_valid']:checked").val();//
     param["paramMap.visiable"] = $("#visiable").val();// 
     param["paramMap.option"]  = $("#paramMap_content").val();
     param["paramMap.userId"] = '${map.id}';
     param["paramMap.tmdid"] = '${map.tmdid}';
     param["paramMap.tmid"] = '${map.tmid}';
     param["paramMap.materAuthTypeId"] = '${map.materAuthTypeId}';
     $.post("Updatematerialsauthindex.do",param,function(data){
         var callBack = data.msg;
         if(data==1){
           $("#but_yes").attr("disabled",false);
           $("#u_tip").html("请勾选审核状态");
         }else if(data==0){
         $("#but_yes").attr("disabled",false);
          $("#u_tip").html("审核观点不能为空");
         }else if(data==3){
         $("#but_yes").attr("disabled",false);
           alert("审核失败");
         }else if(data==2){
           window.location.href="queryPerUserPicturMsginitindex.do?userId=${map.id}&materAuthTypeId=${map.materAuthTypeId}"
         }else if(data==4){
            window.location.href="queryPerUserPicturMsginitindex.do?userId=${map.id}&materAuthTypeId=${map.materAuthTypeId}"
         }else if(callBack == undefined || callBack == ''){
		                 $('#right').html(data);
		                 $(this).show();
		                 }
         else{
         $("#but_yes").attr("disabled",false);
         alert("审核失败");
         }
         
     });
  });


});


</script>
	</head>
	<body>
	
			<div class="nymain">
				<div class="wdzh" id="right">
					<div class="r_main">
						<div class="box" >
							<h2 class="otherh2x" >
								认证图片资料审核
							</h2>
							<div class="boxmain2" style="padding-top: 0px;margin-top:0px; ">
								<div class="biaoge">
									<form>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<div>
													用户名:${map.username }
												</div>
												<hr />
											</tr>
											<tr>
												<div>
													认证种类:${map.tmyname}
												</div>
												<hr />
											</tr>
											<tr>
												<div>
													证件图片
													<a href="../${map.imagePath}" target="_blank" title="查看图片"><img
															src="../${map.imagePath}" width="62" height="62" />
													</a>

												</div>
												<hr />
											</tr>
											<tr>
												<hr />
												<div>

													证件审核
												</div>
											</tr>
											<tr>
												<div>

													文件是否可见：
													<input type="checkbox" name="param_visiable" value="2"
														id="visiable" />
													&nbsp;&nbsp;（选中时候为图片为可见，否则为不可见）

												</div>
											</tr>
											<tr>
												<div>
													审&nbsp;核&nbsp;状&nbsp;态&nbsp;：
													<input type="radio" name="paramMap_valid" value="1"
														onclick="javascript:$('#u_tip').html('')"
														<c:if test='#request.map.auditStatus == 3'>checked="checked"</c:if>
														<s:else></s:else> />
													有效
													<input type="radio" name="paramMap_valid" value="0"
														<c:if test='#request.map.auditStatus == 2'>checked="checked"</c:if>
														<s:else></s:else> />
													无效
												</div>
											</tr>
											<tr>
												<div>
													审&nbsp;核&nbsp;观&nbsp;点&nbsp;：
												</div>
											</tr>
											<tr>
												<div>
													&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;
													<s:textarea name="paramMap.content" cols="40" rows="5"
														id="paramMap_content" value="%{#request.map.tmdoption}" />
												</div>
											</tr>
											<tr>
												<br />
												<div align="center">
													<input type="button" value="审核此证件"
														style="background-image: url(static/images/sqdk_07.jpg); background-repeat: no-repeat; height: 24px; width: 78px; margin-top: 0; background-position: left center"
														id="but_yes" />
													&nbsp;&nbsp;
													<input type="button" value="删除此证件"
														style="background-image: url(static/images/sqdk_07.jpg); background-repeat: no-repeat; height: 24px; width: 78px; margin-top: 0; background-position: left center"
														id="but_del"  />
													<span style="color: red; float: none;" id="u_tip"
														class="formtips"></span>
												</div>
											</tr>

										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
		

			<script>
/*
$(function(){
var  ttt = ${map.auditStatus}
  if(ttt == '3' || ttt=='2'){
    $("#paramMap_content").attr("disabled","true");
  }
});
*/
</script>
	</body>
</html>
