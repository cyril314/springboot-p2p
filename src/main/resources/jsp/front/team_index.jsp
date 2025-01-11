<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@include file="../include/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <jsp:include page="../include/head.jsp"></jsp:include>
    <script type="text/javascript" src="${ctx}/static/js/public.js"></script>
</head>
<body>
<!--about start-->
<!--列表 start-->
<div style="background: #f5f5f7; width: 100%; height: 100%;">
    <div style="width: 990px; margin: 0 auto;">
        <ul>
            <%--<c:if test="pageBean.page==null || pageBean.page.size==0">
                <li><div class="C_nr_jj2">没有管理团队</div></li>
            </c:if>
            <s:else>
                <s:iterator value="pageBean.page" var="teams" status="sta">
                 <li>
                  <table>
                    <tr>
                        <td rowspan="2"><img width="121" height="117" src="${teams.imgPath}" /></td>
                        <td><a href="#" class="ab_news_title">${teams.userName}</a></td>
                       </tr>
                        <tr>
                              <td><p>${teams.intro}<!-- [<a href="about-gonggao-detail.html">查看详情</a>] --></p></td>
                        </tr>
                        </table>
                 </li>
                </s:iterator>
            </s:else>
        --%>
            <li><img src="${ctx}/upload/lists/20140831/20140831211723.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211517.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211356.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211320.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211252.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211159.jpg"/></li>
            <li><img src="${ctx}/upload/lists/20140831/20140831211057.jpg"/></li>
        </ul>
        <!-- 分页 -->
        <%--<div class="digg clear">
		<shove:page curPage="${pageBean.pageNum}" showPageCount="10" pageSize="${pageBean.pageSize }" theme="jsNumber" totalCount="${pageBean.totalNum}">
			<s:param name="cid">${cid}</s:param>
			<s:param name="type">${type}</s:param>
		</shove:page>
	</div>
  --%><!--列表 end-->
    </div>
</div>
<!--about end-->
<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
<script>
    function initListInfo(praData) {
        praData["state"] =${state};
        $.shovePost("frontTeam.do", praData, function (data) {
            $("#showcontent").html("");
            $("#showcontent").html(data);
            var state = ${state};
            if (state == 3) {
                $(".C_wz a").eq(1).html("专家顾问");
            }
        });
    }
</script>
</body>
</html>