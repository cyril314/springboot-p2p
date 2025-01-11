<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../include/taglib.jsp" %>
<!--留言板-->
  	  <ul class="ly_list clearfix">
  	   	<c:if test="pageBean.page!=null || pageBean.page.size>0">
       	<s:iterator value="pageBean.page" var="message">
            <li class="clearfix">        	
                <div class="l_pic"> 
                	<a href="userMeg.do?id=${message.userId}" target="_blank">     	
                		<shove:img src="${message.personalHead}"
						defaulImg="images/default-img.jpg" width="62" height="62"></shove:img>
                	</a>
              	</div>
                <div class="l_txt">
                    <h5>
                    	<span>
                    		<a href="userMeg.do?id=${message.userId}" target="_blank">
                    			<c:out value="#message.username"/>
                    		</a>：
                    	</span>
                    		说<em><s:date name="#message.msgTime" format="yyyy-MM-dd HH:mm:ss"/></em>
                    </h5>
                    <p><c:out value="#message.msgContent"/></p>
                </div>
            </li>
        </s:iterator>
  		</c:if>
  		<s:else>
	  		<li>
	        	<div class="plbox" style="text-align: center;font-size: 50;">暂无留言</div>
	      	</li>  	
	    </s:else>
      </ul>
      
        <!--分页器 开始-->
         <div class="wrap" style="margin:10px 0 20px 0">
            <div class="inwrap">          	
            	<c:if test="pageBean.page!=null || pageBean.page.size>0">
	    			<div class="page">
			             <p>
			                <shove:page url="borrowmessage.do" curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
								<s:param name="paramMap.id">${message.modeId}</s:param>
	 						</shove:page>
			             </p>
			    	 </div>  
		    	</c:if>
            </div>	 
        </div> 
      <!--分页器 结束--> 
      <s:hidden name="id" value="%{#request.id}"></s:hidden>   
       
<script type="text/javascript">
var flag = true;
	$(function(){
	     $('#savetbn').click(function(){
		     param['paramMap.id']=$('#id').val();
		     param['paramMap.code']=$('#code1').val();
		     param['paramMap.msg']=$('#msgContent').val();
		     if(flag){
			     flag = false;
		         $.shovePost('addDebtMSG.do',param,function(data){
				     if(data.msg == 1){
				    	 queryMsgRecod();
				     }else{
				       alert("验证码错误！");
				       flag = true;
				     }
		         });
		     }
		    
	     });
	     switchCode1();
	});

	//固定，分页回调
	function initListInfo(param){
		queryMsgRecod();
	}

	function switchCode1(){
		    var timenow = new Date();
		    $('#codeNum1').attr('src','admin/imageCode.do?pageId=msg&d='+timenow);
	};	
</script>