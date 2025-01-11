<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
<!-- 引用头部公共部分 -->
<jsp:include page="../include/top.jsp"></jsp:include>

<%--<div class="C_sqed">
	<p><span>${creditingMap.title }</span><br />${creditingMap.description }</p>
	<a href="creditingInit.do"><img src="{ctx}/static/images/C_sqed.jpg" /></a>
</div>
--%>
<!--borrow start-->
<div class="borrow">
    <div class="center">
        <div class="borrow_login">
            <c:if test="${user==null}">您好！您还没有<span>登录！</span><a href="login.do">马上登录</a></c:if>
            <c:if test="${user.type==0}">您好！借款功能暂不支持催收机构</c:if>
            <c:if test="${user.authStep==1}">
                您好！您还未填写
                <span style="color: red;">借款个人信息</span> 及
                <span style="color: red;">借款认证资料</span>
                <a href="querBaseData.do">马上填写资料</a>
            </c:if>
            <c:if test="${user.authStep==2}">
                您好！您还未填写
                <span style="color: red;">借款工作信息</span> 及
                <span style="color: red;">借款认证资料</span>
                <a href="userPassData.do">马上填写资料</a>
            </c:if>
            <c:if test="${user.authStep==3}">
                您好！您还未成为
                <span style="color: red;">VIP会员</span> 及
                填写
                <span style="color: red;">借款认证资料</span>
                <a href="querBaseData.do">马上填写资料</a>
            </c:if>
            <c:if test="${user.authStep==4}">
                您好！您还未填写
                <span style="color: red;">借款认证资料</span>
                <a href="userPassData.do">马上填写资料</a>
            </c:if>
            <c:if test="${user.authStep==5}">
                您好！您已填写完
                <span>借款个人信息</span> 及
                <span>借款认证资料</span>
                <a href="userPassData.do">补充填写资料</a>
            </c:if>
        </div>
        <!--净 start-->
        <div class="borrow_all">
            <div class="borrow_top1"><span>净</span>${worthMap.title }</div>
            <div class="borrow_middle">
                <c:if test="${worthMap.description.length()>108}">
                    <c:out value="${worthMap.description.substring(0,108)}"/>......
                </c:if>
                <c:if test="${worthMap.description.length()<108}">${worthMap.description.substring(0,108)}</c:if>
            </div>
            <div class="borrow_bottom">
                <c:if test="${worthMap.status==1}">
                    <a href="addBorrowInit.do?t=1">
                        <input type="button" value="发布借款" class="btnbo1" onmouseover="this.className='btnbo1hover'"
                               onmouseout="this.className='btnbo1'"/>
                    </a>
                </c:if>
                <c:if test="${worthMap.status!=1}">
                    <a href="javascript:void(0)">
                        <input type="button" value="发布借款" class="btnbo1" onmouseover="this.className='btnbo1hover'"
                               onmouseout="this.className='btnbo1'"/>
                    </a>
                </c:if>
            </div>
        </div>
        <!--净 end-->
        <!--信 start-->
        <div class="borrow_all m12">
            <div class="borrow_top2"><span>信</span>${ordinaryMap.title }</div>
            <div class="borrow_middle">
                <c:if test="${ordinaryMap.description.length()>108}">
                    <c:out value="${ordinaryMap.description.substring(0,108)}"/>......
                </c:if>
                <c:if test="${ordinaryMap.description.length()<108}">${ordinaryMap.description.substring(0,108)}</c:if>
            </div>
            <div class="borrow_bottom">
                <c:if test="${ordinaryMap.status==1}">
                    <a href="addBorrowInit.do?t=3">
                        <input type="button" value="发布借款" class="btnbo2" onmouseover="this.className='btnbo2hover'"
                               onmouseout="this.className='btnbo2'"/>
                    </a>
                </c:if>
                <c:if test="${ordinaryMap.status!=1}">
                    <a href="javascript:void(0)">
                        <input type="button" value="发布借款" class="btnbo2" onmouseover="this.className='btnbo2hover'"
                               onmouseout="this.className='btnbo2'"/>
                    </a>
                </c:if>
            </div>
        </div>
        <!--信 end-->
        <!--实 start-->
        <div class="borrow_all m12">
            <div class="borrow_top3"><span>实</span>${fieldMap.title }</div>
            <div class="borrow_middle">
                <c:if test="${fieldMap.description.length()>108}">
                    <c:out value="${fieldMap.description.substring(0,108)}"/>......
                </c:if>
                <c:if test="${fieldMap.description.length()<108}">${fieldMap.description.substring(0,108)}</c:if>
            </div>
            <div class="borrow_bottom">
                <c:if test="${fieldMap.status==1}">
                    <a href="addBorrowInit.do?t=4">
                        <input type="button" value="发布借款" class="btnbo3" onmouseover="this.className='btnbo3hover'"
                               onmouseout="this.className='btnbo3'"/>
                    </a>
                </c:if>
                <c:if test="${fieldMap.status!=1}">
                    <a href="javascript:void(0)">
                        <input type="button" value="发布借款" class="btnbo3" onmouseover="this.className='btnbo3hover'"
                               onmouseout="this.className='btnbo3'"/>
                    </a>
                </c:if>
            </div>
        </div>
        <!--实 end-->
        <!--担 start-->
        <div class="borrow_all">
            <div class="borrow_top4"><span>担</span>${institutionsMap.title }</div>
            <div class="borrow_middle">
                <c:if test="${institutionsMap.description.length()>108}">
                    <c:out value="${institutionsMap.description.substring(0,108)}"/>......
                </c:if>
                <c:if test="${institutionsMap.description.length()<108}">${institutionsMap.description.substring(0,108)}</c:if>
            </div>
            <div class="borrow_bottom">
                <c:if test="${institutionsMap.status==1}">
                    <a href="addBorrowInit.do?t=5">
                        <input type="button" value="发布借款" class="btnbo4" onmouseover="this.className='btnbo4hover'"
                               onmouseout="this.className='btnbo4'"></input>
                    </a>
                </c:if>
                <c:if test="${institutionsMap.status!=1}">
                    <a href="javascript:void(0)">
                        <input type="button" value="发布借款" class="btnbo4" onmouseover="this.className='btnbo4hover'"
                               onmouseout="this.className='btnbo4'"/>
                    </a>
                </c:if>
            </div>
        </div>
        <!--担 end-->
    </div>
    <div class="clear"></div>
</div>
<!--borrow end-->
<!--  引用底部公共部分 -->
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
