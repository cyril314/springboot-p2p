<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../include/taglib.jsp" %>
<html>
<head>
    <title>管理首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
    <meta http-equiv="description" content="This is my page"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/admin/admin_css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/plugins/date/calendar.css"/>
    <script type="text/javascript" src="${ctx}/static/plugins/date/calendar.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.shove-1.0.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
                param["pageBean.pageNum"] = 1;
                initListInfo(param);
                $("#search").click(function () {
                    param["pageBean.pageNum"] = 1;
                    initListInfo(param);
                });
            }
        );

        //加载留言信息
        function initListInfo(praData) {
            param["paramMap.userName"] = $("#userName").val();
            param["paramMap.auditStatus"] = $("#auditStatus").val();
            param["paramMap.adminName"] = $("#adminName").val();
            param["paramMap.realName"] = $("#realName").val();
            param["paramMap.certificateName"] = $("#certificateName").val();
            /*
            $.shovePost("tongji.do",praData,function(){
                $("#dataInfo").html(data);
            });
            */
            $.shovePost("rechargeecordsInf.do", praData, initCallBack);
        }

        function initCallBack(data) {
            $("#dataInfo").html(data);
        }

        function selectStartDate() {
            return showCalendar('startDate', '%Y-%m-%d', '24', true, 'startDate');
        }

        function selectEndDate() {
            return showCalendar('endDate', '%Y-%m-%d', '24', true, 'endDate');
        }
    </script>
</head>
<body style="min-width: 1000px">
<div id="right">
    <div style="padding: 15px 10px 0px 10px;">
        <div>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="100" height="30">
                        <a href="javascript:void(0);" class="main_alll_h2">基本资料认证</a>
                    </td>
                    <td width="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <div style="padding-right: 10px; padding-bottom: 10px; width: 1120px; padding-top: 10px; background-color: #fff;">
            <table style="margin-bottom: 8px;" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                <!-- -
                   <tr><td id="tongji"></td></tr>-->
                <tr>
                    <td class="f66" align="left" width="50%" height="36px">
                        会员名称: <input id="userName" name="paramMap.userName"/>&nbsp;&nbsp;
                        跟踪审核: <input id="adminName" name="paramMap.adminName"/>&nbsp;&nbsp;
                        真实姓名: <input id="realName" type="text" name="paramMap.realName"/>
                        状态:
                        <select id="auditStatus" name="auditStatus">
                            <option value="-1">-请选择-</option>
                            <option value="1">待审核</option>
                            <option value="2">失败</option>
                            <option value="3">成功</option>
                        </select>
                        <select id="certificateName" name="certificateName">
                            <option value="-1">-请选择-</option>
                            <option value="1">身份认证</option>
                            <option value="2">工作认证</option>
                            <option value="3">居住地认证</option>
                            <option value="4">信用报告认证</option>
                            <option value="5">收入认证</option>
                        </select>
                        <input id="search" type="button" value="查找" name="search"/>
                    </td>
                </tr>
                </tbody>
            </table>
            <span id="dataInfo"><img src="${ctx}/static/images/admin/load.gif" class="load" alt="加载中..."/> </span>
        </div>
    </div>
</div>
</body>
</html>