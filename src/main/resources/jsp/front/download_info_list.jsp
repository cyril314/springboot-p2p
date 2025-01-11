<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>

 <!--中间右侧 开始--><%--
          <div class="lctab" style="padding:0 10px;">
             <div class="newlist">
               <ul>
                <c:if test="pageBean.page==null || pageBean.page.size==0">
                     	 没有下载资料
                </c:if>
                <s:else>
                  <s:iterator value="pageBean.page" var="bean" status="sta">
                  <c:if test="#bean.state==1">
                    <li>
                      <span><s:date name="#bean.publishTime" format="yyyy-MM-dd HH:mm:ss" /></span>
                      <a href="frontDownloadDetail.do?id=${bean.id}">${bean.title}</a>
                    </li>
                    </c:if>
                  </s:iterator>
                </s:else>
                              
              </ul>
            </div>
           <div class="fenye">
             <div class="fenyemain">
                <shove:page curPage="${pageBean.pageNum}" showPageCount="8" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
				</shove:page>
             </div>
           </div>
        </div>  
     --%><!--中间右侧 结束-->



<div class="account">
	<div class="acc_content" >
    	<div class="inmes_top">下载专区</div>
            <ul>
            	<c:if test="pageBean.page==null || pageBean.page.size==0">
                     	没有下载资料
                </c:if>
                <s:else>
                	<s:iterator value="pageBean.page" var="bean" status="sta">
                		<c:if test="#bean.state==1">
			            	<li>
			                	<div class="down">
			                    	<span><s:date name="#bean.publishTime" format="yyyy-MM-dd HH:mm:ss" /></span>
			                    	<a href="frontDownloadDetail.do?id=${bean.id}">${bean.title}</a>
			                    </div>
			                    <div>
			                    	<a href="downloads.do?id=${bean.id}"></a>
			                    </div>
			                </li>
                		</c:if>
                  </s:iterator>
                </s:else>              
            </ul>
                <div class="downpage">
                	<shove:page curPage="${pageBean.pageNum}" showPageCount="8" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
					</shove:page>
                <!--  
                   <ul class="page">
                      <li class="p1"><a href="#">上一页</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">4</a></li>
                      <li><a href="#">5</a></li>
                      <li class="on"><a href="#">6</a></li>
                      <li><a href="#">...</a></li>
                      <li class="p1"><a href="#">下一页</a></li>
                   </ul>  
                -->     	
                </div>            
    </div>
</div>