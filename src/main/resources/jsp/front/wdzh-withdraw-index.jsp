<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<table id="tab" class="jlmes" cellpadding="0" cellspacing="0"> 
 <tr>
          <td><strong>姓名</strong></td><td><strong>时间</strong></td><td><strong>电话</strong></td><td><strong>提现账号</strong></td><td><strong>提现金额</strong></td><td><strong>手续费</strong></td><td><strong>状态</strong></td><td><strong>操作</strong></td>
        </tr> 
    
    <c:if test="pageBean.page!=null && pageBean.page.size>0">
       <s:iterator value="pageBean.page"  var="bean">
	    <tr>
	       <td align="center">${bean.name}</td>
	       <td align="center"><s:date name="#bean.applyTime" format="yyyy-MM-dd HH:mm:ss" /></td>
	       <td align="center">${bean.cellPhone}</td>
	       <td align="center">${bean.acount}</td>
	       <td align="center">${bean.sum}</td>
	       <td align="center">${bean.poundage}</td>
	       <c:if test="#bean.status == 1">
	          <td align="center">审核中</td>
	       	  <td align="center"><a href="javascript:void(0);" onclick="deleteWithdraw(${bean.id},${bean.sum})">取消</a></td>
	       </c:if>
	       <s:else>
	         <c:if test="#bean.status ==2">
	             <td align="center">已提现</td>
	             <td align="center">--</td>
	         </c:if>
	         <s:elseif test="#bean.status ==3">
	                <td align="center">已取消</td>
	                <td align="center">--</td>
	           </s:elseif>
	            <s:elseif test="#bean.status ==4">
	               <td align="center">转账中</td>
	              <td align="center">--</td>
	            </s:elseif>
	            <s:else>
	                <td align="center">失败</td>
	               <td align="center">--</td>
	            </s:else>
	         </s:else>
	    </tr>
		</s:iterator>
	</c:if>
	<s:else>
	    <tr><td colspan="9" align="center">暂无信息</td></tr>
	</s:else>
</table>
	<div class="digg clear">
	<p>
	<shove:page curPage="${pageBean.pageNum}" showPageCount="6" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}"></shove:page>
    </p>
    </div>

<script>
   function deleteWithdraw(id,sum){
      param["paramMap.wId"] = id;
      param["paramMap.money"] = sum;
      if(!window.confirm("确定要取消提现记录")){
        return;
      }
      $.shovePost("deleteWithdraw.do",param,function(data){
           if(data.msg == 1){
             alert("取消成功");
             withdrawInfo();
             //jumpUrl('withdrawLoad.do');
           }else{
             alert(data.msg);
             return;
           }
      });
   }
   function initListInfo(param){
		$.shovePost("queryWithdrawList.do",param,initCallBack);
   }
</script>