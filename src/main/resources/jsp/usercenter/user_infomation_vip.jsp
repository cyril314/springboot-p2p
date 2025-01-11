<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="../include/head.jsp"></jsp:include>
	<!--=======================-->
	<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
	<link id="skin" rel="stylesheet" href="${ctx}/static/plugins/jbox/Gray/jbox.css" />
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>
<!-- Start -->
<div class="account">
	<div class="acc_content">
		<div class="pertop">
			<ul>
				<li><a href="querBaseData.do" >个人基本信息</a></li>
				<li><a href="querWorkData.do" >个人工作信息</a></li>
				<li><a href="quervipData.do" style="background: #1ca4ad; color: #FFF;">申请VIP</a></li>
				<li><a href="userPassData.do" >认证资料</a></li>
			</ul>
			<a href="borrow.do" class="ca_back">返回</a>
		</div>
		<div class="percontent">
        	<div style=" padding: 20px 0 0 0; line-height: 25px; color: #F00;">${vipMsgMap.content }</div>
            <table cellpadding="0" cellspacing="0">
            	<tr>
                	<td align="right" width="125">您的状态是：</td>
                    <td>
						<c:if test="#request.vippagemap.vipStatus==2">尊敬的vip会员</c:if>
						<s:else>普通会员</s:else>
					</td>
                </tr>
        		<tr>
                	<td align="right">会员费：</td>
                    <td style="margin-top:3px;">${vipFee }/年</td>
                </tr>
                <tr>
                	<td align="right">可用余额：</td>
                    <td><span class="left"><c:if test="#request.vippagemap.usableSum!=''">${vippagemap.usableSum }元</c:if><s:else>0.00元</s:else></span> <a href="rechargeInit.do" class="update left" style="margin:10px 0 0 10px;">充值</a></td>
                </tr>
                <tr>
					<td align="right"><span style="color: red; float: none;" class="formtips">*</span>选择客服：</td>
					<td>
						<a id="kefuname">${vippagemap.kefuname }</a>
						<input type="hidden" value="${vippagemap.kfid }" name="paramMap.kefu" id="kefu"/>
					    <c:if test="#request.vippagemap.vipStatus==2">&nbsp;</c:if>
					    <s:else>
					    	<img src="{ctx}/static/images/C_KF.png" onclick="fff()" style="cursor: pointer;margin-left:5px;" id="btn_sp"/>
						</s:else>
						<span style="color: red; float: none;" id="u_kefu" class="formtips"></span>
					</td>
				</tr>
					<c:if test="#request.vippagemap.vipStatus==2">&nbsp;</c:if>
					<s:else> 
					<tr>
	                	<td align="right">交易密码：</td>
	                    <td><input type="password" class="C_input_fbjk" id="password"/><span style="color: red; float: none;" id="u_pwd"></span></td>
                	</tr>
                   <tr>
                	<td align="right"></td>
					<td><a href="javascript:void(0)" id="vip_btn"><img src="{ctx}/static/images/C_sq.jpg" /></a>
                    	<p style="line-height:30px; "></p>
                    </td>
                	</tr>
                </s:else>
            </table>
        </div>
	</div>
</div>
<!-- 引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/jbox/jquery.jBox-zh-CN.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/dialog/popom.js"></script>
<script type="text/javascript">
$(function(){
	//样式选中
	dqzt(2);
	var sd=parseInt($(".l-nav").css("height"));
	var sdf=parseInt($(".r-main").css("height"));
	$(".l-nav").css("height",sd>sdf?sd:sdf-15);
});
</script>
<script type="text/javascript">
  /*
   $(function(){
   $("#btn_sp").click(function(){
      //window.showModalDialog("uploadFileAction.do?obj="+json,window,"dialogWidth=500px;dialogHeight=400px");
      var   rv   =   showModalDialog("querykefu.do");
             $("#kefuname").html(rv[0]);
             $("#kefu").attr("value",rv[1]);
   });
   })
   */
   $(function(){
   //--------------add by houli 判断用户是否已经申请了vip，如果申请了则该页面显示灰色
      var isVip = '${isVip}';
      if(isVip == "true"){//页面操作按钮变灰色
          $("#vip_btn").attr('style','display:none;');
          $("#btn_sp").attr('style','display:none;');
          $("#context").attr('disabled','disabled');
          $("#code").attr('disabled','disabled'); 
          $("#codeNum").attr('style','display:none;');
      }
       $('#code').blur(function(){
        if($('#code').val()==""){
            $('#u_code').html("验证码不能为空");
            return ;
         }else{
          $('#u_code').html("");
         }
      }); 
       $('#password').blur(function(){
	        if($('#password').val()==""){
	            $('#u_pwd').html("交易密码不能为空");
	            return ;
	         }else{
	          $('#u_pwd').html("");
	         }
	      }); 
      $('#btn_sp').click(function(){
                   if($("#kefu").val()==""){
         $("#u_kefu").html("客服不能为空");
         return ;
      }else{
       $("#u_kefu").html("");
      }
    });
   });
</script>
		
<script type="text/javascript">
	//初始化
	$(function(){
		$("#li_geren").click(function(){
			var from = '${from}';
            window.location.href='querBaseData.do?from='+from;
        });
		$("#li_work").click(function(){
			var from = '${from}';
			window.location.href='querWorkData.do?from='+from;
        });
		$("#li_vip").click(function(){
			var from = '${from}';
			window.location.href='quervipData.do?from='+from;
		});
	});
	$(function(){
		$("#vip_btn").click(function(){
	      var param= {};
	      //param["paramMap.pageId"] = "vip";
	      param["paramMap.content"] = $("#context").val();
	      param["paramMap.kefu"] = $("#kefu").val();
	      param["paramMap.password"] = $("#password").val();
	      param["paramMap.from"] = '${from}';
	      var from = '${from}';
	    
	      var btype = '${btype}';
	      if(btype == ''){
	         btype = '${session.borrowWay}';
	      }
	      $.post("updataUserVipStatus.do",param,function(data){
	        if(data.msg==1){
	          alert("申请vip成功!");
	         window.location.href="userPassData.do?from="+from+"&btype="+btype;
	        }else if(data.msg==5){
	          $("#u_code").html("验证码错误");
	        }else if(data.msg==2){
	          $("#u_kefu").html("跟踪人不能为空");
	        }else if(data.msg==18){
	          $("#u_pwd").html("交易密码不能为空");
		    }else if(data.msg==17){
		      $("#u_pwd").html("交易密码不正确");
			}else if(data.msg==13){
	         window.location.href="querBaseData.do";
	        }else if(data.msg==14){
	         window.location.href="querWorkData.do?btype="+btype;
	        }else{
	        	alert(data.msg);
	        }
	      });
		});
	});
    function fff(){
    	$.jBox("iframe:querykefu.do", {
    		title: "选择客服",
    		width: 800,
    		height: 500,
    		buttons: {  }
    		});
    }
    function ffff(f,d){
    	 $("#kefuname").html(f);
             $("#kefu").attr("value",d);
             window.parent.window.jBox.close() ;
    	if($('#kefu').val() != ''){
    	   $('#u_kefu').html('');
    	}
    }
</script>
</body>
</html>